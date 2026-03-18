#import "../shared/_at.typ": *

#show: ad.with(
  title: "Laue Diffraction and X-Ray Crystallography",
  author: "Parth Bhargava · A0310667E",
  experiment: "",
  course: "PC3193 Experimental Physics II",
  title-page: false
)

#show link: underline
#set math.equation(numbering: "(1)")

= Abstract

This two-part experiment uses Laue diffraction and powder X-ray crystallography (XRC) to characterise crystalline materials. Laue patterns recorded for a LiF single crystal show a symmetric spot array consistent with a cubic point group, while patterns for polyethylene monofilament show increased molecular orientation after mechanical drawing. Powder XRC scans of two unknown samples yield indexed peak lists and lattice parameters: Unknown 1 matches a diamond-cubic structure with $a = 5.430 ± 0.002$ Å (silicon), and Unknown 2 matches a body-centred cubic (BCC) structure with $a = 3.140 ± 0.004$ Å (molybdenum). The structure factor for the 8-atom diamond-cubic basis is derived to explain the additional selection rules that distinguish diamond-cubic from simple FCC diffraction.

= Introduction

X-ray wavelengths ($≈ 0.5$--$2.5$ Å) are comparable to interatomic spacings in solids, so a crystal acts as a three-dimensional diffraction grating for X-rays. When elastically scattered X-rays from many periodically arranged atoms interfere constructively, discrete diffraction features appear whose geometry encodes the crystal structure. Two complementary methods exploit this.

In *Laue diffraction*, a polychromatic (white) X-ray beam illuminates a single crystal. Each set of lattice planes selects from the continuous spectrum the wavelength that satisfies the Bragg condition, producing a pattern of spots whose symmetry and distribution reveal the crystal's point-group symmetry and orientation. In *powder X-ray crystallography*, a monochromatic beam strikes a polycrystalline sample with randomly oriented crystallites. Each family of planes that satisfies the Bragg condition produces a cone of diffracted radiation; scanning the detector angle $2 θ$ converts these cones into discrete peaks whose positions yield interplanar spacings and, through indexing, the lattice parameters and crystal structure.

The report is organised so that each theoretical development leads directly to a specific measurement and analysis step. The Laue section determines crystal symmetry and orientation from spot patterns; the XRC section identifies two unknown polycrystalline samples from their indexed peak lists and lattice parameters.

= Theory

== X-Ray Production

X-rays are produced by two mechanisms, each yielding a different spectral character suited to a different diffraction method.

*Characteristic X-rays* arise when energetic electrons eject inner-shell electrons from target atoms. When outer-shell electrons fill the resulting vacancies, they emit X-rays at discrete energies set by the electronic structure of the target. For a copper anode, the dominant emission is Cu $K_(α 1)$ at $λ = 1.5406$ Å. This monochromatic radiation is essential for powder diffraction, where each sharp peak must correspond to a single, well-defined wavelength.

*Bremsstrahlung* is produced when electrons decelerate in the Coulomb field of target nuclei. The resulting radiation has a continuous spectrum from visible light up to a cutoff energy equal to the electron kinetic energy. This white beam is essential for Laue diffraction, where many wavelengths must be available simultaneously so that every set of lattice planes can find a wavelength satisfying the Bragg condition.

== The Bragg Condition

Consider a set of parallel crystal planes separated by spacing $d$. When an X-ray beam strikes these planes at a glancing angle $θ$, rays reflected from successive planes travel different path lengths. Constructive interference occurs when this path difference equals an integer number of wavelengths:

$ n λ = 2 d sin θ $ <bragg-law>

This relates the experimentally measured angle $2 θ$ (in a $θ$-$2 θ$ scan) to the interplanar spacing $d$, which encodes the lattice geometry. Bragg's law underpins both Laue and powder diffraction: in the Laue method, $λ$ is the variable (selected from the white beam); in powder diffraction, $θ$ is the variable (scanned by the goniometer).

== Laue Diffraction

In Laue diffraction, the incident beam contains a continuous range of wavelengths. Each lattice plane $(h k l)$ selects the wavelength $λ_(h k l)$ that satisfies @bragg-law at the fixed geometric angle set by the crystal orientation. The resulting spots on the detector correspond to projections of reciprocal-lattice directions, so the symmetry of the spot pattern mirrors the point-group symmetry of the crystal. For a cubic crystal viewed along a low-index zone axis, the pattern shows the characteristic $n$-fold rotational symmetry of that axis.

For polymeric samples, Laue patterns reveal the degree of molecular orientation. An amorphous or randomly oriented sample produces diffuse scattering, while a highly oriented (drawn) sample produces sharper, anisotropic features reflecting the preferred alignment of polymer chains along the drawing axis.

== Powder Diffraction and Cubic Indexing

In a polycrystalline powder, crystallites are randomly oriented. For each set of planes satisfying the Bragg condition, a cone of diffracted rays is produced. A $θ$-$2 θ$ scan records intensity as a function of $2 θ$, converting cones into peaks. Each peak position yields $d_(h k l)$ via @bragg-law, and the set of $d$-values can be indexed to determine the crystal structure.

For cubic crystals with lattice parameter $a$, the interplanar spacing is:

$ d_(h k l) = frac(a, sqrt(h^2 + k^2 + l^2)) $ <dhkl-cubic>

Combining with @bragg-law (for $n = 1$):

$ sin^2 θ = frac(λ^2, 4 a^2)(h^2 + k^2 + l^2) $ <sin2-relation>

@sin2-relation shows that for a cubic crystal, $sin^2 θ$ increases in proportion to $h^2 + k^2 + l^2$. By computing the ratios of $sin^2 θ$ values for successive peaks, one can identify the allowed sequence of $h^2 + k^2 + l^2$ values and from that determine the crystal type.

== Structure Factor and Selection Rules

Not all planes produce observable diffraction peaks. The structure factor $F(h k l)$ determines the amplitude of scattering from a unit cell:

$ F(h k l) = sum_(j=1)^(M) f_j exp[2 π i (h x_j + k y_j + l z_j)] $ <structure-factor>

where $f_j$ is the atomic scattering factor and $(x_j, y_j, z_j)$ are the fractional coordinates of the $j$-th atom. When $F(h k l) = 0$, destructive interference within the unit cell extinguishes the reflection. These are the systematic absences, or selection rules.

*Simple cubic (SC):* one atom at $(0,0,0)$. $F = f$ for all $(h k l)$, so there are no systematic absences.

*Body-centred cubic (BCC):* two atoms at $(0,0,0)$ and $(1 slash 2, 1 slash 2, 1 slash 2)$.
$ F = f[1 + e^(i π(h + k + l))] = cases(2f "if" h + k + l "even", 0 "if" h + k + l "odd") $ <bcc-rule>

*Face-centred cubic (FCC):* four atoms at $(0,0,0)$, $(1 slash 2, 1 slash 2, 0)$, $(1 slash 2, 0, 1 slash 2)$, $(0, 1 slash 2, 1 slash 2)$.
$ S_"FCC" = f[1 + e^(i π(h+k)) + e^(i π(h+l)) + e^(i π(k+l))] = cases(4f "if" h\,k\,l "all even or all odd", 0 "otherwise") $ <fcc-rule>

These selection rules generate distinct sequences of allowed $h^2 + k^2 + l^2$ values:
- *SC:* 1, 2, 3, 4, 5, 6, 8, 9, ...
- *BCC:* 2, 4, 6, 8, 10, 12, ...
- *FCC:* 3, 4, 8, 11, 12, 16, 19, 20, 24, ...

The ratios of successive $sin^2 θ$ values directly distinguish the three cubic types.

== Diamond-Cubic Structure Factor (8-Atom Basis)

The diamond-cubic structure consists of two interpenetrating FCC sublattices offset by $(1 slash 4, 1 slash 4, 1 slash 4)$. The 8 atoms in the conventional unit cell occupy:

#v(0.3em)
#align(center)[
  Sublattice 1: $(0,0,0)$, $space (1 slash 2, 1 slash 2, 0)$, $space (1 slash 2, 0, 1 slash 2)$, $space (0, 1 slash 2, 1 slash 2)$

  Sublattice 2: $(1 slash 4, 1 slash 4, 1 slash 4)$, $space (3 slash 4, 3 slash 4, 1 slash 4)$, $space (3 slash 4, 1 slash 4, 3 slash 4)$, $space (1 slash 4, 3 slash 4, 3 slash 4)$
]
#v(0.3em)

Sublattice 2 is the same FCC arrangement as sublattice 1, shifted by $(1 slash 4, 1 slash 4, 1 slash 4)$. The total structure factor is therefore:

$ F(h k l) = S_"FCC" ⋅ [1 + e^(i π (h+k+l) slash 2)] $ <diamond-sf>

where $S_"FCC"$ is the FCC structure factor from @fcc-rule. The second factor $P = 1 + e^(i π (h+k+l) slash 2)$ introduces additional extinctions beyond the FCC rule. Evaluating $P$ for different values of $h + k + l mod 4$:

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (center, center, center, center),
    [*$h+k+l mod 4$*], [*$e^(i π(h+k+l) slash 2)$*], [*$P$*], [*$|F|^2$*],
    [0], [$1$], [$2$], [$64 f^2$],
    [1], [$i$], [$1 + i$], [$32 f^2$],
    [2], [$-1$], [$0$], [$0$],
    [3], [$-i$], [$1 - i$], [$32 f^2$],
  ),
  caption: [Structure factor magnitude for the diamond-cubic 8-atom basis, evaluated for FCC-allowed reflections only. When $h+k+l ≡ 2 med (mod 4)$, the reflection is extinguished by destructive interference between the two sublattices.]
) <tab:diamond-sf>

The physical consequence is that reflections such as $(200)$ ($h+k+l = 2$), $(222)$ ($h+k+l = 6$), and $(442)$ ($h+k+l = 10$) are forbidden in diamond-cubic but allowed in simple FCC. This additional extinction is what distinguishes diamond-cubic from FCC experimentally.

= Methods

== Safety and X-Ray Unit

All experiments were performed on enclosed X-ray systems with radiation shielding and interlock mechanisms. X-rays were enabled only with the shield locked in place, and exposure times were controlled by a timer. Tube current was monitored and kept within specified limits.

== Laue Diffraction

*LiF single crystal.* A LiF mini-crystal was mounted with adhesive tape over the 1 mm diameter primary beam collimator, with the crystal axis aligned at approximately 45°. X-ray film was loaded in the cassette at experimental station E.S. 3, and the pattern was exposed for 40 minutes.

*Polyethylene monofilament.* A polyethylene monofilament was mounted vertically, centred over the 1 mm collimator port. A first exposure (7 minutes at E.S. 3, 30 kV, 75 μA) recorded the pattern for the undrawn (as-received) filament. The central section was then manually stretched until it acquired a clearly drawn, oriented form, and a second exposure was recorded with the drawn section centred over the beam. The geometry was kept fixed between exposures so that differences in the patterns reflect orientation changes rather than alignment drift.

== Powder X-Ray Crystallography

Two unknown polycrystalline samples were scanned on a PANalytical X'Pert$#super[3]$ powder diffractometer in $θ$-$2 θ$ (goniometer) geometry. The instrument uses a Cu anode with $K_(α 1)$ wavelength 1.5406 Å and $K_(α 2)$ wavelength 1.5444 Å ($K_(α 2) slash K_(α 1)$ intensity ratio 0.50). Scans covered $2 θ = 20°$--$140°$ with a step size of $0.02°$ and 0.40 s per step. The complete instrument settings for each sample are recorded in @tab:settings. Diffraction data were exported as CSV files for peak identification and indexing.

= Results

== Laue Diffraction Patterns

The three Laue patterns are shown in @fig:laue-lif, @fig:laue-pe-raw, and @fig:laue-pe-drawn.

#boxfig(
  "lau+xrc/data/LiF_mini_crystal.jpg",
  [Laue pattern for LiF mini-crystal. Discrete spots arranged with approximate rotational symmetry about the direct beam, consistent with a well-ordered single crystal.]
) <fig:laue-lif>

The LiF pattern (@fig:laue-lif) shows a set of distinct, well-separated spots distributed symmetrically about the central direct-beam position. The spots appear at discrete angular positions with no diffuse background, confirming that the LiF sample is a well-ordered single crystal with long-range periodicity.

#boxfig(
  "lau+xrc/data/amorphous_polyethylene.jpg",
  [Laue pattern for polyethylene monofilament (undrawn). The diffuse central region and absence of sharp spots indicate low molecular orientation and substantial amorphous character.]
) <fig:laue-pe-raw>

#boxfig(
  "lau+xrc/data/stretched_polyethylene.jpg",
  [Laue pattern for polyethylene monofilament (drawn). Sharper, axis-aligned features indicate increased molecular orientation along the drawing direction.]
) <fig:laue-pe-drawn>

The undrawn polyethylene (@fig:laue-pe-raw) produces a largely diffuse pattern with no sharp spots, reflecting the lack of long-range crystalline order in the as-received filament. After drawing (@fig:laue-pe-drawn), the pattern develops sharper features aligned along a preferred axis. The contrast directly shows that mechanical drawing induces molecular alignment: the polymer chains, initially oriented randomly, become preferentially parallel to the draw axis, introducing enough order to produce anisotropic diffraction.

== XRC Scans

#boxfig(
  "lau+xrc/plots/Sample Run_11_xrc.png",
  [Powder XRC scan for Unknown 1 (Sample Run 11). The dominant peak at $2 θ ≈ 28.4°$ is the (111) reflection. All observed peaks are consistent with diamond-cubic selection rules.]
) <fig:xrc-unk1>

#boxfig(
  "lau+xrc/plots/Sample Run_7_xrc.png",
  [Powder XRC scan for Unknown 2 (Sample Run 7). The dominant peak at $2 θ ≈ 58.8°$ is the (220) reflection under BCC indexing. Several weak features in the $26°$--$34°$ range sit at or near the noise floor and do not index consistently with the main phase.]
) <fig:xrc-unk2>

The indexed peak lists for both unknowns are presented in @tab:xrc-peaks. Peak positions were determined from the scan data after smoothing and thresholding. Interplanar spacings were computed from each peak using Bragg's law ($d = λ slash (2 sin θ)$) with $λ = 1.5406$ Å.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center),
    [*Sample*], [*$2 θ$ (°)*], [*Intensity*], [*$(h k l)$*], [*$d$ (Å)*], [*$a$ (Å)*],
    [Unknown 1], [28.43], [2201], [(1 1 1)], [3.137], [5.433],
    [Unknown 1], [47.33], [525], [(2 2 0)], [1.919], [5.428],
    [Unknown 1], [56.15], [256], [(3 1 1)], [1.637], [5.427],
    [Unknown 1], [69.11], [139], [(4 0 0)], [1.358], [5.432],
    [Unknown 1], [76.35], [246], [(3 3 1)], [1.246], [5.430],
    [Unknown 1], [88.01], [246], [(4 2 2)], [1.109], [5.431],
    [Unknown 1], [94.93], [140], [(5 1 1)], [1.045], [5.430],
    [Unknown 1], [106.69], [95], [(4 4 0)], [0.960], [5.430],
    [Unknown 1], [114.07], [129], [(5 3 1)], [0.918], [5.431],
    [Unknown 1], [127.53], [122], [(6 2 0)], [0.859], [5.431],
    [Unknown 1], [136.89], [71], [(5 3 3)], [0.828], [5.430],
    table.hline(),
    [Unknown 2], [40.67], [353], [(1 1 0)], [2.217], [3.135],
    [Unknown 2], [58.81], [6318], [(2 0 0)], [1.569], [3.138],
    [Unknown 2], [73.83], [2238], [(2 1 1)], [1.283], [3.142],
    [Unknown 2], [116.07], [292], [(2 2 2)], [0.908], [3.145],
  ),
  caption: [Indexed peak list for the two unknown samples. Each peak's $d$-spacing is computed from Bragg's law with $λ = 1.5406$ Å, and the lattice parameter $a$ is derived from @dhkl-cubic. Unknown 1 is indexed as diamond-cubic; Unknown 2 as BCC.]
) <tab:xrc-peaks>

= Analysis

== Laue Symmetry and Orientation

The LiF Laue pattern shows a symmetric arrangement of spots about the direct beam with approximately four-fold symmetry, consistent with a cubic crystal viewed near a $⟨ 100 ⟩$ zone axis. The discrete, sharp spots confirm single-crystal quality and stable orientation throughout the exposure. LiF crystallises in the rock-salt (NaCl-type) structure with space group $F m overline(3) m$, and the observed pattern symmetry is consistent with this cubic point group.

For polyethylene, the transition from diffuse scattering (undrawn) to anisotropic features (drawn) shows the mechanical induction of crystallographic texture. In the undrawn state, crystalline lamellae are randomly oriented, producing no preferred diffraction directions. Drawing forces the polymer chains into approximate alignment along the draw axis, creating a fibre texture where the $c$-axis of the orthorhombic polyethylene unit cell aligns preferentially along the fibre direction. In effect, the drawn filament behaves as a partially oriented polycrystal.

== XRC Indexing: $sin^2 θ$ Ratio Method

The first step in powder pattern analysis is to determine the crystal type from the sequence of observed reflections. Computing $sin^2 θ$ for each peak and forming ratios relative to the first peak reveals the allowed values of $h^2 + k^2 + l^2$, which immediately identifies the structure type.

=== Unknown 1

The $sin^2 θ$ values for the first six peaks of Unknown 1 are:

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (center, center, center, center, center),
    [*$2 θ$ (°)*], [*$sin^2 θ$*], [*Ratio*], [*$h^2+k^2+l^2$*], [*$(h k l)$*],
    [28.43], [0.0606], [1.00], [3], [(1 1 1)],
    [47.33], [0.1614], [2.66], [8], [(2 2 0)],
    [56.15], [0.2222], [3.67], [11], [(3 1 1)],
    [69.11], [0.3226], [5.32], [16], [(4 0 0)],
    [76.35], [0.3833], [6.32], [19], [(3 3 1)],
    [88.01], [0.4844], [7.99], [24], [(4 2 2)],
  ),
  caption: [Ratio analysis for Unknown 1. The sequence 3, 8, 11, 16, 19, 24 matches the FCC-allowed values with the additional absence of $h^2+k^2+l^2 = 4$ (i.e. the (200) reflection), which is the signature of diamond-cubic structure.]
) <tab:ratio-unk1>

The ratio sequence 1 : 2.66 : 3.67 : 5.32 : 6.32 : 7.99 corresponds to $h^2+k^2+l^2$ = 3, 8, 11, 16, 19, 24. This matches the FCC selection rule (all even or all odd indices), but with the notable absence of (200) ($h^2+k^2+l^2 = 4$) and (222) ($h^2+k^2+l^2 = 12$). These additional absences are precisely the extinctions predicted by the diamond-cubic structure factor (@tab:diamond-sf): reflections with $h+k+l ≡ 2 med (mod 4)$ vanish because of destructive interference between the two FCC sublattices.

The lattice parameters computed from each peak cluster tightly around $a = 5.430 ± 0.002$ Å, in excellent agreement with the literature value for silicon ($a = 5.431$ Å). Unknown 1 is therefore identified as *silicon* with the diamond-cubic structure.

=== Unknown 2

The $sin^2 θ$ analysis for the four strong peaks of Unknown 2 gives:

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (center, center, center, center, center),
    [*$2 θ$ (°)*], [*$sin^2 θ$*], [*Ratio*], [*$h^2+k^2+l^2$*], [*$(h k l)$*],
    [40.67], [0.1208], [1.00], [2], [(1 1 0)],
    [58.81], [0.2409], [1.99], [4], [(2 0 0)],
    [73.83], [0.3606], [2.98], [6], [(2 1 1)],
    [116.07], [0.7190], [5.95], [12], [(2 2 2)],
  ),
  caption: [Ratio analysis for Unknown 2. The sequence 2, 4, 6, 12 is a subset of the BCC-allowed values ($h+k+l$ even), confirming a body-centred cubic structure.]
) <tab:ratio-unk2>

The ratios 1 : 2.00 : 2.98 : 5.95 correspond to $h^2+k^2+l^2$ = 2, 4, 6, 12. This is the signature of a BCC lattice, where the selection rule $h+k+l$ = even eliminates reflections such as (100), (111), (210), and (311). The missing values 8 and 10 (which would correspond to (220) and (310)) are expected at $2 θ ≈ 87°$ and $≈ 101°$ but fall below the detection threshold in this scan, consistent with their lower structure-factor-weighted intensities and Debye--Waller suppression at high angles.

Several weak peaks appear in the $26°$--$34°$ range of the Unknown 2 scan (intensities around 110--140, compared to the strongest peak at 6318). These do not index consistently with the BCC phase ($sin^2 θ$ ratios do not match the BCC sequence) and are likely from minor surface contamination or background scattering from the sample mount.

The lattice parameters from the four indexed peaks give $a = 3.140 ± 0.004$ Å, in close agreement with the literature value for molybdenum ($a = 3.147$ Å, 0.2% discrepancy). Unknown 2 is therefore identified as *molybdenum* with the BCC structure.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, center, center),
    [*Sample*], [*Mean $a$ (Å)*], [*Structure*], [*Identification*],
    [Unknown 1], [$5.430 ± 0.002$], [Diamond cubic], [Silicon],
    [Unknown 2], [$3.140 ± 0.004$], [BCC], [Molybdenum],
  ),
  caption: [Summary of lattice parameters and structural identification.]
) <tab:lattice>

== Verification via Diamond-Cubic Selection Rules

The identification of Unknown 1 as diamond-cubic silicon is further supported by checking the 8-atom basis selection rules from @diamond-sf and @tab:diamond-sf against the full peak list.

The observed reflections for Unknown 1 have $h+k+l$ values of 3, 4, 5, 4, 7, 8, 7, 8, 9, 8, 11, all satisfying $h+k+l ≢ 2 med (mod 4)$. Crucially, the (200) reflection ($h+k+l = 2$) and (222) reflection ($h+k+l = 6$) are absent despite being allowed by the simpler FCC rule. This is exactly the extinction pattern one would get from the second FCC sublattice shifted by $(1 slash 4, 1 slash 4, 1 slash 4)$, confirming a diamond-cubic basis rather than simple FCC.

For a simple FCC metal (aluminium, copper, gold), the (200) reflection would be one of the strongest peaks. Its complete absence in the Unknown 1 pattern, together with the lattice parameter matching silicon, leaves no ambiguity in the identification.

= Discussion

The Laue and XRC results illustrate two fundamentally different uses of X-ray diffraction. The Laue method, with its white beam and fixed geometry, gives qualitative information about crystal symmetry and orientation. The powder method, with its monochromatic beam and scanned angle, gives quantitative information about lattice parameters and structure type.

For the Laue results, the contrast between the LiF single-crystal pattern and the polyethylene patterns illustrates the difference between long-range crystalline order (producing discrete spots) and the partial order induced by mechanical processing (producing anisotropic diffuse scattering). The drawn polyethylene pattern does not show the sharp spots of a single crystal because the polymer remains polycrystalline; the anisotropy comes from preferred orientation of crystalline lamellae, which in metallurgical terms is called fibre texture.

For the XRC results, the $sin^2 θ$ ratio method gives an unambiguous distinction between crystal types without requiring any prior knowledge of the material. The ratio sequence 3, 8, 11, 16, ... immediately points to FCC-type reflections, while the additional absence of $h^2+k^2+l^2 = 4$ narrows the identification to diamond-cubic. For Unknown 2, the ratio sequence 2, 4, 6, 12 directly identifies BCC, ruling out both FCC and simple cubic. The lattice parameters then match the structures to specific elements.

The dominant source of uncertainty in the XRC analysis is peak-position determination, which depends on step size ($0.02°$), counting statistics, and any systematic zero-angle offset. The consistency of $a$ values across multiple peaks (standard deviation $< 0.005$ Å for both samples) gives confidence that systematic errors are small. At high angles, $K_(α 1)$/$K_(α 2)$ doublet splitting becomes resolved (visible as paired peaks in @fig:xrc-unk1 above $2 θ ≈ 75°$), confirming the instrumental resolution and the two-wavelength character of the Cu source.

= Conclusion

The Laue patterns confirm single-crystal symmetry for LiF and show that mechanical drawing induces molecular orientation in polyethylene. The powder XRC scans yield internally consistent indexed peak lists for both unknowns: Unknown 1 is diamond-cubic silicon ($a = 5.430$ Å) and Unknown 2 is BCC molybdenum ($a = 3.140$ Å). The 8-atom diamond-cubic structure factor derivation accounts for the additional extinctions (absence of (200) and (222) reflections) that distinguish silicon from a simple FCC metal. The BCC identification of Unknown 2 is established by the $sin^2 θ$ ratio sequence 1 : 2 : 3 : 6 and the lattice parameter match to molybdenum.

= References

1. Laue Diffraction, PC3193 manual (provided).
2. X-Ray Crystallography, PC3193 manual (provided).
3. C. Kittel, _Introduction to Solid State Physics_, 8th ed. (Wiley, 2005), Chapter on Diffraction.
4. H.P. Myers, _Introductory Solid State Physics_ (Taylor & Francis, 1997).

= Appendix

== Instrument Settings

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    [*Parameter*], [*Unknown 1 (Run 11)*], [*Unknown 2 (Run 7)*],
    [Diffractometer], [PANalytical X'Pert$#super[3]$], [PANalytical X'Pert$#super[3]$],
    [Goniometer], [PW3050/60 ($θ slash θ$)], [PW3050/60 ($θ slash θ$)],
    [Geometry], [Flat sample stage (PW3071/xx)], [Flat sample stage (PW3071/xx)],
    [Anode material], [Cu], [Cu],
    [$K_(α 1)$ wavelength], [1.5406 Å], [1.5406 Å],
    [$K_(α 2)$ wavelength], [1.5444 Å], [1.5444 Å],
    [Generator voltage], [40 kV], [45 kV],
    [Tube current], [30 mA], [40 mA],
    [Scan range ($2 θ$)], [20.0°--140.0°], [20.0°--140.0°],
    [Step size], [0.020°], [0.020°],
    [Scan type], [Continuous], [Continuous],
    [Time per step], [0.40 s], [0.40 s],
    [Divergence slit], [Fixed, 1.52 mm], [Fixed, 1.52 mm],
    [Receiving slit], [0.10 mm], [0.10 mm],
    [Monochromator], [No], [No],
    [No. of points], [6000], [6000],
    [Scan date], [15 Feb 2024], [8 Oct 2025],
  ),
  caption: [XRC instrument settings for the two unknown samples, extracted from the measurement metadata.]
) <tab:settings>

== Laue Exposure Log

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, left, left, left),
    [*Sample*], [*Station*], [*Exposure time*], [*Tube settings*],
    [LiF mini-crystal], [E.S. 3], [40 min], [Standard (1 mm collimator, 45° alignment)],
    [Polyethylene (undrawn)], [E.S. 3], [7 min], [30 kV, 75 μA],
    [Polyethylene (drawn)], [E.S. 3], [7 min], [30 kV, 75 μA],
  ),
  caption: [Exposure parameters for Laue diffraction patterns.]
) <tab:laue-log>

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
      "Help me process the powder XRD data files, identify peaks, calculate sin²θ ratios, and determine lattice parameters for the unknown samples." \
      *Output:* \
      Python script for peak extraction and lattice parameter calculation
    ], [
      Used for data processing automation. All diffraction measurements were recorded by me, and the identification of crystal structures through systematic absence analysis and lattice parameter comparison is my own work.
    ],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help with Typst formatting for figures, tables, equations, and appendix layout. Check that cross-references and file paths compile correctly." \
      *Output:* \
      Typst formatting guidance and layout suggestions
    ], [
      Used only for formatting. All experiment content, analysis, and scientific interpretations were written and verified by me.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)
