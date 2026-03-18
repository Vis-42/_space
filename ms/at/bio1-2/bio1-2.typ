#import "../shared/_at.typ": *

#show: ad.with(
  title: "Fluorescence Spectroscopy and Circular Dichroism: Protein Unfolding",
  author: "Parth Bhargava · A0310667E",
  experiment: "",
  course: "PC3193 Experimental Physics II",
  title-page: false
)

#show link: underline
#set math.equation(numbering: "(1)")

#let placeholder-fig(caption-text) = figure(
  box(
    width: 90%,
    stroke: 0.5pt,
    inset: 10pt,
    align(center)[
      *Placeholder Figure*
      #v(0.4em)
      #caption-text
    ]
  ),
  caption: [#caption-text]
)

= Abstract

This two-part experiment probes protein unfolding in BSA and lysozyme using fluorescence spectroscopy (tertiary environment of Trp/Tyr residues) and circular dichroism (secondary-structure content). Acid-induced changes are measured by comparing emission spectra and CD ellipticity spectra for native and denatured conditions. The analysis extracts spectral shifts and intensity/ellipticity changes to connect structural disruption to optical observables.

= Introduction

Protein folding determines biological function and is stabilized by weak interactions that can be disrupted by pH changes. In this experiment, unfolding is induced by acid and monitored with two optical probes that are sensitive to different structural levels. Fluorescence spectroscopy reports on the local environment of intrinsic fluorophores (Trp/Tyr), while circular dichroism reports on changes in secondary-structure populations through differential absorption of circularly polarized light. Together, the two parts allow a consistent interpretation of how acid perturbs tertiary and secondary structure in BSA and lysozyme.

== Objectives and Deliverables
The deliverables are:

1. *Part I (Fluorescence).* Record emission spectra for BSA and lysozyme with and without acid, extract intensity and wavelength shifts, and summarize the changes in a table.
2. *Part II (CD).* Record CD spectra for the same samples and conditions, extract ellipticity minima and structural trends, and summarize the changes in a table.
3. *Cross-part interpretation.* Use fluorescence (tertiary environment) and CD (secondary structure) jointly to explain why BSA and lysozyme respond differently to acid.

Each deliverable maps to a specific figure or table in Results and to a specific inference step in Analysis.

= Theory

== Part I Physical Background
Fluorescence arises after optical excitation of a fluorophore to an excited singlet state, followed by rapid relaxation and radiative emission. Because some energy is dissipated before emission, the emitted photon has lower energy and longer wavelength than the excitation photon, producing a Stokes shift. In proteins, the intrinsic fluorophores tyrosine (Tyr) and tryptophan (Trp) dominate the signal. Their fluorescence quantum yield and emission maximum depend strongly on local environment. When the protein unfolds, Trp/Tyr residues become more solvent-exposed, typically decreasing fluorescence intensity and shifting the emission maximum to longer wavelengths.

The measured observable is the emission spectrum $I(lambda)$ for a fixed excitation wavelength. In dilute samples, intensity scales with concentration and optical path length via Beer-Lambert factors and the quantum yield. Qualitatively, the unfolding transition is captured by changes in (i) peak intensity and (ii) emission maximum $lambda_(max)$ as the environment switches from hydrophobic (buried) to hydrophilic (exposed). These two extracted parameters are used in Analysis to compare native vs acid conditions for BSA and lysozyme.

== Part II Physical Background
Circular dichroism (CD) measures the differential absorption of left- and right-circularly polarized light by optically active samples. If $A_L$ and $A_R$ are the absorbances for left and right circular polarization, then

$ "CD" = A_L - A_R = Delta A . $

From Beer-Lambert law, $Delta A = Delta epsilon c l$, where $Delta epsilon$ is the difference in molar extinction coefficients, $c$ is concentration, and $l$ is path length. CD is typically expressed as ellipticity $theta$, related to the differential absorbance by

$ theta = 33.0 Delta A , $

with $theta$ in degrees for $l$ in centimeters. Proteins exhibit characteristic CD spectra for different secondary structures (alpha helix, beta sheet, random coil). In the unfolded state, the CD signal in the 210-220 nm region weakens toward zero. Therefore, changes in the CD spectrum directly report changes in secondary-structure content.

CD complements fluorescence by reporting on secondary structure, while fluorescence reports on tertiary environment. Joint interpretation of both spectra reveals whether acid alters secondary structure, tertiary packing, or both.

= Methods

== Safety and Setup
Handle quartz cuvettes carefully and avoid touching optical faces. Record all instrument settings that influence spectral shape or intensity (slit widths, scanning speed, response time, accumulations, path length) for uncertainty tracking. Use the same cuvette cleaning procedure and buffer blanking for all scans to maintain a consistent baseline.

== Part I Procedure
*Sample preparation (manual values).* Prepare BSA and lysozyme samples in 1x PBS and the corresponding acidified samples in 0.1 M HCL/KCL (pH 1). Use:
- BSA: 25 uL of 12 mg/ml BSA + 2975 uL PBS.
- BSA + acid: 25 uL of 12 mg/ml BSA + 2975 uL acid.
- Lysozyme: 100 uL of 3 mg/ml lysozyme + 2900 uL PBS.
- Lysozyme + acid: 100 uL of 3 mg/ml lysozyme + 2900 uL acid.

*Instrument settings.* Set excitation wavelength to 280 nm (excites Tyr and Trp) and measure emission from 300-400 nm. Use 5 nm slit widths for excitation and emission, medium scan speed, and enable auto-store and ASCII export.

*Measurement steps.* Clean cuvette (DI water, ethanol, DI water), zero with PBS in cuvette, then measure each sample in a clean cuvette. Export all spectra and keep a run log.

== Part II Procedure
*Instrument warm-up.* Open nitrogen cylinder (about 10 psi), set flow to 3 L/min, switch on the CD instrument and lamp, and allow a 30 minute warm-up. Ensure HT is in the 200-300 range before scanning.

*Scan parameters.* Sensitivity 100 mdeg, start 250 nm, end 200 nm, data pitch 1 nm, scanning speed 100 nm/min, response 1 s, bandwidth 1 nm, accumulation 5, delay 0. Use 1 cm quartz cuvette and minimum 3 ml volume.

*Measurement steps.* Load the sample, open shutter, and start the scan. Save spectra in ASCII format and overlay all scans (native and acidified) for BSA and lysozyme in one set of plots.

== Data Products
Export all spectra as ASCII (.txt or .csv). Required plots: fluorescence emission spectra for each protein with and without acid; CD spectra for each protein with and without acid. The analysis uses peak intensity, emission maxima, and CD ellipticity minima extracted from these spectra.

= Results

== Part I Results
#placeholder-fig([Fluorescence emission spectra (300-400 nm) for BSA and lysozyme, each with and without acid. Include a consistent intensity scale and label emission maxima.]) <fig:part1-main>

Extracted fluorescence features for Part I:
#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    [*Sample*], [*lambda_max (nm)*], [*Relative intensity*],
    [BSA], [ ], [ ],
    [BSA + acid], [ ], [ ],
    [Lysozyme], [ ], [ ],
    [Lysozyme + acid], [ ], [ ],
  ),
  caption: [Fluorescence emission maxima and relative intensities for native and acid conditions.]
) <tab:part1-values>

== Part II Results
#placeholder-fig([CD spectra (200-250 nm) for BSA and lysozyme, each with and without acid. Mark the 210-220 nm region and characteristic minima.]) <fig:part2-main>

Extracted CD features for Part II:
#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    [*Sample*], [*Ellipticity minima (mdeg)*], [*Wavelength (nm)*],
    [BSA], [ ], [ ],
    [BSA + acid], [ ], [ ],
    [Lysozyme], [ ], [ ],
    [Lysozyme + acid], [ ], [ ],
  ),
  caption: [CD ellipticity minima and positions for native and acid conditions.]
) <tab:part2-values>

= Analysis

== Part I Analysis
Compare spectra in @fig:part1-main and extract the emission maximum $lambda_(max)$ and relative intensity for each condition. Decreased intensity and red-shifted $lambda_(max)$ indicate increased solvent exposure of Trp/Tyr residues, consistent with unfolding. Use @tab:part1-values to quantify the change for BSA and lysozyme and comment on which protein shows a stronger tertiary-structure perturbation.

== Part II Analysis
Use @fig:part2-main to identify ellipticity minima and the signal in the 210-220 nm band. Weaker ellipticity in this region indicates loss of alpha-helix content. Use @tab:part2-values to compare native vs acid conditions for each protein and infer secondary-structure changes.

== Cross-Part Comparison
Combine fluorescence and CD results to explain whether acid primarily disrupts tertiary packing (fluorescence changes) or also alters secondary structure (CD changes). Address the manual question: if BSA and lysozyme respond differently, explain why their structural stability or residue environments differ.

= Discussion

Map observations to inferences:
- Fluorescence intensity and $lambda_(max)$ shifts → change in local environment of Trp/Tyr residues.
- CD ellipticity changes around 210-220 nm → change in secondary-structure content.
- Agreement between both modalities → consistent unfolding mechanism; disagreement → partial unfolding or different sensitivity.

Dominant uncertainties come from slit width and scan speed (affecting spectral shape), baseline subtraction and blanking, and sample preparation concentration errors. Report how these affect intensity scaling and peak locations.

= Conclusion

Summarize the primary observable(s) in each part and the derived physical parameters. Explicitly confirm that the deliverables in Objectives are met and state the final interpretation that connects both parts.

= References

1. Fluorescence Spectroscopy: A tool for Protein folding/unfolding Study, PC3267 manual (provided).
2. Circular Dichroism of Protein, PC3267 manual (provided).
3. David Sheehan, *Physical Biochemistry: Principles and Applications* (Wiley, 2000).
4. Charles R. Cantor and Paul R. Schimmel, *Biophysical Chemistry, Part II: Techniques for the study of biological structure and function* (W.H. Freeman, 1980).
5. JASCO J-810 spectropolarimeter operating manual.

= Appendix

== Instrument Settings (Record Sheet)
#figure(
  table(
    columns: (auto, auto),
    align: (left, left),
    [*Parameter*], [*Value*],
    [Geometry], [ ],
    [Control range], [ ],
    [Step size], [ ],
    [Integration time], [ ],
    [Wavelength or probe], [ ],
    [Filters], [ ],
    [Calibration reference], [ ],
  ),
  caption: [Instrument settings recorded during scans.]
) <tab:settings>

== Raw Data Log
#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    [*Run*], [*Condition*], [*File/Note*],
    [1], [ ], [ ],
    [2], [ ], [ ],
    [3], [ ], [ ],
  ),
  caption: [Run log for raw data files and notes.]
) <tab:raw-log>
