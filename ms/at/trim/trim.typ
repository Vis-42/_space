#import "../shared/_at.typ": *

#show: ad.with(
  title: "Interaction of Ions with Matter:\nComputer Simulations",
  author: "Parth Bhargava · A0310667E",
  experiment: "Experiment A",
  course: "PC3193 \n Experimental Physics II",
  title-page: false
)

#show link: underline

#set math.equation(numbering: "(1)")

#let project(title) = heading(
  level: 1,
  numbering: none
)[#text(size: 15pt, weight: "bold", fill: colors.myg.darken(25%))[#title]]

= Abstract

TRIM (Transport of Ions in Matter) simulations were used to study ion transport, energy loss, damage production, and sputtering across six applied problems spanning nuclear microscopy, semiconductor implantation, surface science, and radiation therapy. The report follows the six prescribed parts of the practical and addresses each question directly. Each section includes a brief discussion/conclusion and improvement points, and all TRIM diagrams are placed in the Appendix and referenced from the main text.

= Introduction

TRIM is a Monte Carlo simulation framework for ion transport in matter. It follows an ion step-by-step, using conservation of energy and momentum to decide how much energy is transferred to electrons and nuclei at each collision. Repeating this many times produces the measurable distributions: how far the ion travels (range), how much that range varies (straggling), how much damage is created (vacancies), how much material is ejected (sputter yield), and where energy is deposited. These outputs are the same physical quantities that define depth resolution in IBIC, implant profiles in semiconductors, erosion rates in SIMS, and dose shaping in proton therapy.

== Interdisciplinary Motivation
The manual moves from fundamentals to applications. At the microscopic level, every ion loses energy through collisions and leaves behind a distribution of energy, defects, and displaced atoms. At the macroscopic level, those same distributions become the quantities we care about: image resolution and damage in IBIC, depth and disorder in implantation, erosion rate in sputtering, and dose placement in therapy. Each project therefore uses the same basic physics to answer a different practical question.

= Theory

== Stopping and Energy Loss
An ion entering a target must lose energy as it travels. That energy is transferred mainly to electrons (ionization and excitation) and to nuclei (elastic collisions). The rate of energy loss per unit distance is the stopping power,

$ S = - dv(E, x) = S_"e" + S_"n" $ <stopping-power>

At high velocities, interactions with the electron cloud are more effective, so $S_"e"$ dominates and the ion loses energy gradually. As the ion slows, elastic nuclear collisions become more probable and $S_"n"$ rises, producing displacement cascades and vacancies. Because $S$ increases toward the end of the track, energy deposition peaks near the end of range (the Bragg peak), and damage tends to be largest in the same region.

== Range and Straggling
Each collision is random, so two identical ions do not stop at exactly the same depth. The mean range $R$ is the average stopping depth, while the spread around it is the straggling. Longitudinal straggling $Delta R$ quantifies uncertainty along the beam direction, and radial straggling $Delta r$ quantifies lateral spread caused by multiple scattering. These uncertainties set depth resolution, lateral resolution, and dose precision.

= Methods

== Simulation Workflow
Each problem was simulated in TRIM by selecting the ion, energy, and target definition prescribed in the manual. A Monte Carlo run tracks many ion trajectories to produce averaged depth profiles and statistical spreads. The workflow is:
- Define ion species, energy, and incidence (normal incidence unless specified).
- Define target layers, thicknesses, and densities (auto density for standard materials).
- Choose the calculation mode appropriate to the physics (Demo, Full Damage Cascades, or Sputtering).
- Run with sufficient ions to stabilize averages and export TRIM text tables.

== Data Products and Analysis
TRIM outputs were exported as raw text tables and used directly for all reported values:
- `TDATA.txt` for mean range, straggling, and vacancy per ion.
- `IONIZ.txt`, `VACANCY.txt`, and `E2RECOIL.txt` for depth-resolved profiles.
- `LATERAL.txt` for radial and projected lateral spread.
These tables were parsed to generate plots and to compute the key values quoted in each section. All figures appear in the Appendix and are referenced from the main text.

This practical consists of six parts. The first two are short guided exercises in TRIM setup. Parts 3-6 address applications.

#project("Particle Beam Weapons (1 GeV protons in air)")
#set heading(numbering: none)

High-energy beams are discussed in terms of range and hazard zones. This part links those ideas to where energy is deposited and how the beam spreads.

== Aim
Determine the proton range and beam spread in air, then use those values to define a safe standoff distance and identify where exposure is most severe.

== Physical Context
At GeV energies the proton moves very fast, so each collision removes only a small fraction of its energy and the range is long. As the proton slows, the stopping power rises, so energy deposition increases toward the end of range. That is why the terminal region is the hazard zone. Meanwhile, repeated small-angle scattering accumulates over kilometers, which sets the beam radius and therefore the width of the hazard zone.

== TRIM Setup
- Calculation mode: Demo (as recommended)
- Ion: Proton (H)
- Energy: 1 GeV
- Target: Air (standard composition, density auto)
- Outputs requested: range, longitudinal straggling, radial straggling, range distribution
- Ions simulated: 5,000

== Questions and Answers
*(a) What is the range in air of a 1 GeV proton beam?*

The simulated mean range is *2.95 km*. This long range follows from dominant electronic stopping in air, so energy is lost steadily over kilometers.

*(b) What is the radius of the particle beam at the end of range (radial straggling)?*

The radial straggling at the end of range is *41.3 m*. Multiple scattering broadens the beam laterally, so the hazard zone is a wide cylinder rather than a line.

*(c) What is a minimum safe distance from the end of range?*

A conservative safety distance is the mean range plus a few longitudinal straggling widths. Using $R + 3 Delta R$, this is roughly *3.06 km*. A practical minimum is about *3.1 km*.

*(d) Are you safer at the end of range or closer to the source?*

Closer to the source is safer. The stopping power increases near the end of range, so the terminal region receives higher dose for the same fluence.

*(e) Plot the relevant graphs.*

The ion distribution plot is shown in Appendix @fig:s1-range. The lateral spread plot is shown in Appendix @fig:s1-straggling.

== Discussion and Conclusion
The 2.95 km range and 41.3 m radial straggling show that a 1 GeV proton beam travels far but also spreads to a wide hazard cylinder. Using the measured $R$ and $Delta R$ gives a safe standoff of about 3.1 km, and the rising stopping power near end‑of‑range makes that terminal region the most severe exposure zone. The appendix plots directly show the depth distribution and lateral spread that justify these estimates.

== Improvements
- Increase ion count to reduce statistical noise in straggling estimates.
- Validate air composition and density against lab conditions.
- Cross-check with SRIM range tables for sanity.

== Appendix Plots
See Appendix figures @fig:s1-range and @fig:s1-straggling.

#set heading(numbering: "1.1")
#project("Proton Ranges in Beryllium (10 MeV)")
#set heading(numbering: none)

This exercise builds intuition for how material properties control penetration depth and beam broadening.

== Aim
Measure the range and straggling of 10 MeV protons in Be and relate these values to depth precision and lateral spread in a dense solid.

== Physical Context
In Be the density is far higher than in air, so collisions occur more frequently and the range is much shorter for the same ion energy. Because each ion follows a different collision history, the end-of-range position is smeared by longitudinal straggling, while cumulative scattering produces radial straggling. Both are direct consequences of discrete, random collisions.

== TRIM Setup
- Calculation mode: Demo
- Ion: Proton (H)
- Energy: 10 MeV
- Target: Beryllium (solid, density auto)
- Outputs requested: range distribution and straggling
- Ions simulated: 5,000

== Questions and Answers
*(a) What is the range of 10 MeV protons in beryllium?*

The simulated range is *803 μm*. The short range reflects stronger stopping in a dense solid.

*(b) What is the longitudinal (range) straggling?*

The longitudinal straggling is *11.7 μm*. This sets the depth resolution for any application that depends on where ions stop.

*(c) What is the radial straggling at end of range?*

The radial straggling is *13.0 μm*, indicating modest lateral spread relative to the range.

*(d) Plot the relevant diagrams.*

Ion distribution and transverse spread plots are in Appendix @fig:s2-range and @fig:s2-straggling.

== Discussion and Conclusion
The measured range (803 μm) and straggling (11.7 μm longitudinal, 13.0 μm radial) show that 10 MeV protons stop within a sub‑millimeter depth with only a few‑percent spread. That means good depth precision and limited lateral blur in a dense solid like Be. The appendix plots visualize this narrow end‑of‑range region and the modest transverse spread that follow from the data.

== Improvements
- Use manual depth plotting to view full trajectory, not only end-of-range.
- Compare with 10 MeV in Si for material dependence.

== Appendix Plots
See Appendix figures @fig:s2-range and @fig:s2-straggling.

#set heading(numbering: "1.1")
#project("Nuclear Microscopy (IBIC in Silicon, 2 MeV protons)")
#set heading(numbering: none)

IBIC relies on ion-induced charge to image active regions inside devices. The physics question is how deep information can be extracted before damage overwhelms the signal.

== Aim
Estimate the IBIC depth limit in Si using 2 MeV protons and locate the damage peak that limits usable signal.

== Physical Context
In IBIC, the signal comes from electron–hole pairs created by ionization along the track, so more ionization means more charge to collect. However, those same ions also create defects, and defect density rises where nuclear stopping becomes strong. As a result, the usable depth is limited by the region before damage peaks, because trapping centers reduce charge collection.

== TRIM Setup
- Calculation mode: Full Damage Cascades
- Ion: Proton (H)
- Energy: 2 MeV
- Target: Silicon (solid, density auto)
- Outputs requested: range profile, straggling, vacancy vs depth, energy loss vs depth
- Ions simulated: 10,000

== Questions and Answers
*(a) What is the depth limit for IBIC information (range of 2 MeV protons in Si)?*

The range is *48.2 μm*, so IBIC information is accessible up to this depth.

*(b) What is the range straggling?*

The longitudinal straggling is *1.19 μm*, which sets the depth resolution.

*(c) What is the radial straggling at end of range?*

The radial straggling is *2.33 μm*, setting the lateral spread at depth.

*(d) At what depth does maximum damage occur, and why?*

Maximum damage occurs near *48 μm*, close to the end of range. Nuclear stopping rises as the ion slows, increasing elastic collisions and vacancy production. This damage peak is a physical limit for IBIC because excessive defects reduce charge collection.

*(e) Plot the relevant diagrams.*

Ion distribution is in Appendix @fig:s3-range. Ionization, vacancy, and recoil-energy plots are in @fig:s3-energy-loss, @fig:s3-damage, and @fig:s3-e2recoil.

== Discussion and Conclusion
The 48.2 μm range sets the deepest layer that can be probed, while the damage peak near the end of range limits how close to that depth one can reliably collect charge. The ionization curve shows where signal is generated, and the vacancy profile shows where defects begin to dominate. Together they define a practical IBIC window that ends before the damage maximum, as seen in the appendix plots.

== Improvements
- Increase number of ions to stabilize vacancy depth profile.
- Compare electronic vs nuclear stopping curves to explain damage peak.

== Appendix Plots
See Appendix figures @fig:s3-range, @fig:s3-damage, and @fig:s3-energy-loss.

#set heading(numbering: "1.1")
#project("Implantation (200 keV B in Si)")
#set heading(numbering: none)

Ion implantation is central to semiconductor doping. The same stopping physics sets the dopant profile and the lattice damage that must later be repaired.

== Aim
Compare depth distribution and damage for 200 keV B and 200 keV H in Si to illustrate implantation tradeoffs between shallow doping and lattice disorder.

== Physical Context
At the same energy, a heavier ion moves more slowly and transfers more momentum in elastic collisions. That makes nuclear stopping stronger, so the ion stops sooner and creates denser damage cascades. The ion distribution therefore tells us where dopants are placed, while the vacancy profile tells us how much lattice disorder must later be annealed.

== TRIM Setup
- Calculation mode: Full Damage Cascades
- Ion 1: Boron (B), 200 keV
- Ion 2: Proton (H), 200 keV (comparison run)
- Target: Silicon
- Outputs requested: ion distribution vs depth, vacancies vs depth
- Ions simulated: 10,000 (B) and 10,000 (H)

== Questions and Answers
*(a) What is the depth distribution of 200 keV boron ions in Si? How does it compare to 200 keV protons?*

For boron, the projected range is *0.569 μm* with straggling *0.105 μm*. For protons, the range is *1.85 μm* with straggling *0.110 μm*. Boron stops earlier because of stronger nuclear stopping, giving a shallower dopant profile.

*(b) What is the damage incurred and how does it compare?*

Boron produces high damage: $7.95 times 10^2$ vacancies per ion. Protons produce $2.13 times 10^1$ vacancies per ion. The larger boron damage follows from higher momentum transfer and denser collision cascades, implying a stronger need for post‑implant annealing.

*(c) Plot relevant diagrams.*

The boron ion distribution is in Appendix @fig:s4-boron-depth. The vacancy comparison plot is in Appendix @fig:s4-damage.

== Discussion and Conclusion
At 200 keV, boron stops much shallower (0.569 μm) than protons (1.85 μm) while producing far more vacancies ($7.95 × 10^2$ vs $2.13 × 10^1$ per ion). This directly shows the implantation tradeoff: shallow dopant placement comes with higher lattice disorder and a stronger need for annealing. The appendix plots show the depth localization and the relative damage for both ions.

== Improvements
- Include channeling effects if crystal orientation is known.
- Test a range of energies to map implantation depth control.

== Appendix Plots
See Appendix figures @fig:s4-boron-depth and @fig:s4-damage.

#set heading(numbering: "1.1")
#project("Sputtering (SIMS on GaAs with Ar)")
#set heading(numbering: none)

Surface analysis and focused ion beam machining depend on sputter yield. This section links collision cascades to how efficiently atoms are ejected from the surface.

== Aim
Find the Ar energy that maximizes sputter yield for GaAs and compare yields at that energy for H and Au.

== Physical Context
Sputtering requires momentum transfer to atoms near the surface. If the ion energy is too low, surface atoms are not knocked out; if it is too high, most energy is deposited deeper and fewer atoms escape. This creates an optimum at intermediate energy. Ion mass controls momentum transfer in elastic collisions, so heavier ions generally give higher sputter yields at the same energy.

== TRIM Setup
- Calculation mode: Sputtering
- Ion: Argon (Ar)
- Energies: 1, 3, 10, 30, 100, 300, 1000 keV
- Target: GaAs (compound, stoichiometric)
- Comparison runs: Proton and Gold at the optimum energy
- Outputs requested: sputter yield, energy dependence plot
- Ions simulated: 5000 for each run

== Questions and Answers
*(a) What Ar beam energy gives the greatest sputter yield?*

The maximum sputter yield occurs at *30 keV* from the Ar energy sweep.

*(b) How does the optimum sputter yield compare with protons of the same energy?*

At 30 keV, the proton sputter yield is much lower than Ar. The H plot shows a small near-surface peak and a low total integral compared with Ar.

*(c) How does the optimum sputter yield compare with gold atoms of the same energy?*

At 30 keV, gold produces a much higher sputter yield than Ar. The Au plot shows a larger near-surface peak and higher integral yield across energy.

*(d) Plot relevant diagrams.*

The Ar energy sweep plots are in Appendix @fig:s5-1kev, @fig:s5-3kev, @fig:s5-10kev, @fig:s5-30kev, @fig:s5-100kev, @fig:s5-300kev, and @fig:s5-1000kev. The 30 keV comparisons for H and Au are in Appendix @fig:s5-h30 and @fig:s5-au30.

== Discussion and Conclusion
The sweep shows a clear yield maximum at 30 keV, consistent with the need to deposit momentum near the surface rather than too deep. At that energy, the comparison plots show the expected mass trend: Au gives the highest yield, Ar is intermediate, and H is lowest because light ions transfer less momentum in elastic collisions. The appendix spectra capture both the optimum and the mass dependence.

== Improvements
- Separate Ga and As sputter yields to assess preferential sputtering.
- Add angular dependence if the beam incidence is not normal.

== Appendix Plots
See Appendix figures @fig:s5-1kev, @fig:s5-3kev, @fig:s5-10kev, @fig:s5-30kev, @fig:s5-100kev, @fig:s5-300kev, @fig:s5-1000kev, @fig:s5-h30, and @fig:s5-au30.

#set heading(numbering: "1.1")
#project("Ion Beam Radiation Treatment (Protons)")
#set heading(numbering: none)

In radiation therapy, the goal is dose shaping: concentrate energy at the tumor while sparing healthy tissue. Proton stopping makes this possible through the Bragg peak.

== Aim
Select a proton energy that places the Bragg peak at the tumor center and quantify the dose advantage relative to traversed tissue.

== Physical Context
Dose is proportional to energy deposited per unit length, which TRIM reports as ionization. Because stopping power increases as the proton slows, ionization peaks near the end of range (the Bragg peak). By choosing the proton energy so that this peak sits at the tumor center, we maximize tumor dose while keeping entrance tissue dose lower.

== Geometry and Path Length
- Skin: 1 mm
- Skull: 4 mm
- Brain tissue before tumor: 3 mm
- Tumor diameter: 2 mm
- Tumor center depth: 9 mm from skin surface

== TRIM Setup
- Calculation mode: Full Damage Cascades or Quick (for depth-dose profile)
- Ion: Proton (H)
- Target: Layered stack (skin, bone, brain, tumor as tissue-equivalent)
- Outputs requested: ionization/energy deposition vs depth, range
- Ions simulated: 5,000

== Questions and Answers
*(a) What proton energy deposits maximum energy at the tumor center? What is the dose ratio?*

The energy is *36.85 MeV*. The ionization at the tumor center is *0.892 eV/(Å·ion)* and the mean ionization through traversed tissue (0–8 mm) is *0.353 eV/(Å·ion)*, giving a dose ratio of *2.53*.

*(b) Plot relevant diagrams.*

The ion distribution through the layered target is shown in Appendix @fig:s6-range. The ionization profile is shown in Appendix @fig:s6-depth-dose.

== Discussion and Conclusion
The chosen energy (36.85 MeV) places the Bragg peak at the tumor center, and the dose ratio of 2.53 quantifies how much higher the tumor dose is than the entrance region. This is the key advantage of proton therapy in layered tissue: dose is concentrated where the beam stops. The appendix plots show the depth‑dose peak aligned with the target in the assumed geometry.

== Improvements
- Use tissue-equivalent material compositions for each layer.
- Include beam broadening and lateral spread for realistic dose planning.

== Appendix Plots
See Appendix figures @fig:s6-depth-dose and @fig:s6-range.

#set heading(numbering: "1.1")

#pagebreak()

= Conclusion

The TRIM simulations map ion–matter interaction physics onto practical outcomes. The air and Be cases show how stopping power and multiple scattering set range and lateral spread. The Si IBIC case ties electronic stopping to charge collection limits and nuclear stopping to damage peaks near the end of range. Implantation results show how heavier ions stop earlier and generate larger vacancy densities, while protons penetrate deeper with lower damage. The sputtering study identifies a yield maximum at 30 keV and shows strong ion‑mass dependence at fixed energy. In the therapy case, the Bragg peak is placed at the tumor center and the dose ratio exceeds 2.5, demonstrating the dose‑shaping advantage of protons.

= References

1. J. F. Ziegler, J. P. Biersack, and U. Littmark, _The Stopping and Range of Ions in Solids_, Pergamon (1985).
2. TRIM / SRIM 2003 user manual (as provided in the practical handout).

= Appendix: TRIM Plots and Printouts

All TRIM diagrams requested in the manual are placed here.

#set figure(placement: none)

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

== Particle Beam Weapons Plots
#boxfig("trim/plots/part1_tp0.png", width: 80%, box-width: 90%, [Ion distribution (depth vs Y) for 1 GeV protons in air.]) <fig:s1-range>
#boxfig("trim/plots/part1_lateral.png", width: 80%, box-width: 90%, [Radial spread vs depth for 1 GeV protons in air.]) <fig:s1-straggling>

== Proton Ranges in Beryllium Plots
#boxfig("trim/plots/part2_tp0.png", width: 80%, box-width: 90%, [Ion distribution (depth vs Y) for 10 MeV protons in Be.]) <fig:s2-range>
#boxfig("trim/plots/part2_tp3.png", width: 65%, box-width: 80%, [Transverse view highlighting lateral spread in Be.]) <fig:s2-straggling>

== Nuclear Microscopy (IBIC) Plots
#boxfig("trim/plots/part3_tp0.png", width: 80%, box-width: 90%, [Ion distribution (depth vs Y) for 2 MeV protons in Si.]) <fig:s3-range>
#boxfig("trim/plots/part3_vacancy.png", width: 80%, box-width: 90%, [Vacancy production vs depth in Si (2 MeV protons).]) <fig:s3-damage>
#boxfig("trim/plots/part3_ionization.png", width: 80%, box-width: 90%, [Ionization vs depth in Si (2 MeV protons; ions left axis, recoils right axis).]) <fig:s3-energy-loss>
#boxfig("trim/plots/part3_e2recoil.png", width: 80%, box-width: 90%, [Energy to recoils vs depth in Si (2 MeV protons).]) <fig:s3-e2recoil>

== Implantation Plots
#boxfig("trim/plots/part4_depth_profile.png", width: 80%, box-width: 90%, [Depth profile for boron ions in Si (200 keV).]) <fig:s4-boron-depth>
#boxfig("trim/plots/part4_vacancy_compare.png", width: 80%, box-width: 90%, [Vacancy production vs depth for B and H in Si (200 keV).]) <fig:s4-damage>

== Sputtering Plots
#boxfig("trim/data/ss_part5/1kev.png", width: 85%, box-width: 95%, [Sputtering spectra for Ar on GaAs at 1 keV.]) <fig:s5-1kev>
#boxfig("trim/data/ss_part5/3kev.png", width: 85%, box-width: 95%, [Sputtering spectra for Ar on GaAs at 3 keV.]) <fig:s5-3kev>
#boxfig("trim/data/ss_part5/10kev.png", width: 85%, box-width: 95%, [Sputtering spectra for Ar on GaAs at 10 keV.]) <fig:s5-10kev>
#boxfig("trim/data/ss_part5/30kev.png", width: 85%, box-width: 95%, [Sputtering spectra for Ar on GaAs at 30 keV (optimum yield).]) <fig:s5-30kev>
#boxfig("trim/data/ss_part5/100kev.png", width: 85%, box-width: 95%, [Sputtering spectra for Ar on GaAs at 100 keV.]) <fig:s5-100kev>
#boxfig("trim/data/ss_part5/300kev.png", width: 85%, box-width: 95%, [Sputtering spectra for Ar on GaAs at 300 keV.]) <fig:s5-300kev>
#boxfig("trim/data/ss_part5/1000kev.png", width: 85%, box-width: 95%, [Sputtering spectra for Ar on GaAs at 1000 keV.]) <fig:s5-1000kev>
#boxfig("trim/data/ss_part5/H_30kev.png", width: 85%, box-width: 95%, [Sputtering spectra for H on GaAs at 30 keV.]) <fig:s5-h30>
#boxfig("trim/data/ss_part5/Au_30kev.png", width: 85%, box-width: 95%, [Sputtering spectra for Au on GaAs at 30 keV.]) <fig:s5-au30>

== Ion Beam Radiation Treatment Plots
#boxfig("trim/plots/part6_ionization.png", width: 85%, box-width: 95%, [Ionization vs depth for 36.85 MeV protons in layered tissue.]) <fig:s6-depth-dose>
#boxfig("trim/plots/part6_tp0.png", width: 70%, box-width: 95%, [Ion distribution (depth vs Y) through layered tissue; peak near tumor region.]) <fig:s6-range>

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
      "Help me navigate the TRIM software interface and export the required text tables (TDATA, RANGE, IONIZ, VACANCY, E2RECOIL, LATERAL). Provide simple guidance for converting those tables into plots and checking units." \
      *Output:* \
      Step-by-step software navigation tips, export checklist, and basic plotting guidance
    ], [
      Used for technical guidance on software usage and data export. I selected the parameters, ran the simulations, and verified all values against the raw TRIM outputs.
    ],
    table.hline(stroke: 2pt),
    [Claude Code], [
      *Prompt:* \
      "Help with Typst formatting for figures, captions, tables, and page breaks. Also check that file paths to plots are correct and the document compiles." \
      *Output:* \
      Typst formatting tips, page layout suggestions, and compile/debug hints
    ], [
      Used only for formatting and file-handling guidance. All experiment content, analysis, and interpretations were written and verified by me.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)
