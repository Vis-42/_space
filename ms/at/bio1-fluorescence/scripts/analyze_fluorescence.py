import json
from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt


DATA_DIR = Path(__file__).resolve().parents[1] / "data "
PLOTS_DIR = Path(__file__).resolve().parents[1] / "plots"
OUT_DIR = Path(__file__).resolve().parents[1]

LABELS = {
    "sol1": "BSA + PBS",
    "sol2": "BSA + acid",
    "sol3": "Lysozyme + PBS",
    "sol4": "Lysozyme + acid",
}

COLORS = {
    "sol1": "#1f77b4",
    "sol2": "#ff7f0e",
    "sol3": "#2ca02c",
    "sol4": "#d62728",
}


def read_fluorescence_csv(path: Path):
    wavelengths = []
    intensities = []
    meta = {}
    in_data = False
    in_meta = False
    with path.open("r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            stripped = line.strip()
            if not stripped:
                if in_data:
                    in_data = False
                continue
            if stripped.startswith("Wavelength (nm)"):
                in_data = True
                continue
            if in_data:
                parts = stripped.split(",")
                try:
                    wavelengths.append(float(parts[0]))
                    intensities.append(float(parts[1]))
                except (ValueError, IndexError):
                    in_data = False
                    continue
            if ":" in stripped and not in_data:
                key_val = stripped.split(":", 1)
                if len(key_val) == 2:
                    meta[key_val[0].strip()] = key_val[1].strip()
    return np.array(wavelengths), np.array(intensities), meta


def smooth(y, window=5):
    if window < 3 or len(y) < window:
        return y
    kernel = np.ones(window) / window
    return np.convolve(y, kernel, mode="same")


def find_peak(x, y, window=5):
    y_s = smooth(y, window)
    idx = np.argmax(y_s)
    return float(x[idx]), float(y[idx]), float(y_s[idx])


def main():
    PLOTS_DIR.mkdir(parents=True, exist_ok=True)
    results = []

    fig, ax = plt.subplots(figsize=(7.5, 4.5), dpi=150)

    for stem in ["sol1", "sol2", "sol3", "sol4"]:
        path = DATA_DIR / f"{stem}.csv"
        x, y, meta = read_fluorescence_csv(path)
        label = LABELS.get(stem, stem)
        ax.plot(x, y, linewidth=1.2, label=label, color=COLORS[stem])

        raw_peak_x, raw_peak_y, _ = find_peak(x, y, window=1)
        smooth_peak_x, _, smooth_peak_y = find_peak(x, y, window=7)

        results.append({
            "file": path.name,
            "label": label,
            "x_range": [float(x.min()), float(x.max())],
            "peak_raw": {"wavelength_nm": raw_peak_x, "intensity": raw_peak_y},
            "peak_smoothed": {"wavelength_nm": smooth_peak_x, "intensity": round(smooth_peak_y, 2)},
            "meta": meta,
        })

    ax.set_xlabel("Wavelength (nm)", fontsize=11)
    ax.set_ylabel("Fluorescence Intensity (a.u.)", fontsize=11)
    ax.legend(frameon=False, fontsize=9)
    ax.grid(alpha=0.2)
    ax.set_xlim(300, 400)
    fig.tight_layout()

    plot_path = PLOTS_DIR / "fluorescence_emission.png"
    fig.savefig(plot_path)
    plt.close(fig)

    out_path = OUT_DIR / "fluorescence_summary.json"
    out_path.write_text(json.dumps(results, indent=2))
    print(f"Wrote {out_path} and {plot_path}")


if __name__ == "__main__":
    main()
