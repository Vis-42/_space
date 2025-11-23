"""
3D Quantum Barrier Simulation.

A visualization tool for quantum tunneling through potential barriers,
featuring real-time animation and interactive controls.
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.constants import hbar, m_e
from scipy.sparse import diags
from scipy.sparse.linalg import spsolve
from matplotlib.widgets import Slider, Button

# Set plot style (choose one):
# plt.style.use('seaborn-v0_8-whitegrid')  # Clean with grid
# plt.style.use('dark_background')          # Dark theme
# plt.style.use('bmh')                      # Modern clean
plt.style.use('seaborn-v0_8-white')        # Clean without grid

# Constants and default parameters
GRID_SIZE = 4000
DOMAIN_LENGTH = 2e-8
CFL_FACTOR = 0.4
BOUNDARY_WIDTH_FRACTION = 0.05
BARRIER_WIDTH_FRACTION = 0.2


class QuantumPhysics:
    """Handles quantum mechanical calculations and wave evolution."""

    def __init__(self, N, L, dt):
        self.N = N
        self.L = L
        self.dt = dt
        self.dx = L / N
        self.x = np.linspace(0, L, N)

        # Evolution operators (computed on demand)
        self.A = None
        self.B = None
        self.operators_valid = False

    def check_stability(self):
        """Verify numerical stability via CFL condition."""
        cfl_condition = hbar * self.dt / (m_e * self.dx**2)
        if cfl_condition > 0.5:
            print(f"Warning: CFL condition violated ({cfl_condition:.3f} > 0.5)")
            print("Consider reducing dt or increasing dx for stability")
        return cfl_condition <= 0.5

    def create_gaussian_wave(self, k0, sigma, x_center):
        """Create normalized Gaussian wave packet."""
        psi = np.exp(-((self.x - x_center) ** 2) / (2 * sigma ** 2), dtype=complex)
        psi *= np.exp(1j * k0 * self.x)
        return psi / np.linalg.norm(psi)

    def create_barrier_potential(self, amplitude):
        """Create rectangular potential barrier in center."""
        V = np.zeros(self.N)
        barrier_width = int(BARRIER_WIDTH_FRACTION * self.N)
        center = self.N // 2
        start = center - barrier_width // 2
        end = center + barrier_width // 2
        V[start:end] = amplitude
        return V, start, end

    def update_evolution_operators(self, V):
        """Update Crank-Nicolson evolution operators."""
        if self.operators_valid:
            return

        # Diagonal elements
        a_diag = (1 + 1j * hbar * self.dt / (2 * m_e * self.dx**2) +
                 1j * self.dt / (2 * hbar) * V)
        b_diag = (1 - 1j * hbar * self.dt / (2 * m_e * self.dx**2) -
                 1j * self.dt / (2 * hbar) * V)

        # Off-diagonal elements
        off_diag = -1j * hbar * self.dt / (4 * m_e * self.dx**2) * np.ones(self.N - 1)

        self.A = diags([off_diag, a_diag, off_diag], [-1, 0, 1], format='csr')
        self.B = diags([-off_diag, b_diag, -off_diag], [-1, 0, 1], format='csr')
        self.operators_valid = True

    def apply_absorbing_boundaries(self, psi):
        """Apply absorbing boundary conditions."""
        boundary_width = int(BOUNDARY_WIDTH_FRACTION * self.N)

        # Left boundary
        for i in range(boundary_width):
            damping = np.exp(-((boundary_width - i) / boundary_width)**2)
            psi[i] *= damping

        # Right boundary
        for i in range(self.N - boundary_width, self.N):
            damping = np.exp(-((i - (self.N - boundary_width)) / boundary_width)**2)
            psi[i] *= damping

        return psi

    def evolve_wavefunction(self, psi, V, steps):
        """Evolve wavefunction using Crank-Nicolson method."""
        self.update_evolution_operators(V)

        for _ in range(abs(steps)):
            if steps > 0:
                psi = spsolve(self.A, self.B @ psi)
            else:
                psi = spsolve(self.B, self.A @ psi)
            psi = self.apply_absorbing_boundaries(psi)

        return psi

    def invalidate_operators(self):
        """Mark operators as needing recalculation."""
        self.operators_valid = False


class QuantumBarrierSimulator:
    """Main simulator class with visualization and controls."""

    def __init__(self):
        # Initialize physics engine
        self.dt = CFL_FACTOR * m_e * (DOMAIN_LENGTH / GRID_SIZE)**2 / hbar
        self.physics = QuantumPhysics(GRID_SIZE, DOMAIN_LENGTH, self.dt)

        # Wave parameters
        self.k0_initial = 6e10
        self.sigma = 2e-10
        self.x_wave0 = DOMAIN_LENGTH / 4

        # Simulation state
        self.V_amplitude = 0.0
        self.V = None
        self.barrier_start = 0
        self.barrier_end = 0
        self.psi = None

        # Animation state
        self.time_step = 0
        self.previous_time_step = 0
        self.playing = False
        self.speed_factor = 5
        self.interval = 30
        self.timer = None

        # Visualization parameters
        self.zoom_scale = 1.0
        self.amplitude_scale = 2.0
        self.probability_scale = 5.0
        self.potential_visual_scale = 1e18
        self.initial_max_val = None

        # Plot elements
        self._init_plot_objects()

        # UI elements
        self._init_ui_objects()

        self._initialize_simulation()

    def _init_plot_objects(self):
        """Initialize plot object references."""
        self.fig = None
        self.ax_3d = None
        self.lines = {}
        self.barrier_lines = {}
        self.text_objects = {}

    def _init_ui_objects(self):
        """Initialize UI object references."""
        self.sliders = {}
        self.buttons = {}

    def _initialize_simulation(self):
        """Set up initial simulation state."""
        self.physics.check_stability()
        self.psi = self.physics.create_gaussian_wave(
            self.k0_initial, self.sigma, self.x_wave0
        )
        self.V, self.barrier_start, self.barrier_end = (
            self.physics.create_barrier_potential(self.V_amplitude)
        )

    def _compute_wave_statistics(self, psi):
        """Compute center of mass and spread of wave packet."""
        prob_density = np.abs(psi) ** 2
        center_of_mass = (np.sum(self.physics.x * prob_density) /
                         np.sum(prob_density))
        spread = np.sqrt(np.sum(((self.physics.x - center_of_mass) ** 2) *
                               prob_density) / np.sum(prob_density))
        return center_of_mass, spread

    def _update_axis_limits(self, psi):
        """Update 3D plot limits based on wave packet."""
        center_of_mass, spread = self._compute_wave_statistics(psi)

        # Dynamic x-limits
        x_min = max(0, center_of_mass - self.zoom_scale * 3 * spread)
        x_max = min(DOMAIN_LENGTH, center_of_mass + self.zoom_scale * 3 * spread)
        self.ax_3d.set_xlim(x_min, x_max)

        # Fixed y,z limits for stable viewing
        if self.initial_max_val is None:
            self.initial_max_val = np.max(np.abs(psi))

        limit = self.amplitude_scale * self.initial_max_val
        self.ax_3d.set_ylim(-limit, limit)
        self.ax_3d.set_zlim(-limit, limit)

        return x_min, x_max, -limit, limit

    def _update_wavefunction_plots(self, psi):
        """Update all wavefunction visualization lines."""
        if 'real' in self.lines:
            self.lines['real'].set_data_3d(
                self.physics.x, np.zeros_like(self.physics.x), np.real(psi)
            )
        if 'imag' in self.lines:
            self.lines['imag'].set_data_3d(
                self.physics.x, np.imag(psi), np.zeros_like(self.physics.x)
            )
        if 'sum' in self.lines:
            self.lines['sum'].set_data_3d(
                self.physics.x, np.real(psi), np.imag(psi)
            )
        if 'prob' in self.lines:
            self.lines['prob'].set_data_3d(
                self.physics.x, np.zeros_like(self.physics.x),
                self.probability_scale * np.abs(psi) ** 2
            )

    def _update_potential_visualization(self, y_min, y_max):
        """Update potential barrier and profile visualization."""
        # Remove old barrier lines
        for line in self.barrier_lines.values():
            if line is not None:
                try:
                    line.remove()
                except (AttributeError, ValueError):
                    pass

        # Add new barrier boundary lines
        x_left, x_right = (self.physics.x[self.barrier_start],
                          self.physics.x[self.barrier_end])
        self.barrier_lines['left'], = self.ax_3d.plot(
            [x_left, x_left], [y_min, y_max], [0, 0],
            color='orange', lw=3
        )
        self.barrier_lines['right'], = self.ax_3d.plot(
            [x_right, x_right], [y_min, y_max], [0, 0],
            color='orange', lw=3
        )

        # Update potential profile
        y_profile = y_min - 0.3 * (y_max - y_min)
        potential_plot = self.potential_visual_scale * self.V

        if 'potential' not in self.lines or self.lines['potential'] is None:
            self.lines['potential'], = self.ax_3d.plot(
                self.physics.x, [y_profile] * len(self.physics.x), potential_plot,
                color='cyan', lw=2
            )
        else:
            self.lines['potential'].set_data_3d(
                self.physics.x, [y_profile] * len(self.physics.x), potential_plot
            )

        # Update potential info display
        self._update_potential_info(y_profile)

    def _update_potential_info(self, y_profile):
        """Update potential text display."""
        center_idx = (self.barrier_start + self.barrier_end) // 2
        x_center = self.physics.x[center_idx]
        potential_value = self.potential_visual_scale * self.V[center_idx]

        # Update text
        text_content = f" V = {self.V_amplitude:.2e} J"
        if 'potential' not in self.text_objects or self.text_objects['potential'] is None:
            self.text_objects['potential'] = self.ax_3d.text(
                x_center, y_profile, potential_value, text_content,
                color='cyan', fontsize=12, ha='center'
            )
        else:
            self.text_objects['potential'].set_text(text_content)
            self.text_objects['potential'].set_position((x_center, y_profile, potential_value))

    def _update_time_display(self, time_step, x_min, x_max, y_min):
        """Update time step display."""
        text_content = f"Time Step: {time_step}"
        if 'time' not in self.text_objects or self.text_objects['time'] is None:
            self.text_objects['time'] = self.ax_3d.text(
                (x_min + x_max) * 0.7, y_min, 0, text_content, fontsize=12
            )
        else:
            self.text_objects['time'].set_text(text_content)

    def update_simulation(self, time_step, update_plot=True):
        """Update simulation state and visualization."""
        if not plt.fignum_exists(self.fig.number):
            return

        # Evolve wavefunction
        direction = 1 if time_step > self.previous_time_step else -1
        steps = abs(time_step - self.previous_time_step)
        self.psi = self.physics.evolve_wavefunction(self.psi, self.V, steps * direction)
        self.previous_time_step = time_step

        if update_plot:
            self._update_wavefunction_plots(self.psi)
            x_min, x_max, y_min, y_max = self._update_axis_limits(self.psi)
            self._update_potential_visualization(y_min, y_max)
            self._update_time_display(time_step, x_min, x_max, y_min)
            self.fig.canvas.draw_idle()

    def _animate_step(self):
        """Single animation step."""
        if self.playing:
            new_time_step = self.time_step + self.speed_factor
            self.update_simulation(new_time_step)
            self.time_step = new_time_step

            # Extend slider range if needed
            if self.time_step > self.sliders['time'].valmax:
                self.sliders['time'].valmax = self.time_step + 1000
                self.sliders['time'].ax.set_xlim(0, self.sliders['time'].valmax)

            self.sliders['time'].set_val(self.time_step)
            self.timer = self.fig.canvas.new_timer(
                interval=self.interval,
                callbacks=[(self._animate_step, [], {})]
            )
            self.timer.start()

    # Event handlers
    def _on_play_pause(self, event):
        """Toggle play/pause state."""
        self.playing = not self.playing
        if self.playing:
            self.buttons['play_pause'].label.set_text('Pause')
            if self.timer is None:
                self.timer = self.fig.canvas.new_timer(
                    interval=self.interval,
                    callbacks=[(self._animate_step, [], {})]
                )
                self.timer.start()
        else:
            self.buttons['play_pause'].label.set_text('Play')
            if self.timer is not None:
                self.timer.stop()
                self.timer = None

    def _on_step_forward(self, event):
        """Step forward in time."""
        self._stop_animation()
        self.time_step += 10
        self._extend_time_slider()
        self.sliders['time'].set_val(self.time_step)
        self.update_simulation(self.time_step)

    def _on_step_backward(self, event):
        """Step backward in time."""
        self._stop_animation()
        self.time_step = max(0, self.time_step - 10)
        self.sliders['time'].set_val(self.time_step)
        self.update_simulation(self.time_step)

    def _on_speed_up(self, event):
        """Increase animation speed."""
        self.speed_factor *= 2
        self.interval = max(10, self.interval // 2)
        self._restart_timer_if_playing()

    def _on_speed_down(self, event):
        """Decrease animation speed."""
        self.speed_factor = max(1, self.speed_factor // 2)
        self.interval = min(500, self.interval * 2)
        self._restart_timer_if_playing()

    def _stop_animation(self):
        """Stop animation and reset play button."""
        self.playing = False
        self.buttons['play_pause'].label.set_text('Play')
        if self.timer is not None:
            self.timer.stop()
            self.timer = None

    def _extend_time_slider(self):
        """Extend time slider range if necessary."""
        if self.time_step > self.sliders['time'].valmax:
            self.sliders['time'].valmax = self.time_step + 1000
            self.sliders['time'].ax.set_xlim(0, self.sliders['time'].valmax)

    def _restart_timer_if_playing(self):
        """Restart timer with new interval if currently playing."""
        if self.timer is not None and self.playing:
            self.timer.stop()
            self.timer = self.fig.canvas.new_timer(
                interval=self.interval,
                callbacks=[(self._animate_step, [], {})]
            )
            self.timer.start()

    # Slider event handlers
    def _on_time_changed(self, val):
        """Handle time slider changes."""
        new_time_step = int(val)
        self.update_simulation(new_time_step, update_plot=True)
        self.time_step = new_time_step

    def _on_zoom_changed(self, val):
        """Handle zoom slider changes."""
        self.zoom_scale = val
        self.update_simulation(self.time_step)

    def _on_momentum_changed(self, val):
        """Handle momentum slider changes."""
        self.k0_initial = val
        self._reset_simulation()

    def _on_potential_changed(self, val):
        """Handle potential slider changes."""
        self.V_amplitude = val
        self.V, self.barrier_start, self.barrier_end = (
            self.physics.create_barrier_potential(self.V_amplitude)
        )
        self.physics.invalidate_operators()
        self._reset_simulation()

    def _reset_simulation(self):
        """Reset simulation to initial state."""
        self.psi = self.physics.create_gaussian_wave(
            self.k0_initial, self.sigma, self.x_wave0
        )
        self.initial_max_val = None
        self.time_step = 0
        self.previous_time_step = 0
        self.sliders['time'].set_val(0)
        self.update_simulation(0)

    def _setup_3d_plot(self):
        """Initialize 3D plot area."""
        self.ax_3d = self.fig.add_subplot(111, projection='3d')

        # Set initial limits and labels
        x_min = self.x_wave0 - 3 * self.sigma
        x_max = self.x_wave0 + 3 * self.sigma
        x_min = max(0, x_min)
        x_max = min(DOMAIN_LENGTH, x_max)

        self.ax_3d.set_xlim(x_min, x_max)
        self.initial_max_val = np.max(np.abs(self.psi))

        limit = self.amplitude_scale * self.initial_max_val
        self.ax_3d.set_ylim(-limit, limit)
        self.ax_3d.set_zlim(-limit, limit)

        # Set axis labels
        self.ax_3d.set_xlabel("Position (m)")
        self.ax_3d.set_ylabel("Imaginary Component")
        self.ax_3d.set_zlabel("Real Component")

    def _create_wavefunction_lines(self):
        """Create initial wavefunction visualization lines."""
        self.lines['real'], = self.ax_3d.plot(
            self.physics.x, np.zeros_like(self.physics.x), np.real(self.psi),
            lw=2, color='blue', label='Re(Ψ)'
        )
        self.lines['imag'], = self.ax_3d.plot(
            self.physics.x, np.imag(self.psi), np.zeros_like(self.physics.x),
            lw=2, color='green', label='Im(Ψ)'
        )
        self.lines['sum'], = self.ax_3d.plot(
            self.physics.x, np.real(self.psi), np.imag(self.psi),
            lw=2, color='purple', label='Re(Ψ)+Im(Ψ)'
        )
        self.lines['prob'], = self.ax_3d.plot(
            self.physics.x, np.zeros_like(self.physics.x),
            self.probability_scale * np.abs(self.psi) ** 2,
            lw=2, color='red', label='|Ψ|²'
        )

        # Add legend
        self.ax_3d.legend()

    def _create_sliders(self):
        """Create control sliders."""
        plt.subplots_adjust(bottom=0.35)

        # Time slider
        ax_time = plt.axes([0.2, 0.25, 0.5, 0.03])
        self.sliders['time'] = Slider(ax_time, 'Time Step', 0, 10000, valinit=0, valstep=1)
        self.sliders['time'].on_changed(self._on_time_changed)

        # Zoom slider
        ax_zoom = plt.axes([0.2, 0.20, 0.5, 0.03])
        self.sliders['zoom'] = Slider(ax_zoom, 'Zoom Level', 0.1, 2.0, valinit=1.0)
        self.sliders['zoom'].on_changed(self._on_zoom_changed)

        # Momentum slider
        ax_momentum = plt.axes([0.2, 0.15, 0.5, 0.03])
        self.sliders['momentum'] = Slider(
            ax_momentum, 'Wave Momentum', 1e10, 1e11, valinit=self.k0_initial
        )
        self.sliders['momentum'].on_changed(self._on_momentum_changed)

        # Potential slider
        ax_potential = plt.axes([0.2, 0.10, 0.5, 0.03])
        self.sliders['potential'] = Slider(
            ax_potential, 'Barrier Height', 0.0, 1e-17, valinit=self.V_amplitude
        )
        self.sliders['potential'].on_changed(self._on_potential_changed)

    def _create_buttons(self):
        """Create control buttons."""
        # Create buttons
        ax_play = plt.axes([0.1, 0.02, 0.1, 0.04])
        self.buttons['play_pause'] = Button(ax_play, 'Play')
        self.buttons['play_pause'].on_clicked(self._on_play_pause)

        ax_forward = plt.axes([0.25, 0.02, 0.1, 0.04])
        self.buttons['forward'] = Button(ax_forward, 'Forward')
        self.buttons['forward'].on_clicked(self._on_step_forward)

        ax_rewind = plt.axes([0.4, 0.02, 0.1, 0.04])
        self.buttons['rewind'] = Button(ax_rewind, 'Rewind')
        self.buttons['rewind'].on_clicked(self._on_step_backward)

        ax_speed_up = plt.axes([0.55, 0.02, 0.1, 0.04])
        self.buttons['speed_up'] = Button(ax_speed_up, 'Speed +')
        self.buttons['speed_up'].on_clicked(self._on_speed_up)

        ax_speed_down = plt.axes([0.7, 0.02, 0.1, 0.04])
        self.buttons['speed_down'] = Button(ax_speed_down, 'Speed -')
        self.buttons['speed_down'].on_clicked(self._on_speed_down)

    def setup_ui(self):
        """Set up complete user interface."""
        self.fig = plt.figure(figsize=(12, 8))
        self.fig.suptitle('Quantum Barrier Simulator', fontsize=16)

        self._setup_3d_plot()
        self._create_wavefunction_lines()
        self._create_sliders()
        self._create_buttons()

    def run(self):
        """Launch the simulation."""
        self.setup_ui()
        self.update_simulation(self.time_step)
        plt.show()


if __name__ == "__main__":
    simulator = QuantumBarrierSimulator()
    simulator.run()
