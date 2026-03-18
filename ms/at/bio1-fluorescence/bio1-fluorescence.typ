#import "../shared/_at.typ": *

#show: ad.with(
  title: "Fluorescence Spectroscopy:
  Protein Unfolding",
  author: "Parth Bhargava · A0310667E",
  experiment: "",
  course: "PC3267 Biophysics II",
  title-page: false
)

#show link: underline
#set math.equation(numbering: "(1)")

= Abstract

Intrinsic fluorescence of BSA and lysozyme was measured at 280 nm excitation before and after acid denaturation at pH 1. BSA showed a 24% drop in emission intensity along with a 19 nm blue shift of the emission maximum (from 346 nm to 327 nm), while lysozyme lost 28% of its intensity with essentially no wavelength shift (343 to 344 nm). The two proteins respond to acid in structurally different ways, and this report explores why.

= Introduction

Proteins fold into specific three-dimensional shapes that determine their biological function. The native fold is held together by hydrogen bonds, electrostatic interactions, hydrophobic packing, and in some cases covalent disulfide bridges. If this balance is disrupted, for instance by lowering the pH, partial or complete unfolding can occur, exposing residues that were previously buried inside the hydrophobic core.

Fluorescence spectroscopy gives a direct optical readout of tertiary structure because the intrinsic fluorophores tryptophan and tyrosine are sensitive to their local environment. When these residues sit buried inside the protein core, their fluorescence looks quite different from when they are exposed to aqueous solvent. By comparing emission spectra before and after a perturbation, one can track structural changes at the level of individual residues without needing extrinsic labels or complicated sample preparation.

This report applies fluorescence spectroscopy to BSA and lysozyme, two well-characterised proteins with very different structural properties. BSA is a large ($≈ 66$ kDa), predominantly α-helical transport protein with two Trp residues and 17 disulfide bonds. Lysozyme is smaller ($≈ 14$ kDa), with six Trp residues, three α-helical segments, a β-sheet domain, and four disulfide bonds that make it structurally quite rigid. Comparing the fluorescence response of these two proteins to acid tests how structural composition governs susceptibility to chemical denaturation.

= Theory

== The Fluorescence Process

Fluorescence arises from a three-stage electronic process. First, a photon of energy $h ν_"ex"$ is absorbed by a fluorophore, promoting an electron from the ground singlet state $S_0$ to a vibrationally excited level of the first excited singlet state $S_1'$. The molecule then rapidly relaxes to the lowest vibrational level of $S_1$ through non-radiative processes (vibrational relaxation and internal conversion), dissipating energy to the surroundings on a picosecond timescale. Finally, the electron returns to $S_0$ by emitting a photon of energy $h ν_"em"$. Because energy was lost during relaxation, the emitted photon has lower energy (longer wavelength) than the excitation photon. This wavelength difference is the Stokes shift, and it allows emission to be detected against a dark background, free from excitation light.

Not every excited molecule returns to the ground state by fluorescence. Competing non-radiative pathways (collisional quenching, intersystem crossing to triplet states, Förster resonance energy transfer) can depopulate $S_1$ without photon emission. The fraction of absorbed photons that actually produce fluorescence is the quantum yield $Φ$:

$ Φ = frac(k_r, k_r + sum_i k_(n r comma i)) $ <eq:qy>

where $k_r$ is the radiative rate constant and $k_(n r comma i)$ are the rate constants for each non-radiative channel. Both the quantum yield and the emission wavelength depend on the molecular environment of the fluorophore, which is what makes fluorescence useful as a structural probe.

== Intrinsic Protein Fluorescence

Of the 20 standard amino acids, only phenylalanine, tyrosine, and tryptophan have aromatic side chains that fluoresce. Phenylalanine has a very low quantum yield and is rarely useful. Tyrosine emits near 303 nm and is moderately sensitive to environment. Tryptophan is the dominant intrinsic fluorophore, with an emission maximum that ranges from about 308 nm in a fully apolar environment to above 350 nm when fully solvent-exposed. Its intensity responds strongly to quenching by nearby residues and solvent molecules.

Excitation at 280 nm excites both Tyr and Trp. The emission spectrum therefore contains contributions from both, though Trp typically dominates because of its larger extinction coefficient and broader Stokes shift. The key observables are:

- *Emission maximum $λ_"max"$* reflects the average polarity of the fluorophore environment. A red shift indicates increased solvent exposure, while a blue shift points to a more hydrophobic or electrostatically shielded environment.
- *Peak intensity* reflects the quantum yield, which drops when quenching pathways become available, for example through exposure to water, protonated histidines, or disulfide bonds.

When a protein unfolds, buried Trp and Tyr residues become exposed to aqueous solvent. The typical signature of unfolding is a decrease in fluorescence intensity accompanied by a red shift of $λ_"max"$. If the denatured state adopts a non-trivial conformation though, such as a molten globule or an acid-expanded form, the spectral changes can be more complex.

== Fluorescence Intensity in Dilute Solution

In dilute solution, the fluorescence intensity $F$ is proportional to the absorbed light and the quantum yield:

$ F = I_0 Φ (1 - 10^(-ε c l)) ≈ I_0 Φ (2.303 ε c l) $ <eq:intensity>

where $I_0$ is the excitation intensity, $ε$ is the molar extinction coefficient, $c$ is the molar concentration, and $l$ is the optical path length. The approximation holds when the absorbance $ε c l$ is small ($< 0.05$), which is the regime used here. In this limit, fluorescence intensity scales linearly with concentration, so relative intensity comparisons between samples at equal concentration are straightforward.

= Methods

== Sample Preparation

Four solutions were prepared in 1.5 mL Eppendorf tubes:
- *BSA native:* 25 μL of 12 mg/mL BSA stock + 2975 μL of 1×PBS (final concentration $≈ 0.1$ mg/mL).
- *BSA + acid:* 25 μL of 12 mg/mL BSA stock + 2975 μL of 0.1 M HCl/KCl buffer at pH 1.
- *Lysozyme native:* 100 μL of 3 mg/mL lysozyme stock + 2900 μL of 1×PBS (final concentration $≈ 0.1$ mg/mL).
- *Lysozyme + acid:* 100 μL of 3 mg/mL lysozyme stock + 2900 μL of 0.1 M HCl/KCl buffer at pH 1.

Both proteins were diluted to roughly the same final concentration ($≈ 0.1$ mg/mL) to keep the absorbance in the linear regime of @eq:intensity. The acid buffer at pH 1 provides a sufficiently extreme environment to induce rapid, steady-state denaturation without requiring extended incubation.

== Instrument Settings

Fluorescence spectra were recorded on a Varian Cary Eclipse spectrofluorimeter (serial el02116112) with the following parameters:

#figure(
  table(
    columns: (auto, auto),
    align: (left, left),
    [*Parameter*], [*Value*],
    [Excitation wavelength], [280 nm],
    [Emission range], [300--400 nm],
    [Excitation slit width], [5 nm],
    [Emission slit width], [5 nm],
    [Scan rate], [600 nm/min],
    [Data interval], [1.0 nm],
    [Averaging time], [0.1 s],
    [PMT voltage], [Medium],
    [Excitation filter], [Auto],
    [Emission filter], [Open],
  ),
  caption: [Cary Eclipse instrument parameters for fluorescence emission scans.]
) <tab:settings>

The 280 nm excitation wavelength excites both Tyr and Trp residues. The 5 nm slit widths balance signal strength against spectral resolution for the broad emission bands of proteins.

== Measurement Procedure

Before each scan, the quartz cuvette was rinsed with deionised water, ethanol, and deionised water again. A baseline was recorded with 1×PBS in the cuvette and subtracted automatically using the instrument's zero function. Each protein solution was then loaded into a clean cuvette and scanned. Spectra were exported in ASCII (CSV) format with embedded metadata for subsequent analysis.

= Results

@fig:fluor-main presents the fluorescence emission spectra for all four samples. The two native-state spectra (BSA + PBS and lysozyme + PBS) are broad with emission maxima in the 340--350 nm region. On acidification, both proteins show reduced emission intensity, but their wavelength responses differ noticeably.

#boxfig(
  "bio1-fluorescence/plots/fluorescence_emission.png",
  [Fluorescence emission spectra (excitation 280 nm) for BSA and lysozyme in PBS (native) and in 0.1 M HCl/KCl at pH 1 (acid). Lysozyme native shows the highest intensity; BSA + acid shows both reduced intensity and a pronounced blue shift.]
) <fig:fluor-main>

@fig:instrument shows the raw spectra as recorded by the FluorEssence software, with the instrument's own peak annotations. The four panels correspond to BSA + PBS (top left, peak at 343.07 nm, 108.6 a.u.), BSA + acid (top right, peak at 324.00 nm, 82.8 a.u.), lysozyme + PBS (bottom left, peak at 344.00 nm, 161.8 a.u.), and lysozyme + acid (bottom right, peak at 343.07 nm, 117.9 a.u.). These instrument-annotated values confirm the peak positions and intensities used in the analysis below.

#boxfig(
  "bio1-fluorescence/plots/instrument_spectra.png",
  [Raw fluorescence emission spectra as exported from the FluorEssence instrument software, with peak wavelength and intensity annotations for each sample.]
) <fig:instrument>

The extracted spectral parameters are summarised in @tab:fluor-values. Peak positions were determined from smoothed spectra (7-point moving average) to reduce noise in the broad, flat-topped emission bands.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, center, center),
    [*Sample*], [$λ_"max"$ (nm)], [Peak intensity (a.u.)], [$Δ I$ (%)],
    [BSA native], [346], [107], [--],
    [BSA + acid], [327], [82], [$-$23],
    [Lysozyme native], [343], [161], [--],
    [Lysozyme + acid], [344], [116], [$-$28],
  ),
  caption: [Fluorescence emission parameters extracted from @fig:fluor-main. $λ_"max"$ is the smoothed peak position; $Δ I$ is the percentage change in peak intensity relative to the native condition.]
) <tab:fluor-values>

= Analysis

The data in @tab:fluor-values reveal two quite different patterns of acid-induced spectral change.

== BSA: Intensity Decrease with Blue Shift

BSA shows a 23% decrease in peak intensity on acidification, accompanied by a 19 nm blue shift of $λ_"max"$ from 346 nm to 327 nm. The intensity decrease is consistent with increased non-radiative quenching, likely from protonated histidine side chains and enhanced solvent access to the fluorophores. The blue shift, however, is the opposite of what simple unfolding would produce: if Trp residues moved from a hydrophobic interior to polar solvent, we would expect a red shift instead.

This tells us that at pH 1, BSA does not adopt a fully solvent-exposed random coil. BSA is known to undergo a series of pH-dependent conformational transitions: the native N-form ($≈$ pH 7) converts to the fast F-form below pH 4 and further to the expanded E-form below pH 3. In the E-form, the protein is significantly expanded but retains residual tertiary contacts. The 17 intramolecular disulfide bonds constrain the backbone even when non-covalent interactions are disrupted, preventing full exposure of the two Trp residues (Trp-134 and Trp-212). The blue shift may reflect a rearrangement where the Trp residues end up in an environment that is actually less polar than in the native state, possibly due to altered electrostatic shielding by protonated residues or local structural collapse around the Trp sites.

The emission spectrum of BSA + acid is also noticeably broader and flatter than the native spectrum (@fig:fluor-main), spanning roughly 320--335 nm without a sharp peak. This broadening suggests heterogeneity in the Trp environments in the acid-denatured state, consistent with a disordered but not fully unfolded conformation.

== Lysozyme: Intensity Decrease without Wavelength Shift

Lysozyme shows a 28% intensity decrease, comparable in magnitude to BSA, but essentially no shift in $λ_"max"$ (343 nm to 344 nm, within the $≈ 2$ nm uncertainty of the measurement). The intensity decrease indicates enhanced quenching of the six Trp residues, but the lack of a wavelength shift means the average polarity of the Trp environment is unchanged.

This is consistent with partial unfolding: the acid disrupts some tertiary contacts and increases access of quenching agents (water, protonated side chains) to the Trp residues, but the four disulfide bonds maintain the overall fold well enough to keep the Trp residues in environments of similar polarity. Lysozyme is known to retain significant native-like structure at low pH because of its disulfide bonds, forming a molten-globule-like state rather than a fully unfolded chain.

== Comparison of BSA and Lysozyme

Both proteins lose roughly a quarter of their fluorescence intensity on acidification, which suggests acid-induced quenching is a general effect. The wavelength behaviour, however, distinguishes the two:

- BSA undergoes a substantial conformational rearrangement (blue shift, spectral broadening) that alters the local environment of its Trp residues, consistent with the N to F to E transition.
- Lysozyme maintains its Trp environment (no shift) while experiencing enhanced quenching, consistent with a structurally constrained molten globule stabilised by disulfide bonds.

The higher absolute intensity of native lysozyme relative to BSA ($≈ 161$ vs $≈ 107$ a.u.) reflects lysozyme's six Trp residues compared to BSA's two, along with possible differences in quantum yield related to the distinct burial environments in the two proteins.

= Discussion

The fluorescence data show that acid-induced structural changes in BSA and lysozyme are qualitatively different despite producing similar magnitudes of intensity loss. Wavelength and intensity report on complementary aspects of the fluorophore environment: wavelength reflects local polarity, while intensity reflects the net competition between radiative and non-radiative decay.

For BSA, the blue shift is the most informative feature. It rules out simple solvent exposure and instead points to a reorganised tertiary structure where Trp residues sit in modified microenvironments. This fits with the well-documented acid expansion of BSA, where the protein swells but does not fully lose its domain architecture because the many disulfide bonds hold things in place.

For lysozyme, the preservation of $λ_"max"$ combined with intensity loss tells us that the global structure is more resistant to acid. The four disulfide bonds cross-link the α and β domains, maintaining the spatial relationship between Trp residues and their surroundings even when non-covalent interactions are weakened by protonation.

The dominant experimental uncertainties are: (i) concentration accuracy of the diluted protein solutions ($≈ 5$% pipetting error), which scales the absolute intensity but not $λ_"max"$; (ii) cuvette alignment and cleanliness, which can introduce baseline offsets; and (iii) the 1 nm data interval and 5 nm slit widths, which limit the precision with which $λ_"max"$ can be determined in these broad, flat-topped spectra to roughly $± 2$ nm.

= Conclusion

Fluorescence emission spectra at 280 nm excitation reveal distinct acid-induced structural changes in BSA and lysozyme. BSA shows both a 23% intensity decrease and a 19 nm blue shift, indicating a conformational rearrangement (N to E transition) that modifies the local environment of its two Trp residues without fully exposing them to solvent. Lysozyme shows a comparable 28% intensity loss but no measurable wavelength shift, consistent with structurally constrained partial unfolding where disulfide bonds preserve the polarity of the Trp microenvironments. The different responses show that the number and topology of disulfide bonds, rather than protein size alone, governs how acid perturbation is expressed at the level of tertiary structure.

= References

1. Fluorescence Spectroscopy: A tool for Protein folding/unfolding Study, PC3267 manual (provided). <ref1>
2. J.R. Lakowicz, _Principles of Fluorescence Spectroscopy_, 3rd ed. (Springer, 2006). <ref2>
3. D. Sheehan, _Physical Biochemistry: Principles and Applications_ (Wiley, 2000). <ref3>

#pagebreak()

= Declaration on the Use of Generative AI

I declare that I *HAVE* used generative AI tools to produce this assignment.

I acknowledge that generative AI was used in the following manner:

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    align: (left, left, left),
    stroke: 1pt,
    table.hline(stroke: 2pt),
    [*AI Tool Used*], [*My Prompt and AI Output*], [*How the Output Was Used*],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help me process the fluorescence CSV data files, generate an overlay plot of the emission spectra, and extract peak wavelengths and intensities." \
      *Output:* \
      Python script for data processing and plotting
    ], [
      Used for data processing automation. All spectral measurements were performed by me, and the physical interpretation of peak shifts and intensity changes is my own.
    ],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help with Typst formatting for figures, tables, and equation layout. Check that file paths and cross-references compile correctly." \
      *Output:* \
      Typst formatting guidance and layout suggestions
    ], [
      Used only for formatting. All experiment content, analysis, and scientific interpretations were written and verified by me.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)
