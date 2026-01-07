---
title: Magnetic Moment in Helmholtz Field
summary: Comprehensive analysis of magnetic torque measurements and Helmholtz field calibration.
tags:
  - Physics
  - Experimental
  - Data Analysis
date: '2024-01-01'

image:
  caption: 'Magnetic Moment Analysis'
  focal_point: Smart

links:
  - icon_pack: fab
    icon: github
    name: Code
    url: 'https://github.com/Vis-42/_space/tree/main/ms/at/magnetic_moment'
---

## Overview

Comprehensive experimental analysis of magnetic moment measurements in a Helmholtz coil configuration:

- **Field Calibration**: Cross-validated Helmholtz constant across 5 independent methods
- **Scaling Laws**: Validated all 5 theoretical scaling laws (R² > 0.997)
- **Mathematical Correction**: Discovered and corrected quadratic vs linear fitting for diameter dependence
- **Error Analysis**: Comprehensive error budget showing field calibration dominates (86% of variance)

## Key Results

- Validated all 5 theoretical scaling laws with R² > 0.997
- Helmholtz constant: c = (6.81 ± 0.23) × 10⁻⁴ T·A⁻¹ (3.3% uncertainty)
- Corrected mathematical error in diameter analysis (T ∝ d² not T ∝ d)
- Comprehensive error budget and cost-benefit analysis

## Technical Details

- **Analysis Tools**: Python (numpy, matplotlib, scipy)
- **Data Processing**: Multi-experiment analysis, residual analysis, 3D visualization
- **Visualization**: 20+ publication-quality plots including polar plots and 3D surfaces
- **Report**: Typst document with comprehensive analysis and presentation

