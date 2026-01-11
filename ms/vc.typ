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

// PROJECTS
#section_header("PROJECTS")

#cv-entry(
  "Quantum Wavepacket Visualization",
  [
    #text(style: "italic")[Developed interactive visualizations of quantum phenomena in Python]
    - 3D simulation of a quantum wavepacket traversing a potential barrier
    - Quantum harmonic oscillator dynamics
  ],
  "Jan 2025 -- Mar 2025"
)

#v(0.15em)

// COURSEWORK
#section_header("COURSEWORK")

#grid(
  columns: (auto, 2em, 1fr),
  align: (left, left),
  gutter: 0.5em,
  [*Classical Mechanics:*], [], [Lagrangian and Hamiltonian formulations, coupled ODEs, variational principles],
  [*Electromagnetism:*], [], [Maxwell's equations, boundary-value problems, vector calculus],
  [*Quantum Mechanics:*], [], [Schrödinger equation, operator methods, eigenvalue problems],
  [*Mathematical Methods:*], [], [Linear algebra, ODEs/PDEs, Fourier analysis, complex analysis],
  [*Programming:*], [], [Python/Java, algorithmic problem-solving, debugging],
  [*Experimental Physics:*], [], [Experimental design, statistical data analysis, uncertainty estimation]
)
#v(0.15em)

// SKILLS
#section_header("SKILLS")

#grid(
  columns: (auto, 2em, 1fr),
  align: (left, left),
  gutter: 0.5em,
  [*Programming Languages:*], [], [Python, C++, C, SQL, Julia],
  [*Frameworks, Libraries & Tools:*], [], [Matplotlib, Git, PyTorch, LaTeX, Typst]
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

- *Computational Physics and Machine Learning:* Physics-informed neural networks, scientific computing, and data-driven approaches to modeling complex physical systems
- *Experimental and Theoretical Integration:* Laboratory techniques in condensed matter physics, instrumentation development, and bridging experimental data with computational models
