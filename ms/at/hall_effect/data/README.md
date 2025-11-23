# Hall Effect Experiment Analysis

## Project Overview

This directory contains the complete data analysis for the PC2193 Hall Effect experiment on p-type and n-type Germanium semiconductors.

## Files

### Data Files
- `nGE exp 1.x` - Hall voltage vs current for n-type Ge (3 runs)
- `nGe exp 2.x` - Hall voltage and sample voltage vs magnetic field for n-type Ge (3 runs)
- `pGe exp 1.x` - Hall voltage vs current for p-type Ge (3 runs)
- `pGe exp 2.x` - Hall voltage and sample voltage vs magnetic field for p-type Ge (3 runs)
- `pGe exp 3` - Hall voltage vs temperature for p-type Ge

### Analysis Program
- `hall_effect_analysis.py` - Complete Python analysis program that:
  - Loads and processes all experimental data files
  - Performs linear regression for Hall effect analysis
  - Calculates Hall coefficients, carrier densities, and mobilities
  - Analyzes magnetoresistance for independent mobility determination
  - Generates publication-quality plots with error bars
  - Outputs comprehensive results summary

### Generated Plots
- `exp1_ntype_UH_vs_I.png` - Hall voltage vs current (n-type)
- `exp1_ptype_UH_vs_I.png` - Hall voltage vs current (p-type)
- `exp2a_ntype_UH_vs_B.png` - Hall voltage vs magnetic field (n-type)
- `exp2a_ptype_UH_vs_B.png` - Hall voltage vs magnetic field (p-type)
- `exp2b_ntype_R_vs_B.png` - Magnetoresistance (n-type)
- `exp2b_ptype_R_vs_B.png` - Magnetoresistance (p-type)
- `exp3_ptype_UH_vs_T.png` - Hall voltage vs temperature (p-type)

## Running the Analysis

```bash
# Activate virtual environment
source ../xrd_venv/bin/activate

# Run the analysis
python hall_effect_analysis.py
```

## Key Results

### N-type Germanium
- Hall coefficient: H = (-9.99 ± 0.50) × 10⁻³ m³/C
- Carrier density: n = (6.25 ± 0.31) × 10²⁰ m⁻³
- Hall mobility: μ_Hall = (0.363 ± 0.026) m²/(V·s)
- Magnetoresistance mobility: μ_MR = (0.390 ± 0.014) m²/(V·s)

### P-type Germanium
- Hall coefficient: H = (+7.26 ± 0.37) × 10⁻³ m³/C
- Carrier density: n = (8.60 ± 0.43) × 10²⁰ m⁻³
- Hall mobility: μ_Hall = (0.287 ± 0.020) m²/(V·s)
- Magnetoresistance mobility: μ_MR = (0.565 ± 0.007) m²/(V·s)

### Temperature Dependence
- Transition temperature (extrinsic → intrinsic): ~106°C
- Sign reversal confirms intrinsic carrier generation

## Dependencies

- Python 3.13+
- NumPy 2.3.3
- SciPy 1.16.2
- Matplotlib 3.10.6

