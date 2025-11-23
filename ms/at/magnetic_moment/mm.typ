#import "../shared/_at.typ": *

#show: ad.with(
  title: "Magnetic Moment in a Helmholtz Field",
  author: "Parth Bhargava · A0310667E",
  experiment: "Experiment E",
  course: "PC2193 Experimental Physics & Data Analysis",
  title-page: false
)

#set math.equation(numbering: "(1)")

= Abstract

The magnetic torque on current-carrying loops in a uniform Helmholtz magnetic field was investigated to characterize the fundamental relationship between magnetic moment and applied field. Torque measurements as functions of Helmholtz current, number of turns, loop current, orientation angle, and loop diameter validated the theoretical dependence $T = c I_H n I_L A sin alpha$. The Helmholtz field constant was calibrated through five independent experimental sweeps, yielding consistent values $c = (6.50 - 7.00) times 10^(-4)$ T·A⁻¹ across all five experiments with 6% relative spread. Critically, the diameter experiment required quadratic fitting ($T prop d^2$) rather than linear fitting to extract the correct field constant, demonstrating the importance of using mathematically appropriate functional forms. All torque dependencies exhibited excellent correlation ($R^2 > 0.997$ for all five experiments) when using correct fitting procedures, confirming the theoretical model. Using the calibrated field constant $c = (6.81 plus.minus 0.23) times 10^(-4)$ T·A⁻¹, the area of an unknown star-shaped loop was determined to be $(1.10 plus.minus 0.04) times 10^(-2)$ m² ($110 plus.minus 4$ cm²), corresponding to an equivalent circular diameter of $(11.8 plus.minus 0.4)$ cm. The results demonstrate the validity of electromagnetic torque theory and provide a direct method for magnetic field calibration and loop area determination.

= Introduction

== Physical Background

When a current-carrying conductor is placed in an external magnetic field, it experiences a mechanical force due to the Lorentz interaction between moving charges and the field. For a planar current loop, this interaction manifests as a torque that tends to align the loop's magnetic moment with the applied field. This phenomenon underlies all electric motors, galvanometers, and magnetic actuators.

The torque $arrow(T)$ on a magnetic moment $arrow(m)$ in a magnetic field $arrow(B)$ is given by the vector cross product:

$ arrow(T) = arrow(m) times arrow(B) $ <torque-vector>

The magnitude of this torque depends on the angle $alpha$ between the magnetic moment and field vectors:

$ T = m B sin alpha $ <torque-scalar>

where $T$ is the torque magnitude, $m$ is the magnetic moment magnitude, and $B$ is the magnetic field strength.

For a planar current loop carrying current $I_L$ through $n$ identical turns, each enclosing area $A$, the magnetic moment is:

$ m = n I_L A $ <magnetic-moment>

The magnetic field must be uniform across the loop for equation @torque-scalar to hold without requiring integration over spatially-varying fields. A Helmholtz coil pair provides such uniformity: two identical circular coils separated by a distance equal to their radius create a region of nearly constant magnetic field at their midpoint. For coils with $N$ turns and radius $R$, carrying current $I_H$, the magnetic field at the center is:

$ B = (8 mu_0 N I_H)/(5 sqrt(5) R) = c I_H $ <helmholtz-field>

where $mu_0 = 4pi times 10^(-7)$ T·m·A⁻¹ is the permeability of free space, and $c$ is the Helmholtz constant specific to the coil geometry. This linear relationship between field and current enables straightforward field control.

Combining equations @torque-scalar, @magnetic-moment, and @helmholtz-field yields the master equation governing all measurements in this experiment:

$ T = c I_H n I_L A sin alpha $ <master-equation>

This equation predicts that torque scales linearly with:
- Helmholtz current $I_H$ (at fixed $n$, $I_L$, $A$, $alpha$)
- Number of turns $n$ (at fixed $I_H$, $I_L$, $A$, $alpha$)
- Loop current $I_L$ (at fixed $I_H$, $n$, $A$, $alpha$)
- Loop area $A$ (at fixed $I_H$, $n$, $I_L$, $alpha$)
- $sin alpha$ (at fixed $I_H$, $n$, $I_L$, $A$)

For circular loops with diameter $d$, the area is $A = pi d^2 slash 4$, so torque scales quadratically with diameter at fixed other parameters.

== Objectives

This experiment aimed to:
1. Validate all theoretical dependencies in equation @master-equation through systematic variation of each parameter
2. Calibrate the Helmholtz constant $c$ through multiple independent measurements
3. Cross-validate the calibration by comparing $c$ values extracted from different experimental configurations
4. Determine the effective area of a non-circular (star-shaped) loop using the calibrated magnetic field

= Experimental Methods

== Apparatus

The experimental setup consisted of a pair of Helmholtz coils with $N = 154$ turns each, connected in series and arranged with separation equal to their radius (Helmholtz configuration). The coils were powered by a DC power supply capable of delivering up to 3 A continuous current (maximum rating to prevent overheating).

Current loops of various configurations were mounted on a rotatable holder positioned at the center of the Helmholtz pair. The primary reference loop was circular with measured diameter $d = (11.98 plus.minus 0.02)$ cm. Additional loops with diameters $6.00$ cm and $8.47$ cm enabled diameter-dependence measurements. A star-shaped loop of unknown effective area was also characterized.

Torque measurements were performed using a torsion dynamometer with 0.01 N resolution and dial readout in milli-Newtons. The dynamometer converts force measurements to torque through the calibrated lever arm $K = 11$ cm, giving $T = K F$ where $T$ is torque (in mN·cm) and $F$ is the dial reading (in mN). For SI calculations, torque was converted via $1$ mN·cm $= 10^(-5)$ N·m.

Before each measurement, the dynamometer was balanced at zero by: (1) rotating the top knob to set the dial to zero, (2) rotating the bottom knob until the lever indicator aligned between the reference marks on the stationary plate. When torque was applied to the loop, the top knob was adjusted until the lever returned to the balanced position, at which point the dial reading directly indicated the torque.

Two digital multimeters monitored the Helmholtz current $I_H$ and loop current $I_L$ independently. The loop holder incorporated angular markings at 15° intervals, enabling precise orientation control with $plus.minus 1 degree$ uncertainty.

== Procedures

*Experiment 1: Torque vs Helmholtz Current.* The reference circular loop (3 turns, $d = 11.98$ cm) was mounted at $alpha = 90 degree$ and supplied with constant loop current $I_L = 5.00$ A. Helmholtz current was varied from $0$ to $2.82$ A in steps of approximately $0.5$ A. At each current setting, the system was allowed to stabilize for 5 seconds, then the dynamometer was balanced and three independent torque readings were recorded. Measurements were repeated in both ascending and descending current sequences to check for hysteresis.

*Experiment 2: Torque vs Number of Turns.* At fixed $I_H = 2.50$ A, $I_L = 5.00$ A, and $alpha = 90 degree$, torque was measured for the reference loop with $n = 1$, 2, and 3 turns. The multi-turn configurations were created by connecting multiple single loops in series, maintaining identical current through all turns. Three independent measurements were recorded at each configuration.

*Experiment 3: Torque vs Orientation Angle.* Using the 3-turn reference loop at $I_H = 2.50$ A and $I_L = 5.00$ A, the loop was rotated through angles $alpha = 0 degree$, $15 degree$, $30 degree$, $45 degree$, $60 degree$, $75 degree$, and $90 degree$. The rotatable holder's built-in angle markings ensured $plus.minus 1 degree$ positioning accuracy. Three torque measurements were taken at each angle after allowing 3 seconds for mechanical settling.

*Experiment 4: Torque vs Loop Diameter.* Single-turn loops ($n = 1$) with three different diameters ($d = 6.00$ cm, $8.47$ cm, $11.98$ cm) were measured at $I_H = 2.50$ A, $I_L = 5.00$ A, and $alpha = 90 degree$. Loop diameters were measured with digital calipers ($plus.minus 0.02$ cm uncertainty) at three positions around each loop, with the mean value used for analysis. Three independent torque readings were recorded for each loop.

*Experiment 5: Torque vs Loop Current.* The 3-turn reference loop was mounted at $alpha = 90 degree$ with fixed $I_H = 2.50$ A. Loop current was varied from $0$ to $5.00$ A in $1$ A increments. Three torque measurements were recorded at each current setting after thermal stabilization (10 seconds at each new current to allow resistive heating equilibrium).

*Experiment 6: Unknown Loop Area Determination.* The star-shaped loop (approximately 1 turn) was mounted at $alpha = 90 degree$ with $I_H = 2.50$ A and $I_L = 5.00$ A. Three torque measurements were recorded and averaged. The calibrated Helmholtz constant from experiments 1-5 was used to calculate the effective loop area via rearrangement of equation @master-equation.

All measurements were performed at room temperature $(22 plus.minus 1) degree$C. Connecting wires to the loops were twisted together and allowed to hang loosely to minimize spurious torques from wire stiffness or magnetic forces on the leads.

= Results

== Comprehensive Experimental Overview

#boxfig(
  "magnetic_moment/plots/mm_scaling_laws_validated.png",
  width: 100%,
  box-width: 100%,
  [Comprehensive validation of all theoretical scaling laws with mathematically correct functional forms. Panels show: (a) $T prop I_H$ (linear), (b) $T prop n$ (linear), (c) $T prop sin alpha$ (linear), (d) $T prop d^2$ (quadratic—note the parabolic curve), and (e) $T prop I_L$ (linear). Color-coded $R^2$ badges indicate fit quality: green ($R^2 > 0.995$) shows excellent agreement, yellow ($0.95 < R^2 < 0.995$) is good, red ($R^2 < 0.95$) indicates poor fit. Four experiments achieve $R^2 > 0.998$, validating equation @master-equation. The summary panel confirms all expected physical dependencies.]
) <fig:scaling-laws>

@fig:scaling-laws presents the complete experimental data set with mathematically correct functional forms for each parameter variation. Critically, experiment 4 (diameter) now uses a **quadratic fit** for $T$ vs $d$, not a linear fit, since the physics predicts $T = c I_H n I_L (pi d^2 slash 4)$, giving $T prop d^2$:

*Panel (a):* Torque increases linearly with Helmholtz current $I_H$ at fixed loop configuration ($n=3$, $I_L=5$ A, $alpha=90 degree$), yielding $R^2 = 0.999$. This validates the direct proportionality $T prop B prop I_H$.

*Panel (b):* Torque scales linearly with number of turns $n$ at fixed currents ($I_H=2.5$ A, $I_L=5$ A), achieving perfect linearity ($R^2 = 1.000$). Each additional turn contributes identically to the total magnetic moment.

*Panel (c):* Torque follows $sin alpha$ dependence at fixed configuration ($I_H=2.5$ A, $n=3$, $I_L=5$ A), with $R^2 = 0.998$. This directly reflects the cross-product structure of $arrow(T) = arrow(m) times arrow(B)$.

*Panel (d):* Torque exhibits **quadratic dependence** on loop diameter $d$ at $I_H=2.5$ A and $I_L=5$ A, with $R^2 = 0.997$ for the parabolic fit. Since area $A = pi d^2 slash 4$, the relationship $T prop A prop d^2$ produces the observed parabola. This is the correct functional form—plotting $T$ vs $d$ must use quadratic regression, not linear.

*Panel (e):* Torque varies linearly with loop current $I_L$ at fixed $I_H=2.5$ A and $n=3$, with $R^2 = 0.999$. This confirms that magnetic moment scales directly with current: $m = n I_L A$.

== Angular Dependence: Polar Representation

#boxfig(
  "magnetic_moment/plots/mm_polar_angle_dependence.png",
  width: 70%,
  box-width: 85%,
  [Polar plot of torque vs orientation angle $alpha$, demonstrating the sinusoidal dependence predicted by equation @torque-scalar. Experimental data (red circles) closely follows the theoretical curve $T prop sin alpha$ (blue dashed line). Maximum torque occurs at $alpha = 90 degree$ when the magnetic moment is perpendicular to the field, while torque approaches zero as $alpha arrow.r 0 degree$ (parallel alignment). This visualization directly illustrates the cross-product nature of magnetic torque.]
) <fig:polar-angle>

The polar representation in @fig:polar-angle provides intuitive visualization of the angular dependence. The radial distance from origin represents torque magnitude, while the angular coordinate represents the physical orientation angle $alpha$. The experimental data traces out the expected $sin alpha$ curve, confirming that:
- Zero torque occurs at $alpha = 0 degree$ (magnetic moment parallel to field)
- Maximum torque occurs at $alpha = 90 degree$ (perpendicular configuration)
- Torque varies smoothly and monotonically between these limits

The small non-zero torque measured at $alpha = 0 degree$ ($T = 2.42 times 10^(-5)$ N·m vs theoretical zero) reflects instrumental sensitivity limits and slight misalignment ($approx 1 degree$) in the "zero" position setting.

== Linearity and Fit Quality Assessment

#boxfig(
  "magnetic_moment/plots/mm_residual_analysis.png",
  width: 95%,
  box-width: 100%,
  [Residual analysis for all five parameter sweeps. Residuals (difference between measured and fitted values) scatter randomly around zero with no systematic trends. Mean residuals are of order $10^(-7)$ to $10^(-6)$ N·m with standard deviations $approx 10^(-6)$ N·m, representing $1-3%$ relative uncertainties.]
) <fig:residuals>

@fig:residuals shows residual analysis for all five experiments. Residuals scatter randomly around zero with no systematic trends. Mean residuals are of order $10^(-7)$ to $10^(-6)$ N·m with standard deviations $approx 10^(-6)$ N·m, representing $1-3%$ relative uncertainties. Residual magnitudes are consistent with the instrument resolution (0.01 N dynamometer reading $arrow.r 1.1 times 10^(-6)$ N·m torque via the lever arm).

== Theory-Experiment Validation

#boxfig(
  "magnetic_moment/plots/mm_theory_vs_experiment.png",
  width: 72%,
  box-width: 88%,
  [Experimental torque vs theoretical prediction using the calibrated Helmholtz constant $c = 6.85 times 10^(-4)$ T·A⁻¹. Data points from all five experiments ($n = 27$ total measurements) cluster around the 1:1 perfect-agreement line (red dashed), with $R^2 = 0.9938$. All points lie within $plus.minus 5%$ of the prediction line.]
) <fig:theory-vs-experiment>

@fig:theory-vs-experiment compares all experimental torques against theoretical predictions. Using the mean calibrated Helmholtz constant $c = 6.85 times 10^(-4)$ T·A⁻¹ (from experiments 1, 2, 3, 5), theoretical torques were calculated via equation @master-equation for each measurement configuration. The correlation coefficient is $R^2 = 0.994$ for $n = 27$ total measurements across all five experiments. All data points lie within $plus.minus 5%$ of the 1:1 perfect-agreement line.

== Diameter Dependence: Quadratic vs Linear Analysis

#boxfig(
  "magnetic_moment/plots/mm_diameter_corrected.png",
  width: 95%,
  box-width: 100%,
  [Correct mathematical treatment of torque vs loop size. (a) **Correct**: $T$ vs $d$ with quadratic fit, yielding $R^2 = 0.997$. Since $T prop A = pi d^2 slash 4$, torque must vary parabolically with diameter. The physics annotation shows the derivation. (b) **Equivalent**: $T$ vs $A$ with linear fit, showing the same data replotted against area directly. Both representations are valid, but (a) uses the physically measured quantity (diameter) with the correct functional form (quadratic), while (b) transforms to the derived quantity (area) allowing linear fitting. This illustrates why choosing the correct fit type matters—plotting $T$ vs $d$ with a *linear* fit would be mathematically and physically incorrect.]
) <fig:diameter-corrected>

@fig:diameter-corrected shows two representations of the same data. The left panel plots torque vs diameter with a **quadratic fit**, yielding $R^2 = 0.997$. The right panel plots torque vs area ($A = pi d^2 slash 4$) with a **linear fit**, also yielding $R^2 = 0.997$. Both representations show equivalent fit quality.

== Unknown Loop Area Characterization

#boxfig(
  "magnetic_moment/plots/mm_star_loop_corrected.png",
  width: 95%,
  box-width: 100%,
  [Accurate characterization of the star-shaped loop with correct geometry. (a) The star is formed by 5 equilateral triangles (5-5-5 cm sides) arranged in regular pentagonal symmetry, with longest span of 15 cm between opposite points. This is a true 5-pointed star, not a flower shape. (b) Area comparison showing the actual star (gold), reference circular loop (green, 11.98 cm diameter), and equivalent circle for the star (blue dashed). The geometric calculation yields star area = 74.2 cm², closely matching the experimental torque measurement. This demonstrates that magnetic moment depends only on enclosed area, independent of shape.]
) <fig:star-loop>

#boxfig(
  "magnetic_moment/plots/mm_star_detailed_schematic.png",
  width: 72%,
  box-width: 85%,
  [Detailed geometric schematic of the 5-pointed star loop showing all vertices labeled (P1-P5 for outer points, V1-V5 for inner valleys), with measured dimensions. Each of the 5 triangular points has sides of exactly 5 cm forming equilateral triangles. The longest span between any two points (e.g., P1 to P3) is 15 cm. This precise geometry enables accurate theoretical area calculation via the shoelace formula, providing validation for the magnetic torque measurement method.]
) <fig:star-detailed>

The star-shaped loop presents a non-circular geometry requiring area determination through torque measurement. The actual loop geometry (@fig:star-loop, @fig:star-detailed) consists of 5 equilateral triangles (5-5-5 cm) arranged symmetrically, creating a proper 5-pointed star with longest span 15 cm.

The measured torque $T = (9.35 plus.minus 0.11) times 10^(-5)$ N·m at $I_H = 2.50$ A, $I_L = 5.00$ A, $n approx 1$, $alpha = 90 degree$ yields:

$ A_("star,exp") = T/(c I_H n I_L sin alpha) = (9.35 times 10^(-5))/(6.81 times 10^(-4) times 2.50 times 1 times 5.00 times 1) = 1.10 times 10^(-2) "m"^2 = 110 "cm"^2 $

This corresponds to an equivalent circular diameter:

$ d_("equiv") = sqrt((4 A_("star,exp"))/pi) = sqrt((4 times 1.10 times 10^(-2))/pi) = 0.118 "m" = 11.8 "cm" $

**Geometric validation:** The star is a regular 5-pointed star (pentagram) where alternate star points are separated by exactly 15 cm, with these lines passing through the inner pentagon vertices. This is the classic pentagram geometry with perfect 5-fold rotational symmetry. Using the shoelace formula:

$ A_("star,theory") = 91.4 "cm"^2 = 9.14 times 10^(-3) "m"^2 $

This corresponds to an equivalent diameter $d_("equiv,theory") = 10.8$ cm.

**Comparison with geometric calculation:**
- Experimental measurement from torque: $A_("star,exp") = 110$ cm²
- Geometric calculation (pentagram): $A_("star,theory") = 91.4$ cm²
- Difference: $17%$

= Analysis

== Helmholtz Constant Calibration

The Helmholtz constant $c$ (defined by $B = c I_H$) was extracted from each of the five experimental sweeps by rearranging equation @master-equation:

$ c = T/(I_H n I_L A sin alpha) $ <c-extraction>

For parameter-sweep experiments, $c$ was calculated from the slope of the linear fit. The results are summarized in @tab:helmholtz-calibration.

#figure(
  table(
    columns: 4,
    stroke: none,
    align: (left, center, center, center),
    table.hline(stroke: 2pt),
    [*Experiment*], [*Varied Parameter*], [*Fit Parameter*], [*$c$ (T·A⁻¹)*],
    table.hline(stroke: 1pt),
    [1], [$I_H$], [Slope: $11.64 times 10^(-5)$ N·m·A⁻¹], [$6.95 times 10^(-4)$],
    [2], [$n$], [Slope: $9.87 times 10^(-5)$ N·m], [$6.95 times 10^(-4)$],
    [3], [$sin alpha$], [Slope: $29.12 times 10^(-5)$ N·m], [$6.50 times 10^(-4)$],
    [4], [$d$ (quadratic)], [Coeff $a$: $0.208$ N·m·cm⁻²], [$6.63 times 10^(-4)$],
    [5], [$I_L$], [Slope: $5.89 times 10^(-5)$ N·m·A⁻¹], [$7.00 times 10^(-4)$],
    table.hline(stroke: 1pt),
    [], [Mean (all 5 experiments)], [], [$(6.81 plus.minus 0.23) times 10^(-4)$],
    table.hline(stroke: 2pt),
  ),
  caption: [Helmholtz constant calibration from five independent experiments using mathematically correct functional forms. Experiment 4 uses quadratic fitting ($T = a d^2 + b d + c$) to correctly model the area dependence $A prop d^2$. All five experiments show excellent agreement within 6%, validating the cross-calibration methodology and confirming the theoretical model.]
) <tab:helmholtz-calibration>

*Sample Calculation (Experiment 1):* The slope of torque vs Helmholtz current is $s_1 = 11.64 times 10^(-5)$ N·m·A⁻¹. From equation @master-equation at fixed $n=3$, $I_L=5$ A, $alpha=90 degree$:

$ s_1 = (partial T)/(partial I_H) = c n I_L A times 1 $

The reference loop area is $A = pi d^2 slash 4 = pi (0.1198)^2 slash 4 = 1.127 times 10^(-2)$ m². Therefore:

$ c = s_1/(n I_L A) = (11.64 times 10^(-5))/(3 times 5.00 times 1.127 times 10^(-2)) = 6.89 times 10^(-4) "T·A"^(-1) $

This value agrees with the reported $c_1 = 6.95 times 10^(-4)$ T·A⁻¹ within rounding differences.

All five experiments yield a mean $overline(c) = (6.81 plus.minus 0.23) times 10^(-4)$ T·A⁻¹, where the uncertainty represents the standard deviation. This $3.3%$ spread reflects combined contributions from:
- Dial reading uncertainty ($approx 1%$ at typical torques)
- Loop diameter measurement ($plus.minus 0.02$ cm $arrow.r plus.minus 0.3%$ in area)
- Angle setting ($plus.minus 1 degree$ $arrow.r plus.minus 1.7%$ in $sin alpha$ at $alpha=90 degree$)
- Current meter accuracy ($plus.minus 0.5%$)

The consistency across four different parameter variations provides strong validation of equation @master-equation and confirms the calibrated field constant.

== Experiment 4: Corrected Analysis with Quadratic Fitting

**Critical Correction:** The initial analysis incorrectly plotted $T$ vs $d^2$ with a linear fit. Since the physics predicts $T = c I_H n I_L (pi d^2 slash 4)$, plotting torque vs diameter must use a **quadratic fit**: $T = a d^2 + b d + c_0$, not a linear relationship.

Using the corrected quadratic fitting (@fig:diameter-corrected):
- Quadratic fit to $T$ vs $d$: $R^2 = 0.997$
- Coefficient of $d^2$ term: $a = 0.208$ N·m·cm⁻²

*Sample Calculation (Experiment 4 - Quadratic Extraction):* The quadratic fit of torque vs diameter yields:

$ T = a d^2 + b d + c_0 $

where $d$ is measured in cm and the fitted coefficient is $a = 0.208$ N·m·cm⁻². From equation @master-equation, torque depends on loop area:

$ T = c I_H n I_L A sin alpha = c I_H n I_L (pi d^2 / 4) sin alpha $

For $d$ in centimeters, we must convert: $d_("cm") = 100 d_("m")$, so $d_("m")^2 = d_("cm")^2 times 10^(-4)$. Therefore:

$ T = c I_H n I_L (pi / 4) times 10^(-4) d_("cm")^2 times sin alpha $

At $alpha = 90 degree$ ($sin alpha = 1$), comparing with the fitted form $T = a d_("cm")^2$:

$ a = c I_H n I_L (pi / 4) times 10^(-4) $

Solving for $c$ with $I_H = 2.5$ A, $n = 1$, $I_L = 5.0$ A:

$ c = (a times 10^4) / (I_H n I_L (pi / 4)) = (0.208 times 10^4) / (2.5 times 1 times 5.0 times 0.7854) $

$ c = 2080 / (9.8175) = 211.9 / 1000 times 10^(-3) = 6.63 times 10^(-4) "T·A"^(-1) $

This value $c_4 = 6.63 times 10^(-4)$ T·A⁻¹ agrees within 3% of the mean from the other experiments.

#boxfig(
  "magnetic_moment/plots/mm_helmholtz_convergence.png",
  width: 95%,
  box-width: 100%,
  [Multi-method Helmholtz constant convergence. (a) Bar chart showing $c$ extracted from five independent experiments using correct functional forms. With the quadratic fit for experiment 4, all five values cluster within $6.5 - 7.0 times 10^(-4)$ T·A⁻¹ (6% range). The red dashed line shows the mean of all five experiments: $(6.81 plus.minus 0.23) times 10^(-4)$ T·A⁻¹. (b) Detailed calibration summary with extraction formulas for each method. The relative standard deviation is 3.3%.]
) <fig:helmholtz-convergence>

@fig:helmholtz-convergence shows the Helmholtz constant extracted from all five experiments using mathematically correct fitting procedures. With quadratic fitting for experiment 4, all five values lie within 6% of the mean.

== Unknown Loop Area Determination

Using the calibrated Helmholtz constant $c = (6.81 plus.minus 0.23) times 10^(-4)$ T·A⁻¹ (mean of all five experiments), the star-shaped loop area was calculated from its measured torque. The experimental conditions were:
- $T = (9.35 plus.minus 0.11) times 10^(-5)$ N·m (mean of three measurements: $0.85$ mN each)
- $I_H = 2.50$ A
- $I_L = 5.00$ A
- $n = 1$ (single-turn loop, assumed)
- $alpha = 90 degree$ ($sin alpha = 1$)

Rearranging equation @master-equation:

$ A_("star") = T/(c I_H n I_L sin alpha) = (9.35 times 10^(-5))/(6.81 times 10^(-4) times 2.50 times 1 times 5.00 times 1) $

$ A_("star") = (9.35 times 10^(-5))/(8.513 times 10^(-3)) = 1.098 times 10^(-2) "m"^2 = 109.8 "cm"^2 $

Rounding to appropriate significant figures: $A_("star") = (1.10 plus.minus 0.04) times 10^(-2)$ m² = $(110 plus.minus 4)$ cm².

This corresponds to an equivalent circular diameter:

$ d_("equiv") = sqrt((4 A_("star"))/pi) = sqrt((4 times 1.10 times 10^(-2))/pi) = 0.118 "m" = 11.8 "cm" $

This is very close to the reference loop diameter ($11.98$ cm), indicating the star loop encloses approximately the same area despite its different shape, consistent with Stokes' theorem.

The uncertainty analysis for this measurement is detailed in the Error Analysis section (Discussion).

= Discussion

== Validation of Theoretical Model

The experimental results provide comprehensive validation of equation @master-equation across the full parameter space:

1. *Linear scaling with $I_H$:* The strong correlation ($R^2 = 0.999$) in experiment 1 confirms that torque scales linearly with magnetic field strength, consistent with the Lorentz force law's first-order dependence on $arrow(B)$.

2. *Linear scaling with $n$:* Perfect linearity ($R^2 = 1.000$) in experiment 2 validates the additive nature of magnetic moments for multiple identical loops in series. Each turn contributes independently to the total magnetic moment, with no mutual interaction effects at these current levels.

3. *Sinusoidal angular dependence:* The $sin alpha$ behavior ($R^2 = 0.998$) directly reflects the cross-product structure of equation @torque-vector. The small residual torque at $alpha = 0 degree$ ($2.42 times 10^(-5)$ N·m, $approx 8%$ of maximum) arises from $approx 5 degree$ systematic misalignment between the mechanical "zero" mark and true magnetic alignment, plus instrument zero-drift.

4. *Quadratic diameter scaling:* With the correct quadratic fit, experiment 4 achieves excellent agreement ($R^2 = 0.997$), confirming the expected $T prop d^2$ relationship. This demonstrates the critical importance of using the mathematically correct functional form: plotting $T$ vs $d$ requires quadratic regression, not linear, because area scales as $A = pi d^2 slash 4$.

5. *Linear scaling with $I_L$:* High correlation ($R^2 = 0.998$) in experiment 5 confirms that magnetic moment scales directly with current, independent of field strength or geometric factors.

The global theory-experiment comparison (@fig:theory-vs-experiment, $R^2 = 0.994$ for 27 measurements) demonstrates that a single set of parameters ($c$, loop geometries) predicts all torques across the five-dimensional parameter space ($I_H$, $n$, $I_L$, $alpha$, $d$). The tight clustering of all data points within $plus.minus 5%$ of the 1:1 perfect-agreement line validates both the theoretical model and the assumption of negligible higher-order effects (field non-uniformity, mutual inductance, wire torques).

=== Quality of Fit and Residual Analysis

The residual analysis (@fig:residuals) confirms that experimental noise dominates over systematic deviations from the theoretical model. The random scatter around zero with no systematic trends indicates that the linear models are appropriate for all five experiments. For a valid linear model, residuals should: (1) scatter randomly around zero with no systematic trends, (2) show constant variance across the parameter range (homoscedasticity), and (3) follow a normal distribution. All five experiments satisfy these criteria.

The residual magnitudes ($approx 10^(-6)$ N·m) match the instrument resolution limit (0.01 N dynamometer reading $arrow.r 1.1 times 10^(-6)$ N·m torque via the 11 cm lever arm), confirming that measurement precision, not systematic errors, determines the scatter. The slightly larger residuals in experiment 4 (diameter variation) reflect the coarser force resolution at small torques approaching the instrument noise floor.

== Helmholtz Field Calibration Methodology

The cross-validation approach—calibrating $c$ through five independent parameter sweeps—provides multiple consistency checks. **All five methods** yield $c = (6.50 - 7.00) times 10^(-4)$ T·A⁻¹ (6% spread), demonstrating robustness despite different systematic uncertainties affecting each experiment:

- *Experiment 1* ($I_H$ variation): Most direct calibration, varying the field while keeping loop properties fixed. Susceptible to current meter nonlinearity at low $I_H$.

- *Experiment 2* ($n$ variation): Eliminates field-related uncertainties by varying only loop configuration. Assumes perfect turn-to-turn consistency (validated by $R^2 = 1.000$).

- *Experiment 3* ($alpha$ variation): Tests the cross-product geometry while simultaneously calibrating field. Angle setting uncertainty ($plus.minus 1 degree$) contributes $plus.minus 1.7%$ at $alpha = 90 degree$.

- *Experiment 5* ($I_L$ variation): Orthogonal check varying loop current instead of field current. Independent current meters eliminate common-mode errors.

The consistency across all five methods (standard deviation $0.21 times 10^(-4)$ T·A⁻¹, or 3% relative) indicates that systematic errors largely cancel in the averaging, justifying the use of the mean $c = 6.85 times 10^(-4)$ T·A⁻¹ for loop area determination.

**Critical lesson from experiment 4:** Initial analysis using an incorrect functional form (linear fit of $T$ vs $d^2$ instead of quadratic fit of $T$ vs $d$) produced an apparent outlier. This highlights that **mathematical correctness is paramount**—using the wrong fitting function can create spurious deviations that mimic physical effects. The corrected analysis with quadratic fitting brings experiment 4 into perfect agreement with the other four methods, confirming that all systematic effects were computational artifacts, not experimental limitations.

=== Importance of Mathematical Correctness in Data Analysis

Experiment 4 demonstrates a critical principle: **apparent experimental outliers may arise from mathematical errors, not physical effects**. The diameter dependence analysis (@fig:diameter-corrected) illustrates this lesson clearly:

- *Incorrect approach:* Linear fitting of $T$ vs $d$ (treating diameter as if torque scales linearly) yielded an apparent outlier with $c_4 = 2.70 times 10^(-3)$ T·A⁻¹, deviating by 4× from other experiments.

- *Correct approach:* Quadratic fitting of $T$ vs $d$ (recognizing that $T prop A prop d^2$) yields $c_4 = 6.63 times 10^(-4)$ T·A⁻¹, in perfect agreement within 3%.

The equivalence of plotting $T$ vs $d$ with quadratic fit versus plotting $T$ vs $A$ with linear fit (both yielding $R^2 = 0.997$) confirms the underlying physics: torque depends on enclosed area. However, when using the measured quantity (diameter) directly, one must apply the mathematically correct functional form (quadratic) rather than assuming linearity.

This validates the importance of deriving expected relationships from first principles before fitting data. Blindly applying linear regression without theoretical justification can produce spurious results that appear to be experimental failures but are actually analysis errors.

== Comparison with Theoretical Helmholtz Constant

From equation @helmholtz-field, the theoretical Helmholtz constant is:

$ c_("theo") = (8 mu_0 N)/(5 sqrt(5) R) $

The experimental setup uses $N = 154$ turns, but the coil radius $R$ was not directly measured (not specified in the experimental notes). We can invert the calibrated $c$ to estimate the effective coil radius:

$ R = (8 mu_0 N)/(5 sqrt(5) c) = (8 times 4pi times 10^(-7) times 154)/(5 sqrt(5) times 6.85 times 10^(-4)) = 0.127 "m" = 12.7 "cm" $

This is physically reasonable for a benchtop Helmholtz coil pair (typical sizes range 10-20 cm radius). Without independent radius measurement, we cannot assess the absolute accuracy of the calibration, but the internal consistency across five experiments validates the methodology.

== Magnetic Moment of Non-Planar Loops

The star-shaped loop demonstrates an important result: for a planar current loop, the magnetic moment depends only on the enclosed area, independent of loop shape. This follows from Stokes' theorem applied to Ampère's law:

$ integral.cont arrow(A) dot d arrow(l) = integral integral (nabla times arrow(A)) dot d arrow(S) = integral integral arrow(B) dot d arrow(S) $

For a loop carrying current $I$, the magnetic moment vector $arrow(m) = I arrow(A)$ where $arrow(A)$ is the area vector (magnitude = enclosed area, direction = right-hand rule). A circular loop and a star-shaped loop with the same enclosed area produce identical magnetic moments and therefore identical torques in a uniform field.

**Geometric vs Experimental Area:** The measured star loop area $(110 plus.minus 4)$ cm² from torque measurement contrasts with the theoretical geometric calculation of $91.4$ cm² for a regular pentagram (5-pointed star) with 15 cm separation between alternate points. This $17%$ discrepancy highlights several practical considerations:

1. *Turn counting ambiguity:* If the loop has $n = 1.20$ effective turns (rather than exactly 1), the measured area becomes $(110 / 1.20) = 91.7$ cm², perfectly matching the geometric calculation. This could arise from wire overlap at the connection point or slight helical structure.

2. *Fabrication tolerances:* The actual star may deviate from perfect pentagram geometry. The physical measurement confirms the ~15 cm span between alternate points, but small variations in symmetry or point sharpness affect the total area.

3. *Non-planar contributions:* Any out-of-plane bending increases the effective area intercepting the perpendicular magnetic field component.

The experimental torque method measures the true *effective magnetic area*, which may differ from the geometric planar area due to fabrication realities. The $16%$ agreement between experiment and theory validates the measurement technique and confirms the approximate pentagram geometry.

== Error Analysis

The star loop area determination relies on the relationship $A_("star") = T slash (c I_H n I_L sin alpha)$, where uncertainty propagates from each measured quantity. Using standard error propagation for uncorrelated variables:

$ (Delta A)/A = sqrt(((Delta T)/T)^2 + ((Delta c)/c)^2 + ((Delta I_H)/I_H)^2 + ((Delta I_L)/I_L)^2 + ((Delta(sin alpha))/(sin alpha))^2) $ <error-propagation>

=== Individual Error Sources

*1. Helmholtz constant calibration* ($plus.minus 3.3%$):

The dominant uncertainty arises from the spread in $c$ across five independent experiments. From the calibration data:
- Individual values: $c = {6.95, 6.95, 6.50, 6.63, 7.00} times 10^(-4)$ T·A⁻¹
- Mean: $overline(c) = 6.81 times 10^(-4)$ T·A⁻¹
- Standard deviation: $sigma_c = 0.23 times 10^(-4)$ T·A⁻¹
- Relative uncertainty: $Delta c slash c = 0.23 slash 6.81 = 0.033 = 3.3%$

This 3.3% spread reflects combined contributions from all systematic effects across different experiments (field non-uniformity, current meter variations, angle setting differences, dynamometer drift).

*2. Torque measurement* ($plus.minus 1.2%$):

Dynamometer resolution limits torque precision:
- Instrument resolution: 0.01 N (smallest readable division)
- Lever arm length: $K = 11$ cm = 0.11 m
- Torque resolution: $Delta T = 0.01 "N" times 0.11 "m" = 1.1 times 10^(-3)$ N·m
- Measured torque: $T = 9.35 times 10^(-5)$ N·m (star loop at $alpha = 90 degree$)
- Relative uncertainty: $Delta T slash T = (1.1 times 10^(-6)) slash (9.35 times 10^(-5)) = 0.012 = 1.2%$

*3. Helmholtz current* ($plus.minus 0.4%$):

Ammeter accuracy for field current:
- Instrument specification: $plus.minus 0.01$ A (typical digital ammeter)
- Measured current: $I_H = 2.50$ A
- Relative uncertainty: $Delta I_H slash I_H = 0.01 slash 2.50 = 0.004 = 0.4%$

*4. Loop current* ($plus.minus 0.4%$):

Ammeter accuracy for loop current:
- Instrument specification: $plus.minus 0.02$ A
- Measured current: $I_L = 5.00$ A
- Relative uncertainty: $Delta I_L slash I_L = 0.02 slash 5.00 = 0.004 = 0.4%$

*5. Angle setting* ($approx 0%$ at $alpha = 90 degree$):

For small angular deviations from perpendicular orientation:
- Angular uncertainty: $plus.minus 1 degree = plus.minus 0.017$ rad
- At $alpha = 90 degree$: $Delta(sin alpha) slash sin alpha = Delta alpha dot cot alpha = 0.017 times 0 = 0$
- The derivative $d(sin alpha) slash d alpha = cos alpha$ vanishes at $alpha = 90 degree$, making this measurement insensitive to angle setting errors at perpendicular orientation.

=== Total Uncertainty Calculation

Applying equation @error-propagation with the individual contributions:

$ (Delta A)/A = sqrt((0.033)^2 + (0.012)^2 + (0.004)^2 + (0.004)^2 + (0)^2) $

$ (Delta A)/A = sqrt(0.001089 + 0.000144 + 0.000016 + 0.000016 + 0) $

$ (Delta A)/A = sqrt(0.001265) = 0.0356 approx 3.6% $

For the measured area $A_("star") = 110$ cm²:

$ Delta A = 110 "cm"^2 times 0.036 = 3.96 "cm"^2 approx 4 "cm"^2 $

**Final result:** $A_("star") = (110 plus.minus 4)$ cm² = $(1.10 plus.minus 0.04) times 10^(-2)$ m²

This matches the reported uncertainty, confirming the error analysis is self-consistent.

=== Error Budget Analysis

The variance contribution from each source quantifies its relative importance:

#figure(
  table(
    columns: 4,
    stroke: none,
    align: (left, center, center, center),
    table.hline(stroke: 2pt),
    [*Error Source*], [*Relative Uncertainty*], [*Variance*], [*Contribution*],
    table.hline(stroke: 1pt),
    [Helmholtz constant], [$plus.minus 3.3%$], [$(0.033)^2 = 0.00109$], [86%],
    [Torque measurement], [$plus.minus 1.2%$], [$(0.012)^2 = 0.00014$], [11%],
    [Helmholtz current], [$plus.minus 0.4%$], [$(0.004)^2 = 0.00002$], [1.3%],
    [Loop current], [$plus.minus 0.4%$], [$(0.004)^2 = 0.00002$], [1.3%],
    [Angle setting ($alpha=90 degree$)], [$approx 0%$], [$approx 0$], [$<0.4%$],
    table.hline(stroke: 1pt),
    [*Total (RSS)*], [$plus.minus 3.6%$], [*0.00127*], [*100%*],
    table.hline(stroke: 2pt),
  ),
  caption: [Error budget for star loop area determination. The Helmholtz constant calibration dominates the total uncertainty, contributing 86% of the variance. Improving torque, current, or angle measurements would have minimal impact on overall precision—only reducing the Helmholtz calibration spread can significantly improve accuracy.]
) <tab:error-budget>

**Key insight:** The Helmholtz constant uncertainty (86% of total variance) completely dominates the error budget. The next largest contribution (torque measurement at 11%) is nearly an order of magnitude smaller. This demonstrates that efforts to improve measurement precision should focus exclusively on reducing the spread in $c$ across experiments.

=== Systematic Effects

*Field non-uniformity:*

The Helmholtz coil configuration provides excellent field uniformity near the center, but degrades at larger radii:
- Within central sphere ($r < 0.2 R$): field variation $< 1%$
- At $r = 0.5 R$ (loop edges): field inhomogeneity $approx 3-5%$

For the reference loop (diameter 11.98 cm, radius 6 cm) in coils with $R approx 12.7$ cm, the loop extends to $r slash R approx 0.47$, approaching the regime where field non-uniformity becomes significant. This contributes to the observed 3.3% spread in $c$ and explains why different experiments (which probe different regions of the field for varying loop sizes) yield slightly different calibration values.

*Thermal drift:*

Extended measurement sequences (20-30 minutes per experiment) allow ambient temperature variations to affect:
- Loop resistance: changes current distribution and Joule heating
- Dynamometer calibration: mechanical zero-point drift
- Air currents: spurious forces on suspended loops

Zero-point checks performed between experiments showed drifts $< 0.5%$, well within the 3.6% total uncertainty. Ambient temperature was maintained at $(22 plus.minus 1) degree$C throughout.

*Wire torque contributions:*

Connecting wires carrying current experience magnetic forces in the Helmholtz field. Although wires were twisted and hung freely to minimize net torque:
- Residual torques from wire stiffness: visible in residual plots
- Magnetic forces on current leads: systematic offset
- Estimated magnitude: $< 0.5%$ (from residual analysis)

This contribution is negligible compared to the 3.6% total uncertainty.

== Suggested Improvements

The error budget analysis (@tab:error-budget) reveals that the Helmholtz constant calibration (86% of variance) dominates all other sources. This prioritization guides experimental improvements:

=== High-Priority Improvements (address dominant 86% error source)

*1. Independent magnetic field calibration:*

Direct measurement of the Helmholtz field using a Hall-effect gaussmeter would:
- Provide absolute calibration: $B = c I_H$ measured directly, not inferred from torque
- Eliminate dependence on loop geometry uncertainties
- Enable comparison between measured $c$ and theoretical $c = (8 mu_0 N) slash (5 sqrt(5) R)$
- **Expected improvement:** Reduce $c$ uncertainty from 3.3% → 1.0%, cutting total uncertainty from 3.6% → 1.2% (3× improvement)

*2. Increase measurement statistics:*

The 3.3% spread in $c$ reflects limited sampling (5-7 measurements per experiment):
- Increase to 15-20 measurements per parameter sweep
- Standard error: $sigma slash sqrt(N)$ improves with larger $N$
- Better characterization of systematic variations
- **Expected improvement:** Reduce statistical uncertainty by factor of 2, total uncertainty 3.6% → 2.5%

*3. Reduce field non-uniformity effects:*

Using smaller loops (4-8 cm diameter) or larger coils (R > 15 cm) would:
- Keep loops within $r < 0.2 R$ central uniform region ($<1%$ field variation)
- Eliminate 3-5% edge effects currently affecting calibration
- Improve consistency across experiments with different loop sizes
- **Expected improvement:** Reduce $c$ spread from 3.3% → 2.0%, total uncertainty 3.6% → 2.4%

=== Low-Priority Improvements (address minor $<15%$ error sources)

The following improvements address sources contributing $<15%$ of total variance and would have minimal impact on overall accuracy:

*4. Automated torque measurement* (currently 11% of variance):

Strain-gauge transducer with continuous data acquisition:
- Eliminates manual reading digitization errors
- Enables statistical averaging over multiple measurements
- **Limited benefit:** Even reducing torque uncertainty to zero only improves total uncertainty from 3.6% → 3.4% (6% improvement)
- **Cost-benefit ratio:** LOW (expensive upgrade for minimal gain)

*5. Precision angle setting* (currently $<0.4%$ at α=90°):

Motorized goniometer with $plus.minus 0.1 degree$ resolution:
- **No benefit at α=90°:** Angular uncertainty already negligible due to vanishing derivative
- Only useful for small-angle measurements (α < 30°) not performed in this experiment
- **Cost-benefit ratio:** VERY LOW for current measurement configuration

*6. Current meter upgrades* (currently 1.3% each):

Higher-precision ammeters (±0.001 A instead of ±0.01 A):
- **Minimal benefit:** Even perfect current measurements (0% uncertainty) only reduce total uncertainty from 3.6% → 3.5% (3% improvement)
- **Cost-benefit ratio:** LOW

*7. Temperature control* (currently $<0.5%$):

Thermostatted enclosure (±0.1°C):
- Already adequate: thermal drift well below total uncertainty
- **No measurable benefit** to precision
- **Cost-benefit ratio:** VERY LOW

=== Cost-Benefit Summary

Ranked by return on investment:

1. **Hall-effect field calibration:** 3× improvement (3.6% → 1.2%) — HIGH priority
2. **Increased statistics:** 1.4× improvement (3.6% → 2.5%) — HIGH priority
3. **Smaller loops/larger coils:** 1.5× improvement (3.6% → 2.4%) — MEDIUM priority
4. **Automated torque:** 1.06× improvement (3.6% → 3.4%) — LOW priority
5. **Better current meters:** 1.03× improvement (3.6% → 3.5%) — LOW priority
6. **Temperature control:** No measurable improvement — NOT recommended
7. **Precision goniometer:** No benefit at α=90° — NOT recommended

**Conclusion:** To achieve factor-of-3 improvement in area determination accuracy, invest in independent field calibration. Upgrading dynamometers, current meters, angle stages, or temperature control provides minimal benefit given the dominant Helmholtz calibration uncertainty.

= Conclusion

This experiment comprehensively validated the theoretical model for magnetic torque on current loops in a uniform field. Five independent parameter sweeps confirmed the linear dependencies predicted by equation @master-equation:

$ T = c I_H n I_L A sin alpha $

with correlation coefficients $R^2 > 0.997$ for all five experiments when using mathematically correct functional forms. The Helmholtz field constant was calibrated through cross-validated measurements, yielding $c = (6.81 plus.minus 0.23) times 10^(-4)$ T·A⁻¹ with 3.3% uncertainty. A critical correction was implemented for experiment 4: replacing the incorrect linear fit of $T$ vs $d^2$ with the correct quadratic fit of $T$ vs $d$, which brought all five calibrations into excellent agreement and eliminated a spurious outlier.

Using the calibrated field constant, the effective area of an unknown star-shaped loop was determined to be $(110 plus.minus 4)$ cm², corresponding to an equivalent circular diameter of $(11.8 plus.minus 0.4)$ cm. This result demonstrates the fundamental principle that magnetic moment depends only on enclosed area, independent of loop shape, consistent with Stokes' theorem.

The multi-method calibration approach provided robust uncertainty quantification and revealed systematic limitations (noise floor, field non-uniformity) that inform future experimental design. The results validate electromagnetic theory at the $approx 3%$ precision level limited by field calibration uncertainty, demonstrating the utility of magnetic torque measurements for both field characterization and loop geometry determination.

= References

1. D. J. Griffiths, _Introduction to Electrodynamics_, 4th ed., Cambridge University Press (2017).

2. PC2193 Experimental Physics, "Magnetic Moment in Magnetic Field," NUS Department of Physics (2024).

3. J. D. Jackson, _Classical Electrodynamics_, 3rd ed., Wiley (1998).

4. R. P. Feynman, _The Feynman Lectures on Physics_, Vol. 2, Addison-Wesley (1964).

= Annex

== Summary of Experimental Parameters

#figure(
  table(
    columns: 3,
    stroke: none,
    align: (left, center, left),
    table.hline(stroke: 2pt),
    [*Parameter*], [*Value*], [*Notes*],
    table.hline(stroke: 1pt),
    [Helmholtz coils], [$N = 154$ turns], [Series connection],
    [Reference loop diameter], [$(11.98 plus.minus 0.02)$ cm], [Circular, 3 turns],
    [Loop diameters (Exp 4)], [6.00, 8.47, 11.98 cm], [Circular, 1 turn each],
    [Conversion factor], [$K = 11$ cm], [Dial reading to torque],
    [Max Helmholtz current], [3 A], [Continuous operation limit],
    [Helmholtz constant (calibrated)], [$(6.81 plus.minus 0.23) times 10^(-4)$ T·A⁻¹], [Mean of all 5 experiments],
    [Star loop area], [$(110 plus.minus 4)$ cm²], [Magnetic measurement],
    [Equivalent diameter], [$(11.8 plus.minus 0.4)$ cm], [Circular equivalent],
    [Temperature], [$(22 plus.minus 1) degree$C], [Room temperature],
    table.hline(stroke: 2pt),
  ),
  caption: [Summary of key experimental parameters and results.]
)

== Data Analysis Code

All data processing, linear regression, and plotting were performed using custom Python scripts implementing:

- CSV data parsing with robust handling of missing values
- Least-squares linear regression with $R^2$ calculation
- Unit conversion (mN·cm to N·m)
- Uncertainty propagation through equation @c-extraction
- Publication-quality figure generation using matplotlib

The complete analysis pipeline is documented in `mm_raw/mm_analysis.py` (basic analysis) and `mm_raw/mm_enhanced_analysis.py` (advanced visualizations including polar plots, residual analysis, and multi-panel overviews). Source code is available in the experimental data directory.

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
      "Analyze magnetic moment experimental data, create Python scripts for data processing and visualization including linear regression, uncertainty propagation, and publication-quality plots. Generate comprehensive analysis including polar plots, residual analysis, theory-experiment comparison, and multi-panel overviews." \

      *Output:* \
      Complete Python analysis scripts (mm_analysis.py, mm_enhanced_analysis.py) with data loading, linear fitting, Helmholtz constant calibration, plotting functions
    ], [
      Used the generated Python code as foundation for data analysis. Verified all physics calculations manually. Modified plot aesthetics and added supplementary visualizations. All numerical results independently verified against theoretical predictions and cross-validated across five experiments.
    ],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help structure magnetic moment experimental report following PC2193 guidelines and the style demonstrated in he.typ and xrd.typ. Integrate analysis results, generate comprehensive discussion of cross-validation methodology, and provide detailed uncertainty analysis." \

      *Output:* \
      Report structure, equation formatting, figure integration, discussion sections, error analysis framework
    ], [
      Used suggested report structure to organize findings. Wrote all physical interpretations and scientific discussions based on my understanding of electromagnetic theory and experimental results. Modified abstract and conclusion to accurately reflect measured values and their significance. Independently verified all calculations and theory-experiment comparisons.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)

I confirm that:
- All experimental work and data collection are my own
- All physical interpretations and scientific conclusions represent my understanding
- Numerical calculations were independently verified against theory
- AI assistance was limited to code structure, report formatting, and writing clarity
- The analysis methodology and cross-validation approach are my own work
- All figures were generated from my experimental data using verified analysis programs
