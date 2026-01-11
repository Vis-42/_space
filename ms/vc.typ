#set page(
  paper: "us-letter",
  margin: (top: 0.4in, bottom: 0.4in, left: 0.4in, right: 0.4in)
)

#set text(
  font: "New Computer Modern",
  size: 10pt,
  fill: black
)

#set par(
  justify: true,
  leading: 0.45em
)

// Header
#text(size: 18pt, weight: "bold")[Parth Bhargava]\
#v(0em)
+65 9121 7298 | Singapore | bhargava.parth07\@gmail.com \
https://github.com/Vis-42 | https://vis-42.github.io/ | linkedin.com/in/parth-bhargava-6819b124a/

#v(0.25em)

// Section header function
#let section_header(title) = {
  text(size: 10.5pt, weight: "bold")[#title]
  v(-0.5em)
  line(length: 100%, stroke: 0.8pt)
  v(-0.5em)
}

#let cv-entry(title, details, date) = [
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    gutter: 0.1em,
    [#text(weight: "bold", font: "New Computer Modern")[#title]],
    [#text(style: "italic", size: 10pt, font: "New Computer Modern", fill: gray.darken(20%))[#date]]
  )
  #details
]

// EDUCATION
#section_header("EDUCATION")

#cv-entry(
  "National University of Singapore",
  [
    Bachelor of Science in Physics (Honors, Distinction) #h(1fr)
    *GPA: 4.43*
  ],
  "Aug 2024 -- May 2028"
)

#v(0.1em)

// COURSEWORK
#section_header("COURSEWORK")

*Experimental Physics:*
- Measured *carrier mobility* and type in semiconductors via *Hall effect*; cross-validated through *magnetoresistance analysis* (R² > 0.99); identified *intrinsic transition temperature* at 106°C; comprehensive error propagation and uncertainty analysis
- Determined *lattice constants* via *X-ray diffraction* with sub-2% accuracy; applied *structural fingerprinting* and *Bragg's law* to identify unknown crystal phases (KBr); validated *Kramers theory* for bremsstrahlung cutoff; extracted Planck's constant from voltage measurements
- Calibrated *Helmholtz field configuration*; validated *five independent scaling laws* (R² > 0.997); quantified uncertainty in field constant to *3.3%* through cross-method comparison; corrected mathematical error in diameter dependence (T ∝ d² vs T ∝ d)
- Characterized *electron spin resonance* in paramagnetic systems; extracted *g-factors* and analyzed *hyperfine interactions*; measured resonance frequencies and determined spin parameters
- Analyzed *laser light propagation* through optical media; measured *diffraction patterns*, beam characteristics, and intensity profiles; studied interference phenomena and optical properties

*Theoretical & Computational:*
- *Mechanics:* Lagrangian and Hamiltonian formulations, coupled ODEs, variational principles, phase space dynamics, canonical transformations
- *Electromagnetism:* Maxwell's equations, boundary-value problems, vector calculus, gauge theory, electromagnetic waves and radiation
- *Quantum Mechanics:* Schrödinger equation, operator methods, eigenvalue problems, perturbation theory, angular momentum, spin
- *Mathematical Methods:* Linear algebra, ODEs/PDEs, Fourier analysis, complex analysis, special functions, Green's functions, Sturm-Liouville theory
- *Computation:* Python, Julia, C++; numerical methods (finite differences, Runge-Kutta), data analysis, visualization, Monte Carlo methods
- *Experimental Methods:* Statistical analysis, uncertainty propagation, calibration, regression, error budgets, residual analysis, weighted averaging

#v(0.1em)

// PROJECTS
#section_header("PROJECTS")

#cv-entry(
  "Quantum Wavepacket Visualization",
  [
    #text(style: "italic")[Developed interactive visualizations of quantum phenomena in Python using numerical methods]
    - *3D simulation* of a quantum wavepacket traversing a potential barrier; implemented time-dependent Schrödinger equation solver with finite difference methods
    - *Quantum harmonic oscillator* dynamics; visualization of energy eigenstates, probability densities, and time evolution
    - Interactive parameter controls for barrier height, width, and initial wavepacket momentum; publication-quality plots with proper normalization
  ],
  "Jan 2025 -- Mar 2025"
)

#v(0.1em)

// ACHIEVEMENTS
#section_header("ACHIEVEMENTS")

- *BITSAT: 321/390*, strong proficiency in Physics, Chemistry, and Mathematics
- *JEE Mains: 99.14 percentile* (Top 1% of 2 million candidates)
- *JEE Advanced Rank: 9112*, exceptional problem-solving abilities
- Awarded *Silver Medal* in International Aerospace Olympiad 2024
- *IISER Aptitude Test Rank: 357*

#v(0.1em)

// INTERESTS
#section_header("INTERESTS")

- *Complex Systems & Nonlinear Dynamics:* Emergence, collective behavior, and how simple rules generate complex patterns across scales; chaos theory, bifurcations, attractors
- *Network Science & Information Theory:* Information flow, network structures, and connections between abstract mathematics and physical systems; graph theory, entropy, information geometry
- *Computational Modeling:* Simulation, geometric intuition, and bridging theoretical frameworks with numerical methods; fluid dynamics, pattern formation, multi-scale modeling
