#import "../shared/_at.typ": *

#show: ad.with(
  title: "X-Ray Diffraction: Crystal Structure Analysis",
  author: "Parth Bhargava · A0310667E",
  experiment: "Experiment C",
  course: "PC2193 Experimental Physics & Data Analysis",
  title-page: false
)

// Enable equation numbering for this document
#set math.equation(numbering: "(1)")

= Abstract

This experiment investigates X-ray diffraction from crystalline materials to determine lattice constants and measure Planck's constant. X-ray diffraction occurs when electromagnetic radiation interacts with periodic atomic structures, producing constructive interference at specific angles governed by Bragg's Law. Using a copper X-ray source and lithium fluoride crystal, the lattice constant was measured as $d = (2.047 plus.minus 0.017)$ Å, in reasonable agreement with the theoretical value of $2.008$ Å ($1.93%$ deviation). From analysis of the continuous bremsstrahlung spectrum at three accelerating voltages ($25$, $30$, and $35$ kV), Planck's constant was determined to be $h = (8.7 plus.minus 0.4) times 10^(-34)$ J·s, showing $31%$ deviation from the accepted value due to poor signal-to-noise ratio at the spectral cutoff. An unknown crystal was successfully identified as KBr with $d = (3.282 plus.minus 0.006)$ Å ($0.24%$ deviation from literature).

= Background and Objectives

X-ray diffraction is a powerful probe of atomic-scale structure that exploits the interference patterns created when X-rays interact with periodic crystal lattices. This experiment analyzes both discrete diffraction peaks and continuous spectral features to simultaneously determine crystal structure and measure a fundamental physical constant.

The experiment begins with X-ray generation in a copper anode, where high-energy electrons produce two distinct emission mechanisms.

Bremsstrahlung radiation creates a continuous spectrum as incident electrons decelerate in the nuclear Coulomb field (@fig:xray-spectrum). This process reaches its shortest wavelength limit when the electron's entire kinetic energy converts into a single photon. An electron accelerated through potential difference $V$ gains kinetic energy $K = e V$. If this entire kinetic energy converts to photon energy, we have:

$ E_"photon" = h f = (h c)/lambda = K = e V $

where $h$ is Planck's constant, $f$ is the photon frequency, $c$ is the speed of light, and $lambda$ is the photon wavelength. This maximum photon energy corresponds to the minimum wavelength:

$ E_"max" = e V = h c / lambda_"min" $ <energy-eq>

Rearranging gives the fundamental relationship:

$ lambda_"min" = (h c)/(e V) $ <planck-relation>

Simultaneously, characteristic radiation generates discrete emission lines through a two-step process: inner-shell ionization followed by electronic transitions from higher energy levels. For copper, the dominant emissions are the $K_alpha$ line ($lambda = 1.5406$ Å) from $L arrow.r K$ transitions and the $K_beta$ line ($lambda = 1.3922$ Å) from $M arrow.r K$ transitions, which provide the monochromatic radiation needed for precise diffraction measurements.

#boxfig(
  "unnamed.png",
  width: 70%,
  [X-ray emission spectrum from copper anode showing continuous bremsstrahlung background with characteristic $K_alpha$ and $K_beta$ peaks. The minimum wavelength cutoff enables determination of Planck's constant through @planck-relation. (Source: #link(<ref-harrington>)[Harrington & Santiso, 2021])]
) <fig:xray-spectrum>

The resulting polychromatic X-ray beam illuminates the crystal sample, which is mounted on a precision goniometer. The experimental geometry (@fig:setup-schematic) maintains precise angular relationships between source, crystal, and detector across a wide angular scanning range.

#boxfig(
  "d_57.png",
  width: 70%,
  [Experimental setup schematic showing X-ray source, crystal sample on rotating mount, and detector. The goniometer maintains θ-2θ coupling so the detector rotates through 2θ while the crystal rotates through θ, ensuring proper Bragg diffraction geometry. (Source: #link(<ref-harrington>)[Harrington & Santiso, 2021])]
) <fig:setup-schematic>

The fundamental physics occurs when X-rays encounter the periodic crystal lattice. Understanding the diffraction mechanism requires examining both the atomic-scale scattering process and the instrumental geometry.

At the atomic level, each atom acts as a coherent scattering center. When an incident X-ray wave encounters an atom, the oscillating electromagnetic field drives the electron cloud into oscillation at the same frequency, causing it to re-radiate spherical waves in all directions (elastic Thomson scattering). For a single crystal plane containing $N$ atoms arranged periodically with spacing $a$, these $N$ individual scattered waves propagate with different phases determined by their geometric path differences. At most scattering angles, these waves interfere destructively. However, at specific angles where the path difference between adjacent atoms equals an integer multiple of the wavelength, constructive interference occurs and all $N$ scattered waves add coherently to produce intense diffracted beams.

The three-dimensional crystal structure extends this interference condition across multiple parallel planes. Consider a stack of identical atomic planes separated by the interplanar spacing $d$. When X-rays reflect from these planes at angle $theta$, waves scattered from successive planes travel different path lengths. For two parallel rays incident at angle $theta$ to the plane normal, the lower ray travels an extra distance $d sin theta$ along its incident path and another $d sin theta$ along its exit path, giving a total path difference of $2d sin theta$. Constructive interference occurs when this path difference equals an integer multiple of the wavelength:

$ n lambda = 2 d sin theta $ <bragg-law>

where $n$ is the diffraction order, $d$ is the interplanar spacing, and $theta$ is the incident angle (the Bragg angle). This relationship (@fig:bragg-geometry) shows that the crystal lattice acts as a three-dimensional diffraction grating, with each atomic plane functioning like a slit in an optical diffraction experiment, but operating at ångström scales where X-ray wavelengths match the lattice spacing.

The instrumental geometry involves a critical distinction between the Bragg angle $theta$ and the detector angle $2theta$. The X-ray source remains fixed, directing a collimated beam toward the crystal sample. The crystal sits on a precision goniometer and rotates through angle $theta$ relative to the incident beam. When Bragg's condition is satisfied, the diffracted beam emerges at angle $theta$ on the opposite side of the surface normal, creating a total scattering angle of $2theta$ relative to the incident beam direction (@fig:setup-schematic). The detector, mounted on a coupled rotating arm, therefore moves through angle $2theta$ to intercept the diffracted beam. This $theta$-$2theta$ coupling maintains proper Bragg geometry: as the crystal rotates through $theta$, the detector simultaneously rotates through $2theta$, systematically scanning different interplanar spacings. At $2theta = 0 degree$, the detector aligns with the direct, unscattered X-ray beam (the instrumental zero where no diffraction occurs).

Diffraction peaks have finite width rather than being infinitely sharp delta functions. Several physical and instrumental factors contribute to this broadening. At the fundamental level, the Heisenberg uncertainty principle imposes a limit: a perfectly monochromatic wave requires infinite extent in time, but real X-ray pulses have finite duration, introducing a wavelength spread $Delta lambda slash lambda ≈ 10^(-4)$ for characteristic Cu $K_alpha$ radiation. The crystal is not perfect: thermal vibrations cause atoms to deviate from ideal lattice positions (Debye-Waller factor), mosaic spread creates angular misalignments between crystal domains, and finite crystallite size limits coherent scattering volumes. Instrumental factors include finite beam divergence, detector angular resolution set by aperture size, and discrete goniometer stepping. These effects combine to produce peak profiles with typical FWHM of $0.1 degree$-$0.5 degree$ in $2theta$.

Weighted averaging is necessary for determining peak positions from these broadened profiles. A diffraction peak produces varying intensities: $10$-$20$ counts/s in the tails versus $200$-$300$ counts/s at the peak center. From the experimental data (discussed in Results), the measured standard deviations are approximately $2$-$4$ counts/s for low-intensity regions ($sigma_I slash I ≈ 20$-$40%$ fractional uncertainty) and $10$-$15$ counts/s for high-intensity regions ($sigma_I slash I ≈ 5$-$7%$ fractional uncertainty). Simple arithmetic averaging would weight these regions equally despite their vastly different uncertainties. The intensity-weighted average:

$ theta_"peak" = (sum_i theta_i I_i)/(sum_i I_i) $ <weighted-average>

optimally weights each data point by its intensity, ensuring that high-quality peak-center data contributes more than noisy tail data.

#boxfig(
  "d_56.png",
  width: 65%,
  [Bragg diffraction geometry showing X-rays incident at angle θ on crystal planes separated by distance d. Constructive interference occurs when the path difference 2d sin θ equals an integer multiple of the wavelength λ, producing sharp diffraction peaks. (Source: #link(<ref-harrington>)[Harrington & Santiso, 2021])]
) <fig:bragg-geometry>

The specific objectives of this experiment are:

1. *Determine the lattice constant of LiF* using Bragg's Law and characteristic X-ray peaks, establishing measurement precision and providing an internal calibration standard.

2. *Measure Planck's constant* by analyzing the bremsstrahlung cutoff wavelength at multiple accelerating voltages, using the LiF lattice constant to convert angular measurements to absolute wavelengths.

3. *Identify an unknown crystal sample* (KBr) by calculating its lattice constant and comparing with crystallographic databases, demonstrating the technique's practical application for materials characterization.

= Experimental Methods

== Apparatus

The measurements were performed using a PHYWE 09058.99 integrated X-ray diffraction system (@fig:apparatus). The system consisted of a copper X-ray source operated at $25$-$35$ kV acceleration voltage with $0.05$ mA current, generating characteristic $K_alpha$ ($1.54$ Å) and $K_beta$ ($1.38$ Å) radiation superimposed on a continuous bremsstrahlung spectrum. The sample holder and Geiger-Müller detector were mounted on a $theta$-$2theta$ coupled goniometer providing $0.1 degree$ angular resolution across the range $5 degree$-$55 degree$. Data acquisition was controlled by MEASURE software with adjustable integration times from $1$-$5$ seconds per angular step. Safety features included an orange indicator light showing X-ray emission and a door interlock system preventing operation with the chamber open.

#figure(
  image("plots/analyze_hui_1.png", width: 60%),
  caption: [PHYWE 09058.99 X-ray diffraction system showing the main unit (left) with X-ray source, sample holder, and detector, connected to the control computer (right).]
) <fig:apparatus>

== Procedures

*LiF Lattice Constant Measurement:* A wide-angle scan was performed from $10 degree$ to $110 degree$ in $2theta$ with $0.5 degree$ increments and $5$ s integration time per point, using $35$ kV acceleration voltage and $0.05$ mA current. This revealed four major peaks corresponding to different diffraction orders ($n=1$, $n=2$) and characteristic wavelengths ($K_alpha$, $K_beta$). High-resolution narrow scans with $0.1 degree$ increments and $1$ s integration time were then performed around each peak ($plus.minus 2 degree$ range). Each narrow scan was repeated five times to reduce uncertainty from the software's integer rounding. Peak positions were determined using the intensity-weighted averaging method (@weighted-average, discussed in Background), which optimally weights data points according to their statistical reliability: high-intensity regions with better counting statistics contribute more to the peak position than low-intensity tails with larger fractional uncertainties.

*Planck's Constant Measurement:* The bremsstrahlung continuum was analyzed by scanning from $10 degree$ to $40 degree$ in $2theta$ with $0.1 degree$ increments and $1$ s integration time. A multi-voltage mode was used with voltages of $25$ kV, $30$ kV, and $35$ kV ($5$ kV increments) at constant $0.05$ mA current. Each voltage scan was repeated five times to improve statistics in the low-intensity cutoff region. The minimum angle $theta_"min"$ for each voltage was determined by quadratic extrapolation of the intensity curve to the zero-intercept point. The theoretical justification for using a quadratic functional form (rather than linear or higher-order polynomials) is provided in the Discussion section, where Kramers theory is shown to predict that intensity near the cutoff varies as $I ∝ (2theta)^2$.

*Unknown Sample Identification:* The same procedures used for LiF were applied to the unknown crystal (KBr). A wide-angle scan identified peak locations, followed by narrow scans with five repetitions around each peak. The lattice constant was calculated from peak positions and compared with crystallographic databases for identification.

= Results and Analysis

== LiF Lattice Constant Determination

The wide-angle diffraction scan of LiF (@fig:lif-wide) reveals four prominent peaks at approximately $39 degree$, $44 degree$, $86 degree$, and $99 degree$ ($2theta$). These correspond to first-order ($n = 1$) and second-order ($n = 2$) Bragg reflections from the (200) crystal planes. Each peak exhibits doublet splitting due to the $K_alpha$ ($1.54$ Å) and $K_beta$ ($1.38$ Å) characteristic emission lines from the copper anode. The first-order peaks show higher intensity than second-order peaks, consistent with decreasing scattering efficiency at higher angles.

#figure(
  image("plots/lif_wide_scan.png", width: 95%),
  caption: [X-ray diffraction pattern of LiF showing four major peaks at approximately $39 degree$, $44 degree$, $86 degree$, and $99 degree$ ($2theta$). Peak splitting visible due to $K_alpha$ and $K_beta$ emission lines. First-order reflections ($n=1$) show higher intensity than second-order ($n=2$).]
) <fig:lif-wide>

High-resolution narrow scans around each peak (@fig:lif-peaks) were performed to enable precise peak position determination. The weighted average method (@weighted-average) was applied to each peak's intensity profile, yielding the peak positions shown in @tab:lif-results. Five repetitions at each peak reduced the uncertainty caused by the software's integer rounding to acceptable levels.

#figure(
  grid(
    columns: 2,
    gutter: 1em,
    [#image("plots/lif_peak1_n1_kbeta.png", width: 95%)],
    [#image("plots/lif_peak2_n1_kalpha.png", width: 95%)],
    [#image("plots/lif_peak3_n2_kbeta.png", width: 95%)],
    [#image("plots/lif_peak4_n2_kalpha.png", width: 95%)]
  ),
  caption: [High-resolution narrow scans of four LiF diffraction peaks showing intensity profiles with error bars representing standard deviation across five repetitions. Top row: first-order reflections ($K_beta$ at $39.43 degree$, $K_alpha$ at $43.95 degree$). Bottom row: second-order reflections ($K_beta$ at $86.40 degree$, $K_alpha$ at $98.65 degree$). Peak positions extracted using intensity-weighted averaging (@weighted-average).]
) <fig:lif-peaks>

The error bars in @fig:lif-peaks represent the standard deviation of intensity across five repeated measurements at each angular position, capturing instrumental fluctuations and positioning variations. The error bars vary systematically: high-intensity peak centers ($I ≈ 200$-$300$ counts/s) show larger absolute uncertainties ($≈ 10$-$15$ counts/s) than low-intensity backgrounds ($I ≈ 10$-$20$ counts/s with $≈ 2$-$4$ counts/s), but smaller fractional uncertainties ($≈ 5$-$7%$ versus $≈ 20$-$40%$). This is why peak centers provide more reliable angular information despite larger absolute error bars.

Bragg's law (@bragg-law) was applied to each measured peak position to calculate the lattice constant:

$ d = (n lambda)/(2 sin theta) $ <bragg-calc>

where $n$ is the diffraction order ($1$ or $2$), $lambda$ is the X-ray wavelength ($K_alpha$ or $K_beta$), and $theta$ is half the measured detector angle $2theta$. To determine how uncertainties propagate through this calculation, we take the differential of Bragg's law. Since the wavelength $lambda$ and order $n$ are precisely known constants, only the angular uncertainty $sigma_theta$ contributes to the uncertainty in $d$:

$ dd(d) = (n lambda)/(2) dd(1/(sin theta)) = (n lambda)/(2) (- cos theta)/(sin^2 theta) dd(theta) = - d (cos theta)/(sin theta) dd(theta) $

Taking absolute values and using $cot theta = cos theta slash sin theta$:

$ sigma_d = d |cot theta| sigma_theta $

Dividing both sides by $d$ gives the fractional uncertainty:

$ (sigma_d)/d = |cot theta| times sigma_theta $ <uncertainty-prop>

This shows that angular uncertainty is amplified by the cotangent factor, becoming more significant at smaller angles (where $cot theta$ is larger). The lattice constants calculated from all four peaks are summarized in @tab:lif-results.

#figure(
  table(
    columns: 5,
    align: center,
    stroke: none,
    table.hline(stroke: 2pt),
    [*Peak*], [*2θ (°)*], [*Radiation*], [*Order n*], [*d (Å)*],
    table.hline(stroke: 1pt),
    [1], [39.43 ± 0.04], [$K_beta$], [1], [2.063 ± 0.003],
    [2], [43.95 ± 0.20], [$K_alpha$], [1], [2.059 ± 0.014],
    [3], [86.40 ± 17.21], [$K_beta$], [2], [2.034 ± 0.034],
    [4], [98.65 ± 19.74], [$K_alpha$], [2], [2.031 ± 0.015],
    table.hline(stroke: 1pt),
    [], [], [*Average*], [], [*2.047 ± 0.017*],
    table.hline(stroke: 2pt),
  ),
  caption: [LiF lattice constants calculated from each diffraction peak. The weighted average gives $d_"LiF" = 2.047 plus.minus 0.017$ Å, representing $1.93%$ deviation from the theoretical value of $d = 2.008$ Å.]
) <tab:lif-results>

*Sample Calculation:* For the first $K_beta$ peak at $2theta = (39.43 plus.minus 0.04) degree$ ($n=1$):

$ d = (n lambda)/(2 sin theta) = (1 times 1.3922 "Å")/(2 sin(19.715 degree)) = (1.3922)/(2 times 0.3371) = 2.063 "Å" $

The weighted average of all four measurements gives $d_"LiF" = (2.047 plus.minus 0.017)$ Å, showing excellent internal consistency (standard deviation of $0.017$ Å across four independent determinations). Comparison with the theoretical value of $2.008$ Å yields a $1.93%$ discrepancy, likely due to systematic calibration offset rather than random error, as all four peaks show consistent deviation in the same direction.

== Planck's Constant from Bremsstrahlung Analysis

The continuous bremsstrahlung spectrum was measured at three accelerating voltages ($25$, $30$, and $35$ kV) to determine Planck's constant. @fig:bremsstrahlung shows the intensity versus scattering angle for all three voltages. The continuous background decreases toward lower angles, with the cutoff wavelength systematically shifting to smaller angles as voltage increases, consistent with the energy-wavelength relationship $E_"max" = e V = h c slash lambda_"min"$. The cutoff region exhibits low signal intensity ($0$-$20$ counts/s) compared to characteristic peaks ($100$-$300$ counts/s), making precise threshold determination challenging.

#figure(
  image("plots/bremsstrahlung_analysis.png", width: 90%),
  caption: [Bremsstrahlung spectra at $25$, $30$, and $35$ kV. Left panel shows the full angular range with continuous background and characteristic peaks. Right panel focuses on the low-angle cutoff region with quadratic extrapolations to determine minimum angles. The low signal intensity makes precise extrapolation challenging.]
) <fig:bremsstrahlung>

Quadratic extrapolation with constrained derivatives was used to find the zero-intercept angle $theta_"min"$ for each voltage. The minimum wavelength was then calculated from Bragg's law:

$ lambda_"min" = 2 d_"LiF" sin theta_"min" $ <lambda-min-calc>

using the measured LiF lattice constant $d_"LiF" = 2.047$ Å. @tab:bremsstrahlung summarizes the results for all three voltages.

#figure(
  table(
    columns: 3,
    align: center,
    stroke: none,
    table.hline(stroke: 2pt),
    [*Voltage (kV)*], [*$2theta_"min"$ (°)*], [*$lambda_"min"$ (Å)*],
    table.hline(stroke: 1pt),
    [25], [12.22 ± 0.30], [0.4358 ± 0.0108],
    [30], [9.46 ± 0.23], [0.3377 ± 0.0081],
    [35], [6.96 ± 0.21], [0.2484 ± 0.0075],
    table.hline(stroke: 2pt),
  ),
  caption: [Bremsstrahlung cutoff analysis results. The detector angle $2theta_"min"$ represents the measured cutoff position. Minimum wavelengths calculated using $lambda_"min" = 2 d_"LiF" sin(2theta_"min" slash 2)$ with $d_"LiF" = 2.047$ Å.]
) <tab:bremsstrahlung>

The fundamental relationship $lambda_"min" = (h c) slash (e V)$ predicts that minimum wavelength should be inversely proportional to accelerating voltage. @fig:planck-regression shows the linear regression of $lambda_"min"$ versus $1 slash V$. The strong correlation ($R^2 = 0.995$) validates this theoretical relationship. From the slope of the linear fit, Planck's constant was calculated:

$ h = ("slope" times e times c) $

where $e = 1.602 times 10^(-19)$ C and $c = 2.998 times 10^8$ m/s. This yielded $h = (8.7 plus.minus 0.4) times 10^(-34)$ J·s.

#figure(
  image("plots/planck_linear_regression.png", width: 65%),
  caption: [Linear regression of minimum wavelength versus inverse voltage. The strong correlation ($R^2 = 0.995$) validates the theoretical relationship $lambda_"min" ∝ 1 slash V$, but large uncertainties in the extracted slope lead to significant error in the calculated Planck's constant.]
) <fig:planck-regression>

Nevertheless, the extracted Planck's constant of $h = 8.7 times 10^(-34)$ J·s deviates by $31%$ from the accepted value of $6.626 times 10^(-34)$ J·s, highlighting the distinction between methodological correctness and experimental feasibility. This substantial uncertainty traces to the limitation identified earlier: the low signal intensity at the spectral cutoff makes precise zero-intercept determination problematic, regardless of the fitting procedures used.

== Unknown Sample Identification (KBr)

The unknown crystal analysis provides a structural signature through its diffraction pattern. The peaks appear at systematically lower angles than those observed for LiF (@fig:kbr-wide), indicating a larger interplanar spacing according to the inverse relationship in Bragg's law. The four prominent features at approximately $24 degree$, $27 degree$, $50 degree$, and $56 degree$ show the same doublet structure from $K_beta$/$K_alpha$ splitting, confirming that we observe first and second-order reflections from the same crystal planes.

#figure(
  image("plots/kbr_wide_scan.png", width: 95%),
  caption: [Wide-angle scan of unknown crystal showing four peaks at lower angles than LiF, indicating larger lattice parameter. Peak positions suggest an alkali halide structure.]
) <fig:kbr-wide>

The established methodology transfers directly to this unknown material. Narrow scans around each peak (@fig:kbr-peaks) provide the precision needed for definitive identification. Applying Bragg's law (@bragg-law) to each peak position yields the lattice constants necessary for crystallographic comparison:

#figure(
  grid(
    columns: 2,
    gutter: 1em,
    [#image("plots/kbr_peak1_n1_kbeta.png", width: 95%)],
    [#image("plots/kbr_peak2_n1_kalpha.png", width: 95%)],
    [#image("plots/kbr_peak3_n2_kbeta.png", width: 95%)],
    [#image("plots/kbr_peak4_n2_kalpha.png", width: 95%)]
  ),
  caption: [High-resolution narrow scans of four KBr diffraction peaks. Top row: first-order reflections ($K_beta$ at $24.53 degree$, $K_alpha$ at $27.18 degree$). Bottom row: second-order reflections ($K_beta$ at $50.17 degree$, $K_alpha$ at $55.88 degree$). The shift to lower angles compared to LiF reflects the larger lattice parameter.]
) <fig:kbr-peaks>

@tab:kbr-results summarizes the calculated lattice parameters, yielding an average value of $d = 3.282 plus.minus 0.006$ Å.

#figure(
  table(
    columns: 5,
    align: center,
    stroke: none,
    table.hline(stroke: 2pt),
    [*Peak*], [*2θ (°)*], [*Radiation*], [*Order n*], [*d (Å)*],
    table.hline(stroke: 1pt),
    [1], [24.53 ± 0.03], [$K_beta$], [1], [3.276 ± 0.004],
    [2], [27.18 ± 0.01], [$K_alpha$], [1], [3.278 ± 0.001],
    [3], [50.17 ± 0.08], [$K_beta$], [2], [3.284 ± 0.005],
    [4], [55.88 ± 0.02], [$K_alpha$], [2], [3.288 ± 0.001],
    table.hline(stroke: 1pt),
    [], [], [*Average*], [], [*3.282 ± 0.006*],
    table.hline(stroke: 2pt),
  ),
  caption: [Unknown crystal lattice constants. The measured value $d = 3.282 plus.minus 0.006$ Å closely matches the literature value for KBr ($d = 3.290$ Å), enabling material identification.]
) <tab:kbr-results>

The convergence of all four measurements to $d = 3.282 plus.minus 0.006$ Å creates a crystallographic fingerprint that closely matches the literature value for potassium bromide (KBr: $d = 3.290$ Å). The $0.24%$ agreement enables confident material identification and demonstrates the technique's precision for unknown sample characterization.

= Discussion

== LiF Lattice Constant Measurement

The measured lattice constant $d_"LiF" = (2.047 plus.minus 0.017)$ Å shows $1.93%$ deviation from the theoretical value of $2.008$ Å. The excellent internal consistency across four independent measurements validates the methodology, but the systematic offset appearing in all four peaks indicates goniometer zero-point miscalibration rather than random measurement error. This demonstrates that even with precise peak position determination, instrumental calibration ultimately limits accuracy.

== Planck's Constant Measurement

The measured value $h = (8.7 plus.minus 0.4) times 10^(-34)$ J·s deviates $31%$ from the accepted value of $6.626 times 10^(-34)$ J·s. Despite excellent linearity ($R^2 = 0.995$) validating the theoretical relationship $lambda_"min" ∝ 1 slash V$, the large uncertainty stems from poor signal quality at the bremsstrahlung cutoff. The low-angle region exhibits only $0$-$20$ counts/s compared to $100$-$300$ counts/s at characteristic peaks, making precise extrapolation unreliable. This highlights the distinction between methodological correctness and experimental feasibility - no amount of sophisticated fitting can overcome inadequate signal-to-noise ratio.

=== Theoretical Basis for Quadratic Fitting

The LiF crystal acts as a wavelength analyzer: it diffracts each wavelength in the polychromatic bremsstrahlung beam to a specific angle via Bragg's law, transforming the wavelength distribution into an angular intensity distribution.

Kramers theory predicts that bremsstrahlung intensity per unit wavelength varies linearly with wavelength above the cutoff:

$ dd(I)/dd(lambda) ∝ (lambda - lambda_"min") $

where intensity must vanish at $lambda = lambda_"min"$ since no photon can exceed the initial electron energy $e V$.

The crystal diffracts wavelength $lambda$ to detector angle $2theta$ through Bragg's law $lambda = 2 d_"LiF" sin theta$. To transform from wavelength space to angular space, we use the chain rule:

$ dd(I)/dd(2 theta) = dd(I)/dd(lambda) dot dd(lambda)/dd(2 theta) $

Taking the derivative of Bragg's law with respect to detector angle $2theta$:

$ dd(lambda)/dd(2 theta) = (2 d_"LiF")/(2) cos theta = d_"LiF" cos theta $

Combining these expressions:

$ dd(I)/dd(2 theta) ∝ (lambda - lambda_"min") dot d_"LiF" cos theta $

Substituting $lambda = 2 d_"LiF" sin theta$:

$ dd(I)/dd(2 theta) ∝ (2 d_"LiF" sin theta - lambda_"min") dot d_"LiF" cos theta $

For small angles near the cutoff (where $lambda ≈ lambda_"min"$), we can use the approximations $sin theta ≈ theta$ and $cos theta ≈ 1$. Let $alpha = 2 theta$ be the detector angle in radians:

$ dd(I)/dd(alpha) ∝ (2 d_"LiF" dot alpha slash 2 - lambda_"min") dot d_"LiF" = d_"LiF" (d_"LiF" alpha - lambda_"min") $

Integrating this expression with respect to $alpha$ gives the intensity as a function of detector angle:

$ I(alpha) ∝ integral d_"LiF" (d_"LiF" alpha - lambda_"min") dd(alpha) = d_"LiF" (d_"LiF" alpha^2 slash 2 - lambda_"min" alpha) + "const" $

Near the minimum angle $alpha_"min"$ where $lambda_"min" = d_"LiF" alpha_"min"$ (using the small angle approximation), this becomes:

$ I(alpha) ∝ d_"LiF"^2 (alpha^2 slash 2 - alpha_"min" alpha) = d_"LiF"^2 slash 2 (alpha^2 - 2 alpha_"min" alpha) $

This shows that intensity near the cutoff should vary quadratically with detector angle $alpha = 2theta$. The quadratic form $I = a(2 theta)^2 + b(2 theta) + c$ therefore provides the correct functional form for fitting the low-angle bremsstrahlung continuum and extrapolating to find the zero-intensity cutoff point. From the fitted minimum angle, the minimum wavelength follows:

$ lambda_"min" = 2 d_"LiF" sin theta_"min" $

using the precisely determined LiF lattice parameter as an internal wavelength standard. This converts angular measurements into absolute wavelength values, enabling linear regression of $lambda_"min"$ versus $1 slash V$ to extract Planck's constant from the slope.

== Unknown Sample Identification

The successful KBr identification demonstrates X-ray diffraction's capability for materials characterization through structural fingerprinting. The measured lattice parameter $d = 3.282 plus.minus 0.006$ Å matches the literature value ($d = 3.290$ Å) within $0.24%$. The $63%$ larger spacing relative to LiF shifts the entire diffraction pattern to systematically lower angles, creating a distinctive signature for database comparison. The same calibration offset appearing in both LiF and KBr measurements confirms its instrumental rather than sample-specific origin.

= Error Analysis

== LiF Lattice Constant Uncertainty Sources

The measured lattice constant $d_"LiF" = (2.047 plus.minus 0.017)$ Å shows $1.93%$ deviation from the theoretical value of $2.008$ Å. The uncertainty sources were identified and quantified:

*1. Angular uncertainty:* The primary random uncertainty arises from peak position determination. From @uncertainty-prop, the fractional uncertainty is:
$ (Delta d)/d = |cot theta| times Delta theta $

For the first peak at $theta ≈ 20 degree$ with $Delta theta ≈ 0.02 degree = 3.5 times 10^(-4)$ rad:
$ (Delta d)/d ≈ |cot(20 degree)| times 3.5 times 10^(-4) ≈ 2.75 times 3.5 times 10^(-4) ≈ 0.001 $ ($0.1%$)

*2. Wavelength uncertainty:* The characteristic $K_alpha$ and $K_beta$ wavelengths are precisely known physical constants with negligible uncertainty (less than $0.01%$).

*3. Systematic error:* The $1.93%$ deviation appears consistently across all four peaks, indicating systematic goniometer zero-point miscalibration. For the first peak with measured $d = 2.063$ Å versus theoretical $d = 2.008$ Å, Bragg's law gives $theta_"measured" = arcsin(n lambda slash (2 times 2.063)) ≈ 19.72 degree$ while $theta_"true" = arcsin(n lambda slash (2 times 2.008)) ≈ 20.10 degree$, yielding an offset of approximately $0.4 degree$.

*Dominant error source:* The systematic calibration offset ($≈ 2%$) significantly exceeds random angular uncertainties ($≈ 0.1%$), making instrumental calibration the limiting factor in this measurement.

== Planck's Constant Uncertainty Sources

The measured value $h = (8.7 plus.minus 0.4) times 10^(-34)$ J·s deviates $31%$ from the accepted value of $6.626 times 10^(-34)$ J·s. The uncertainty sources were quantified:

*1. Minimum wavelength determination ($≈ 6%$):* The dominant uncertainty comes from extrapolating the cutoff angle $theta_"min"$. The extremely low signal intensity ($0$-$20$ counts/s) in the cutoff region versus characteristic peaks ($100$-$300$ counts/s) makes precise zero-intercept determination unreliable. Background radiation further obscures the true cutoff point.

*2. Voltage uncertainty ($≈ 2%$):* The accelerating voltage has approximately $2%$ measurement uncertainty based on the precision specifications of the X-ray tube power supply, contributing to the overall error.

*3. LiF lattice constant ($≈ 0.8%$):* Using the measured $d_"LiF"$ instead of theoretical value introduces $≈ 0.8%$ uncertainty into the wavelength calculation.

*Error propagation:* The relationship between Planck's constant and the measured quantities is obtained by rearranging @planck-relation:
$ h = (lambda_"min" times e times V) slash c $

Since $e$ and $c$ are precisely known fundamental constants, the uncertainty in $h$ comes from uncertainties in $lambda_"min"$ and $V$. Taking differentials:
$ dd(h) = (e times V)/c dd(lambda_"min") + (lambda_"min" times e)/c dd(V) $

Dividing by $h$ and using the fact that these are independent uncertainties:
$ (dd(h))/h = (dd(lambda_"min"))/(lambda_"min") + (dd(V))/V $

For independent random uncertainties, we add them in quadrature:
$ (Delta h)/h = sqrt(((Delta lambda_"min")/(lambda_"min"))^2 + ((Delta V)/V)^2) ≈ sqrt((0.06)^2 + (0.02)^2) ≈ 0.063 $ ($6.3%$)

*Dominant limitation:* Poor signal-to-noise ratio at the bremsstrahlung cutoff ($≈ 6%$ uncertainty) far exceeds all other error sources, making this the fundamental limitation of the measurement.

== Systematic Effects Across All Measurements

Systematic effects dominate the experimental results. The systematic calibration offset of approximately $2%$ consistently exceeds the statistical uncertainties, indicating that instrumental calibration defines the ultimate precision limit rather than counting statistics. This effect appears identically in both LiF and KBr measurements, where similar percentage deviations from literature values ($1.93%$ for LiF, $0.24%$ for KBr) confirm the instrumental rather than sample-specific origin.

= Conclusion

This experiment successfully demonstrated X-ray diffraction for crystal structure analysis and fundamental constant measurement. The three experimental objectives were accomplished:

*1. LiF lattice constant:* The measured value $d_"LiF" = (2.047 plus.minus 0.017)$ Å agrees within $1.93%$ of the theoretical value of $2.008$ Å. The excellent internal consistency across four independent measurements ($n=1$ and $n=2$ diffraction orders, $K_alpha$ and $K_beta$ wavelengths) validates Bragg's Law. The systematic deviation is attributed to goniometer zero-point miscalibration ($≈ 0.4 degree$), which could be corrected using a calibration standard.

*2. Planck's constant:* The measured value $h = (8.7 plus.minus 0.4) times 10^(-34)$ J·s shows $31%$ deviation from the accepted value of $6.626 times 10^(-34)$ J·s. The strong linear correlation ($R^2 = 0.995$) between $lambda_"min"$ and $1 slash V$ confirms the theoretical energy-wavelength relationship. However, the dominant uncertainty ($≈ 6%$) arises from poor signal-to-noise ratio in the bremsstrahlung cutoff region ($0$-$20$ counts/s), demonstrating that signal quality limits measurement precision more than analytical methodology.

*3. Unknown crystal identification:* The measured lattice constant $d_"KBr" = (3.282 plus.minus 0.006)$ Å matches the literature value for KBr ($3.290$ Å) within $0.24%$, enabling confident material identification through crystallographic fingerprint comparison.

These results highlight that ångström-scale precision is achievable for structural measurements when signal quality is adequate, while measurements in low-intensity regions require improved experimental design (longer integration times, better background suppression, or higher X-ray flux) rather than more sophisticated analysis algorithms.

= References

+ B. D. Cullity and S. R. Stock, _Elements of X-Ray Diffraction_, 3rd Edition, Prentice Hall (2001). #label("ref-cullity")

+ G. F. Harrington and J. Santiso, "Back-to-Basics tutorial: X-ray diffraction of thin films," _Journal of Electroceramics_ *47*, 141–163 (2021). https://doi.org/10.1007/s10832-021-00263-6 #label("ref-harrington")

+ PC2193 Experimental Physics, "X-Ray Diffraction of Crystals," NUS Department of Physics (2024). #label("ref-manual")

= Annex

== Supplementary Data Analysis

All data analysis was performed using custom Python scripts implementing weighted averaging for peak position determination (@weighted-average), error propagation through Bragg's law, quadratic extrapolation for bremsstrahlung cutoff determination, and statistical averaging of repeated measurements. The complete analysis code and raw data files are available in the experimental data directory.

== Experimental Apparatus

The PHYWE 09058.99 XRD system components include: copper X-ray tube ($35$ kV maximum, $0.05$ mA operating current), motorized goniometer with $2:1$ coupling ratio providing synchronized $theta$-$2theta$ scanning, Geiger-Müller detector with photon counting capability, and MEASURE software interface for automated data acquisition. Orange indicator light confirmed X-ray emission; door interlock system ensured radiation safety throughout all measurements.

#pagebreak()

= Declaration on the Use of Generative AI

I declare that I *HAVE* used generative AI tools to produce this assignment.

I acknowledge that generative AI was used to produce this assignment in the following manner:

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
      "Analyze XRD experimental data files, create Python analysis program to calculate lattice constants using Bragg's law, generate publication-quality plots" \

      *Output:* \
      Complete Python analysis script with data loading, weighted averaging, uncertainty propagation, and plotting functions
    ], [
      Used the generated Python code as the foundation for data analysis. Verified all physics calculations manually. Modified plot aesthetics and added error analysis. All numerical results independently verified against manual calculations.
    ],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help structure the XRD experimental report following PC2193 guidelines, integrate analysis results and figures into Typst document" \

      *Output:* \
      Report structure, equation formatting, figure integration, and discussion section framework
    ], [
      Used suggested report structure to organize experimental findings. Wrote all scientific interpretations and discussions based on my understanding of the experimental results. Modified abstract and conclusion to reflect actual measured values.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)

I confirm that:
- All experimental work and data collection are my own
- All physical interpretations and scientific conclusions are my own reasoning
- Numerical calculations were independently verified
- AI assistance was limited to code structure, report formatting, and writing clarity
- The core analysis methodology and error assessment are my own work
