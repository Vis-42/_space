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
  leading: 0.5em
)

// Header
#text(size: 18pt, weight: "bold")[Parth Bhargava]\
#v(0em)
+65 9121 7298 | Singapore | bhargava.parth07\@gmail.com \
https://github.com/Vis-42 | https://vis-42.github.io/ | linkedin.com/in/parth-bhargava-6819b124a/

#v(0.3em)

// Section header function
#let section_header(title) = {
  text(size: 10.5pt, weight: "bold")[#title]
  v(-0.6em)
  line(length: 100%, stroke: 0.8pt)
  v(-0.6em)
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

#v(0.15em)

// COURSEWORK
#section_header("COURSEWORK")

*Labwork:*
- Measured *carrier density* and *mobility* in n-type and p-type germanium via *Hall effect*; determined n-type: $n = 6.25 times 10^20$ m⁻³, $mu = 0.363$ m²/(V·s); p-type: $n = 8.60 times 10^20$ m⁻³, $mu = 0.287$ m²/(V·s); cross-validated mobility through *magnetoresistance* (R² > 0.99); observed *extrinsic→intrinsic transition* at 106°C via sign reversal
- Determined *LiF lattice constant* via *X-ray diffraction*: $d = 2.047 plus.minus 0.017$ Å (1.93% deviation); identified unknown crystal as *KBr* through structural fingerprinting: $d = 3.282 plus.minus 0.006$ Å (0.24% deviation); extracted *Planck's constant* from bremsstrahlung cutoff: $h = 8.7 times 10^(-34)$ J·s (31% deviation, limited by S/N)
- Calibrated *Helmholtz field constant* through five independent experiments: $c = 6.81 times 10^(-4)$ T·A⁻¹ (3.3% uncertainty); validated all *scaling laws* (R² > 0.997); determined unknown loop area: $110 plus.minus 4$ cm²; corrected diameter analysis using *quadratic fitting* (T ∝ d²)
- Characterized *electron spin resonance* in DPPH; extracted *g-factor*: $g = 1.905 plus.minus 0.025$ (4.9% deviation from free electron); validated frequency-field linearity (R² = 0.9995)
- Measured *Gaussian beam propagation* of He-Ne laser; determined *beam waist*: $W_0 = 0.394 plus.minus 0.008$ mm; *Rayleigh range*: $Z_R = 770 plus.minus 15$ mm (0.1% agreement with theory); beam quality: $M^2 = 1.08 plus.minus 0.05$; all intensity profiles fit Gaussian (R² > 0.998)

*Theory & Computation:*
- *Mechanics:* Lagrangian and Hamiltonian formulations, coupled ODEs, variational principles, phase space dynamics
- *Electromagnetism:* Maxwell's equations, boundary-value problems, vector calculus, gauge theory
- *Quantum Mechanics:* Schrödinger equation, operator methods, eigenvalue problems, perturbation theory
- *Mathematical Methods:* Linear algebra, ODEs/PDEs, Fourier analysis, complex analysis, special functions
- *Computation:* Python, Julia, C++; numerical methods (finite differences, Runge-Kutta), data analysis, visualization
- *Experimental Methods:* Statistical analysis, uncertainty propagation, calibration, regression, error budgets

#v(0.15em)

// PROJECTS
#section_header("PROJECTS")

#cv-entry(
  "Quantum Wavepacket Visualization",
  [
    #text(style: "italic")[Developed interactive visualizations of quantum phenomena in Python]
    - *3D simulation* of quantum wavepacket traversing potential barrier using finite difference methods
    - *Quantum harmonic oscillator* dynamics; visualization of energy eigenstates and time evolution
  ],
  "Jan 2025 -- Mar 2025"
)

#v(0.15em)

// ACHIEVEMENTS
#section_header("ACHIEVEMENTS")

- *BITSAT: 321/390*, strong proficiency in Physics, Chemistry, and Mathematics
- *JEE Mains: 99.14 percentile* (Top 1% of 2 million candidates)
- *JEE Advanced Rank: 9112*, exceptional problem-solving abilities
- Awarded *Silver Medal* in International Aerospace Olympiad 2024
- *IISER Aptitude Test Rank: 357*

#v(0.15em)

// INTERESTS
#section_header("INTERESTS")

- *Complex Systems & Nonlinear Dynamics:* Emergence, collective behavior, chaos theory, and how simple rules generate complex patterns across scales
- *Network Science & Information Theory:* Information flow, network structures, graph theory, and connections between abstract mathematics and physical systems
- *Computational Modeling:* Simulation, geometric intuition, and bridging theoretical frameworks with numerical methods
