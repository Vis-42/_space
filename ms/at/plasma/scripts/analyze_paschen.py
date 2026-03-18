#!/usr/bin/env python3
"""
Analyse Paschen curve data: generate plots, compute the second Townsend
coefficient gamma, and overlay theoretical Paschen curves.
"""

import json
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path
from scipy.optimize import curve_fit

ROOT = Path(__file__).resolve().parent.parent
DATA_FILE = ROOT / "data" / "paschen_data.json"
PLOT_DIR = ROOT / "plots"
RESULTS_FILE = ROOT / "analysis_results.json"

PLOT_DIR.mkdir(exist_ok=True)

A = 20.0      # 1/(Pa m)
B = 487.0     # 1/(Pa m)
E_EULER = np.e

PRESSURE_COLORS = {"8": "#1f77b4", "6": "#ff7f0e", "4": "#2ca02c"}
PRESSURE_MARKERS = {"8": "o", "6": "s", "4": "^"}


def load_data():
    with open(DATA_FILE) as f:
        raw = json.load(f)

    processed = {}
    for p_str, trials_by_d in raw["data"].items():
        d_vals, u_avg, u_std = [], [], []
        for d_str, trials in trials_by_d.items():
            if trials is None:
                continue
            d_vals.append(float(d_str))
            arr = np.array(trials, dtype=float)
            u_avg.append(arr.mean())
            u_std.append(arr.std(ddof=1) if len(arr) > 1 else 0.0)
        processed[p_str] = {
            "d_mm": np.array(d_vals),
            "U_avg": np.array(u_avg),
            "U_std": np.array(u_std),
            "p_hPa": float(p_str),
            "p_Pa": float(p_str) * 100.0,
        }
    return processed


def paschen_voltage(pd, C):
    """Paschen breakdown voltage: U_br = B * pd / ln(A * pd / C)"""
    arg = A * pd / C
    arg = np.where(arg > 1.0, arg, np.nan)
    return B * pd / np.log(arg)


def pd_min_from_C(C):
    return E_EULER * C / A


def U_min_from_C(C):
    return E_EULER * B * C / A


def plot_U_vs_d(data):
    """Plot 1: U_br vs d for each pressure."""
    fig, ax = plt.subplots(figsize=(8, 5.5))
    for p_str, d in sorted(data.items(), key=lambda x: -x[1]["p_hPa"]):
        ax.errorbar(
            d["d_mm"], d["U_avg"], yerr=d["U_std"],
            fmt=PRESSURE_MARKERS[p_str] + "-",
            color=PRESSURE_COLORS[p_str],
            capsize=3, markersize=5, linewidth=1.2,
            label=f"{p_str} hPa"
        )
    ax.set_xlabel("Electrode gap d (mm)", fontsize=12)
    ax.set_ylabel("Breakdown voltage $U_{br}$ (V)", fontsize=12)
    ax.set_title("Paschen Curves: $U_{br}$ vs $d$", fontsize=13)
    ax.legend(fontsize=11)
    ax.grid(True, alpha=0.3)
    fig.tight_layout()
    fig.savefig(PLOT_DIR / "U_vs_d.png", dpi=200)
    plt.close(fig)


def plot_U_vs_pd(data):
    """Plot 2: U_br vs pd (should collapse onto single curve)."""
    fig, ax = plt.subplots(figsize=(8, 5.5))
    for p_str, d in sorted(data.items(), key=lambda x: -x[1]["p_hPa"]):
        pd_vals = d["d_mm"] * 1e-3 * d["p_Pa"]  # Pa m
        ax.errorbar(
            pd_vals, d["U_avg"], yerr=d["U_std"],
            fmt=PRESSURE_MARKERS[p_str],
            color=PRESSURE_COLORS[p_str],
            capsize=3, markersize=5,
            label=f"{p_str} hPa"
        )
    ax.set_xlabel("$p \\times d$ (Pa·m)", fontsize=12)
    ax.set_ylabel("Breakdown voltage $U_{br}$ (V)", fontsize=12)
    ax.set_title("Paschen Curve: $U_{br}$ vs $pd$", fontsize=13)
    ax.legend(fontsize=11)
    ax.grid(True, alpha=0.3)
    fig.tight_layout()
    fig.savefig(PLOT_DIR / "U_vs_pd.png", dpi=200)
    plt.close(fig)


def plot_linear(data):
    """Plot 3: d/U_br vs ln(d) for linearity check and gamma extraction."""
    fig, ax = plt.subplots(figsize=(8, 5.5))
    fit_results = {}

    for p_str, d in sorted(data.items(), key=lambda x: -x[1]["p_hPa"]):
        mask = d["d_mm"] > 0
        d_m = d["d_mm"][mask] * 1e-3
        U = d["U_avg"][mask]
        ln_d = np.log(d_m)
        y = d_m / U

        ax.plot(
            ln_d, y, PRESSURE_MARKERS[p_str],
            color=PRESSURE_COLORS[p_str],
            markersize=5, label=f"{p_str} hPa"
        )

        # Linear fit to the right branch (past minimum, where d/U increases with ln(d))
        # Find the minimum of U to select points on the right branch
        i_min = np.argmin(U)
        if i_min < len(U) - 3:
            fit_mask = np.arange(len(U)) >= i_min
        else:
            fit_mask = np.ones(len(U), dtype=bool)

        if np.sum(fit_mask) >= 3:
            ln_d_fit = ln_d[fit_mask]
            y_fit = y[fit_mask]
            coeffs = np.polyfit(ln_d_fit, y_fit, 1)
            slope, intercept = coeffs

            ln_d_line = np.linspace(ln_d_fit.min(), ln_d_fit.max(), 50)
            ax.plot(
                ln_d_line, slope * ln_d_line + intercept,
                "--", color=PRESSURE_COLORS[p_str], linewidth=1.0, alpha=0.7
            )

            p_Pa = d["p_Pa"]
            B_est = 1.0 / (slope * p_Pa) if slope != 0 else np.nan
            ln_ApC = intercept * B_est * p_Pa if slope != 0 else np.nan

            C_from_fit = A * p_Pa / np.exp(ln_ApC / (slope * p_Pa)) if slope != 0 else np.nan

            if slope != 0:
                val = intercept / slope
                C_est = A * p_Pa * np.exp(-val * B * p_Pa) if not np.isnan(val) else np.nan
            else:
                C_est = np.nan

            # C = ln(1/gamma + 1), so gamma = 1/(exp(C) - 1)
            # Use the intercept relationship: intercept = C / (B*p)
            C_direct = intercept * B * p_Pa
            if not np.isnan(C_direct) and C_direct > 0:
                gamma_lin = 1.0 / (np.exp(C_direct) - 1)
            else:
                gamma_lin = np.nan

            fit_results[p_str] = {
                "slope": slope,
                "intercept": intercept,
                "B_estimated": B_est,
                "C_from_intercept": C_direct,
                "gamma_from_linear_fit": gamma_lin,
            }

    ax.set_xlabel("ln($d$ / m)", fontsize=12)
    ax.set_ylabel("$d / U_{br}$ (m/V)", fontsize=12)
    ax.set_title("Linear Plot: $d/U_{br}$ vs ln($d$)", fontsize=13)
    ax.legend(fontsize=11)
    ax.grid(True, alpha=0.3)
    fig.tight_layout()
    fig.savefig(PLOT_DIR / "linear_plot.png", dpi=200)
    plt.close(fig)
    return fit_results


def compute_gamma_from_minimum(data):
    """Extract gamma from the Paschen minimum using Eq. 7-9."""
    results = {}
    for p_str, d in data.items():
        i_min = np.argmin(d["U_avg"])
        U_min = d["U_avg"][i_min]
        d_min_mm = d["d_mm"][i_min]
        d_min_m = d_min_mm * 1e-3
        pd_min = d["p_Pa"] * d_min_m

        C_from_Umin = U_min * A / (E_EULER * B)
        C_from_pdmin = A * pd_min / E_EULER

        gamma_from_Umin = 1.0 / (np.exp(C_from_Umin) - 1)
        gamma_from_pdmin = 1.0 / (np.exp(C_from_pdmin) - 1)

        results[p_str] = {
            "d_min_mm": float(d_min_mm),
            "U_min_V": float(U_min),
            "pd_min_Pa_m": float(pd_min),
            "C_from_Umin": float(C_from_Umin),
            "C_from_pdmin": float(C_from_pdmin),
            "gamma_from_Umin": float(gamma_from_Umin),
            "gamma_from_pdmin": float(gamma_from_pdmin),
        }
    return results


def plot_with_theory(data, gamma_results):
    """Plot 4: measured data with theoretical Paschen overlay."""
    fig, ax = plt.subplots(figsize=(8, 5.5))

    gammas = [r["gamma_from_Umin"] for r in gamma_results.values()
              if not np.isnan(r["gamma_from_Umin"]) and r["gamma_from_Umin"] > 0]
    gamma_avg = np.mean(gammas) if gammas else 0.01
    C_avg = np.log(1.0 / gamma_avg + 1)

    pd_theory = np.linspace(0.4, 5.0, 500)
    U_theory = paschen_voltage(pd_theory, C_avg)
    ax.plot(
        pd_theory, U_theory, "k-", linewidth=1.5, alpha=0.6,
        label=f"Theory (γ = {gamma_avg:.4f})"
    )

    for p_str, d in sorted(data.items(), key=lambda x: -x[1]["p_hPa"]):
        pd_vals = d["d_mm"] * 1e-3 * d["p_Pa"]
        ax.errorbar(
            pd_vals, d["U_avg"], yerr=d["U_std"],
            fmt=PRESSURE_MARKERS[p_str],
            color=PRESSURE_COLORS[p_str],
            capsize=3, markersize=5,
            label=f"{p_str} hPa data"
        )

    ax.set_xlabel("$p \\times d$ (Pa·m)", fontsize=12)
    ax.set_ylabel("Breakdown voltage $U_{br}$ (V)", fontsize=12)
    ax.set_title("Measured Data with Theoretical Paschen Curve", fontsize=13)
    ax.legend(fontsize=10)
    ax.grid(True, alpha=0.3)
    ax.set_ylim(bottom=350)
    fig.tight_layout()
    fig.savefig(PLOT_DIR / "U_vs_pd_with_theory.png", dpi=200)
    plt.close(fig)
    return gamma_avg, C_avg


def main():
    data = load_data()

    plot_U_vs_d(data)
    print("Generated: U_vs_d.png")

    plot_U_vs_pd(data)
    print("Generated: U_vs_pd.png")

    linear_results = plot_linear(data)
    print("Generated: linear_plot.png")

    gamma_min_results = compute_gamma_from_minimum(data)

    gamma_avg, C_avg = plot_with_theory(data, gamma_min_results)
    print("Generated: U_vs_pd_with_theory.png")

    results = {
        "gamma_from_minimum": gamma_min_results,
        "gamma_from_linear_fit": linear_results,
        "gamma_average": float(gamma_avg),
        "C_average": float(C_avg),
        "U_min_theoretical": float(U_min_from_C(C_avg)),
        "pd_min_theoretical": float(pd_min_from_C(C_avg)),
    }

    with open(RESULTS_FILE, "w") as f:
        json.dump(results, f, indent=2, default=lambda x: float(x) if isinstance(x, (np.floating, np.integer)) else None)

    print(f"\nResults saved to {RESULTS_FILE}")

    print("\n--- Gamma from Paschen Minimum ---")
    for p, r in sorted(gamma_min_results.items()):
        print(f"  {p} hPa: d_min = {r['d_min_mm']:.2f} mm, "
              f"U_min = {r['U_min_V']:.0f} V, "
              f"γ(U_min) = {r['gamma_from_Umin']:.6f}, "
              f"γ(pd_min) = {r['gamma_from_pdmin']:.6f}")

    print(f"\n  Average γ = {gamma_avg:.6f}")
    print(f"  Theoretical U_min = {U_min_from_C(C_avg):.1f} V")
    print(f"  Theoretical (pd)_min = {pd_min_from_C(C_avg):.4f} Pa·m")


if __name__ == "__main__":
    main()
