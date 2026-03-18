import json
from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt


DATA_DIR = Path(__file__).resolve().parents[1] / "data"
PLOTS_DIR = Path(__file__).resolve().parents[1] / "plots"
OUT_DIR = Path(__file__).resolve().parents[1]


def read_cd_txt(path: Path):
    x = []
    y = []
    in_data = False
    meta = {}
    with path.open("r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            if line.strip() == "XYDATA":
                in_data = True
                continue
            if not in_data:
                if "\t" in line:
                    key, value = line.split("\t", 1)
                    meta[key.strip()] = value.strip()
                continue
            parts = line.strip().split()
            if len(parts) >= 2:
                try:
                    x.append(float(parts[0]))
                    y.append(float(parts[1]))
                except ValueError:
                    continue
    return np.array(x), np.array(y), meta


def find_min_in_range(x, y, lo, hi):
    mask = (x >= lo) & (x <= hi)
    if not mask.any():
        return None
    idx = np.argmin(y[mask])
    xsel = x[mask][idx]
    ysel = y[mask][idx]
    return float(xsel), float(ysel)


def main():
    PLOTS_DIR.mkdir(parents=True, exist_ok=True)
    results = []
    fig, ax = plt.subplots(figsize=(7.5, 4.5), dpi=150)
    for path in sorted(DATA_DIR.glob("sol*.txt")):
        x, y, meta = read_cd_txt(path)
        ax.plot(x, y, linewidth=1.0, label=path.stem)
        min_helix = find_min_in_range(x, y, 210, 222)
        min_208 = find_min_in_range(x, y, 206, 210)
        results.append(
            {
                "file": path.name,
                "x_range": [float(x.min()), float(x.max())] if len(x) else [],
                "min_210_222": min_helix,
                "min_206_210": min_208,
                "meta": meta,
            }
        )
    ax.set_xlabel("Wavelength (nm)")
    ax.set_ylabel("Ellipticity (mdeg)")
    ax.set_title("CD spectra (sol1-sol4)")
    ax.grid(alpha=0.2)
    ax.legend(frameon=False)
    fig.tight_layout()
    plot_path = PLOTS_DIR / "cd_sol1_sol4.png"
    fig.savefig(plot_path)
    plt.close(fig)

    out_path = OUT_DIR / "cd_summary.json"
    out_path.write_text(json.dumps(results, indent=2))
    print(f"Wrote {out_path} and {plot_path}")


if __name__ == "__main__":
    main()
