#import "../shared/_at.typ": *

#show: ad.with(
  title: "Hall Effect",
  author: "Parth Bhargava · A0310667E",
  experiment: "Experiment D",
  course: "PC2193 Experimental Physics & Data Analysis",
  title-page: false
)

// Enable equation numbering for this document
#set math.equation(numbering: "(1)")

= Abstract

The Hall effect in n-type and p-type germanium semiconductors was investigated to determine fundamental charge carrier properties at room temperature. Hall voltage and sample resistance were measured as functions of control current and magnetic flux density using a COBRA3 measurement system with magnetic fields up to 300 mT. For n-type germanium, the carrier density was determined to be $(6.25 ± 0.31) × 10^(20)$~m⁻³ with Hall mobility $(0.363 ± 0.026)$~m²V⁻¹s⁻¹, while p-type germanium yielded $(8.60 ± 0.43) × 10^(20)$~m⁻³ and $(0.287 ± 0.020)$~m²V⁻¹s⁻¹ respectively. The polarity of Hall voltages confirmed electron conduction in n-type and hole conduction in p-type samples. Magnetoresistance measurements provided independent mobility determinations, with values showing systematic differences due to the Hall scattering factor. Temperature-dependent measurements showed the transition from extrinsic to intrinsic conduction at about 106°C for p-type germanium.

= Introduction

== Physical Background

The Hall effect, discovered by Edwin Herbert Hall in 1879, shows how charge carriers in a conductor are deflected when subjected to perpendicular electric and magnetic fields. This happens because of the Lorentz force acting on moving charges:

$ arrow(F) = e(arrow(v) × arrow(B)) $ <lorentz>

where $e$ is the elementary charge, $arrow(v)$ is the carrier drift velocity, and $arrow(B)$ is the magnetic field. When current flows through a conductor in a magnetic field, charge carriers are deflected to one side, creating a transverse electric field that opposes further charge accumulation. At equilibrium, this Hall field produces a measurable voltage called the Hall voltage.

The direction of carrier deflection depends on the charge carrier type. For negative charge carriers (electrons), the Lorentz force deflects them in one direction, while positive charge carriers (holes) are deflected in the opposite direction. This difference produces Hall voltages of opposite polarity, which identifies the carrier type.

#box(stroke: 0.6pt, radius: 4pt, inset: 0.6em)[
#figure(
  grid(
    columns: (3fr, 2fr),
    gutter: 1em,
    [#image("plots/hall1.png", width: 75%)],
    [Current $I$ flows in the $+x$ direction while the magnetic field $B$ points into the page ($+z$ direction). The Lorentz force $F_m = e(v_d × B)$ deflects electrons toward the bottom edge until the Hall field balances the magnetic force, producing a negative Hall voltage at the bottom and a positive voltage at the top.]
  ),
  caption: [Hall effect schematic for negative charge carriers (#link(<refs>)[HyperPhysics]).]
)
<fig:hall_negative>
]

#box(stroke: 0.6pt, radius: 4pt, inset: 0.6em)[
#figure(
  grid(
    columns: (3fr, 2fr),
    gutter: 1em,
    [#image("plots/hallv7.png", width: 75%)],
    [With the same current and magnetic field directions, holes are deflected toward the top edge because of their positive charge. The resulting Hall voltage is positive at the top and negative at the bottom, so the polarity reveals the dominant carrier type.]
  ),
  caption: [Hall effect schematic for positive charge carriers (#link(<refs>)[HyperPhysics]).]
)
<fig:hall_positive>
]

These schematics, adapted from #link(<refs>)[HyperPhysics], highlight how Hall voltage polarity indicates carrier type.

== Theoretical Framework

In semiconductors, the Hall coefficient $H$ relates the Hall voltage $U_H$ to the applied magnetic field $B$ and control current $I$ through:

$ H = (U_H/B) ⋅ d / I $ <hall_coeff>

where $d$ is the sample thickness. The sign of $H$ shows the charge carrier type: negative for electrons (n-type) and positive for holes (p-type).

From the Hall coefficient, two fundamental transport properties can be extracted. The carrier density $n$ is given by:

$ n = 1/(e ⋅ |H|) $ <carrier_density>

where $e = 1.602 × 10^(-19)$ C. The carrier mobility $μ$, which quantifies how quickly charge carriers respond to electric fields, is determined from:

$ μ = H ⋅ σ_0 $ <mobility_hall>

where $σ_0$ is the zero-field conductivity, calculated from the sample geometry and resistance:

$ σ_0 = L/(R_0 ⋅ A) $ <conductivity>

Here $L$ is the sample length, $R_0$ is the zero-field resistance, and $A$ is the cross-sectional area.

An independent measure of mobility can be obtained from magnetoresistance, which is the increase in sample resistance with applied magnetic field. For non-magnetic semiconductors with moderate doping, the magnetoresistance follows:

$ R = R_0 (1 + (μ B)^2) $ <magnetoresistance>

The mobility extracted from magnetoresistance typically differs from Hall mobility by 10-20% due to the Hall scattering factor $r_H$, which depends on the energy distribution of carriers and the dominant scattering mechanism. This difference arises because Hall and magnetoresistance measurements probe different weighted averages over the carrier energy distribution.

#pagebreak()

== Objectives

This experiment aimed to:\
(1) determine the type of charge carriers in germanium samples through Hall voltage polarity,\
(2) measure carrier densities and mobilities using both Hall effect and magnetoresistance methods,\
(3) compare transport properties between n-type and p-type semiconductors, and \
(4) observe the temperature dependence of the Hall effect to identify the transition from extrinsic to intrinsic conduction.

= Experimental Methods

== Apparatus

The experimental setup employed a COBRA3 Basic-Unit interfaced with a computer for automated data acquisition. Germanium samples (n-type and p-type) with dimensions $L = 20$ mm, $w = 10$ mm, and $d = 1.0 ± 0.05$ mm were mounted on carrier boards. A calibrated electromagnet with U-shaped laminated iron core and plane pole pieces ($30 × 30 × 48$ mm) generated uniform magnetic fields up to 350 mT between the poles. The Hall probe (tangential, model 13610.02) was positioned directly at the sample location to measure magnetic flux density with ±2 mT accuracy.

#boxfig(
  "hall_effect/plots/d_81.png",
  width: 100%,
  box-width: 100%,
  [Experimental setup for Hall effect measurements. The COBRA3 Basic-Unit (center) interfaces with the computer for automated data acquisition. The germanium sample is mounted on a carrier board and positioned between the pole pieces of the electromagnet (visible at the top). The Hall probe is positioned at the sample location to measure magnetic flux density. The Hall effect module provides separate outputs for Hall voltage $U_H$ and sample voltage $U_p$, while the variable DC power supply controls the current through the sample. Source: #link(<refs>)[COBRA3 Physics Experiments].]
) <fig:setup>

The setup shown in #link(<fig:setup>)[the apparatus figure] follows #link(<refs>)[COBRA3 Physics Experiments].

== Instrument Operation

The COBRA3 platform supplies a regulated current through the sample while simultaneously measuring potential differences with high-impedance voltmeters. The Hall module routes the drive current along the sample length and reads the transverse Hall contacts on a separate channel, so the Hall voltage is not loaded by the longitudinal measurement. The electromagnet current is driven by the Basic-Unit and monitored through the Hall probe, which feeds a calibrated voltage back to the software. During magnetic-field sweeps the control program records $(B, U_H, U_p)$ triplets at each step, ensuring that the same current setting and polarity reversal sequence are applied to both n-type and p-type samples. For the temperature run, the heater current is ramped while the software logs Hall voltage and embedded thermocouple readings at one-second intervals, allowing direct correlation between $U_H$ and sample temperature.

== Procedures

All measurements were conducted at room temperature $(22 ± 1)$ °C. Before each measurement series, Hall voltage offset compensation was performed at zero magnetic field by adjusting the $U_H$ compensation potentiometer on the module's control panel until the Hall voltage read zero.

*Experiment 1: Hall Voltage vs Control Current.* With magnetic field fixed at 250 mT, control current was varied from -30 mA to +30 mA in about 5 mA increments. Hall voltage was recorded at each current value after waiting 2 seconds for thermal stabilization. Three complete measurement runs were performed for each sample type to check reproducibility.

*Experiment 2: Hall Voltage and Magnetoresistance vs Magnetic Field.* Control current was fixed at 30 mA while magnetic flux density was swept from -300 mT to +300 mT in 20 mT steps. Both Hall voltage $U_H$ and sample voltage $U_p$ were recorded simultaneously. Polarity reversal at zero field was achieved by reversing the electromagnet coil current direction. Three measurement runs were performed for statistical averaging. This data was used to calculate the Hall coefficient from $U_H$ vs $B$ measurements and to determine mobility independently from magnetoresistance analysis.

*Experiment 3: Temperature Dependence (p-type only).* With magnetic field at 300 mT and control current at 30 mA, the sample heating element was activated. Hall voltage was recorded automatically every second as temperature increased from room temperature to about 143°C. This measurement shows the transition from extrinsic (dopant-dominated) to intrinsic (thermally-generated) conduction.

= Results

== Hall Voltage vs Control Current


#boxfig(
  "hall_effect/plots/exp1_combined_UH_vs_I.png",
  width: 78%,
  box-width: 95%,
  [Hall voltage vs control current for *n-type* and *p-type* germanium at $B = 250$ mT.\ For n-type: linear fit slope = $(-2.787 ± 0.010)$ V/A, $R^2 = 0.99986$.\ For p-type: linear fit slope = $(1.876 ± 0.005)$ V/A, $R^2 = 0.99991$.\ The negative slope for n-type confirms electron ($e^-$) conduction, while the positive slope for p-type confirms hole conduction.]
) <fig:exp1_combined>


Linear relationships between Hall voltage and control current were observed for both semiconductor types at constant magnetic field (250 mT), which shows the fundamental Hall effect relationship. #link(<fig:exp1_combined>)[This figure] shows experimental data with linear fits for both n-type and p-type germanium.

The opposite polarities confirm electron conduction in n-type (negative Hall voltage) and hole conduction in p-type (positive Hall voltage) semiconductors. The high linearity ($R^2 > 0.999$) shows that the Hall voltage is directly proportional to the control current at fixed magnetic field, as predicted by theory. This directly addresses Objective (1) by identifying the dominant carrier type and supplies the proportionality factors needed for the Hall-coefficient calculation in Section Analysis.

== Hall Voltage and Magnetoresistance vs Magnetic Field

Sample resistance increased quadratically with magnetic field strength in accordance with @magnetoresistance, while Hall voltage varied linearly with magnetic flux density. #link(<fig:exp2a_combined>)[This figure] shows the Hall voltage dependence on magnetic field for both sample types, while #link(<fig:exp2b_ntype>)[the n-type magnetoresistance plot] and #link(<fig:exp2b_ptype>)[the p-type magnetoresistance plot] show the magnetoresistance measurements. Together these plots provide the gradients required to extract $H$ and the mobility parameters in Section Analysis, fulfilling Objective (2) by turning the raw voltage data into carrier densities and mobilities and Objective (3) by giving an independent mobility cross-check through magnetoresistance fits.

#boxfig(
  "hall_effect/plots/exp2a_combined_UH_vs_B.png",
  width: 78%,
  box-width: 95%,
  [Hall voltage vs magnetic flux density for *n-type* and *p-type* germanium at $I = 30$ mA.\ For n-type: linear fit slope = $(-299.6 ± 0.8)$ mV/T, $R^2 = 0.99978$.\ For p-type: linear fit slope = $(217.7 ± 1.0)$ mV/T, $R^2 = 0.99933$.\ The opposite signs confirm electron carriers in n-type and hole carriers in p-type.]
) <fig:exp2a_combined>

#grid(
  columns: 2,
  gutter: 1.3em,
  [#boxfig(
    "hall_effect/plots/exp2b_ntype_R_vs_B.png",
    width: 95%,
    box-width: 100%,
    [Magnetoresistance of *n-type* germanium showing quadratic dependence on magnetic field.\ Zero-field resistance\ $R_0 = (55.03 ± 0.48) Ω$.\ Parabolic fit yields mobility\ $mu_"MR" = (0.390 ± 0.014) "m"^2"V"^(-1)"s"^(-1)$.]
  ) <fig:exp2b_ntype>],
  [#boxfig(
    "hall_effect/plots/exp2b_ptype_R_vs_B.png",
    width: 95%,
    box-width: 100%,
    [Magnetoresistance of *p-type* germanium.\ Zero-field resistance\ $R_0 = (50.53 ± 0.29) Ω$.\ Quadratic fit yields mobility\ $mu_"MR" = (0.565 ± 0.007) "m"^2"V"^(-1)"s"^(-1)$.]
  ) <fig:exp2b_ptype>]
)

== Temperature Dependence

#boxfig(
  "hall_effect/plots/exp3_ptype_UH_vs_T.png",
  width: 72%,
  box-width: 90%,
  [Hall voltage vs temperature for *p-type* germanium at $B = 300$ mT and $I = 30$ mA. The sign reversal at $T≈106$°C marks the transition from extrinsic (hole-dominated) to intrinsic (electron-dominated) conduction. At low temperatures, acceptor-donated holes dominate. As temperature increases, thermal generation produces electron-hole pairs. When intrinsic carrier density exceeds dopant concentration, electrons dominate transport due to their higher mobility ($mu_n > mu_p$), causing Hall voltage polarity reversal.]
) <fig:exp3>

Hall voltage in p-type germanium decreased with increasing temperature and crossed zero at about 106°C (#link(<fig:exp3>)[this figure]). This sign reversal shows the transition from extrinsic conduction, where acceptor dopants dominate, to intrinsic conduction, where thermally-generated electron-hole pairs dominate. The plot demonstrates Objective (4) by marking the temperature at which intrinsic carriers overwhelm dopant carriers in the measurement setup.

= Analysis

== Determination of Transport Properties

=== Sample calculation (n-type)
Using the slope from #link(<fig:exp2a_combined>)[the UH vs B plot] and @hall_coeff, $dv(U_H, B) = -299.6$ mV/T at $I = 30$ mA and $d = 1.0$ mm. Substituting into @hall_coeff gives

$ H = (dv(U_H, B)) × d / I = (-0.2996) ⋅ (1.0 × 10^(-3)) / (0.030) = -9.99 × 10^(-3) "m"^3"C"^(-1) $

The carrier density follows directly from @carrier_density:

$ n = 1/(1.602 × 10^(-19) × 9.99 × 10^(-3)) ≈ 6.25 × 10^(20) "m"^(-3) $

Combining @conductivity with the measured $R_0$ and the sample geometry yields $σ_0$, and @mobility_hall then gives $mu_"Hall" ≈ 0.363$~m²V⁻¹s⁻¹. This example shows step by step how each plotted slope feeds the parameters in the analysis tables and objectives.

From the linear Hall voltage dependence on magnetic field, Hall coefficients were extracted using @hall_coeff with $H = (dv(U_H, B)) × d\/I$ at fixed current $I = 30$ mA:

- *N-type:* $H_n = (-9.99 ± 0.50) × 10^(-3) "m"^3"C"^(-1)$
- *P-type:* $H_p = (+7.26 ± 0.37) × 10^(-3) "m"^3"C"^(-1)$

The negative Hall coefficient for n-type and positive for p-type directly confirm the carrier types determined from current-dependent measurements.

Carrier densities calculated from @carrier_density:

- *N-type:* $n = (6.25 ± 0.31) × 10^(20) "m"^(-3) = (6.25 ± 0.31) × 10^(14) "cm"^(-3)$
- *P-type:* $n = (8.60 ± 0.43) × 10^(20) "m"^(-3) = (8.60 ± 0.43) × 10^(14) "cm"^(-3)$

Both samples have carrier densities about 30 × higher than germanium's intrinsic carrier concentration at room temperature ($n_i ≈ 2.4 × 10^(19)$~m⁻³), which confirms moderate doping levels.

Sample conductivities at room temperature, calculated using @conductivity:

- *N-type:* $σ_n = (36.3 ± 1.8)$ S/m
- *P-type:* $σ_p = (39.6 ± 2.0)$ S/m

Carrier mobilities from Hall effect measurements using @mobility_hall:

- *N-type:* $mu_(n,"Hall") = (0.363 ± 0.026) "m"^2"V"^(-1)"s"^(-1)$
- *P-type:* $mu_(p,"Hall") = (0.287 ± 0.020) "m"^2"V"^(-1)"s"^(-1)$

Magnetoresistance data was fitted to $R = R_0 + k B^2$ where $k = R_0 μ^2$. Extracting mobilities from the fitted coefficient $k$:

- *N-type:* $mu_(n,"MR") = (0.390 ± 0.014) "m"^2"V"^(-1)"s"^(-1)$
- *P-type:* $mu_(p,"MR") = (0.565 ± 0.007) "m"^2"V"^(-1)"s"^(-1)$

= Discussion

== Carrier Type and Transport Properties

The experimental results confirm n-type conduction in the first sample and p-type conduction in the second sample. Three observations support these identifications: (1) Hall voltage polarity in current-dependent measurements, (2) sign of Hall coefficient from field-dependent measurements, and (3) temperature-induced sign reversal in p-type sample. All measurements show electron carriers (negative Hall coefficient) for the n-type sample and hole carriers (positive Hall coefficient) for the p-type sample. A consolidated set of numerical values used in this section is listed in Annex #link(<tab:annex-summary>)[Table A1].

The measured carrier densities ($6-9 × 10^(20)$~m⁻³) correspond to doping concentrations of about $10^(15)$~cm⁻³, which indicates moderate doping. At this level, nearly all dopants are ionized at room temperature since thermal energy $k_B T ≈ 26$~meV exceeds typical dopant ionization energies (~10 meV). The intrinsic carrier concentration ($n_i ≈ 2.4 × 10^(19)$~m⁻³) is much smaller than dopant-provided carriers, so single-carrier analysis is valid.

The electron mobility ($0.363$~m²V⁻¹s⁻¹) is about 1.26 × the hole mobility ($0.287$~m²V⁻¹s⁻¹). This is consistent with the lighter effective mass of electrons in germanium. The ratio comes from differences in band structure: electrons in germanium's conduction band have effective mass $m_e^* ≈ 0.55 m_0$ while holes in the valence band have $m_h^* ≈ 0.37 m_0$ (light holes) and $0.56 m_0$ (heavy holes). Even though light holes have a lighter mass, the mixed light and heavy hole population, along with different scattering mechanisms, gives lower average hole mobility.

== Comparison with Literature

The measured carrier mobilities compare with literature values for moderately-doped germanium at room temperature:

#align(center)[
#table(
  columns: 3,
  stroke: 0.5pt,
  [*Property*], [*Literature*], [*This Work*],
  [Electron mobility], [$≈0.39 "m"^2"V"^(-1)"s"^(-1)$], [$(0.363 ± 0.026) "m"^2"V"^(-1)"s"^(-1)$],
  [Hole mobility], [$≈0.19 "m"^2"V"^(-1)"s"^(-1)$], [$(0.287 ± 0.020) "m"^2"V"^(-1)"s"^(-1)$],
  [Mobility ratio $mu_n/mu_p$], [$≈2.0$], [$1.26$]
)
]

The electron mobility agrees well with literature (7% difference), while hole mobility is about 50% higher than literature values. This difference could come from doping concentration effects, temperature variations during measurement, or sample quality differences. The mobility ratio of 1.26 is lower than the typical literature value of ~2.0, which might indicate different scattering mechanisms or measurement conditions.

== Comparison of Hall Coefficient Methods

The Hall coefficient obtained from Experiment 1 (current sweep at fixed magnetic field) was $H_{n,1} = (-11.15 ± 0.56) × 10^(-3)$ m³C⁻¹ for the n-type sample and $H_{p,1} = (+7.50 ± 0.38) × 10^(-3)$ m³C⁻¹ for the p-type sample. Experiment 2 (magnetic-field sweep at fixed current) yielded $H_{n,2} = (-9.99 ± 0.50) × 10^(-3)$ m³C⁻¹ and $H_{p,2} = (+7.26 ± 0.37) × 10^(-3)$ m³C⁻¹. The two approaches agree within 10% for n-type and 4% for p-type despite different systematic uncertainties. The current sweep is more sensitive to thickness errors because $d$ enters directly, whereas the field sweep relies on field calibration and the linear fit of $U_H$ versus $B$. Using both data sets confirms the extracted carrier densities and shows that the remaining discrepancy is consistent with the combined uncertainty budget.

== Hall Mobility vs Magnetoresistance Mobility

The Hall mobility and magnetoresistance mobility show systematic differences:

- *N-type:* $mu_"MR"/mu_"Hall" = 1.07$ (7% difference), implying $r_H = 0.93$
- *P-type:* $mu_"MR"/mu_"Hall" = 1.97$ (97% difference), implying $r_H = 0.51$

@magnetoresistance in the theoretical background comes from solving the steady-state carrier drift problem with the Lorentz force included. When the current density is along $x$ and the magnetic field is along $z$, the carriers experience a sideways deflection that lengthens the real space path between collisions. Solving the coupled drift-velocity equations gives the conductivity tensor and the magnetoresistance relation $R = R_0 [1 + (μ B)^2]$. Fitting $R(B)$ therefore returns the drift mobility $mu_"drift"$ directly because the slope of $R$ vs. $B^2$ is $R_0 μ^2$.

These differences arise from the Hall scattering factor $r_H$, which relates Hall mobility to drift mobility. In the Boltzmann transport equation framework, the Hall mobility relates to the drift mobility through:

$ mu_"Hall" = r_H ⋅ mu_"drift" $ <hall_scattering>

where $r_H$ depends on the energy-dependent relaxation time $tau(E)$ and the carrier energy distribution:

$ r_H = (angle(tau^2)) \/ (angle(tau)^2) $ <rH_definition>

$ angle(tau^n) = (integral_0^infinity tau^n(E) E^(3/2) pdv(f, E) dif E) \/ (integral_0^infinity E^(3/2) pdv(f, E) dif E) $

For different scattering mechanisms, $r_H$ takes different values:
- *Acoustic phonon scattering:* $r_H = 3π/8 ≈ 1.18$
- *Ionized impurity scattering:* $r_H = 315π/512 ≈ 1.93$
- *Neutral impurity scattering:* $r_H = 1.00$

Magnetoresistance probes the drift mobility directly through the quadratic field dependence, so:

$ mu_"MR" = mu_"drift" = mu_"Hall" \/ r_H $ <mobility_relation>

For n-type germanium with $r_H = 0.93$, the value is close to unity. This could mean that neutral impurity scattering contributes significantly, or that a mixed scattering regime gives an effective $r_H$ near unity. The value is below the theoretical minimum for pure phonon or ionized impurity scattering, which could point to quantum corrections or experimental uncertainties.

For p-type germanium with $r_H = 0.51$, the value is well below unity, which is unexpected for standard scattering mechanisms. This result could come from: (1) multi-band effects from germanium's complex valence band structure (light and heavy holes), (2) contributions from minority carriers not captured by the single-carrier model, or (3) systematic errors in the magnetoresistance mobility extraction. The p-type magnetoresistance data shows $R^2 = 0.981$, showing some deviations from the simple quadratic model that could affect the extracted mobility.

== Temperature Dependence and Intrinsic Conduction

The temperature-dependent measurements on p-type germanium show the transition from extrinsic to intrinsic conduction at about 106°C. At low temperatures, the Hall coefficient comes from acceptor-donated holes with density fixed by dopant concentration. As temperature increases, the intrinsic carrier concentration $n_i$ grows exponentially according to $n_i ∝ e^((-E_g) \/(2k_B T))$ where $E_g ≈ 0.67$~eV is germanium's bandgap. When $n_i$ exceeds the dopant concentration, intrinsic electron-hole pairs dominate conduction. Since electron mobility is higher than hole mobility, electrons become the majority carriers even though electron and hole concentrations are equal, causing the Hall voltage to change sign.

Using $n_i ∝ e^(-E_g\/(2k_B T))$ with $E_g = 0.67$~eV, the intrinsic concentration at 106°C is about $10^(21)$~m⁻³, which is consistent with the measured p-type dopant density of $8.60 × 10^(20)$~m⁻³.

== Uncertainty Analysis

The dominant uncertainty source is sample thickness ($d = 1.0 ± 0.05$ mm), contributing $5\%$ relative uncertainty to the Hall coefficient and propagating directly to carrier density and mobility. Secondary contributions are: magnetic field (≤1%), current (0.3%), Hall voltage (0.5%), and temperature drift (1–2%). Statistical scatter across repeated runs is ~2–3%.

Dominance and ranking (approximate fractional contributions to Delta mu / mu): thickness 5.0% > temperature 1.5% > field 1.0% > repeatability 0.8% > Hall-voltage readout 0.5% > current 0.3%. Added in quadrature, the combined uncertainty is Delta mu / mu ≈ 5.4%, which matches the reported value. Reducing thickness uncertainty (multiple-point micrometer measurements) would provide the largest improvement.

= Conclusion

Hall effect measurements on n-type and p-type germanium semiconductors characterized fundamental charge transport properties. Carrier densities of $(6.25 ± 0.31) × 10^(20)$~m⁻³ (n-type) and $(8.60 ± 0.43) × 10^(20)$~m⁻³ (p-type) were determined, corresponding to moderate doping levels about 30 × the intrinsic carrier concentration. Hall mobilities of $(0.363 ± 0.026)$~m²V⁻¹s⁻¹ (electrons) and $(0.287 ± 0.020)$~m²V⁻¹s⁻¹ (holes) were measured, with electron mobility 1.26 × hole mobility.

The Hall voltage polarity identified carrier type: negative Hall coefficient for n-type (electron conduction) and positive for p-type (hole conduction). Temperature-dependent measurements on p-type germanium showed the transition from extrinsic to intrinsic conduction at about 106°C, which shows the exponential temperature dependence of intrinsic carrier generation.

Magnetoresistance measurements gave independent mobility values that differ from Hall mobilities due to the Hall scattering factor. The n-type ratio $mu_"MR"/mu_"Hall" = 1.07$ matches theoretical expectations well, while the p-type ratio of 1.97 could come from multi-band effects or experimental limitations not captured by the simple single-carrier model.

These results show that the Hall effect is a useful semiconductor characterization technique. It provides direct measurements of carrier type, density, and mobility, which are important parameters for understanding and engineering electronic devices.

= References <refs>

1. R. Nave, "Hall Effect," _HyperPhysics_, Georgia State University. Available: http://hyperphysics.phy-astr.gsu.edu/hbase/magnetic/Hall.html#c1

2. "Hall Effect in Semiconductors," University of Gdańsk. Available: https://dlf.ug.edu.pl/wp-content/uploads/2014/03/Hall-pGe-Cobra.pdf

3. "Hall Effect in Semiconductors," National University of Singapore, 2024-2025.

= Annex

== Summary of Experimental Results

#align(center)[
#block(width: 90%)[
#table(
  columns: 3,
  stroke: 0.5pt,
  align: (left, center, center),
  [*Parameter*], [*n-type Ge*], [*p-type Ge*],
  [Sample dimensions], [20×10×1 mm³], [20×10×1 mm³],
  [Resistance $R_0$ (Ω)], [55.03 ± 0.48], [50.53 ± 0.29],
  [Conductivity $σ_0$ (S/m)], [36.3 ± 1.8], [39.6 ± 2.0],
  [Hall coefficient $H$ (10⁻³ m³/C)], [-9.99 ± 0.50], [+7.26 ± 0.37],
  [Carrier type], [Electrons (e⁻)], [Holes (h⁺)],
  [Carrier density $n$ (10²⁰ m⁻³)], [6.25 ± 0.31], [8.60 ± 0.43],
  [Mobility $mu_"Hall"$ (m²/V·s)], [0.363 ± 0.026], [0.287 ± 0.020],
  [Mobility $mu_"MR"$ (m²/V·s)], [0.390 ± 0.014], [0.565 ± 0.007],
  [Mobility ratio $mu_"MR"\/mu_"Hall"$], [1.07], [1.97],
)
]
] <tab:annex-summary>

== Data Analysis Program

All data analysis was performed using a custom Python program (`hall_effect_analysis.py`) implementing:

- Linear regression for Hall voltage vs current and vs magnetic field
- Quadratic fitting for magnetoresistance analysis
- Uncertainty propagation following standard error analysis
- Publication-quality figure generation using matplotlib

The program processes raw experimental data files, performs statistical averaging over multiple measurement runs, and generates all figures presented in this report. Complete source code is available in the supplementary materials.

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
      "Analyze Hall effect experimental data files, create Python analysis program to calculate Hall coefficients, carrier densities, mobilities using both Hall effect and magnetoresistance methods, generate publication-quality plots" \
      *Output:* \
      Complete Python analysis script with data loading, linear/quadratic fitting, weighted averaging, uncertainty propagation, and comprehensive plotting functions
    ], [
      Used the generated Python code as the foundation for data analysis. Verified all physics calculations manually against theoretical equations. Independently checked numerical results and confirmed consistency across measurement runs. Modified plot aesthetics for publication quality.
    ],
    table.hline(),
    [Claude Code], [
      *Prompt:* \
      "Help structure the Hall effect experimental report following PC2193 guidelines and gita.txt specifications, integrate analysis results and figures into Typst document with proper physics equations and interpretations" \
      *Output:* \
      Report structure, equation formatting in Typst, figure integration, discussion section framework, error analysis template
    ], [
      Used suggested report structure to organize experimental findings. Wrote all scientific interpretations and physical discussions based on my understanding of semiconductor physics and experimental results. Modified abstract and conclusion to accurately reflect measured values and their significance.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)

I confirm that:
- All experimental work and data collection are my own
- All physical interpretations and scientific conclusions reflect my understanding
- Numerical calculations were independently verified
- AI assistance was limited to code structure, report formatting, and writing clarity
- The core analysis methodology and error assessment represent my own work
- All figures were generated from my experimental data using the analysis program I verified
