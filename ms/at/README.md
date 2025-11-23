# PC2193 Experimental Physics - Laboratory Reports

**Author:** Parth Bhargava (A0310667E)  
**Course:** PC2193 Experimental Physics & Data Analysis  
**Institution:** National University of Singapore

This repository contains complete experimental reports, data analysis, and presentations for three physics experiments conducted as part of PC2193.

---

## 📁 Directory Structure

```
at/
├── hall_effect/              # Experiment D: Hall Effect in Semiconductors
│   ├── he.typ                # Main report (Typst source)
│   ├── he.pdf                # Compiled report
│   ├── data/                 # Raw experimental data files
│   ├── plots/                # Generated figures and plots
│   └── scripts/              # Python analysis scripts
│       └── hall_effect_analysis.py
│
├── xrd/                      # Experiment C: X-Ray Diffraction
│   ├── xrd.typ               # Main report (Typst source)
│   ├── xrd.pdf               # Compiled report
│   ├── data/                 # Raw experimental data
│   ├── plots/                # Generated figures
│   └── scripts/              # Analysis scripts
│       └── xrd_final_corrected.py
│
├── magnetic_moment/          # Experiment E: Magnetic Moment in Helmholtz Field
│   ├── mm.typ                # Main report (Typst source)
│   ├── mm.pdf                # Compiled report
│   ├── mm_pres.typ           # Presentation (Typst source)
│   ├── mm_pres.pdf           # Compiled presentation
│   ├── MM_MagneticMoment copy.pdf  # Experiment manual
│   ├── data/                 # Raw experimental data
│   │   ├── all_data_corrected.csv
│   │   └── all_experimental_data_master.txt
│   ├── plots/                # Generated figures
│   └── scripts/              # Analysis scripts
│       ├── mm_analysis.py
│       ├── mm_enhanced_analysis.py
│       └── mm_corrected_analysis.py
│
├── shared/                   # Shared templates and assets
│   ├── _at.typ               # Common Typst template
│   ├── _templ.typ            # Template examples
│   └── _templ.pdf
│
├── venv_physics/             # Python virtual environment
│   └── ...                   # (numpy, matplotlib, scipy)
│
└── README.md                 # This file
```

---

## 🧪 Experiments

### 1. Hall Effect in Semiconductors (Experiment D)
**Report:** `hall_effect/he.typ` → `hall_effect/he.pdf`

**Objectives:**
- Determine carrier type (electrons vs holes) in n-type and p-type germanium
- Measure Hall coefficient and carrier density
- Calculate carrier mobility via Hall effect and magnetoresistance
- Observe temperature-dependent transition from extrinsic to intrinsic conduction

**Key Results:**
- n-type Ge: carrier density $(6.25 \pm 0.31) \times 10^{20}$ m⁻³, mobility $0.363$ m²/(V·s)
- p-type Ge: carrier density $(8.60 \pm 0.43) \times 10^{20}$ m⁻³, mobility $0.287$ m²/(V·s)
- Temperature-induced sign reversal at ~106°C confirms extrinsic→intrinsic transition

---

### 2. X-Ray Diffraction: Crystal Structure Analysis (Experiment C)
**Report:** `xrd/xrd.typ` → `xrd/xrd.pdf`

**Objectives:**
- Determine LiF lattice constant using Bragg's Law
- Measure Planck's constant from bremsstrahlung cutoff wavelength
- Identify unknown crystal (KBr) via diffraction fingerprinting

**Key Results:**
- LiF lattice constant: $d = (2.047 \pm 0.017)$ Å (1.93% deviation from literature)
- Planck's constant: $h = (8.7 \pm 0.4) \times 10^{-34}$ J·s (31% deviation due to low S/N ratio)
- KBr identification: $d = (3.282 \pm 0.006)$ Å (0.24% deviation from literature)

---

### 3. Magnetic Moment in Helmholtz Field (Experiment E)
**Report:** `magnetic_moment/mm.typ` → `magnetic_moment/mm.pdf`  
**Presentation:** `magnetic_moment/mm_pres.typ` → `magnetic_moment/mm_pres.pdf`

**Objectives:**
- Validate electromagnetic torque theory: $\vec{T} = \vec{m} \times \vec{B}$
- Calibrate Helmholtz field constant through 5 independent experiments
- Cross-validate calibration methodology
- Determine unknown (star-shaped) loop area via magnetic torque measurement

**Key Results:**
- All 5 scaling laws confirmed with $R^2 > 0.997$
- Helmholtz constant: $c = (6.81 \pm 0.23) \times 10^{-4}$ T·A⁻¹ (3.3% uncertainty)
- Star loop area: $(110 \pm 4)$ cm² from torque measurement
- **Critical insight:** Corrected quadratic fitting for diameter dependence (T ∝ d² not T ∝ d)

**Presentation Highlights:**
- Enhanced visual design with color-coded fit quality badges
- Mathematical correctness emphasized (wrong vs correct fitting approaches)
- Error budget visualization showing Helmholtz calibration dominates (86% of variance)
- Cost-benefit analysis for suggested improvements ranked by impact

---

## 🚀 Quick Start

### Compiling Reports

All reports are written in [Typst](https://typst.app/). To compile:

```bash
# From repository root
cd /Users/parthbhargava/_space/ms/at

# Compile individual reports
typst compile --root . hall_effect/he.typ hall_effect/he.pdf
typst compile --root . xrd/xrd.typ xrd/xrd.pdf
typst compile --root . magnetic_moment/mm.typ magnetic_moment/mm.pdf
typst compile --root . magnetic_moment/mm_pres.typ magnetic_moment/mm_pres.pdf

# Or compile all at once
for exp in hall_effect xrd magnetic_moment; do
    for file in $exp/*.typ; do
        typst compile --root . "$file" "${file%.typ}.pdf"
    done
done
```

**Note:** The `--root .` flag is required to allow Typst to access the shared template in `../shared/_at.typ`.

### Running Analysis Scripts

All Python scripts use the consolidated virtual environment:

```bash
# Activate virtual environment
source venv_physics/bin/activate

# Run analysis scripts (they will generate plots in respective plots/ directories)
python3 hall_effect/scripts/hall_effect_analysis.py
python3 xrd/scripts/xrd_final_corrected.py
python3 magnetic_moment/scripts/mm_analysis.py
python3 magnetic_moment/scripts/mm_enhanced_analysis.py

# Deactivate when done
deactivate
```

**Dependencies:** numpy, matplotlib, scipy (already installed in `venv_physics/`)

---

## 📊 Data Analysis Workflow

### Hall Effect
1. **Data Collection:** Raw voltage/current measurements in `hall_effect/data/`
2. **Analysis:** `hall_effect_analysis.py` performs:
   - Linear regression for Hall voltage vs current/field
   - Quadratic fitting for magnetoresistance
   - Hall coefficient and carrier density calculation
   - Mobility extraction from two independent methods
3. **Outputs:** Publication-quality plots saved to `hall_effect/plots/`

### X-Ray Diffraction
1. **Data Collection:** Angular scans and intensity measurements
2. **Analysis:** `xrd_final_corrected.py` performs:
   - Peak position determination via weighted averaging
   - Bragg's law application for lattice constant
   - Bremsstrahlung cutoff extrapolation
   - Planck's constant extraction from multiple voltages
3. **Outputs:** Diffraction patterns and analysis plots in `xrd/plots/`

### Magnetic Moment
1. **Data Collection:** Torque measurements in `magnetic_moment/data/all_data_corrected.csv`
2. **Analysis:** 
   - `mm_analysis.py`: Basic 5-experiment analysis and Helmholtz constant calibration
   - `mm_enhanced_analysis.py`: Advanced visualizations (polar plots, residuals, 3D surfaces)
3. **Outputs:** 20+ publication-quality plots in `magnetic_moment/plots/`
4. **Key Innovation:** Corrected diameter analysis using **quadratic fitting** (T ∝ d²)

---

## 📝 Report Writing Style

All reports follow a consistent structure:

1. **Abstract:** Quantitative summary with uncertainties
2. **Introduction:** Theory derived from first principles
3. **Methods:** Detailed apparatus and procedures
4. **Results:** High-quality figures with comprehensive captions
5. **Analysis:** Sample calculations and error propagation
6. **Discussion:** 
   - Comparison with literature
   - Error analysis with dominance ranking
   - Systematic vs random effects
   - Cost-benefit analysis for improvements
7. **Conclusions:** Quantitative summary
8. **References:** Proper citations
9. **Annex:** Summary tables and code documentation
10. **AI Declaration:** Transparent documentation of AI tool usage

---

## 🎓 Academic Integrity

All experimental work, data collection, and scientific interpretations are original work by Parth Bhargava. Generative AI (Claude Code) was used for:
- Python script structure and plotting functions
- Typst report formatting and equation rendering
- Writing clarity improvements

**All physics calculations were independently verified.** See individual reports for detailed AI usage declarations.

---

## 🔧 Technical Details

### Typst Template (`shared/_at.typ`)
- Custom document class for physics lab reports
- Boxed figure environment (`#boxfig`)
- Consistent styling across all reports
- Equation numbering and cross-referencing

### Python Analysis
- **Style:** Publication-quality plots (300 dpi, serif fonts)
- **Error handling:** Robust data loading with missing value support
- **Reproducibility:** All scripts use relative paths
- **Modularity:** Separate functions for fitting, plotting, analysis

### Virtual Environment
```bash
# Recreate if needed
python3 -m venv venv_physics
source venv_physics/bin/activate
pip install numpy matplotlib scipy
```

---

## 📈 Key Achievements

### Hall Effect
- ✅ Identified carrier types via Hall voltage polarity
- ✅ Cross-validated mobility through Hall effect and magnetoresistance
- ✅ Observed intrinsic transition at 106°C

### XRD
- ✅ Sub-2% accuracy for LiF lattice constant determination
- ✅ Successfully identified unknown crystal (KBr) via structural fingerprinting
- ✅ Demonstrated Kramers theory validation for bremsstrahlung

### Magnetic Moment
- ✅ Validated all 5 theoretical scaling laws (R² > 0.997)
- ✅ **Discovered and corrected mathematical error:** quadratic vs linear fitting for diameter
- ✅ Cross-validated Helmholtz constant across 5 independent methods (3.3% uncertainty)
- ✅ Comprehensive error budget showing field calibration dominates (86% of variance)

---

## 🛠 Maintenance

### Adding New Experiments
1. Create new directory: `new_experiment/`
2. Add subdirectories: `data/`, `plots/`, `scripts/`
3. Write report using shared template: `#import "../shared/_at.typ": *`
4. Update this README

### Regenerating Plots
```bash
source venv_physics/bin/activate
cd <experiment>/scripts
python3 <analysis_script>.py
# Plots automatically saved to ../plots/
```

### Recompiling All Reports
```bash
./compile_all.sh  # (create this script if needed)
```

---

## 📧 Contact

**Parth Bhargava**  
A0310667E  
National University of Singapore  
PC2193 Experimental Physics & Data Analysis

---

## 📄 License

This work is submitted as part of PC2193 coursework. All rights reserved.

---

**Last Updated:** November 11, 2024  
**Repository Status:** ✅ Organized, ✅ All scripts tested, ✅ All reports compiled
