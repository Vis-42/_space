import csv
import json
from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt


DATA_DIR = Path(__file__).resolve().parents[1] / "data"
PLOTS_DIR = Path(__file__).resolve().parents[1] / "plots"
OUT_DIR = Path(__file__).resolve().parents[1]


def read_xrc_csv(path: Path):
    angles = []
    intensities = []
    meta = {}
    in_scan = False
    with path.open("r", encoding="utf-8", errors="ignore") as f:
        reader = csv.reader(f)
        for row in reader:
            if not row:
                continue
            if row[0].strip() == "[Scan points]":
                in_scan = True
                next(reader, None)  # skip header
                continue
            if in_scan:
                try:
                    angles.append(float(row[0]))
                    intensities.append(float(row[1]))
                except (ValueError, IndexError):
                    continue
            else:
                if len(row) >= 2 and row[0] and row[1]:
                    meta[row[0].strip()] = row[1].strip()
    return np.array(angles), np.array(intensities), meta


def smooth(y, window=9):
    if window < 3:
        return y
    kernel = np.ones(window) / window
    return np.convolve(y, kernel, mode="same")


def find_peaks(x, y, min_distance=0.15):
    y_s = smooth(y, 9)
    baseline = np.percentile(y_s, 20)
    noise = np.std(y_s[y_s < np.percentile(y_s, 50)])
    threshold = baseline + 4 * noise
    peaks = []
    for i in range(2, len(y_s) - 2):
        if y_s[i] > threshold and y_s[i] >= y_s[i - 1] and y_s[i] >= y_s[i + 1]:
            peaks.append((x[i], y[i]))
    peaks = sorted(peaks, key=lambda p: p[1], reverse=True)
    filtered = []
    for px, py in peaks:
        if all(abs(px - fx) >= min_distance for fx, _ in filtered):
            filtered.append((px, py))
        if len(filtered) >= 20:
            break
    return sorted(filtered, key=lambda p: p[0])


def bragg_d(two_theta_deg, wavelength):
    theta = np.radians(two_theta_deg / 2.0)
    return wavelength / (2 * np.sin(theta))


def process_file(path: Path):
    x, y, meta = read_xrc_csv(path)
    if len(x) == 0:
        raise ValueError(f"No scan points found in {path}")
    wavelength = float(meta.get("K-Alpha1 wavelength", "1.5405980"))
    peaks = find_peaks(x, y)
    peak_rows = []
    for two_theta, intensity in peaks:
        d = bragg_d(two_theta, wavelength)
        peak_rows.append(
            {
                "two_theta_deg": round(two_theta, 3),
                "intensity": round(float(intensity), 1),
                "d_angstrom": round(float(d), 4),
            }
        )
    # Plot
    PLOTS_DIR.mkdir(parents=True, exist_ok=True)
    title = path.stem.replace("_", " ")
    fig, ax = plt.subplots(figsize=(7.5, 4.5), dpi=150)
    ax.plot(x, y, color="black", linewidth=0.8)
    for p in peak_rows:
        ax.axvline(p["two_theta_deg"], color="red", alpha=0.4, linewidth=0.7)
    ax.set_xlabel("2theta (deg)")
    ax.set_ylabel("Intensity (a.u.)")
    ax.set_title(title)
    ax.grid(alpha=0.2)
    out_path = PLOTS_DIR / f"{path.stem}_xrc.png"
    fig.tight_layout()
    fig.savefig(out_path)
    plt.close(fig)
    return {
        "file": str(path.name),
        "wavelength": wavelength,
        "scan_range": [float(x.min()), float(x.max())],
        "step": float(np.median(np.diff(x))),
        "peaks": peak_rows,
        "plot": str(out_path),
    }


def main():
    results = []
    for csv_path in sorted(DATA_DIR.glob("*.csv")):
        results.append(process_file(csv_path))
    out_path = OUT_DIR / "xrc_summary.json"
    out_path.write_text(json.dumps(results, indent=2))
    print(f"Wrote {out_path}")


if __name__ == "__main__":
    main()
