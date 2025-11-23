# Deep Dive Analysis: Assignments Directory Structure and Content

## 📁 Directory Organization

### File Naming Convention
- **`cma#.typ`** = **C**lassical **M**echanics **A**ssignment # (major assignments, 1-6)
- **`cmw#.typ`** = **C**lassical **M**echanics **W**orksheet # (weekly worksheets, 4-24)
- **`mm2a2.typ`** = Special assignment (likely Mathematical Methods)

### Structure Pattern
```
assignments/
├── cma1.typ → cma1.pdf          # Major assignments (longer, more complex)
├── cma2.typ → cma2.pdf
├── ...
├── cmw4.typ → cmw4.pdf          # Weekly worksheets (shorter problems)
├── cmw5.typ → cmw5.pdf
├── ...
├── adv/                          # Advanced session materials (PDFs)
│   ├── PC3261-2025-Session-19.pdf
│   └── ...
└── Assignment_export/            # Exported assignment PDFs
```

---

## 🎨 Typst Setup and Template System

### Core Template Architecture

**Main Template:** `shared/_at.typ`
- Comprehensive academic template with 80+ functions
- Built on modern Typst packages:
  - `ctheorems` - Theorem environments
  - `showybox` - Styled boxes (definitions, solutions)
  - `physica` - Physics notation (differentials, derivatives)
  - `unify` - Unit formatting
  - `tablex` - Enhanced tables
  - `lovelace` - Algorithm typesetting
  - `delimitizer` - Mathematical delimiters

### Document Structure Pattern

Every assignment/worksheet follows this structure:

```typst
#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 12",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("5.7")[
  Problem statement...
]

#solution[
  Solution with detailed derivations...
]
```

### Key Template Features

1. **Problem Environment:** `#pbm("title")[body]`
   - Black-bordered box with "Problem" label
   - Used for all problem statements

2. **Solution Environment:** `#solution[body]`
   - Green-header box with white body
   - Used for complete solutions

3. **Mathematical Notation:**
   - `$vb(v)$` = bold vector (from `vb()`)
   - `$vu(e)_x$` = unit vector (from `vu()`)
   - `$dif x$` = differential (from physica)
   - `$dv(f, x)$` = total derivative (from physica)
   - `$pdv(f, x)$` = partial derivative (from physica)
   - `#boxed[$...$]` = boxed final answers

4. **Page Layout:**
   - A4 paper, 2cm margins
   - 11pt New Computer Modern font
   - Decorative footer with page numbers
   - Inline header (no separate title page)

---

## 📚 Course Content: PC3261 Classical Mechanics II

### Course Overview
**PC3261 Classical Mechanics II** - Advanced undergraduate classical mechanics course covering Lagrangian and Hamiltonian formulations, constraints, and advanced dynamics.

### Topic Progression (Inferred from Problem Numbers)

#### Early Topics (Worksheets 4-12)
- **Energy methods** (Worksheet 12: Problems 5.7-5.10)
  - Conservation of energy
  - First-order differential equations from energy
  - Inverted harmonic oscillator
  - Small amplitude oscillations

- **Particle dynamics** (Assignment 1)
  - Spiral trajectories
  - Projectile motion with drag
  - Electron in crossed fields
  - Motion on helical tracks

#### Mid Topics (Worksheets 13-19)
- **d'Alembert's principle** (Worksheet 14: Problems 6.4-6.6)
  - Constrained systems
  - Virtual displacements
  - Holonomic constraints
  - Atwood machine
  - Spring-mass systems

- **Lagrangian mechanics** (Worksheet 19: Problems 8.4-8.5)
  - Euler-Lagrange equations
  - Cycloidal pendulum (isochronous oscillator)
  - Motion on cone surfaces
  - Generalized coordinates
  - Cyclic coordinates and conservation laws

#### Advanced Topics (Worksheets 20-24)
- **Hamiltonian mechanics** (Worksheet 22: Problem 9.2)
  - Legendre transformation
  - Hamilton's equations
  - Central force problems in Hamiltonian form

- **Poisson brackets** (Worksheet 23: Problems 9.7-9.8)
  - Poisson bracket algebra
  - Angular momentum as generator of rotations
  - Constants of motion
  - Projectile motion in Hamiltonian formalism

### Problem Complexity Evolution

**Early Worksheets (4-12):**
- Single-particle dynamics
- Energy conservation methods
- Direct integration of equations of motion
- ~2-4 problems per worksheet

**Mid Worksheets (13-19):**
- Constrained systems
- Lagrangian formulation
- Multiple degrees of freedom
- ~2-3 problems per worksheet

**Advanced Worksheets (20-24):**
- Hamiltonian mechanics
- Phase space methods
- Poisson bracket algebra
- ~2-3 problems per worksheet

**Major Assignments (cma1-6):**
- Multi-part problems (a, b, c...)
- 20-35 points per problem
- Complex systems requiring multiple techniques
- 3-4 problems per assignment

---

## 🔬 Mathematical and Physical Concepts

### Core Mathematical Techniques

1. **Differential Equations**
   - First-order ODEs from energy conservation
   - Second-order ODEs from Newton's laws
   - Coupled systems (e.g., electron in crossed fields)
   - Nonlinear equations (e.g., projectile with drag)

2. **Coordinate Systems**
   - Cartesian: $(x, y, z)$
   - Polar: $(r, \phi)$
   - Cylindrical: $(\rho, \phi, z)$
   - Spherical: $(r, \theta, \phi)$
   - Generalized coordinates: $(q_1, q_2, \ldots)$

3. **Vector Calculus**
   - Position, velocity, acceleration vectors
   - Cross products for angular momentum
   - Curvature and torsion of curves
   - Gradient, divergence, curl (in advanced contexts)

4. **Calculus of Variations**
   - Euler-Lagrange equations
   - Action principle: $\delta \int L \, dt = 0$
   - Constrained variations

5. **Hamiltonian Formalism**
   - Legendre transformation: $H = \sum p_i \dot{q}_i - L$
   - Hamilton's equations:
     $$\dot{q}_i = \frac{\partial H}{\partial p_i}, \quad \dot{p}_i = -\frac{\partial H}{\partial q_i}$$
   - Poisson brackets: $\{f, g\} = \sum_i \left(\frac{\partial f}{\partial q_i}\frac{\partial g}{\partial p_i} - \frac{\partial f}{\partial p_i}\frac{\partial g}{\partial q_i}\right)$

### Physical Principles

1. **Conservation Laws**
   - Energy conservation: $E = T + U = \text{constant}$
   - Momentum conservation: $\dot{\mathbf{p}} = 0$ when $\mathbf{F} = 0$
   - Angular momentum: $\mathbf{L} = \mathbf{r} \times \mathbf{p}$ (conserved for central forces)

2. **Constraints**
   - Holonomic: $f(\mathbf{r}_1, \mathbf{r}_2, \ldots, t) = 0$
   - Non-holonomic: inequality or velocity-dependent
   - Virtual displacements: $\delta \mathbf{r}$ (compatible with constraints)

3. **d'Alembert's Principle**
   $$\sum_\alpha \left[\mathbf{F}_\alpha^{(A)} - m_\alpha \ddot{\mathbf{r}}_\alpha\right] \cdot \delta \mathbf{r}_\alpha = 0$$
   - Foundation for Lagrangian mechanics
   - Eliminates constraint forces from equations

4. **Lagrangian Mechanics**
   - Lagrangian: $L = T - U$ (kinetic minus potential energy)
   - Euler-Lagrange: $\frac{d}{dt}\left(\frac{\partial L}{\partial \dot{q}_i}\right) - \frac{\partial L}{\partial q_i} = 0$
   - Cyclic coordinates → conserved momenta

5. **Hamiltonian Mechanics**
   - Phase space: $(q_i, p_i)$ coordinates
   - Hamiltonian: $H(q, p, t) = \sum p_i \dot{q}_i - L$
   - Symplectic structure
   - Canonical transformations

### Example Problem Analysis

#### Problem 5.7 (Worksheet 12): Three-Particle System
**Physics:** Constrained motion with inextensible strings
**Math:** 
- Energy conservation: $E = T + U = 0$ (from initial conditions)
- Kinetic energy: $T = \frac{1}{2}m a^2 \dot{\theta}^2$
- Potential energy: $U = -2mg a \sin\theta$
- Result: $\dot{\theta}^2 - \frac{2g}{a}\sin\theta = 0$

**Key Insight:** Tension forces do zero work because they're parallel to the constraint (inextensible string).

#### Problem 9.7 (Worksheet 23): Poisson Bracket with Angular Momentum
**Physics:** Angular momentum generates rotations
**Math:**
- Poisson bracket: $\{\mathbf{r}, \mathbf{n} \cdot \mathbf{L}\}_{(q,p)}$
- Result: $\{\mathbf{r}, \mathbf{n} \cdot \mathbf{L}\} = \mathbf{n} \times \mathbf{r}$
- Physical meaning: Infinitesimal rotation by angle $\epsilon$ about axis $\mathbf{n}$

**Key Insight:** This connects symmetry (rotational invariance) to conservation (angular momentum) via Poisson bracket structure.

---

## ✍️ Writing Style and Workflow

### Solution Structure

Every solution follows a clear pattern:

1. **Setup/Given**
   - State coordinate system
   - Identify constraints
   - List initial conditions

2. **Derivation**
   - Step-by-step mathematical work
   - Clear justification for each step
   - Use of appropriate techniques (energy, Lagrangian, etc.)

3. **Final Answer**
   - Boxed final result: `#boxed[$...$]`
   - Often includes multiple parts (a, b, c...)

4. **Physical Interpretation** (when appropriate)
   - What the result means physically
   - Limiting cases
   - Connection to conservation laws

### Mathematical Rigor

- **Notation:** Consistent use of vector notation, differentials, derivatives
- **Derivations:** Complete, showing all steps
- **Boxed answers:** Final results clearly marked
- **Physical checks:** Units, limiting cases, conservation laws

### Example Workflow

```typst
#solution[
  *Setup:*
  
  [Coordinate system and initial conditions]
  
  *Derivation:*
  
  [Step-by-step mathematics]
  
  #boxed[$final result$]
  
  *Physical interpretation:*
  
  [What it means]
]
```

---

## 🎯 Key Observations

### Strengths of This Setup

1. **Consistency:** All documents use the same template, ensuring uniform formatting
2. **Modularity:** Shared template (`_at.typ`) allows easy updates across all documents
3. **Mathematical Typesetting:** Excellent support for physics notation via physica package
4. **Organization:** Clear naming convention makes it easy to find specific assignments
5. **Version Control:** Typst source files are human-readable and diff-friendly

### Topics Covered (Summary)

**Classical Mechanics II (PC3261) covers:**
- ✅ Particle dynamics in various coordinate systems
- ✅ Energy methods and conservation laws
- ✅ Constrained systems and d'Alembert's principle
- ✅ Lagrangian mechanics and Euler-Lagrange equations
- ✅ Hamiltonian mechanics and phase space
- ✅ Poisson brackets and symmetry
- ✅ Advanced applications (cycloidal pendulum, motion on surfaces, etc.)

### Mathematical Sophistication

The course progresses from:
- **Basic:** Single-particle Newtonian mechanics
- **Intermediate:** Constrained systems, Lagrangian methods
- **Advanced:** Hamiltonian formalism, Poisson brackets, symmetry principles

This represents a complete undergraduate course in analytical mechanics, covering the transition from Newtonian to Lagrangian to Hamiltonian formulations—the three pillars of classical mechanics.

---

## 📊 Statistics

- **Total Worksheets:** ~21 (cmw4 through cmw24)
- **Total Assignments:** 6 (cma1 through cma6)
- **Problems per Worksheet:** 2-4 typically
- **Problems per Assignment:** 3-4 typically
- **Total Problems:** ~80-100 problems across all documents

---

## 🔍 Technical Details

### Typst Compilation
```bash
typst compile --root . assignments/cmw12.typ assignments/cmw12.pdf
```

### Template Dependencies
All handled automatically via Typst's package system:
- `@preview/ctheorems:1.1.3`
- `@preview/showybox:2.0.4`
- `@preview/physica:0.9.5`
- `@preview/unify:0.4.3`
- `@preview/tablex:0.0.8`
- `@preview/lovelace:0.3.0`
- `@preview/delimitizer:0.1.0`

### File Organization
- Source files: `.typ` (Typst markup)
- Output files: `.pdf` (compiled documents)
- Images: Referenced from external directory (`../../../../_zss/`)
- Shared resources: `shared/_at.typ` (imported by all documents)

---

## 🎓 Conclusion

This assignments directory represents a well-organized, professionally typeset collection of classical mechanics problems and solutions. The use of Typst provides:

1. **Mathematical Excellence:** Superior typesetting for physics notation
2. **Consistency:** Uniform formatting across all documents
3. **Maintainability:** Easy to update template and regenerate all PDFs
4. **Readability:** Clean source code that's easy to understand and modify

The progression from basic dynamics through Lagrangian and Hamiltonian mechanics demonstrates a comprehensive understanding of analytical mechanics, with problems ranging from simple energy conservation to advanced Poisson bracket algebra.

---

**Author:** Analysis generated from codebase exploration  
**Date:** 2025  
**Course:** PC3261 Classical Mechanics II  
**Institution:** National University of Singapore

