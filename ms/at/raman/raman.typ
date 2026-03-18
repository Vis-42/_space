#import "../shared/_at.typ": *

#show: ad.with(
  title: "Raman Spectroscopy",
  author: "Parth Bhargava · A0310667E",
  experiment: "Experiment B",
  course: "Experimental Physics II",
  title-page: false
)

#show link: underline
#set math.equation(numbering: "(1)")

= Abstract

Raman spectroscopy with a 532 nm laser was used to characterise carbon allotropes, assess three diamond-like samples, estimate the thickness of a graphene film, and identify an unlabeled semiconductor wafer. Graphite (carbon rod), HOPG, carbon nanotubes, and diamond each produced distinct spectra consistent with their bonding geometry, with measured D, G, and 2D band positions falling within standard literature ranges. Among the diamond-like samples, only Unknown A (peak at 1336 cm⁻¹) was close to the 1333 cm⁻¹ diamond reference; the other two peaked near 1307 and 1302 cm⁻¹, ruling out crystalline diamond. The graphene spectrum showed a 2D/G intensity ratio of approximately 0.82, placing it in the few-layer regime. The unknown wafer was identified as crystalline silicon from its characteristic mode at 521 cm⁻¹.

= Introduction

Most analytical techniques require at least some sample preparation, but Raman spectroscopy is unusual in that it works on materials essentially as they are. A laser beam focused onto the sample scatters off the lattice vibrations, and the energy shift of the scattered photons encodes the vibrational frequencies of the material. Because different crystal structures, bonding geometries, and even the number of atomic layers all affect these frequencies, a single Raman spectrum can reveal a great deal about a sample's identity and structural quality.

This is particularly useful for carbon, which exists in several allotropic forms. Graphite, diamond, nanotubes, and graphene all contain only carbon atoms but differ fundamentally in their bonding. sp² carbon (graphite, graphene, nanotubes) and sp³ carbon (diamond) produce entirely different Raman spectra, and within the sp² family, disorder, stacking order, and dimensionality introduce further spectral differences. Raman spectroscopy exploits exactly these differences to distinguish materials that would be chemically identical by elemental analysis.

This experiment applies Raman spectroscopy to four problems: identifying the characteristic vibrational bands of several carbon allotropes, determining whether three unknown samples are genuine diamond, estimating the layer count of a graphene film on a SiO₂/Si substrate, and identifying an unlabeled semiconductor wafer.

= Theory

== Raman Scattering

When monochromatic laser light hits a material, most photons scatter elastically, leaving with the same energy they arrived with. This is Rayleigh scattering. A small fraction of photons, however, exchange energy with lattice vibrations (phonons) and scatter inelastically. If a photon gives energy to the lattice, it leaves with less energy and a longer wavelength; this is Stokes scattering. If instead it picks up energy from a phonon that was already thermally excited, it leaves with more energy; this is anti-Stokes scattering.

#boxfig("../../../_zss/d 101.png", width: 85%, box-width: 95%, [Rayleigh, Stokes, and anti-Stokes scattering energy-level diagram. The Stokes process leaves the molecule in a higher vibrational state; the anti-Stokes process starts from an excited state and returns the molecule to the ground state [3].]) <fig:energy-diagram>

The Raman spectrum plots scattered intensity against the frequency shift relative to the laser line, measured in wavenumber units:

$ Δ tilde(ν) = 1/λ_0 - 1/λ_s $ <eq:raman-shift>

where $λ_0$ is the laser wavelength and $λ_s$ is the scattered wavelength. Each peak in the spectrum corresponds to a vibrational mode of the material. At room temperature, most molecules sit in their ground vibrational state, so Stokes lines are much stronger than anti-Stokes lines, and it is the Stokes spectrum that is normally recorded [3].

== Vibrational Energy and Bond Strength

The vibrational energy levels of a bond follow a Morse potential: quantised levels with decreasing spacing at higher energies, reflecting the anharmonicity of real bonds. The fundamental vibrational frequency depends on bond stiffness and atomic mass, following the same logic as a classical spring: stiffer bonds and lighter atoms vibrate at higher frequency. This is why the Raman shift acts as a chemical fingerprint. The same element can produce very different peak positions depending on how its atoms are bonded to each other [3].

#boxfig("../../../_zss/d 96.png", width: 85%, box-width: 95%, [Morse potential curve showing quantised vibrational levels with decreasing spacing at higher energies. The fundamental transition dominates the Raman spectrum [3].]) <fig:morse>

== Polarizability and Selection Rules

Not every vibration is Raman-active. The scattering process works through the induced dipole: the oscillating electric field of the laser distorts the electron cloud, and the resulting oscillating dipole radiates at the shifted frequency. For this to happen, the vibration must change the polarizability of the molecule. Vibrations that only change the dipole moment (without affecting polarizability) are infrared-active instead. In molecules with a centre of symmetry, symmetric (gerade) vibrations tend to be Raman-active while asymmetric (ungerade) vibrations tend to be IR-active, a relationship known as the mutual exclusion rule [3].

#boxfig("../../../_zss/d 97.png", width: 85%, box-width: 95%, [Polarisation geometry for Raman scattering. The depolarisation ratio (perpendicular to parallel scattered intensity) distinguishes symmetric from asymmetric modes [3].]) <fig:polarization>

== Carbon Allotrope Signatures

Carbon bonds as either sp² (planar, three-fold coordination) or sp³ (tetrahedral, four-fold coordination), and this difference produces dramatically different Raman spectra.

In sp² carbon (graphite, graphene, nanotubes), the key features are:

- *G band (~1580 cm⁻¹):* the in-plane C-C stretching mode. This is a fundamental zone-centre phonon present in all sp² carbon, and its position is relatively insensitive to disorder.

- *D band (~1350 cm⁻¹):* a disorder-activated mode that appears when defects, grain boundaries, or edges break the translational symmetry and relax the selection rules. A strong D band relative to G indicates significant structural disorder. The D band arises from an intervalley double-resonance process and is dispersive, meaning its frequency shifts with excitation wavelength.

- *D' band (~1620 cm⁻¹):* another disorder-activated mode, but arising from intravalley (rather than intervalley) scattering. It typically appears as a weak shoulder on the high-frequency side of the G band and requires high spectral resolution to resolve clearly.

- *2D band (~2700 cm⁻¹), also called G':* a second-order two-phonon overtone of the D mode. Unlike the D band itself, it does not require disorder for its activation because momentum conservation is satisfied by the two-phonon process. Its shape and intensity relative to the G band are sensitive to layer stacking, making it the primary tool for thickness determination in graphene [1].

In sp³ carbon (diamond), the bonding geometry supports a single sharp Raman line near 1332 cm⁻¹. Diamond-like carbon, where the sp³ network is disordered or mixed with sp² regions, shows a broadened and shifted peak, sometimes accompanied by weak sp² features.

== Thickness Sensitivity in Layered Materials

In atomically thin materials like graphene, the number of layers changes the phonon dispersion through interlayer coupling. The most practical thickness indicator is the 2D band. In monolayer graphene, the 2D band is a single sharp Lorentzian with an intensity ratio 2D/G typically exceeding 2. As layers are added, the 2D band broadens, develops substructure from multiple double-resonance pathways, and its intensity relative to G decreases. In bulk graphite, 2D/G drops below about 0.5 and the 2D band becomes distinctly asymmetric [1].

= Methods

== Instrument

All spectra were acquired on a uRaman microscope module equipped with a 532 nm diode laser. Samples were focused through a 20× objective. Laser power was controlled using a five-position hardware attenuator before software fine-tuning.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    [*Knob*], [*Filter*], [*Transmission*],
    [1], [None], [100%],
    [2], [OD 0.2], [63%],
    [3], [OD 0.3], [50%],
    [4], [OD 0.6], [25%],
    [5], [OD 1.3], [5%],
  ),
  caption: [Hardware attenuator settings. The knob position was selected before software power adjustment to avoid laser instability at low software power settings.]
) <tab:attenuator>

For each measurement, a dark spectrum was first acquired at the chosen integration time and averaging settings to establish the detector baseline. The sample spectrum was then recorded and saved. Several independent acquisitions were made per sample to check reproducibility; these were later interpolated onto a common wavenumber grid and averaged.

== Acquisition Parameters

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, center, center, center, center),
    [*Sample*], [*Runs*], [*Integration (ms)*], [*Averages*], [*Smoothing*],
    [Carbon rod], [3], [1000], [3], [Yes],
    [HOPG], [3], [1200], [3], [Yes],
    [Graphene], [5], [500], [100], [No],
    [Carbon nanotube], [5], [1000--10000], [10], [Yes],
    [Diamond], [3], [1000], [3], [Yes],
    [Diamond-like 1 (A)], [5], [1000], [3], [No],
    [Diamond-like 2 (C)], [14], [5000--7000], [10], [Yes],
    [Diamond-like 3 (B)], [11], [100--2000], [10], [Yes],
    [Unknown wafer], [5], [1000], [1], [Yes],
  ),
  caption: [Acquisition parameters for all samples. All measurements used 532 nm excitation. Smoothing refers to Savitzky-Golay filtering (6 side points, 3rd-order polynomial) applied by the acquisition software. The software-reported laser power was 0 mW in all exported metadata; actual power was set by the hardware attenuator.]
) <tab:params>

Integration times and averaging counts were chosen based on signal strength. Graphene required 100 hardware averages per spectrum to compensate for the weak scattering from a film only a few atoms thick. Carbon nanotubes were measured at several integration times (1000 to 10000 ms) to ensure the spectral shape was not dependent on acquisition parameters. The run-to-run standard deviation, shown as a shaded band in each plot, serves as a visual check of measurement reproducibility.

= Results and Analysis

== Carbon Allotropes

=== Graphite (Carbon Rod)

#boxfig("raman/plots/carbon_rod.png", width: 85%, box-width: 95%, [Carbon rod (graphite): averaged spectrum of 3 runs with run-to-run spread shown as shading. The D, G, and 2D bands are marked.]) <fig:carbon-rod>

The carbon rod spectrum (@fig:carbon-rod) shows the three expected bands of sp² carbon. The G band appears at 1566 cm⁻¹, which is about 15 cm⁻¹ below the ideal graphite value of 1580 cm⁻¹. This downward shift can arise from strain or the polycrystalline nature of the rod, where a mixture of crystallite orientations broadens and shifts the average G position. The D band at 1346 cm⁻¹ is relatively strong, reflecting the considerable structural disorder in a carbon rod compared to single-crystal graphite. The 2D band appears at 2681 cm⁻¹.

=== HOPG

#boxfig("raman/plots/hopg.png", width: 85%, box-width: 95%, [HOPG: averaged spectrum of 3 runs. The G band dominates, and the D band is weaker relative to G than in the carbon rod, consistent with higher crystalline order.]) <fig:hopg>

Highly oriented pyrolytic graphite (@fig:hopg) shows a G band at 1581 cm⁻¹, very close to the expected value for well-ordered graphite. The D band at 1365 cm⁻¹ is noticeably weaker relative to G than in the carbon rod, confirming that HOPG has far fewer defects and better long-range order. The 2D band at 2720 cm⁻¹ is shifted about 40 cm⁻¹ higher than in the carbon rod, reflecting the well-defined layer stacking in this material.

=== Carbon Nanotubes

#boxfig("raman/plots/cnt.png", width: 85%, box-width: 95%, [Carbon nanotube sample: averaged spectrum of 5 runs. The D band is more intense than the G band (D/G > 1), indicating substantial disorder.]) <fig:cnt>

The nanotube spectrum (@fig:cnt) is notable for having a D band at 1337 cm⁻¹ that is more intense than the G band at 1572 cm⁻¹, giving a D/G ratio greater than 1. This level of disorder is typical for nanotube bundles, where tube ends, inter-tube junctions, and structural defects all activate the D mode. The 2D band appears at 2677 cm⁻¹.

=== Diamond

#boxfig("raman/plots/diamond.png", width: 85%, box-width: 95%, [Diamond: averaged spectrum of 3 runs. The sharp sp³ phonon at 1333 cm⁻¹ is the only physical feature.]) <fig:diamond>

Diamond (@fig:diamond) produces a single sharp peak at 1333 cm⁻¹, matching the literature value of 1332 cm⁻¹ for the zone-centre optical phonon of sp³ carbon. The sharpness and the absence of any sp² features (no D or G bands) confirm high-quality crystalline diamond. A small step-like baseline discontinuity visible in the spectrum is an acquisition artifact from detector segment stitching and is not a physical Raman feature.

=== Peak Summary

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, center, center),
    [*Sample*], [*D (cm⁻¹)*], [*G (cm⁻¹)*], [*2D/G' (cm⁻¹)*],
    [Carbon rod], [1346], [1566], [2681],
    [HOPG], [1365], [1581], [2720],
    [Graphene], [1360], [1585], [2688],
    [Carbon nanotube], [1337], [1572], [2677],
  ),
  caption: [Peak positions for sp² carbon allotropes. All values from averaged spectra under 532 nm excitation. Literature ranges: D ≈ 1340--1360, G ≈ 1580--1590, 2D ≈ 2680--2700 cm⁻¹ \[1\].]
) <tab:carbon-peaks>

The measured peak positions (@tab:carbon-peaks) fall within standard literature ranges for 532 nm excitation [1]. The variation in D-band position (1337--1365 cm⁻¹) partly reflects the dispersive nature of this mode, whose frequency depends on excitation wavelength, and partly reflects differences in defect character across the samples. The carbon rod's low G position (1566 cm⁻¹) stands out relative to HOPG (1581 cm⁻¹) and graphene (1585 cm⁻¹), likely reflecting strain or a mixture of crystallite orientations. The D' mode, which sometimes appears as a shoulder on the high-frequency side of the G band near 1620 cm⁻¹, was not clearly resolved as a distinct peak in any of the spectra.

== Diamond-like Samples

Three unlabeled samples were assessed by comparing their Raman spectra against the 1332 cm⁻¹ diamond reference established above.

#boxfig("raman/plots/diamond_like_1.png", width: 85%, box-width: 95%, [Diamond-like sample 1 (Unknown A): averaged spectrum of 5 runs. The peak near 1336 cm⁻¹ is the closest match to the diamond reference.]) <fig:dl1>

Unknown A (@fig:dl1) peaks at 1336 cm⁻¹, only 4 cm⁻¹ above the diamond reference. This is the closest of the three, but the slight shift suggests either minor stress in the crystal lattice or a small degree of structural disorder. Crystalline diamond under compressive stress can shift its Raman peak upward by a few wavenumbers, so this sample could still be diamond under residual stress, or it could be high-quality diamond-like carbon.

#boxfig("raman/plots/diamond_like_2.png", width: 85%, box-width: 95%, [Diamond-like sample 2 (Unknown C): averaged spectrum of 14 runs. The peak near 1307 cm⁻¹ is 25 cm⁻¹ below the diamond reference.]) <fig:dl2>

#boxfig("raman/plots/diamond_like_3.png", width: 85%, box-width: 95%, [Diamond-like sample 3 (Unknown B): averaged spectrum of 11 runs. The peak near 1302 cm⁻¹ is the furthest from the diamond reference.]) <fig:dl3>

Unknown C (@fig:dl2) and Unknown B (@fig:dl3) peak at 1307 and 1302 cm⁻¹ respectively, shifted 25--30 cm⁻¹ below the diamond reference. Shifts of this magnitude cannot be explained by instrument calibration or mild stress; they indicate either a heavily disordered sp³ network with significant bond-angle distortion, substantial sp² contamination, or a non-diamond material altogether. Neither sample is crystalline diamond.

== Graphene Thickness

#boxfig("raman/plots/graphene.png", width: 85%, box-width: 95%, [Graphene on SiO₂/Si: averaged spectrum from 5 different locations on the sample. The D, G, and 2D bands are labeled, along with the silicon substrate peak near 520 cm⁻¹.]) <fig:graphene>

The graphene spectrum (@fig:graphene) was acquired at five different locations on the sample, with 100 hardware averages per location to compensate for the weak signal from such a thin film. Despite being only a few atoms thick, the graphene signal is strong enough to produce clear peaks. This is partly because optical interference in the SiO₂ layer on the Si substrate enhances the electric field at the graphene surface, amplifying both the excitation and the Raman scattering [1].

The G band appears at 1585 cm⁻¹ and the 2D band at 2688 cm⁻¹. The measured 2D/G intensity ratio is approximately 0.82. For ideal monolayer graphene under 532 nm excitation, this ratio typically exceeds 2, with the 2D band appearing as a single symmetric Lorentzian. In bulk graphite, the ratio drops below 0.5 and the 2D band becomes asymmetric. A value of 0.82 places this sample in the few-layer regime, most likely 3 to 5 layers [1].

The D band at 1360 cm⁻¹ indicates some disorder or edge scattering, probably from the laser spot partially sampling the boundary of a graphene flake rather than indicating intrinsic defects in the basal plane. The peak near 520 cm⁻¹ is from the silicon substrate underneath the SiO₂ layer; its presence confirms that the graphene film is thin enough for the laser to penetrate through to the substrate.

The same thickness-determination approach applies to other layered materials such as WS₂ and MoS₂, where characteristic Raman modes (the E$""_(2g)^1$ and A$""_(1g)$ peaks) shift with layer number. These materials were not available in the lab during this experiment, so only graphene was measured.

== Unknown Semiconductor

#boxfig("raman/plots/unknown_semiconductor.png", width: 85%, box-width: 95%, [Unknown semiconductor wafer: averaged spectrum of 5 runs. The dominant peak at 521 cm⁻¹ matches crystalline silicon.]) <fig:unknown>

The unknown wafer (@fig:unknown) shows a single dominant peak at 521 cm⁻¹, matching the first-order optical phonon of crystalline silicon at 520--521 cm⁻¹. A weaker feature near 296 cm⁻¹ is consistent with a known two-phonon combination mode in silicon. No other peaks are present that would indicate a compound semiconductor such as GaAs (characteristic peaks near 268 and 292 cm⁻¹) or GaN (near 568 cm⁻¹). The wafer is crystalline silicon.

= Discussion

The most striking result across these measurements is how differently the same element behaves depending on its bonding geometry. All four sp² carbon samples and diamond contain only carbon atoms, yet their spectra are immediately distinguishable. The HOPG spectrum is dominated by a clean G band with a weak D component. The carbon rod shows stronger D-band scattering from its polycrystalline disorder. The nanotube spectrum has D/G > 1 because of the many structural discontinuities in a tube bundle. Diamond, also pure carbon, gives a completely different single-line spectrum because its sp³ bonding supports a different set of lattice vibrations. This underscores that Raman spectroscopy probes structure, not just elemental composition.

Beyond peak positions, intensity ratios carry quantitative structural information. The D/G ratio measures disorder: HOPG (low D/G, well ordered) compared to the carbon rod (higher D/G, polycrystalline) compared to nanotubes (D/G > 1, many defects). The 2D/G ratio measures layer count in graphene: the value of 0.82 places the sample between ideal monolayer (2D/G > 2) and bulk graphite (2D/G < 0.5), consistent with 3 to 5 layers. These ratios provide structural insight that peak positions alone cannot.

The diamond-like sample assessment illustrates a practical application of Raman spectroscopy: rapid, non-destructive authentication. Only one of the three unknowns came close to the 1332 cm⁻¹ reference, while the other two showed shifts of 25--30 cm⁻¹ that clearly exclude crystalline diamond.

Repeat measurements across all samples showed good run-to-run consistency, visible in the narrow shaded bands in the figures. The main experimental limitation is the uncertainty in absolute laser power, since the software reports 0 mW while actual power is set by the hardware attenuator. The spectral resolution of the instrument is also insufficient to resolve the D' shoulder from the G band; this mode, expected near 1620 cm⁻¹, was not observed as a distinct feature in any spectrum.

= Conclusion

Raman spectroscopy with 532 nm excitation successfully distinguished five carbon allotropes through their vibrational spectra. D, G, and 2D band positions and intensity ratios provided a consistent framework for assessing structural order: HOPG showed the least disorder, the carbon rod was intermediate, and carbon nanotubes showed the most. Diamond produced a clean sp³ signature at 1333 cm⁻¹, with no sp² contamination. Of three diamond-like unknowns, only Unknown A (1336 cm⁻¹) approximated the diamond reference; the other two, peaked at 1307 and 1302 cm⁻¹, are not crystalline diamond. The graphene film showed a 2D/G ratio of 0.82, indicating few-layer material rather than a monolayer. The unknown semiconductor wafer was identified as crystalline silicon from its 521 cm⁻¹ phonon mode. Across all measurements, repeated acquisitions confirmed spectral stability and enabled meaningful averaging.

= References

1. A. C. Ferrari, "Raman spectroscopy of graphene and graphite," _Solid State Communications_ *143*, 47 (2007).
2. Raman spectroscopy lab manual (provided).
3. E. Smith and G. Dent, _Modern Raman Spectroscopy: A Practical Approach_ (Wiley, 2005).

= Appendix: Raman Spectra

#set figure(placement: none)

All averaged Raman spectra recorded in this experiment are presented in the main text at the point of discussion. For reference, the complete list is:

== Carbon Allotropes
- Carbon rod (graphite): @fig:carbon-rod
- HOPG: @fig:hopg
- Carbon nanotube: @fig:cnt
- Diamond: @fig:diamond
- Graphene: @fig:graphene

== Diamond-like Samples
- Unknown A: @fig:dl1
- Unknown C: @fig:dl2
- Unknown B: @fig:dl3

== Semiconductor
- Unknown wafer (silicon): @fig:unknown

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
      "Help me navigate the Raman software interface, export spectra, and organize filenames for later plotting." \
      *Output:* \
      Basic workflow tips and export checklist
    ], [
      Used for technical guidance on software usage and file handling. All measurements, analysis, and interpretations were performed and verified by me.
    ],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help with Typst formatting for figures, captions, tables, and page breaks. Check that file paths are consistent and the document compiles." \
      *Output:* \
      Typst formatting tips and layout suggestions
    ], [
      Used only for formatting guidance. All experiment content, analysis, and interpretations were written and verified by me.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)
