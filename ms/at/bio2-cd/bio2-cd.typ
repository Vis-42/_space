#import "../shared/_at.typ": *

#show: ad.with(
  title: "Circular Dichroism:
  Protein Secondary Structure",
  author: "Parth Bhargava · A0310667E",
  experiment: "",
  course: "PC3267 Biophysics II",
  title-page: false
)

#show link: underline
#set math.equation(numbering: "(1)")

= Abstract

Circular dichroism (CD) spectroscopy was used to monitor acid-induced changes in the secondary structure of BSA and lysozyme. Spectra were recorded over 200--250 nm on a JASCO J-810 spectropolarimeter with five-scan accumulation. On acidification to pH 1, BSA showed a 21% reduction in the magnitude of its ellipticity minimum near 210 nm (from $-141.4$ to $-111.1$ mdeg), indicating substantial loss of α-helical content. Lysozyme showed less than 1% change ($-72.8$ to $-72.1$ mdeg), meaning its secondary structure is largely preserved under the same conditions. The difference is attributed to the greater structural rigidity conferred by lysozyme's four disulfide bonds.

= Introduction

Circular dichroism measures the differential absorption of left- and right-circularly polarised light by optically active molecules. In proteins, the peptide bond chromophore gives rise to characteristic CD spectra that depend on the backbone dihedral angles, and therefore on the secondary structure. Each structural motif (α-helix, β-sheet, random coil) produces a distinct spectral signature in the far-UV region (190--250 nm), making CD a quantitative probe of secondary-structure content.

When a protein unfolds, its ordered secondary structure converts to a disordered random coil, and the CD spectrum changes accordingly. Comparing spectra of native and denatured protein directly reveals the extent of secondary-structure loss. This is complementary to fluorescence spectroscopy, which reports on tertiary-level packing around specific residues; CD instead reveals whether the backbone geometry itself has been disrupted.

BSA and lysozyme are again subjected to acid denaturation at pH 1. BSA is approximately 67% α-helical in its native state, so it should show a pronounced CD response to unfolding. Lysozyme has about 30% α-helix and 10% β-sheet, with four disulfide bonds that covalently stabilise the fold. The comparison tests whether disulfide-mediated structural rigidity actually protects secondary structure under extreme pH conditions.

= Theory

== Circularly Polarised Light and Optical Activity

Linearly polarised light can be decomposed into two equal-amplitude circularly polarised components, one rotating left (L) and one rotating right (R). In a non-optically-active medium, both components propagate identically and recombine to give linearly polarised light at the exit. In an optically active medium, the refractive indices and absorption coefficients for L and R differ. This difference in absorption is the physical basis of circular dichroism.

If $A_L$ and $A_R$ are the absorbances for the two components, the CD signal is:

$ "CD" = A_L - A_R = Δ A $ <eq:cd-def>

Because L and R are absorbed unequally, the transmitted components have different amplitudes, and their superposition produces elliptically polarised light rather than linearly polarised light. The ellipticity $θ$ of this ellipse is related to the differential absorbance by:

$ θ = 33.0 space Δ A $ <eq:ellipticity>

where $θ$ is in millidegrees and $Δ A$ is in absorbance units. From Beer--Lambert's law, $Δ A = Δ ε space c space l$, where $Δ ε$ is the difference in molar extinction coefficients for L and R light, $c$ is the molar concentration, and $l$ is the path length.

@eq:ellipticity is the central relation connecting the measured quantity (ellipticity) to the molecular property (differential extinction). Since secondary-structure elements impose specific constraints on the peptide-bond geometry, $Δ ε$ varies systematically with backbone conformation, and the CD spectrum therefore encodes secondary-structure content.

== Secondary-Structure Signatures

The far-UV CD spectrum of a protein arises primarily from the $n → π^*$ and $π → π^*$ transitions of the amide bond. Each secondary-structure type produces a characteristic pattern:

- *α-helix:* strong negative bands near 208 nm and 222 nm, plus a positive band near 193 nm. The 222 nm band comes from the $n → π^*$ transition, while the 208 nm band reflects exciton splitting of the $π → π^*$ transition in the helical array of peptide bonds.
- *β-sheet:* a weaker negative band near 218 nm and a positive band near 195 nm.
- *Random coil:* a strong negative band near 198 nm and weak positive signal above 210 nm.

When a protein unfolds from a structured to a disordered state, the CD signal in the 210--222 nm region becomes less negative, approaching zero as the random-coil contribution dominates. The magnitude of this change directly reports the extent of secondary-structure loss.

= Methods

== Sample Preparation

Four solutions were prepared identically to those used in the fluorescence experiment:
- *BSA native:* 25 μL of 12 mg/mL BSA + 2975 μL of 1×PBS.
- *BSA + acid:* 25 μL of 12 mg/mL BSA + 2975 μL of 0.1 M HCl/KCl (pH 1).
- *Lysozyme native:* 100 μL of 3 mg/mL lysozyme + 2900 μL of 1×PBS.
- *Lysozyme + acid:* 100 μL of 3 mg/mL lysozyme + 2900 μL of 0.1 M HCl/KCl (pH 1).

All solutions had final protein concentrations of approximately 0.1 mg/mL.

== Instrument and Scan Parameters

CD spectra were recorded on a JASCO J-810 spectropolarimeter (Rev. 1.00). The nitrogen purge was set to $≈ 10$ psi with a flow rate of 3 L/min, and the xenon lamp was allowed 30 minutes to stabilise before data collection. The high-tension (HT) voltage was checked to be in the 200--300 V range before scanning. The scan parameters were:

#figure(
  table(
    columns: (auto, auto),
    align: (left, left),
    [*Parameter*], [*Value*],
    [Sensitivity], [100 mdeg],
    [Scan range], [250 -- 200 nm],
    [Data pitch], [1 nm],
    [Scanning speed], [100 nm/min (continuous)],
    [Response time], [1 s],
    [Bandwidth], [1 nm],
    [Accumulations], [5],
    [Delay time], [0 s],
    [Path length], [1 cm (quartz cuvette)],
    [Minimum sample volume], [3 mL],
  ),
  caption: [JASCO J-810 scan parameters for CD measurements.]
) <tab:cd-settings>

Five-scan accumulation averages out random noise while keeping the total measurement time manageable. The 1 nm bandwidth balances spectral resolution against signal-to-noise for the broad protein CD bands.

== Data Mapping

The spectrometer stores spectra sequentially. The mapping used throughout this report is:
- sol1 = BSA (native)
- sol2 = BSA + acid
- sol3 = Lysozyme (native)
- sol4 = Lysozyme + acid

= Results

@fig:cd-main shows the CD spectra for all four samples over the 200--250 nm range. The BSA spectra (sol1, sol2) have the strongest negative ellipticity, consistent with BSA's high α-helical content. Both lysozyme spectra (sol3, sol4) show weaker negative ellipticity, reflecting lysozyme's lower α-helix fraction.

#boxfig(
  "bio2-cd/plots/cd_sol1_sol4.png",
  [CD spectra for BSA and lysozyme in native (PBS) and acidified (pH 1) conditions over 200--250 nm. The BSA native spectrum (sol1) shows the deepest negative ellipticity. Below $≈ 205$ nm, the rising HT voltage indicates strong solvent absorption and reduced data reliability.]
) <fig:cd-main>

@fig:instrument-cd shows the raw JASCO Spectra Analysis software output, displaying both the CD signal (upper panel) and the high-tension (HT) voltage (lower panel) for all four samples. The HT voltage remains below about 500 V down to 210 nm, confirming reliable detector response in the analysis region. Below 205 nm the HT voltage rises steeply as buffer absorption increases, marking the lower limit of trustworthy data.

#boxfig(
  "bio2-cd/plots/instrument_cd.png",
  width: 95%, box-width: 100%,
  [Raw JASCO J-810 Spectra Analysis output showing CD ellipticity (upper panel) and HT voltage (lower panel) for all four samples. The file legend lists sol1--sol4 with acquisition times.]
) <fig:instrument-cd>

The extracted ellipticity minima in the 210--222 nm region are summarised in @tab:cd-values. This wavelength window captures the α-helical $n → π^*$ contribution and avoids the region below 208 nm where HT voltage rises steeply and the signal becomes unreliable.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, center, center),
    [*Sample*], [Ellipticity min (mdeg)], [$λ$ at min (nm)], [$Δ θ$ (%)],
    [BSA (sol1)], [$-141.4$], [210], [--],
    [BSA + acid (sol2)], [$-111.1$], [210], [$-21.4$],
    [Lysozyme (sol3)], [$-72.8$], [211], [--],
    [Lysozyme + acid (sol4)], [$-72.1$], [212], [$-1.0$],
  ),
  caption: [Ellipticity minima in the 210--222 nm region. $Δ θ$ is the percentage reduction in magnitude relative to the native condition.]
) <tab:cd-values>

= Analysis

== BSA: Substantial Loss of α-Helical Content

The BSA native spectrum (sol1) shows a deep minimum of $-141.4$ mdeg at 210 nm, as expected for a protein with $≈ 67$% α-helical content. On acidification (sol2), this minimum weakens to $-111.1$ mdeg, a 21.4% reduction in magnitude, while staying at the same wavelength.

This indicates significant loss of α-helical secondary structure. At pH 1, protonation of carboxylate side chains (Asp, Glu) and histidine residues disrupts the intra-chain hydrogen bonds that stabilise α-helices, converting ordered helical segments into disordered or partially ordered conformations. The CD spectrum does not collapse fully to a random-coil signature (which would show a strong negative band near 198 nm and weak signal above 210 nm), so the acid-denatured state still retains some residual secondary structure. This fits with the known F/E-form expansion of BSA at extreme pH, where the protein loses a good fraction of its helicity but does not completely unfold.

== Lysozyme: Secondary Structure Largely Preserved

The lysozyme native spectrum (sol3) shows a minimum of $-72.8$ mdeg at 211 nm. The lower magnitude compared to BSA reflects lysozyme's lower α-helical content ($≈ 30$%) and the presence of β-sheet regions, which contribute a different spectral shape. On acidification (sol4), the minimum shifts only to $-72.1$ mdeg at 212 nm, a change of less than 1%.

This near-invariance shows that lysozyme's secondary structure is essentially unaffected by pH 1 treatment. The four disulfide bonds cross-link the polypeptide chain, constraining the backbone dihedral angles and preventing the cooperative helix unwinding that would produce a measurable CD change. Even though non-covalent interactions (hydrogen bonds, salt bridges) are disrupted by protonation, the covalent disulfide network is enough to maintain the secondary-structure geometry.

== Comparison

The CD responses under identical acid conditions are captured by the $Δ θ$ values in @tab:cd-values: BSA loses 21% of its ellipticity signal while lysozyme loses less than 1%. Secondary-structure stability under chemical denaturation clearly depends on the presence and topology of disulfide bonds, not just on the protein's native fold.

The absolute ellipticity of BSA is also roughly twice that of lysozyme, consistent with BSA's higher α-helical fraction. Since α-helical CD signals are the strongest of any secondary-structure type, BSA's predominantly helical fold produces a deeper minimum than lysozyme's mixed α/β architecture.

= Discussion

The CD results give a secondary-structure-level view that complements the fluorescence spectroscopy data (which probes tertiary structure). For BSA, both techniques report significant acid-induced structural changes: fluorescence shows Trp-environment reorganisation (blue shift), and CD shows loss of α-helical content (21% ellipticity reduction). Together, they indicate that BSA at pH 1 undergoes both secondary and tertiary structural disruption, consistent with the expanded E-form conformation.

For lysozyme, the CD data show negligible secondary-structure change ($<1$%), while fluorescence data from the companion experiment show a 28% intensity decrease without wavelength shift. This combination suggests that lysozyme's acid response involves enhanced quenching of Trp residues, perhaps through solvent penetrating into a loosened but structurally intact core, without actual disruption of the backbone fold. The disulfide bonds maintain secondary structure even as non-covalent stabilisation weakens.

The HT voltage data serve as a useful quality check: for all four samples, HT remained below $≈ 500$ V down to 210 nm, rising steeply below 205 nm. This confirms that the data in the 210--250 nm analysis region are reliable, while the region below 205 nm (where buffer absorption becomes dominant) should be interpreted carefully.

The main sources of uncertainty are: (i) concentration accuracy ($≈ 5$% from pipetting), which scales the absolute ellipticity but not the percentage change; (ii) baseline stability and nitrogen purge consistency, which affect the zero level; and (iii) cuvette path-length tolerance ($± 0.01$ cm), contributing roughly $1$% systematic error in absolute ellipticity. The five-scan accumulation reduces random noise but cannot eliminate systematic baseline effects.

= Conclusion

CD spectra over 200--250 nm show that acid denaturation at pH 1 affects BSA and lysozyme very differently. BSA loses 21% of its α-helical ellipticity signal, indicating substantial unfolding of its predominantly helical backbone, while lysozyme retains over 99% of its secondary-structure signature. Lysozyme's structural preservation comes from its four disulfide bonds, which covalently constrain the backbone even when non-covalent stabilising interactions are disrupted by protonation. Together with fluorescence data showing altered Trp environments in BSA but not lysozyme, these results establish that disulfide-bond topology is the primary determinant of structural resilience under extreme acid conditions.

= References

1. Circular Dichroism of Protein, PC3267 manual (provided). <ref1>
2. D. Sheehan, _Physical Biochemistry: Principles and Applications_ (Wiley, 2000). <ref2>
3. C.R. Cantor and P.R. Schimmel, _Biophysical Chemistry, Part II: Techniques for the study of biological structure and function_ (W.H. Freeman, 1980). <ref3>
4. JASCO J-810 spectropolarimeter operating manual. <ref4>

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
      "Help me process the CD spectral data, extract ellipticity minima in the 210--222 nm region, and generate an overlay plot of all four samples." \
      *Output:* \
      Python script for data extraction and plotting
    ], [
      Used for data processing automation. All CD measurements were performed by me on the JASCO J-810, and the interpretation of ellipticity changes in terms of secondary-structure loss is my own.
    ],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help with Typst formatting for figures, tables, and equation layout. Check that cross-references and file paths compile correctly." \
      *Output:* \
      Typst formatting guidance and layout suggestions
    ], [
      Used only for formatting. All experiment content, analysis, and scientific interpretations were written and verified by me.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)
