"""
Driven Triple Pendulum Simulation
PC3236 Computational Methods in Physics

Solves the equations of motion for a triple pendulum with a periodic
driving torque applied to the pivot of the first pendulum.

The Lagrangian approach yields 3 coupled second-order ODEs which are
rewritten as 6 first-order ODEs and integrated using a hand-coded RK4
scheme.  scipy.integrate.solve_ivp is used as a cross-check.
"""

import json
import sys
from pathlib import Path

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

PLOTS = Path(__file__).resolve().parent.parent / "plots"
PLOTS.mkdir(exist_ok=True)

# ── Physical parameters ──────────────────────────────────────────────
g  = 9.81          # gravitational acceleration  [m/s^2]
L1 = 0.4           # length of rod 1             [m]
L2 = 0.35          # length of rod 2             [m]
L3 = 0.3           # length of rod 3             [m]
m1 = 1.0           # mass of bob 1               [kg]
m2 = 1.0           # mass of bob 2               [kg]
m3 = 1.0           # mass of bob 3               [kg]

# Driving torque: tau(t) = tau0 * cos(omega_d * t) applied at pivot 1
tau0    = 2.0       # driving amplitude           [N m]
omega_d = 2.0 * np.pi * 0.8   # driving angular frequency [rad/s]

# ── Time grid ────────────────────────────────────────────────────────
T_END = 40.0
DT    = 1e-3
N     = int(T_END / DT) + 1

# ── Mass matrix and forcing (Lagrangian EOM) ─────────────────────────
#
# State vector: y = [theta1, theta2, theta3, omega1, omega2, omega3]
#
# The mass matrix M(theta) * [alpha1, alpha2, alpha3]^T = F(theta, omega, t)
# where alpha_i = d(omega_i)/dt.
#
# M_ij and F_i are derived from the Lagrangian
#   L = T - V
# with
#   x1 = L1 sin(theta1),                  y1 = -L1 cos(theta1)
#   x2 = x1 + L2 sin(theta2),             y2 = y1 - L2 cos(theta2)
#   x3 = x2 + L3 sin(theta3),             y3 = y2 - L3 cos(theta3)


def mass_matrix(th):
    """Return the 3x3 mass matrix M(theta)."""
    th1, th2, th3 = th
    M = np.zeros((3, 3))

    M[0, 0] = (m1 + m2 + m3) * L1**2
    M[0, 1] = (m2 + m3) * L1 * L2 * np.cos(th1 - th2)
    M[0, 2] = m3 * L1 * L3 * np.cos(th1 - th3)

    M[1, 0] = (m2 + m3) * L1 * L2 * np.cos(th1 - th2)
    M[1, 1] = (m2 + m3) * L2**2
    M[1, 2] = m3 * L2 * L3 * np.cos(th2 - th3)

    M[2, 0] = m3 * L1 * L3 * np.cos(th1 - th3)
    M[2, 1] = m3 * L2 * L3 * np.cos(th2 - th3)
    M[2, 2] = m3 * L3**2

    return M


def forcing(th, om, t):
    """Return the forcing vector F(theta, omega, t)."""
    th1, th2, th3 = th
    om1, om2, om3 = om
    F = np.zeros(3)

    F[0] = (  (m2 + m3) * L1 * L2 * om2**2 * np.sin(th1 - th2)
            + m3 * L1 * L3 * om3**2 * np.sin(th1 - th3)
            - (m1 + m2 + m3) * g * L1 * np.sin(th1)
            + tau0 * np.cos(omega_d * t))

    F[1] = (-(m2 + m3) * L1 * L2 * om1**2 * np.sin(th1 - th2)
            + m3 * L2 * L3 * om3**2 * np.sin(th2 - th3)
            - (m2 + m3) * g * L2 * np.sin(th2))

    F[2] = (-m3 * L1 * L3 * om1**2 * np.sin(th1 - th3)
            - m3 * L2 * L3 * om2**2 * np.sin(th2 - th3)
            - m3 * g * L3 * np.sin(th3))

    return F


def derivs(t, y):
    """RHS of the ODE system  dy/dt = f(t, y)."""
    th = y[:3]
    om = y[3:]
    M = mass_matrix(th)
    F = forcing(th, om, t)
    alpha = np.linalg.solve(M, F)
    return np.concatenate([om, alpha])


# ── Custom RK4 integrator ────────────────────────────────────────────

def rk4_step(f, t, y, dt):
    """Single 4th-order Runge-Kutta step."""
    k1 = f(t,          y)
    k2 = f(t + 0.5*dt, y + 0.5*dt*k1)
    k3 = f(t + 0.5*dt, y + 0.5*dt*k2)
    k4 = f(t + dt,     y + dt*k3)
    return y + (dt / 6.0) * (k1 + 2*k2 + 2*k3 + k4)


def integrate_rk4(f, y0, t_span, dt):
    """Integrate dy/dt = f(t,y) from t_span[0] to t_span[1] using RK4."""
    t0, tf = t_span
    n_steps = int(np.ceil((tf - t0) / dt))
    t_arr = np.linspace(t0, tf, n_steps + 1)
    y_arr = np.zeros((n_steps + 1, len(y0)))
    y_arr[0] = y0
    for i in range(n_steps):
        y_arr[i + 1] = rk4_step(f, t_arr[i], y_arr[i], t_arr[i+1] - t_arr[i])
    return t_arr, y_arr


# ── Energy calculation ───────────────────────────────────────────────

def kinetic_energy(th, om):
    """Total kinetic energy of the three-pendulum system."""
    th1, th2, th3 = th
    om1, om2, om3 = om

    vx1 = L1 * om1 * np.cos(th1)
    vy1 = L1 * om1 * np.sin(th1)

    vx2 = vx1 + L2 * om2 * np.cos(th2)
    vy2 = vy1 + L2 * om2 * np.sin(th2)

    vx3 = vx2 + L3 * om3 * np.cos(th3)
    vy3 = vy2 + L3 * om3 * np.sin(th3)

    T = 0.5 * m1 * (vx1**2 + vy1**2) \
      + 0.5 * m2 * (vx2**2 + vy2**2) \
      + 0.5 * m3 * (vx3**2 + vy3**2)
    return T


def potential_energy(th):
    th1, th2, th3 = th
    y1 = -L1 * np.cos(th1)
    y2 = y1 - L2 * np.cos(th2)
    y3 = y2 - L3 * np.cos(th3)
    return m1*g*y1 + m2*g*y2 + m3*g*y3


# ── Main simulation ─────────────────────────────────────────────────

def run_simulation(y0, label="default", dt=DT, t_end=T_END):
    print(f"  Running RK4 integration ({label})  dt={dt:.0e}  T={t_end} s ...")
    t, Y = integrate_rk4(derivs, y0, (0, t_end), dt)
    print(f"    done – {len(t)} time steps")
    return t, Y


def run_scipy(y0, t_end=T_END):
    print("  Running scipy RK45 cross-check ...")
    sol = solve_ivp(derivs, (0, t_end), y0, method="RK45",
                    max_step=DT*5, rtol=1e-9, atol=1e-12,
                    dense_output=True)
    t_dense = np.linspace(0, t_end, 5000)
    Y_dense = sol.sol(t_dense).T
    print(f"    done – {sol.nfev} function evaluations")
    return t_dense, Y_dense


# ── Plotting routines ────────────────────────────────────────────────

def plot_time_series(t, Y, fname="time_series.png"):
    fig, axes = plt.subplots(3, 1, figsize=(10, 7), sharex=True)
    labels = [r"$\theta_1$", r"$\theta_2$", r"$\theta_3$"]
    colors = ["#1f77b4", "#ff7f0e", "#2ca02c"]
    for i, (ax, lab, c) in enumerate(zip(axes, labels, colors)):
        ax.plot(t, np.degrees(Y[:, i]), lw=0.5, color=c)
        ax.set_ylabel(f"{lab} (deg)")
        ax.grid(alpha=0.25)
    axes[-1].set_xlabel("Time (s)")
    axes[0].set_title("Driven Triple Pendulum – Angular Displacements")
    fig.tight_layout()
    fig.savefig(PLOTS / fname, dpi=150)
    plt.close(fig)
    print(f"    saved {fname}")


def plot_phase_portraits(t, Y, fname="phase_portraits.png"):
    fig, axes = plt.subplots(1, 3, figsize=(14, 4))
    labels = [r"$\theta_1$", r"$\theta_2$", r"$\theta_3$"]
    colors = ["#1f77b4", "#ff7f0e", "#2ca02c"]
    for i, (ax, lab, c) in enumerate(zip(axes, labels, colors)):
        ax.plot(np.degrees(Y[:, i]), np.degrees(Y[:, i+3]),
                lw=0.15, color=c, alpha=0.7)
        ax.set_xlabel(f"{lab} (deg)")
        ax.set_ylabel(f"$\\dot{{{lab[1:-1]}}}$ (deg/s)")
        ax.set_title(f"Pendulum {i+1}")
        ax.grid(alpha=0.25)
    fig.suptitle("Phase Portraits", fontsize=13)
    fig.tight_layout()
    fig.savefig(PLOTS / fname, dpi=150)
    plt.close(fig)
    print(f"    saved {fname}")


def plot_energy(t, Y, fname="energy.png"):
    KE = np.array([kinetic_energy(Y[j, :3], Y[j, 3:]) for j in range(len(t))])
    PE = np.array([potential_energy(Y[j, :3]) for j in range(len(t))])
    E_total = KE + PE

    fig, ax = plt.subplots(figsize=(10, 4))
    ax.plot(t, KE, lw=0.5, label="Kinetic", alpha=0.8)
    ax.plot(t, PE, lw=0.5, label="Potential", alpha=0.8)
    ax.plot(t, E_total, lw=0.7, label="Total", color="black")
    ax.set_xlabel("Time (s)")
    ax.set_ylabel("Energy (J)")
    ax.set_title("Energy vs Time (driven system – total energy is NOT conserved)")
    ax.legend()
    ax.grid(alpha=0.25)
    fig.tight_layout()
    fig.savefig(PLOTS / fname, dpi=150)
    plt.close(fig)
    print(f"    saved {fname}")


def plot_poincare(t, Y, fname="poincare.png"):
    """Stroboscopic Poincaré section sampled at the driving period."""
    T_drive = 2 * np.pi / omega_d
    # sample at integer multiples of driving period
    sample_times = np.arange(0, t[-1], T_drive)
    indices = np.searchsorted(t, sample_times)
    indices = indices[indices < len(t)]

    fig, axes = plt.subplots(1, 3, figsize=(14, 4))
    labels = [r"$\theta_1$", r"$\theta_2$", r"$\theta_3$"]
    colors = ["#1f77b4", "#ff7f0e", "#2ca02c"]
    for i, (ax, lab, c) in enumerate(zip(axes, labels, colors)):
        th_mod = np.mod(Y[indices, i] + np.pi, 2*np.pi) - np.pi
        ax.scatter(np.degrees(th_mod), np.degrees(Y[indices, i+3]),
                   s=1.5, color=c, alpha=0.6)
        ax.set_xlabel(f"{lab} (deg)")
        ax.set_ylabel(f"$\\dot{{{lab[1:-1]}}}$ (deg/s)")
        ax.set_title(f"Pendulum {i+1}")
        ax.grid(alpha=0.25)
    fig.suptitle(f"Poincaré Section (stroboscopic, T = {T_drive:.3f} s)", fontsize=13)
    fig.tight_layout()
    fig.savefig(PLOTS / fname, dpi=150)
    plt.close(fig)
    print(f"    saved {fname}")


def plot_sensitivity(t1, Y1, t2, Y2, fname="sensitivity.png"):
    """Divergence of two nearby trajectories."""
    n = min(len(t1), len(t2))
    delta = np.sqrt(np.sum((Y1[:n, :3] - Y2[:n, :3])**2, axis=1))
    fig, ax = plt.subplots(figsize=(10, 4))
    ax.semilogy(t1[:n], delta, lw=0.6, color="crimson")
    ax.set_xlabel("Time (s)")
    ax.set_ylabel(r"$|\Delta\theta|$ (rad)")
    ax.set_title("Sensitivity to Initial Conditions (Chaos)")
    ax.grid(alpha=0.25)
    fig.tight_layout()
    fig.savefig(PLOTS / fname, dpi=150)
    plt.close(fig)
    print(f"    saved {fname}")


def plot_scipy_comparison(t_rk4, Y_rk4, t_sp, Y_sp, fname="scipy_comparison.png"):
    """Compare custom RK4 with scipy RK45."""
    from scipy.interpolate import interp1d
    f_sp = interp1d(t_sp, Y_sp[:, 0], kind="cubic")
    t_common = t_rk4[t_rk4 <= t_sp[-1]]
    diff = np.abs(Y_rk4[:len(t_common), 0] - f_sp(t_common))

    fig, ax = plt.subplots(figsize=(10, 3.5))
    ax.semilogy(t_common, diff, lw=0.5, color="purple")
    ax.set_xlabel("Time (s)")
    ax.set_ylabel(r"$|\theta_{1,\mathrm{RK4}} - \theta_{1,\mathrm{scipy}}|$ (rad)")
    ax.set_title("RK4 vs scipy RK45 – Absolute Difference in θ₁")
    ax.grid(alpha=0.25)
    fig.tight_layout()
    fig.savefig(PLOTS / fname, dpi=150)
    plt.close(fig)
    print(f"    saved {fname}")


def plot_bifurcation(y0_base, fname="bifurcation.png"):
    """Bifurcation diagram: vary driving amplitude tau0."""
    global tau0
    tau_vals = np.linspace(0.5, 8.0, 60)
    print("  Computing bifurcation diagram (60 amplitudes) ...")

    fig, axes = plt.subplots(3, 1, figsize=(10, 8), sharex=True)
    labels = [r"$\theta_1$", r"$\theta_2$", r"$\theta_3$"]

    T_drive = 2 * np.pi / omega_d
    t_transient = 20.0
    t_sample = 20.0

    for tau_val in tau_vals:
        tau0 = tau_val
        t_run, Y_run = integrate_rk4(derivs, y0_base,
                                      (0, t_transient + t_sample), DT*2)
        mask = t_run >= t_transient
        sample_times = np.arange(t_transient, t_transient + t_sample, T_drive)
        idx = np.searchsorted(t_run, sample_times)
        idx = idx[idx < len(t_run)]
        for i in range(3):
            th_mod = np.mod(Y_run[idx, i] + np.pi, 2*np.pi) - np.pi
            axes[i].scatter([tau_val]*len(idx), np.degrees(th_mod),
                            s=0.4, color="black", alpha=0.4)

    for i, lab in enumerate(labels):
        axes[i].set_ylabel(f"{lab} (deg)")
        axes[i].grid(alpha=0.2)
    axes[-1].set_xlabel(r"Driving amplitude $\tau_0$ (N·m)")
    axes[0].set_title("Bifurcation Diagram (Poincaré samples vs driving amplitude)")
    fig.tight_layout()
    fig.savefig(PLOTS / fname, dpi=150)
    plt.close(fig)
    print(f"    saved {fname}")

    tau0 = 2.0  # restore default


# ── Entry point ──────────────────────────────────────────────────────

if __name__ == "__main__":
    # Initial condition: small angles, zero velocities
    y0 = np.array([0.3, 0.5, 0.2, 0.0, 0.0, 0.0])

    print("=" * 60)
    print("Driven Triple Pendulum – Full Simulation")
    print("=" * 60)

    # 1. Main integration
    t, Y = run_simulation(y0, label="main")

    # 2. All standard plots
    print("\nGenerating plots ...")
    plot_time_series(t, Y)
    plot_phase_portraits(t, Y)
    plot_energy(t, Y)
    plot_poincare(t, Y)

    # 3. Sensitivity to initial conditions
    eps = 1e-6
    y0_perturbed = y0.copy()
    y0_perturbed[0] += eps
    t2, Y2 = run_simulation(y0_perturbed, label="perturbed")
    plot_sensitivity(t, Y, t2, Y2)

    # 4. scipy cross-check
    t_sp, Y_sp = run_scipy(y0, t_end=min(T_END, 20))
    plot_scipy_comparison(t, Y, t_sp, Y_sp)

    # 5. Bifurcation
    plot_bifurcation(y0)

    # 6. Save parameters
    params = dict(
        g=g, L1=L1, L2=L2, L3=L3, m1=m1, m2=m2, m3=m3,
        tau0=2.0, omega_d=omega_d,
        dt=DT, T_end=T_END,
        y0=y0.tolist(),
    )
    (PLOTS.parent / "sim_params.json").write_text(json.dumps(params, indent=2))
    print("\nAll done.")
