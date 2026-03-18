#import "../shared/_at.typ": *

#show: ad.with(
  title: "Paschen Curve and Gas Discharge",
  author: "Parth Bhargava · A0310667E",
  experiment: "Experiment C",
  course: "Experimental Physics II",
  title-page: false
)

#show link: underline
#set math.equation(numbering: "(1)")

= Abstract

The Paschen law relates the breakdown voltage of a gas to the product of pressure and electrode separation. In this experiment, the breakdown voltage of air was measured as a function of electrode gap (0.2 to 5.5 mm) at three pressures (4, 6, and 8 hPa) using a parallel-plate discharge cell. The 8 hPa curve shows the full Paschen shape with a clear minimum at $d ≈ 1.1$ mm ($U_min ≈ 416$ V), while the 6 hPa curve exhibits a broad minimum around $d ≈ 4.0$ mm. At 4 hPa, only the descending left branch was accessible; the minimum lies beyond the measured range. The minimum shifts to larger gap distances as the pressure decreases, consistent with the prediction that the product $p d$ at the minimum is constant. From the 8 hPa curve, the second Townsend coefficient was estimated as γ ≈ 0.002. When plotted against $p d$, the data follow a common trend that agrees with the theoretical Paschen curve within experimental scatter.

= Introduction

A gas at room temperature is ordinarily an excellent electrical insulator. The few free electrons present from cosmic rays or background radiation carry negligible current. But if the electric field between two electrodes becomes strong enough, each free electron can ionise a neutral molecule on its way to the anode, and the newly liberated electron can ionise another, producing an avalanche. Once the avalanche becomes self-sustaining, the gas conducts and a visible glow discharge appears. The voltage at which this transition occurs is the breakdown voltage.

Friedrich Paschen showed in 1889 that the breakdown voltage depends not on pressure and electrode spacing separately, but only on their product $p d$ \[#link(<ref1>)[1]\]. This observation reflects the underlying physics: what matters for an avalanche is the number of collisions an electron undergoes on its path across the gap, which scales with the column density of gas molecules, proportional to $p d$. The resulting Paschen curve, $U_"br"$ vs $p d$, has a single minimum. Understanding this curve is important both for practical applications (designing gas-insulated switchgear, spark gaps, plasma sources) and for testing the Townsend theory of gas breakdown, which predicts the curve shape from two material-dependent coefficients.

This experiment measures the breakdown voltage of air at 4, 6, and 8 hPa over a range of electrode gaps, verifies the Paschen scaling law, and extracts the second Townsend coefficient γ.

= Theory

== Electron Avalanche and the First Townsend Coefficient

Consider a single free electron released near the cathode of a parallel-plate gap filled with gas at pressure $p$. As it accelerates toward the anode under the applied field $E = U slash d$, it collides with gas molecules. If the electron's kinetic energy between collisions exceeds the ionisation energy of the molecule, a collision can free a second electron. Both electrons then accelerate and ionise further, producing an exponentially growing cascade.

Townsend quantified this by defining the first ionisation coefficient α as the number of ionising collisions per unit length of drift. If $n$ electrons enter a slab of thickness $d x$, the number emerging is $n + n α d x$, so the electron population grows as

$ n(x) = n_0 e^(α x) $ <eq:avalanche>

After crossing the full gap $d$, the single initial electron has generated $e^(α d) - 1$ additional electrons (and the same number of positive ions). The empirical dependence of α on the field and pressure is

$ α = A p e^(-B p / E) = A p e^(-(B p d) / U) $ <eq:alpha>

where $A$ and $B$ are constants characteristic of the gas. For air, the accepted values are $A = 20 "  (Pa m)"^(-1)$ and $B = 487 "  (Pa m)"^(-1)$ \[#link(<ref1>)[1], #link(<ref2>)[2]\].

== Secondary Emission and the Breakdown Criterion

An avalanche by itself does not constitute breakdown. The positive ions created drift back toward the cathode, and when they strike the cathode surface, a fraction γ of them release a secondary electron (through Auger neutralisation or kinetic ejection). This is the second Townsend coefficient. Each secondary electron starts a new avalanche, which creates more ions, which release more electrons, and so on.

A self-sustaining discharge requires that, on average, each avalanche produces enough ions to regenerate at least one new starting electron. Each of the $e^(α d) - 1$ ions striking the cathode has probability γ of releasing an electron, so the condition for self-sustained discharge is

$ γ (e^(α d) - 1) = 1 $ <eq:townsend-criterion>

When this criterion is met, the discharge feeds itself and the current grows without bound (in practice, limited by the external circuit). This defines the breakdown voltage.

== Derivation of the Paschen Law

Substituting @eq:alpha into the criterion @eq:townsend-criterion:

$ γ (e^(A p d e^(-B p d slash U)) - 1) = 1 $

Setting $e^(α d) - 1 ≈ e^(α d)$ (valid when $α d >> 1$, which holds near breakdown), and solving for $U$:

$ A p d e^(-(B p d) / U) = ln(1/γ + 1) $

$ e^(-(B p d) / U) = ln(1/γ + 1) / (A p d) $

$ -(B p d) / U = ln(ln(1/γ + 1) / (A p d)) $

Defining $C = ln(1/γ + 1)$ for brevity:

$ U_"br" = (B p d) / ln(A p d / C) $ <eq:paschen>

This is the Paschen law. The breakdown voltage depends only on the product $p d$ and on the material constants $A$, $B$, and $C$ (the last encoding the cathode surface through γ). Two geometries with the same $p d$ have the same breakdown voltage, regardless of whether the gap is narrow and the pressure high, or the gap is wide and the pressure low.

== Minimum of the Paschen Curve

The Paschen curve has a minimum at a specific $(p d)_min$ and corresponding $U_min$. Differentiating @eq:paschen with respect to $p d$ and setting the derivative to zero yields \[#link(<ref1>)[1]\]:

$ (p d)_min = (e C) / A = e / A ln(1/γ + 1) $ <eq:pd-min>

$ U_min = (e B C) / A = (e B) / A ln(1/γ + 1) $ <eq:u-min>

where $e = 2.718...$ is Euler's number (not the electron charge). The ratio $U_min / (p d)_min = B$ follows directly, providing a consistency check. The minimum exists because of a competition between two effects:

- At small $p d$ (left branch): the gas column is too short or too rarefied for efficient ionisation. Electrons cross the gap without enough collisions, and the field must be raised to compensate.
- At large $p d$ (right branch): collisions are abundant, but each electron loses energy more frequently, so the field per collision is reduced. Again, a higher total voltage is needed to sustain the avalanche.

The minimum represents the optimal balance between collision frequency and energy gain per collision.

== Linear Representation for Data Quality

Rearranging @eq:paschen gives a useful linear form. Dividing both sides by $U_"br"$ and multiplying by $d$:

$ d / U_"br" = (ln(A p d) - ln C) / (B p) = (ln d + ln(A p)) / (B p) - (ln C) / (B p) $

Plotting $d / U_"br"$ against $ln d$ should yield a straight line with slope $1/(B p)$ and intercept $(ln(A p) - ln C)/(B p)$ \[#link(<ref1>)[1]\]. Deviations from linearity indicate systematic measurement errors or regime changes.

= Methods

== Apparatus

The discharge cell consisted of two circular brass electrodes mounted inside a glass vacuum vessel. One electrode was fixed; the other could be translated along the axis using a micrometer screw gauge, giving gap distances adjustable from 0 to approximately 6 mm with 0.05 mm precision. The vessel was evacuated using a rotary vane pump, and the internal pressure was set using a needle valve and monitored with a digital pressure gauge (resolution ±0.1 hPa).

A DC high-voltage power supply (0 to 1000 V) was connected across the electrodes. The breakdown voltage was recorded using a digital multimeter set to peak-hold mode, which captures the maximum voltage reached just before the discharge strikes and the voltage drops.

== Measurement Procedure

For each pressure (4, 6, and 8 hPa), the following procedure was repeated at each of 24 electrode gaps from $d = 0.2$ mm to $d = 5.5$ mm:

1. The gap distance was set using the micrometer and verified against the zero reference.
2. The voltage was increased slowly from zero until a visible glow discharge appeared between the electrodes.
3. The peak voltage recorded by the multimeter was noted as the breakdown voltage.
4. The supply was turned off and the residual charge dissipated before the next trial.
5. Three independent trials were performed at each gap distance.

At 4 hPa, the breakdown voltage for gaps below approximately 3.0 mm exceeded the supply's maximum output, so no measurements could be obtained for those gaps. The measurements were performed in a darkened laboratory to allow visual confirmation of the discharge onset.

= Results

== 8 hPa Data

The breakdown voltage at 8 hPa decreases smoothly from 447 V at $d = 0.2$ mm to a minimum of approximately 416 V around $d = 1.0$–$1.1$ mm, then rises monotonically to 482 V at $d = 5.5$ mm. The three trials at each gap distance typically agreed to within 2–3 V, with the tightest clustering (all three trials identical at 417 V) occurring near the minimum at $d = 0.8$–$0.9$ mm.

#boxfig("plasma/plots/U_vs_d.png", width: 95%, box-width: 100%, [Breakdown voltage $U_"br"$ as a function of electrode gap $d$ at three pressures. Each point is the average of three trials; error bars show the standard deviation.]) <fig:u-vs-d>

== 6 hPa Data

At 6 hPa the left branch of the Paschen curve is much steeper, rising from about 470 V at $d = 1.25$ mm to over 727 V at $d = 0.2$ mm. The curve flattens into a broad minimum around $d = 3.6$–$4.0$ mm at approximately 425 V, then begins to rise gently toward 436 V at $d = 5.5$ mm.

== 4 hPa Data

Only gaps from $d = 3.2$ mm to $d = 5.5$ mm could be measured at 4 hPa (smaller gaps required voltages above the supply limit). The six measured points show a monotonic descent from about 691 V at $d = 3.2$ mm to 519 V at $d = 5.5$ mm, with the rate of decrease slowing at larger gaps. The Paschen minimum was not reached within the accessible range, indicating that it lies beyond $d = 5.5$ mm at this pressure.

== Combined Paschen Plot

When all data are plotted against the product $p d$ (@fig:u-vs-pd), the three datasets follow a common trend. The 8 hPa points, which span the region around the Paschen minimum most completely, agree well with the theoretical prediction. The 6 and 4 hPa points extend the coverage to both lower and higher $p d$ values.

#boxfig("plasma/plots/U_vs_pd_with_theory.png", width: 95%, box-width: 100%, [Breakdown voltage plotted against $p d$ for all three pressures, with the theoretical Paschen curve (γ ≈ 0.0013) overlaid. The data follow the expected universal curve within experimental scatter.]) <fig:u-vs-pd>

= Analysis

== Shape of the Paschen Curve

The U-shaped curves in @fig:u-vs-d arise from the competing demands of ionisation efficiency. At small $d$ (or small $p d$), the gap is too narrow for an electron to accumulate enough ionising collisions. Even though the electric field $E = U/d$ is large, the electron simply does not encounter enough gas molecules before reaching the anode. This is the left branch, where the required voltage rises steeply as $d$ decreases.

At large $d$ (or large $p d$), the opposite limitation applies: collisions are abundant, but each electron loses kinetic energy to frequent non-ionising collisions (excitation, elastic scattering). The field must be increased to supply enough energy per mean free path. This is the right branch, which rises more gradually.

The minimum occurs where these two effects balance: the electron has just enough path length to produce a critical number of ionising collisions, and just enough energy per collision to make those ionisations probable.

== Shift of the Minimum with Pressure

The Paschen law predicts that the minimum occurs at a fixed product $(p d)_min$, independent of how $p$ and $d$ are individually chosen (@eq:pd-min). As the pressure decreases, the minimum shifts to larger $d$:

$ d_min = (p d)_min / p $

This is exactly what we observe: the minimum moves from $d ≈ 1.1$ mm at 8 hPa to $d ≈ 3.6$–$4.0$ mm at 6 hPa, and at 4 hPa the minimum was not reached even at the largest gap ($d = 5.5$ mm). In ideal Paschen scaling, $(p d)_min$ would be identical for all pressures. The measured values are:

- 8 hPa: $(p d)_min ≈ 1.1 × 800 = 880$ Pa·mm $= 0.88$ Pa·m
- 6 hPa: $(p d)_min ≈ 4.0 × 600 = 2400$ Pa·mm $= 2.40$ Pa·m
- 4 hPa: $(p d)_min > 5.5 × 400 = 2200$ Pa·mm $= 2.20$ Pa·m (not reached)

The 8 hPa value of $(p d)_min ≈ 0.88$ Pa·m is the most reliable since that curve shows the sharpest minimum. The 6 hPa minimum region is broad and flat, making the exact location harder to pinpoint, which likely inflates the estimated $(p d)_min$. At 4 hPa, the curve is still descending at $d = 5.5$ mm, so the minimum could not be located at all.

== Extraction of the Second Townsend Coefficient

From the 8 hPa data, the minimum breakdown voltage $U_min ≈ 416$ V gives, via @eq:u-min:

$ C = (U_min A) / (e B) = (416 × 20) / (2.718 × 487) = 6.29 $

$ γ = 1 / (e^C - 1) = 1 / (e^6.29 - 1) ≈ 0.0019 $

An independent estimate from $(p d)_min ≈ 0.88$ Pa·m via @eq:pd-min:

$ C = (A (p d)_min) / e = (20 × 0.88) / 2.718 = 6.47 $

$ γ ≈ 1 / (e^6.47 - 1) ≈ 0.0015 $

The two estimates agree reasonably: γ ≈ 0.0015–0.0019. Taking the average, γ ≈ 0.0017, which falls within the range reported for metallic cathodes in air (typically 0.001–0.01 depending on surface condition and cathode material) \[#link(<ref2>)[2], #link(<ref3>)[3]\].

The 6 hPa data gives a similar $U_min ≈ 425$ V (γ ≈ 0.0016 from the voltage method), but the broad minimum makes the $(p d)_min$ estimate less reliable. At 4 hPa, no minimum was observed: the breakdown voltage was still decreasing at the largest accessible gap ($d = 5.5$ mm, $U_"br" ≈ 519$ V). All six measured points lie on the left branch, descending toward a minimum beyond the measurement range. No reliable γ estimate can therefore be extracted from the 4 hPa data alone. Using the 8 hPa parameters, the minimum at 4 hPa would be expected near $d ≈ 0.88/400 × 10^3 ≈ 2.2$ mm, but the data at those gaps was inaccessible due to the voltage limit. The fact that the voltage at $d = 5.5$ mm (519 V) remains well above the 8 hPa minimum (416 V) suggests that additional effects at low pressure, such as changes in secondary emission efficiency with ion energy, shift the effective minimum to larger $p d$ values.

== Linear Plot

@fig:linear shows $d/U_"br"$ plotted against $ln(d)$ for all three pressures. In the regime past the minimum (right branch), the data follow approximately straight lines, as predicted by the linearised Paschen equation. The slopes are consistent with the expected $1/(B p)$ dependence, although the fitted $B$ values scatter somewhat due to the limited number of points on the right branch at lower pressures.

#boxfig("plasma/plots/linear_plot.png", width: 95%, box-width: 100%, [Linear representation: $d/U_"br"$ vs $ln(d)$. The dashed lines are least-squares fits to the data past the Paschen minimum. Approximate linearity confirms the validity of the Townsend model.]) <fig:linear>

= Discussion

== Validity of the Paschen Scaling

The combined $p d$ plot (@fig:u-vs-pd) shows that the data from all three pressures follow a common trend, supporting the Paschen law's prediction that $U_"br"$ depends only on the product $p d$. The overlap is not perfect: the 6 hPa points at large $p d$ sit slightly below the theoretical curve, and the 4 hPa points at intermediate $p d$ sit above. Several factors contribute to this scatter:

- *Electrode surface condition*: The secondary emission coefficient γ depends on surface contamination, oxide layers, and microstructure. Over the course of many discharges, the cathode surface erodes and deposits may accumulate, gradually changing γ. Since the three pressure runs were performed sequentially, the electrode surface may have evolved.
- *Statistical nature of breakdown*: Breakdown requires a seed electron in the right location at the right time. The measured voltage is the peak voltage before the discharge strikes, which fluctuates from trial to trial.
- *Voltage ramp rate*: If the voltage is increased too quickly, the discharge may overshoot the true breakdown voltage. This effect is difficult to control precisely with a manual supply.
- *Pressure stability*: Small drifts in pressure during a measurement series would shift points horizontally on the $p d$ axis.

== Applications of Townsend Discharge

Townsend discharge theory underpins many technologies. Gas-insulated switchgear in high-voltage power transmission relies on gases with high Paschen minima (like SF₆) to prevent accidental breakdown. Conversely, gas discharge lamps, fluorescent tubes, and plasma etching reactors deliberately operate in the breakdown regime, and their design requires knowing the Paschen curve for the specific gas mixture and electrode geometry. Spark plugs in internal combustion engines ignite fuel-air mixtures by driving the electrode gap past the Paschen minimum, and the ignition reliability depends on the pressure and temperature at the moment of discharge.

== Sources of Uncertainty

The dominant uncertainty in this experiment is the identification of the Paschen minimum, particularly at lower pressures where the curve is broad and flat. A ±0.5 mm uncertainty in $d_min$ translates to a significant shift in the extracted $(p d)_min$ and hence in γ. The micrometer resolution (0.05 mm) contributes much less.

The multimeter's peak-hold function introduces a systematic offset if the voltage rises rapidly: the recorded peak may slightly exceed the true breakdown threshold. This effect would shift all $U_"br"$ values upward by a small, roughly constant amount, affecting $U_min$ and hence γ.

= Conclusion

The Paschen curves measured for air at 4, 6, and 8 hPa show the expected dependence on electrode gap distance: the 8 hPa curve exhibits a clear U-shape with a well-defined minimum, the 6 hPa curve shows a broad minimum shifted to larger $d$, and the 4 hPa data captures only the descending left branch, with the minimum beyond the accessible gap range. From the 8 hPa data, which resolved the minimum most cleanly, the second Townsend coefficient was estimated as γ ≈ 0.0017, placing it within the expected range for metallic cathodes in air. The combined $p d$ plot confirms the Paschen scaling: the 8 hPa and 6 hPa datasets broadly follow a common curve, with scatter attributable to electrode ageing, breakdown statistics, and the finite density of measurement points near the minimum.

= References

1. Plasma Physics Laboratory Manual, Experimental Physics II, NUS (2024). <ref1>

2. Y. P. Raizer, _Gas Discharge Physics_, Springer (1991). <ref2>

3. A. N. Tkachev and S. I. Yakovlenko, "The Townsend coefficient and the Paschen law", _Journal of Physics: Conference Series_ *44*, 83 (2006). <ref3>

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
      "Help me transcribe the handwritten data table, compute Paschen curve averages, generate $U_"br"$ vs $d$ and $U_"br"$ vs $p d$ plots, fit the linear representation, and extract the second Townsend coefficient γ." \
      *Output:* \
      Python script for data processing, plotting, and γ extraction
    ], [
      Used for data transcription assistance and plotting automation. All breakdown voltage measurements were performed by me, and the physical interpretation of the Paschen curves and γ values is my own.
    ],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help with Typst formatting for figures, tables, equations, and layout. Check that cross-references and file paths compile correctly." \
      *Output:* \
      Typst formatting guidance and layout suggestions
    ], [
      Used only for formatting. All experiment content, analysis, and scientific interpretations were written and verified by me.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)
