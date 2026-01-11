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
- Measured *carrier type*, *density*, and *mobility* in n-type and p-type germanium via *Hall effect*; cross-validated mobility through independent *magnetoresistance analysis* (R² > 0.99); characterized *temperature-dependent transition* from extrinsic to intrinsic conduction at 106°C
- Determined *lattice constants* via *X-ray diffraction* using *Bragg's law*; achieved *sub-2% accuracy* for LiF and *0.24% deviation* for KBr identification through structural fingerprinting; extracted *Planck's constant* from bremsstrahlung cutoff analysis
- Calibrated *Helmholtz field constant* through five independent experimental methods with *3.3% uncertainty*; validated all *electromagnetic torque scaling laws* (R² > 0.997); determined unknown loop geometries via *magnetic moment measurements*; corrected mathematical model using *quadratic fitting* (T ∝ d² vs linear)
- Characterized *electron spin resonance* in paramagnetic systems; extracted *g-factors* from frequency-field relationships with excellent linearity (R² = 0.9995); analyzed *Zeeman splitting* and resonance conditions
- Measured *Gaussian beam propagation* and *spatial intensity profiles*; determined *beam waist* and *Rayleigh range* with *sub-1% agreement* to theoretical predictions; characterized *beam quality factor*; validated *Gaussian beam optics* model (R² > 0.998)

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
