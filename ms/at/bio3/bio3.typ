#import "../shared/_at.typ": *

#show: ad.with(
  title: "Fluorescence Microscopy:
  Cellular Structure",
  author: "Parth Bhargava · A0310667E",
  experiment: "",
  course: "PC3267 Biophysics II",
  title-page: false
)

#show link: underline
#set math.equation(numbering: "(1)")

= Abstract

Onion skin epidermal cells and human cheek epithelial cells were stained with Hoechst dye and imaged under both brightfield and fluorescence illumination at 20× magnification (NA = 0.45). Brightfield imaging revealed the gross morphology of each cell type, while UV-excited fluorescence selectively highlighted the nuclei with high contrast against a dark background. Onion cells appeared as a regular brick-like array with clearly defined cell walls and uniformly spaced nuclei, whereas cheek cells were rounded, isolated, and irregularly scattered with individually distinguishable nuclei. The experiment illustrates why fluorescence microscopy is preferred over brightfield for localising specific intracellular structures: it provides molecular specificity through selective staining and dramatically improves signal-to-background contrast.

= Introduction

Optical microscopy has been a cornerstone of cell biology since the 17th century, but conventional brightfield illumination has a fundamental limitation: most cellular structures are nearly transparent and have similar refractive indices, making them difficult to distinguish. Fluorescence microscopy addresses this by exploiting fluorescent dyes that bind selectively to particular molecules or organelles. When illuminated at the correct excitation wavelength, these dyes emit light at a longer wavelength, and appropriate optical filters ensure that only this emission reaches the detector. The result is a high-contrast image where the target structure glows brightly against a dark background.

Hoechst dyes are a family of bisbenzimide fluorescent stains that bind to the minor groove of double-stranded DNA, with a preference for A-T-rich regions. When bound, they absorb UV light near 350 nm and emit blue fluorescence near 461 nm. Because they are cell-permeant and do not require fixation, they can stain nuclei in living or freshly prepared cells within minutes.

This experiment uses Hoechst staining to visualise the nuclei of two cell types with very different structural organisation: onion skin epidermal cells (plant) and human cheek epithelial cells (animal). By comparing brightfield and fluorescence images of each, we can see directly what fluorescence microscopy adds beyond what is visible in conventional transmitted light. The comparison also highlights the major structural differences between plant and animal cells, particularly the presence of a rigid cell wall in plant cells and its absence in animal cells.

= Theory

== Fluorescence and the Stokes Shift

When a fluorophore absorbs a photon, an electron is promoted from the ground state $S_0$ to a vibrationally excited level of the first excited singlet state $S_1$. The molecule rapidly relaxes to the lowest vibrational level of $S_1$ through non-radiative processes (internal conversion), losing some energy as heat. The electron then returns to $S_0$ by emitting a photon. Because of the energy lost during vibrational relaxation, the emitted photon has less energy and therefore a longer wavelength than the absorbed photon. This difference between excitation and emission wavelengths is the Stokes shift, and it is what makes fluorescence microscopy possible: optical filters can separate the excitation light from the much weaker emission light based on wavelength alone.

== Hoechst Dye

Hoechst 33258 and 33342 are bisbenzimide dyes that bind non-covalently to the minor groove of double-stranded DNA, preferentially at A-T base pair sequences where the minor groove is narrower. On binding, the dye's fluorescence quantum yield increases substantially because the rigid environment of the groove suppresses non-radiative decay. The excitation peak is near 350 nm (UV) and the emission peak is near 461 nm (blue). Hoechst dyes are membrane-permeant, so they can stain nuclei in intact, unfixed cells after just 15 minutes of incubation.

== Epi-Illumination Fluorescence Microscopy

In epi-illumination geometry, excitation light passes through the objective lens and illuminates the specimen from above (or below, depending on orientation). A dichroic mirror positioned at 45° in the optical path reflects the shorter excitation wavelength toward the specimen but transmits the longer emission wavelength, allowing it to pass through to the eyepiece or camera. An excitation filter upstream of the dichroic selects the appropriate excitation band from the lamp source, and a barrier (emission) filter downstream blocks any residual excitation light that leaks through the dichroic.

The microscope used here has three interchangeable filter cubes: WU for UV excitation, WB for blue excitation, and WG for green excitation. For Hoechst-stained specimens, the WU cube is used, providing UV excitation around 330--385 nm and transmitting emission above approximately 420 nm.

== Resolution

The spatial resolution of a fluorescence microscope is set by diffraction. For a circular aperture, the Rayleigh criterion gives the minimum resolvable distance as:

$ d_"min" = frac(0.61 λ, "NA") $ <eq:rayleigh>

where $λ$ is the emission wavelength and NA is the numerical aperture of the objective. For the 20× objective used here (NA = 0.45) and Hoechst emission at $λ ≈ 461$ nm:

$ d_"min" = frac(0.61 × 461, 0.45) ≈ 625 "nm" $

This means structures separated by less than about 0.6 μm cannot be resolved as distinct features. Cell nuclei (typically 5--10 μm for animal cells, 5--15 μm for plant cells) are well above this limit and should be clearly resolved.

= Methods

== Sample Preparation

Two cell types were prepared for imaging:

*Onion epidermal cells.* A raw onion was cut into sections roughly 5 mm across. The thin, transparent inner membrane of a scale leaf was peeled off with forceps and placed on a glass slide. The membrane was stained with Hoechst dye and incubated for 15 minutes at room temperature. After incubation, the slide was ready for imaging.

*Human cheek epithelial cells.* The inner lining of the cheek was gently scraped with the flat end of a toothpick. The collected cells were transferred to a small drop of phosphate-buffered saline (PBS) on a glass slide. The cells were then stained with Hoechst dye and incubated for 15 minutes.

In both cases the coverslip was placed over the stained specimen before mounting on the microscope stage.

== Instrument

All imaging was performed on an Olympus manual microscope equipped with an Olympus DP74 digital camera. The objective used was a 20× lens with NA = 0.45 and a working distance of 7.2 mm. The camera pixel scale was 0.599 μm/pixel, giving a field of view of approximately 959 × 719 μm for the 1600 × 1200 pixel sensor.

Brightfield images were captured with the transmitted-light source. For fluorescence imaging, the brightfield source was switched off, the WU filter cube (UV excitation) was selected, and the shutter was opened. The camera view was selected in the DP Controller software, and exposure time was adjusted manually to obtain a clear image without saturation. A 20 μm scale bar was added to each image via the software's scale overlay.

== Acquisition Parameters

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center),
    [*Image*], [*Cell type*], [*Mode*], [*Exposure (ms)*], [*Gain*], [*Time*],
    [609], [Cheek], [Fluorescence], [105.0], [5], [07:22:14],
    [610], [Cheek], [Brightfield], [1.3], [5], [07:22:58],
    [611], [Cheek], [Fluorescence], [32.4], [6], [07:25:08],
    [612], [Cheek], [Brightfield], [0.61], [6], [07:25:31],
    [613], [Onion], [Brightfield], [0.76], [6], [07:29:32],
    [614], [Onion], [Fluorescence], [23.2], [6], [07:31:15],
    [615], [Onion], [Brightfield], [0.76], [6], [07:32:27],
    [616], [Onion], [Fluorescence], [42.2], [6], [07:35:15],
  ),
  caption: [Acquisition parameters extracted from the OME-XML metadata embedded in each TIFF file. All images were captured at 20× magnification (NA = 0.45) on 10 March 2026.]
) <tab:acq>

The large difference in exposure times between brightfield (0.6--1.3 ms) and fluorescence (23--105 ms) reflects the much lower light levels in fluorescence mode, where only the dye emission contributes to the image. Image 609 was captured with an exposure of 105 ms, which resulted in saturation of the blue channel across most of the field of view; Image 611, taken of the same specimen at 32.4 ms, gave a better-exposed fluorescence image.

= Results

== Onion Epidermal Cells

#boxfig(
  "bio3/plots/Image_613.png",
  [Onion epidermal cells, brightfield, 20×. The cells form a regular, brick-like array. Cell walls appear as dark outlines between adjacent cells. The cytoplasm is largely transparent under transmitted light.]
) <fig:onion-bf>

@fig:onion-bf shows the onion epidermal tissue under brightfield illumination. The cells are elongated and rectangular, arranged side by side in a tightly packed, regular pattern. The cell walls are clearly visible as dark lines separating adjacent cells. Individual nuclei are difficult to distinguish because the cytoplasm and nuclear material have similar transparency under transmitted light.

#boxfig(
  "bio3/plots/Image_614.png",
  [Onion epidermal cells, Hoechst fluorescence, 20×. Nuclei appear as bright blue spots distributed one per cell across the tissue sheet. The cell walls are not visible because they do not bind the DNA-specific Hoechst dye.]
) <fig:onion-fl>

@fig:onion-fl shows the same type of tissue under UV-excited fluorescence. The nuclei now stand out as bright blue spots against a dark background. Each cell contains a single nucleus, and their regular spacing mirrors the underlying cell arrangement visible in the brightfield image. The cell walls, which contain cellulose rather than DNA, do not fluoresce and are invisible.

== Human Cheek Epithelial Cells

#boxfig(
  "bio3/plots/Image_610.png",
  [Human cheek epithelial cells, brightfield, 20×. The cells are rounded and irregularly scattered across the slide. Cell outlines are faint because animal cells lack a rigid cell wall.]
) <fig:cheek-bf>

@fig:cheek-bf shows cheek epithelial cells under brightfield illumination. Unlike the onion tissue, these cells are isolated and scattered irregularly across the slide. They are roughly circular or ovoid, with diameters in the range of 40--60 μm. The cell outlines are faint because animal cells lack the rigid cell wall that makes plant cell boundaries so prominent. The nucleus is difficult to identify within the transparent cytoplasm.

#boxfig(
  "bio3/plots/Image_611.png",
  [Human cheek epithelial cells, Hoechst fluorescence, 20×. Individual nuclei are clearly visible as discrete bright blue spots. The surrounding cytoplasm is dark because it contains no DNA to bind the Hoechst dye.]
) <fig:cheek-fl>

@fig:cheek-fl shows the same preparation under fluorescence. Each cell's nucleus is now a bright, well-defined blue spot against a dark background. The nuclei are clearly separated from one another, reflecting the scattered, non-contiguous arrangement of cheek cells on the slide. The cytoplasm does not fluoresce, so only the nuclear DNA is visible.

== Comparison Panel

#boxfig(
  "bio3/plots/comparison_panel.png",
  [Side-by-side comparison of all four representative images: onion cells (top row) and cheek cells (bottom row), in brightfield (left) and fluorescence (right). The fluorescence images selectively reveal nuclear DNA, while brightfield shows the overall cell morphology.]
) <fig:panel>

@fig:panel places all four representative images side by side to make the comparison immediate. The top row (onion) shows the transition from a transparent tissue with visible cell walls to a regular array of bright nuclei. The bottom row (cheek) shows the transition from faintly outlined isolated cells to discrete, well-separated fluorescent nuclei.

= Analysis

== Cell Morphology

The most striking difference between the two cell types is their spatial organisation. Onion epidermal cells are tightly packed into a continuous, regular monolayer with a brick-like arrangement. Each cell is elongated (roughly 50--100 μm long and 20--40 μm wide, estimated from the pixel scale of 0.599 μm/pixel) and bounded by a rigid cell wall made primarily of cellulose. This wall maintains the cell's shape and provides structural support to the tissue.

Cheek epithelial cells, by contrast, are rounded (40--60 μm diameter), lack a cell wall, and lie scattered individually on the slide rather than forming a continuous sheet. Their shape is determined by the flexible plasma membrane rather than a rigid external skeleton. When scraped from the cheek lining, they lose their tissue context and appear as isolated, irregularly distributed cells.

== Brightfield vs Fluorescence

In brightfield mode, both cell types are largely transparent and low-contrast. The onion cells are easier to see because their cell walls create visible boundaries, but the nuclei are difficult to distinguish from the surrounding cytoplasm. For the cheek cells, even the cell outlines are barely visible.

Fluorescence transforms this picture entirely. With Hoechst staining and UV excitation, only the DNA-bound dye emits light. The result is a binary-like image: bright nuclei against a dark background. This is the core advantage of fluorescence microscopy. It does not just improve contrast in general; it provides molecular specificity. The image shows exactly where the target molecule (in this case DNA) is located, with everything else rendered invisible. In the onion tissue, this reveals the regular one-nucleus-per-cell arrangement. In the cheek cells, it makes individual nuclei unambiguously identifiable even when the cell boundaries themselves are barely visible.

== Exposure Control

The fluorescence images illustrate why exposure control matters in fluorescence microscopy. Image 609, captured at 105 ms exposure, has a nearly uniformly saturated blue channel (the average blue pixel value is 246 out of 255). The nuclei are lost in a wash of background fluorescence and detector saturation. Image 611, taken of the same cheek specimen at 32.4 ms, shows well-resolved individual nuclei with good dynamic range. This demonstrates that longer exposure does not always mean a better image; it can push the signal into the saturation regime where contrast is lost.

== Quantitative Estimates

From the OME metadata, each pixel corresponds to 0.599 μm. The full field of view is therefore:

$ "FOV" = 1600 × 0.599 "μm" × 1200 × 0.599 "μm" ≈ 959 × 719 "μm" $

The diffraction-limited resolution at this magnification and NA is approximately 625 nm (@eq:rayleigh), which corresponds to just over 1 pixel. In practice, the effective resolution is limited by the camera pixel size and optical aberrations rather than by diffraction alone, but the nuclei (5--15 μm) are far above the resolution limit and are clearly resolved.

= Discussion

== Plant vs Animal Cell Structure

The images provide a direct visual demonstration of the textbook distinction between plant and animal cells. The onion cells have rigid cell walls that maintain their shape and pack them into an ordered tissue geometry. The cheek cells, lacking walls, are flexible and adopt a rounded shape when removed from their tissue context. This difference has functional significance: the cell wall gives plant cells mechanical strength and allows them to maintain turgor pressure, while animal cells rely on their cytoskeleton and extracellular matrix for structural support.

Both cell types have clearly defined nuclei, which is expected since both are eukaryotic. The one-nucleus-per-cell pattern visible in the onion fluorescence images confirms the single-nucleus organisation of these differentiated plant cells.

== Advantages of Fluorescence Microscopy

Fluorescence microscopy offers three main advantages over brightfield:

- *Molecular specificity.* The image shows only the target of the fluorescent dye. With Hoechst, this means only DNA is visible. By choosing different dyes, one can visualise membranes, mitochondria, actin filaments, or essentially any structure for which a selective stain exists.

- *High contrast.* The signal-to-background ratio is dramatically better than in brightfield because the emission filter blocks all light except the fluorescence. In the cheek cell images, nuclei that are nearly invisible in brightfield become unmistakably bright in fluorescence.

- *Multiplexing.* Different dyes with non-overlapping excitation/emission spectra can be used simultaneously to visualise multiple targets in the same specimen, each in a different colour. The microscope's three filter cubes (WU, WB, WG) are designed to accommodate this.

== Limitations

Fluorescence microscopy is not without drawbacks. Photobleaching, the irreversible photodestruction of fluorophores during illumination, limits the total observation time. The UV excitation used for Hoechst can also cause phototoxicity in living cells if exposure is prolonged. The spatial resolution is still limited by diffraction to about 200--600 nm depending on the wavelength and NA, which is insufficient to resolve sub-nuclear structures like individual chromosomes. And unlike brightfield, fluorescence requires staining, which adds preparation steps and can potentially alter cell physiology.

= Conclusion

Brightfield and fluorescence imaging of Hoechst-stained onion and cheek cells show complementary information. Brightfield reveals the overall cell morphology, and in plant cells it clearly shows the cell wall boundaries. Fluorescence selectively highlights the nuclear DNA with far higher contrast, making nuclei easy to identify even in specimens where cell boundaries are difficult to see. The comparison between the two cell types confirms the expected structural differences: onion cells are rectangular, tightly packed, and bounded by rigid walls, while cheek cells are round, isolated, and lacking walls. The experiment also shows the practical importance of exposure control in fluorescence imaging and provides a direct visual argument for why fluorescence microscopy has become an essential tool in cell biology.

= References

1. Fluorescence Microscopy, PC3267 manual (provided).
2. B. Alberts et al., _Molecular Biology of the Cell_, 6th ed. (Garland Science, 2014).
3. J.R. Lakowicz, _Principles of Fluorescence Spectroscopy_, 3rd ed. (Springer, 2006).
4. E. Hecht, _Optics_, 5th ed. (Pearson, 2017).

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
      "Help me convert TIFF microscopy images to PNG, extract OME-XML metadata (exposure, gain, pixel scale), and generate a side-by-side comparison panel." \
      *Output:* \
      Python script for image conversion and metadata extraction
    ], [
      Used for image format conversion and metadata parsing. All microscopy imaging, sample preparation, and interpretation of cell morphology are my own work.
    ],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help with Typst formatting for figures, tables, and layout. Check that image paths and cross-references compile correctly." \
      *Output:* \
      Typst formatting guidance and layout suggestions
    ], [
      Used only for formatting. All experiment content, analysis, and scientific interpretations were written and verified by me.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)
