import numpy as np
import matplotlib.pyplot as plt
from scipy.constants import hbar, m_e
from scipy.sparse import diags
from scipy.sparse.linalg import spsolve
from matplotlib.widgets import Slider, Button

# Use the clean seaborn style that looked great originally
plt.style.use('seaborn-v0_8-paper')


class QuantumBarrierSimulator:
    """Clean 3D Quantum Barrier Simulation with performance optimizations."""

    def __init__(self):
        # Simulation Parameters
        self.N = 4000
        self.L = 2e-8
        self.dx = self.L / self.N
        # Calculate stable dt using CFL condition
        cfl_factor = 0.4
        self.dt = cfl_factor * m_e * self.dx**2 / hbar
        self.x = np.linspace(0, self.L, self.N)

        # Wave packet parameters
        self.k0_initial = 6e10
        self.sigma = 2e-10
        self.x_wave0 = self.L / 4

        # Initialize state
        self.psi = self.initialize_wave(self.k0_initial)
        self.V_amplitude = 0.0
        self.V = self.update_potential_array(self.V_amplitude)
        self.operators_need_update = True

        # Animation parameters
        self.time_step = 0
        self.previous_time_step = 0
        self.playing = False
        self.speed_factor = 5
        self.interval = 30
        self.timer = None

        # Visualization parameters
        self.zoom_scale = 1.0
        self.fixed_amplitude_scale = 2.0
        self.probability_scale_factor = 5.0
        self.potential_visual_scale = 1e18
        self.initial_max_val = None

        # Plot objects
        self.fig = None
        self.ax_3d = None
        self.line_real = None
        self.line_imag = None
        self.line_sum = None
        self.line_abs = None
        self.line_potential = None
        self.barrier_line_left = None
        self.barrier_line_right = None
        self.potential_text = None
        self.potential_marker = None
        self.time_text = None

        # UI elements
        self.time_slider = None
        self.zoom_slider = None
        self.momentum_slider = None
        self.potential_slider = None
        self.play_pause_button = None

        # Barrier visualization
        self.barrier_start = 0
        self.barrier_end = 0

    def check_stability(self):
        """Check CFL condition for numerical stability."""
        cfl_condition = hbar * self.dt / (m_e * self.dx**2)
        if cfl_condition > 0.5:
            print(f"Warning: CFL condition violated ({cfl_condition:.3f} > 0.5)")
        return cfl_condition <= 0.5

    def apply_boundary_conditions(self, psi):
        """Apply absorbing boundary conditions."""
        boundary_width = int(0.05 * self.N)

        # Left boundary
        for i in range(boundary_width):
            damping = np.exp(-((boundary_width - i) / boundary_width)**2)
            psi[i] *= damping

        # Right boundary
        for i in range(self.N - boundary_width, self.N):
            damping = np.exp(-((i - (self.N - boundary_width)) / boundary_width)**2)
            psi[i] *= damping

        return psi

    def initialize_wave(self, k0_value):
        """Initialize normalized Gaussian wave packet."""
        psi_init = np.exp(-((self.x - self.x_wave0) ** 2) / (2 * self.sigma ** 2)) * np.exp(1j * k0_value * self.x)
        psi_init /= np.linalg.norm(psi_init)
        return psi_init

    def update_potential_array(self, V_amp):
        """Create potential array with barrier."""
        V_new = np.zeros(self.N)
        barrier_width = int(0.2 * self.N)
        center_index = self.N // 2
        start = center_index - barrier_width // 2
        end = center_index + barrier_width // 2
        self.barrier_start, self.barrier_end = start, end
        V_new[start:end] = V_amp
        return V_new

    def update_operators(self):
        """Update evolution operators only when needed."""
        if not self.operators_need_update:
            return

        a_diag = 1 + 1j * hbar * self.dt / (2 * m_e * self.dx**2) + 1j * self.dt / (2 * hbar) * self.V
        b_diag = 1 - 1j * hbar * self.dt / (2 * m_e * self.dx**2) - 1j * self.dt / (2 * hbar) * self.V
        off_diag = -1j * hbar * self.dt / (4 * m_e * self.dx**2) * np.ones(self.N - 1)

        self.A = diags([off_diag, a_diag, off_diag], [-1, 0, 1], format='csr')
        self.B = diags([-off_diag, b_diag, -off_diag], [-1, 0, 1], format='csr')
        self.operators_need_update = False

    def evolve_wavefunction(self, psi, steps):
        """Evolve wavefunction with boundary conditions."""
        self.update_operators()

        for _ in range(abs(steps)):
            if steps > 0:
                psi = spsolve(self.A, self.B @ psi)
            else:
                psi = spsolve(self.B, self.A @ psi)
            psi = self.apply_boundary_conditions(psi)

        return psi

    def update_simulation(self, time_step_local, update_plot=True):
        """Update simulation state."""
        if not plt.fignum_exists(self.fig.number):
            return

        direction = 1 if time_step_local > self.previous_time_step else -1
        steps = abs(time_step_local - self.previous_time_step)
        self.psi = self.evolve_wavefunction(self.psi, steps * direction)
        self.previous_time_step = time_step_local

        if update_plot:
            self.update_plots()

    def update_plots(self):
        """Efficiently update all plot elements."""
        # Update wavefunction lines
        if self.line_real is not None:
            self.line_real.set_data_3d(self.x, np.zeros_like(self.x), np.real(self.psi))
        if self.line_imag is not None:
            self.line_imag.set_data_3d(self.x, np.imag(self.psi), np.zeros_like(self.x))
        if self.line_sum is not None:
            self.line_sum.set_data_3d(self.x, np.real(self.psi), np.imag(self.psi))
        if self.line_abs is not None:
            self.line_abs.set_data_3d(self.x, np.zeros_like(self.x),
                                     self.probability_scale_factor * np.abs(self.psi) ** 2)

        # Update axis limits based on wave packet
        probability_density = np.abs(self.psi) ** 2
        center_of_mass = np.sum(self.x * probability_density) / np.sum(probability_density)
        spread = np.sqrt(np.sum(((self.x - center_of_mass) ** 2) * probability_density) / np.sum(probability_density))

        x_min = max(0, center_of_mass - self.zoom_scale * 3 * spread)
        x_max = min(self.L, center_of_mass + self.zoom_scale * 3 * spread)
        self.ax_3d.set_xlim(x_min, x_max)

        if self.initial_max_val is None:
            self.initial_max_val = np.max(np.abs(self.psi))

        y_lim = self.fixed_amplitude_scale * self.initial_max_val
        self.ax_3d.set_ylim(-y_lim, y_lim)
        self.ax_3d.set_zlim(-y_lim, y_lim)

        # Update barrier lines
        if self.barrier_line_left is not None:
            try:
                self.barrier_line_left.remove()
                self.barrier_line_right.remove()
            except (AttributeError, ValueError):
                pass

        self.barrier_line_left, = self.ax_3d.plot([self.x[self.barrier_start], self.x[self.barrier_start]],
                                                 [-y_lim, y_lim], [0, 0], color='orange', lw=3)
        self.barrier_line_right, = self.ax_3d.plot([self.x[self.barrier_end], self.x[self.barrier_end]],
                                                  [-y_lim, y_lim], [0, 0], color='orange', lw=3)

        # Update potential profile
        if self.line_potential is None:
            y_p = -0.3 * y_lim
            potential_plot = self.potential_visual_scale * self.V
            self.line_potential, = self.ax_3d.plot(self.x, [y_p] * len(self.x), potential_plot,
                                                  color='cyan', lw=2)

        # Update time display
        if self.time_text is None:
            self.time_text = self.ax_3d.text(x_min + 0.7*(x_max-x_min), -y_lim, 0,
                                           f"Time Step: {self.time_step}", fontsize=12)
        else:
            self.time_text.set_text(f"Time Step: {self.time_step}")

        self.fig.canvas.draw_idle()

    def animate_simulation(self):
        """Animation loop."""
        if self.playing:
            new_time_step = self.time_step + self.speed_factor
            self.update_simulation(new_time_step)
            self.time_step = new_time_step

            # Auto-expand slider range if needed
            if self.time_step > self.time_slider.valmax:
                self.time_slider.valmax = self.time_step + 1000
                self.time_slider.ax.set_xlim(0, self.time_slider.valmax)

            self.time_slider.set_val(self.time_step)
            self.timer = self.fig.canvas.new_timer(interval=self.interval,
                                                 callbacks=[(self.animate_simulation, [], {})])
            self.timer.start()

    # Event handlers
    def play_pause_button_clicked(self, event):
        self.playing = not self.playing
        if self.playing:
            self.play_pause_button.label.set_text("Pause")
            if self.timer is None:
                self.timer = self.fig.canvas.new_timer(interval=self.interval,
                                                     callbacks=[(self.animate_simulation, [], {})])
                self.timer.start()
        else:
            self.play_pause_button.label.set_text("Play")
            if self.timer is not None:
                self.timer.stop()
                self.timer = None

    def on_time_slider_changed(self, val):
        new_time_step = int(val)
        self.update_simulation(new_time_step, update_plot=True)
        self.time_step = new_time_step
        self.previous_time_step = new_time_step

    def on_zoom_slider_changed(self, val):
        self.zoom_scale = val
        self.update_simulation(self.time_step)

    def on_momentum_slider_changed(self, val):
        self.k0_initial = val
        self.psi = self.initialize_wave(self.k0_initial)
        self.initial_max_val = None
        self.time_step = 0
        self.previous_time_step = 0
        self.time_slider.set_val(0)
        self.update_simulation(0)

    def on_potential_slider_changed(self, val):
        self.V_amplitude = val
        self.V = self.update_potential_array(self.V_amplitude)
        self.operators_need_update = True
        self.psi = self.initialize_wave(self.k0_initial)
        self.time_step = 0
        self.previous_time_step = 0
        self.time_slider.set_val(0)
        self.update_simulation(0)

    def setup_ui(self):
        """Set up clean seaborn-style user interface."""
        self.fig = plt.figure(figsize=(12, 8))
        self.ax_3d = self.fig.add_subplot(111, projection='3d')
        self.fig.subplots_adjust(left=0.1, right=0.95, top=0.9, bottom=0.25)

        # Set initial limits
        x_min = self.x_wave0 - 3 * self.sigma
        x_max = self.x_wave0 + 3 * self.sigma
        x_min = max(0, x_min)
        x_max = min(self.L, x_max)
        self.ax_3d.set_xlim(x_min, x_max)

        self.initial_max_val = np.max(np.abs(self.psi))
        y_lim = self.fixed_amplitude_scale * self.initial_max_val
        self.ax_3d.set_ylim(-y_lim, y_lim)
        self.ax_3d.set_zlim(-y_lim, y_lim)

        self.ax_3d.set_xlabel("Position (m)", fontsize=12)
        self.ax_3d.set_ylabel("Imaginary Component", fontsize=12)
        self.ax_3d.set_zlabel("Real Component", fontsize=12)
        self.ax_3d.set_title("Quantum Barrier Simulator", fontsize=14, pad=20)

        # Initial wavefunction lines with clean colors
        self.line_real, = self.ax_3d.plot(self.x, np.zeros_like(self.x), np.real(self.psi),
                                         lw=2.5, color='blue', label='Re(Ψ)', alpha=0.8)
        self.line_imag, = self.ax_3d.plot(self.x, np.imag(self.psi), np.zeros_like(self.x),
                                         lw=2.5, color='green', label='Im(Ψ)', alpha=0.8)
        self.line_sum, = self.ax_3d.plot(self.x, np.real(self.psi), np.imag(self.psi),
                                        lw=2.5, color='purple', label='Re(Ψ)+Im(Ψ)', alpha=0.8)
        self.line_abs, = self.ax_3d.plot(self.x, np.zeros_like(self.x),
                                        self.probability_scale_factor * np.abs(self.psi) ** 2,
                                        lw=2.5, color='red', label='|Ψ|²', alpha=0.8)

        self.ax_3d.legend(fontsize=10)

        # Create clean UI controls
        slider_color = 'lightblue'
        button_color = 'lightgray'

        # Time Slider
        time_slider_ax = self.fig.add_axes([0.15, 0.02, 0.70, 0.03])
        self.time_slider = Slider(time_slider_ax, 'Time Step', 0, 10000, valinit=0,
                                 valstep=1, color=slider_color)
        self.time_slider.on_changed(self.on_time_slider_changed)

        # Zoom Slider
        zoom_slider_ax = self.fig.add_axes([0.15, 0.06, 0.70, 0.03])
        self.zoom_slider = Slider(zoom_slider_ax, 'Zoom Level', 0.1, 2.0, valinit=1.0,
                                 valstep=0.1, color=slider_color)
        self.zoom_slider.on_changed(self.on_zoom_slider_changed)

        # Momentum Slider
        momentum_slider_ax = self.fig.add_axes([0.15, 0.10, 0.70, 0.03])
        self.momentum_slider = Slider(momentum_slider_ax, 'Wave Momentum', 1e10, 1e11,
                                     valinit=self.k0_initial, valstep=1e9, color=slider_color)
        self.momentum_slider.on_changed(self.on_momentum_slider_changed)

        # Potential Slider
        potential_slider_ax = self.fig.add_axes([0.15, 0.14, 0.70, 0.03])
        self.potential_slider = Slider(potential_slider_ax, 'Barrier Height', 0.0, 1e-17,
                                      valinit=self.V_amplitude, valstep=1e-19, color=slider_color)
        self.potential_slider.on_changed(self.on_potential_slider_changed)

        # Simple, clean buttons
        btn_width, btn_height = 0.12, 0.04
        btn_spacing = 0.015
        btn_y = 0.19

        self.play_pause_button = Button(self.fig.add_axes([0.15, btn_y, btn_width, btn_height]),
                                       'Play', color=button_color)
        forward_button = Button(self.fig.add_axes([0.15 + (btn_width + btn_spacing), btn_y, btn_width, btn_height]),
                              'Forward', color=button_color)

        # Connect button events
        self.play_pause_button.on_clicked(self.play_pause_button_clicked)

    def run(self):
        """Run the clean simulator."""
        self.check_stability()
        self.setup_ui()
        self.update_simulation(self.time_step)
        plt.show()


if __name__ == "__main__":
    simulator = QuantumBarrierSimulator()
    simulator.run()
