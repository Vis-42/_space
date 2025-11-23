import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider, Button
from matplotlib.animation import FuncAnimation
from scipy.special import hermite, factorial
from scipy.integrate import simpson

# Constants
hbar = 1.0
m = 1.0
omega = 1.0
a = np.sqrt(hbar / (m * omega))
number_of_eigenstates = 100

# Grids
x = np.linspace(-10, 10, 1024)
dx = x[1] - x[0]
V_x = 0.5 * m * omega**2 * x**2
V_x_scaled = V_x / np.max(V_x) * 0.5

dp = 2 * np.pi * hbar / (len(x) * dx)
p = np.fft.fftshift(np.fft.fftfreq(len(x), d=dx)) * 2 * np.pi * hbar

# Initial values
x0_init, p0_init, sigma0_init = 0.0, 1.0, 1.0

# Globals
coeffs = []
eigenstates = []
ani = None
times = []
avg_x_vals = []
avg_p_vals = []

# Eigenstates and energy
def ho_eigenstate(n, x):
    xi = x / a
    norm = 1.0 / (np.sqrt(a * (2**n) * factorial(n) * np.sqrt(np.pi)))
    Hn = hermite(n)
    return norm * Hn(xi) * np.exp(-xi**2 / 2)

def E_n(n):
    return hbar * omega * (n + 0.5)

def psi_0(x, x0, p0, sigma0):
    norm = 1.0 / np.sqrt(np.sqrt(2 * np.pi) * sigma0)
    return norm * np.exp(1j * p0 * x / hbar) * np.exp(- (x - x0)**2 / (4 * sigma0**2))

def fourier_transform(psi_x):
    return np.fft.fftshift(np.fft.fft(np.fft.ifftshift(psi_x))) * dx / np.sqrt(2 * np.pi * hbar)

# Set up figure and layout
fig = plt.figure(figsize=(16, 10))
gs = fig.add_gridspec(2, 2)
plt.subplots_adjust(left=0.06, right=0.97, top=0.95, bottom=0.3)  # Room for sliders

# Axes
ax_wave = fig.add_subplot(gs[0, 0])     # top-left
ax_momentum = fig.add_subplot(gs[1, 0]) # bottom-left
ax_spec = fig.add_subplot(gs[0, 1])     # top-right
ax_avg = fig.add_subplot(gs[1, 1])      # bottom-right

# Position space
line_x, = ax_wave.plot(x, np.zeros_like(x), label=r"$|\psi(x,t)|^2$")
pot_line, = ax_wave.plot(x, V_x_scaled, 'k--', label="Potential V(x)")
ax_wave.set_xlim(x[0], x[-1])
ax_wave.set_ylim(0, 0.6)
ax_wave.set_xlabel("x")
ax_wave.set_ylabel(r"$|\psi(x,t)|^2$")
ax_wave.set_title("Position-space wavefunction")
ax_wave.legend()

# Momentum space
line_p, = ax_momentum.plot(p, np.zeros_like(p), label=r"$|\phi(p,t)|^2$", color="green")
ax_momentum.set_xlim(-7, 7)
ax_momentum.set_ylim(0, 0.6)
ax_momentum.set_xlabel("p")
ax_momentum.set_ylabel(r"$|\phi(p,t)|^2$")
ax_momentum.set_title("Momentum-space wavefunction")
ax_momentum.legend()

# Energy spectrum
spectrum_bar = ax_spec.bar(range(number_of_eigenstates), np.zeros(number_of_eigenstates))
ax_spec.set_title("Energy Spectrum")
ax_spec.set_xlabel("n (eigenstate index)")
ax_spec.set_ylabel(r"$|c_n|^2$")
ax_spec.set_ylim(0, 0.5)

# Expectation values
avgx_line, = ax_avg.plot([], [], label=r"$\langle x \rangle$", color="blue")
avgp_line, = ax_avg.plot([], [], label=r"$\langle p \rangle$", color="green")
ax_avg.set_xlim(0, 20)
ax_avg.set_ylim(-5, 5)
ax_avg.set_xlabel("Time t")
ax_avg.set_ylabel("Expectation values")
ax_avg.set_title("⟨x⟩ and ⟨p⟩ over time")
ax_avg.legend()

# Sliders (placed below)
ax_x0 = plt.axes([0.2, 0.22, 0.65, 0.03])
ax_p0 = plt.axes([0.2, 0.17, 0.65, 0.03])
ax_sigma = plt.axes([0.2, 0.12, 0.65, 0.03])
s_x0 = Slider(ax_x0, 'x₀', -5.0, 5.0, valinit=x0_init)
s_p0 = Slider(ax_p0, 'p₀', -5.0, 5.0, valinit=p0_init)
s_sigma = Slider(ax_sigma, 'σ₀', 0.1, 3.0, valinit=sigma0_init)

# Buttons
ax_play = plt.axes([0.75, 0.05, 0.1, 0.04])
ax_stop = plt.axes([0.6, 0.05, 0.1, 0.04])
play_button = Button(ax_play, 'Play')
stop_button = Button(ax_stop, 'Stop')

# Update function
def update_initial_wave():
    global coeffs, eigenstates, ani
    if ani is not None:
        return
    x0, p0, sigma0 = s_x0.val, s_p0.val, s_sigma.val
    psi_init = psi_0(x, x0, p0, sigma0)
    phi_init = fourier_transform(psi_init)
    line_x.set_ydata(np.abs(psi_init)**2)
    line_p.set_ydata(np.abs(phi_init)**2)
    fig.canvas.draw_idle()

    coeffs.clear()
    eigenstates.clear()
    for n in range(number_of_eigenstates):
        phi_n = ho_eigenstate(n, x)
        c_n = simpson(np.conj(phi_n) * psi_init, x=x)
        coeffs.append(c_n)
        eigenstates.append(phi_n)

    probs = [abs(c)**2 for c in coeffs]
    for rect, height in zip(spectrum_bar, probs):
        rect.set_height(height)

# Time evolution
def psi_xt(x, t):
    psi_t = np.zeros_like(x, dtype=complex)
    for n in range(number_of_eigenstates):
        psi_t += coeffs[n] * eigenstates[n] * np.exp(-1j * E_n(n) * t / hbar)
    return psi_t

# Animation
def run_animation(event):
    global ani, times, avg_x_vals, avg_p_vals
    update_initial_wave()
    times.clear()
    avg_x_vals.clear()
    avg_p_vals.clear()
    avgx_line.set_data([], [])
    avgp_line.set_data([], [])

    def animate(frame):
        t = frame * 0.1
        psi_t = psi_xt(x, t)
        prob_x = np.abs(psi_t)**2
        phi_t = fourier_transform(psi_t)
        prob_p = np.abs(phi_t)**2

        avg_x = simpson(x * prob_x, x=x)
        avg_p = simpson(p * prob_p, x=p)

        line_x.set_ydata(prob_x)
        line_p.set_ydata(prob_p)
        ax_wave.set_title(f"$|\psi(x,t)|^2$ at t = {t:.1f}")
        ax_momentum.set_title(f"$|\phi(p,t)|^2$ at t = {t:.1f}")

        times.append(t)
        avg_x_vals.append(avg_x)
        avg_p_vals.append(avg_p)
        avgx_line.set_data(times, avg_x_vals)
        avgp_line.set_data(times, avg_p_vals)
        ax_avg.set_xlim(0, max(20, t + 1))
        ymin = min(avg_x_vals + avg_p_vals) - 1
        ymax = max(avg_x_vals + avg_p_vals) + 1
        ax_avg.set_ylim(ymin, ymax)

        return line_x, line_p, avgx_line, avgp_line

    ani = FuncAnimation(fig, animate, frames=200, interval=50, blit=False)
    plt.draw()

# Stop animation
def stop_animation(event):
    global ani
    if ani is not None:
        ani.event_source.stop()
        ani = None
    update_initial_wave()
    times.clear()
    avg_x_vals.clear()
    avg_p_vals.clear()
    avgx_line.set_data([], [])
    avgp_line.set_data([], [])
    fig.canvas.draw()

# Bind controls
s_x0.on_changed(lambda val: update_initial_wave())
s_p0.on_changed(lambda val: update_initial_wave())
s_sigma.on_changed(lambda val: update_initial_wave())
play_button.on_clicked(run_animation)
stop_button.on_clicked(stop_animation)

# Initial draw
update_initial_wave()
plt.show()
