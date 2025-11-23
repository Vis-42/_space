// Modern Typst Academic Template
// Leverages modern community packages and follows Typst best practices

// Required package imports
#import "@preview/ctheorems:1.1.3": *
#import "@preview/showybox:2.0.4": *
#import "@preview/physica:0.9.5": *
#import "@preview/unify:0.4.3": qty, num, unit
#import "@preview/tablex:0.0.8": tablex, hlinex, vlinex
#import "@preview/lovelace:0.3.0": *
#import "@preview/delimitizer:0.1.0": *

// Show theorem rules
#show: thmrules

// =============================================================================
// COLOR DEFINITIONS
// =============================================================================

#let colors = (
  // Primary colors from LaTeX template
  myg: rgb("#388C46"),
  myb: rgb("#2D6FB1"),
  myr: rgb("#C74440"),
  myp: rgb("#C55CD4"),
  mygr: rgb("#2C3338"),
  myred: rgb("#7F0000"),
  myyellow: rgb("#A97945"),

  // PROFESSIONAL DESIGN SYSTEM - Semantic Color Groups
  // Shared neutral backgrounds for consistency
  bg-light: rgb("#F8F9FA"),         // Primary light background
  bg-white: rgb("#FFFFFF"),         // Pure white for high contrast
  border-light: rgb("#E1E8ED"),     // Subtle borders

  // Mathematical/Formal Group - Blue family (authority, logic, proofs)
  theorem-fg: rgb("#1565C0"),       // Deep blue - authoritative
  lemma-fg: rgb("#1976D2"),         // Medium blue - supporting
  proposition-fg: rgb("#1E88E5"),   // Lighter blue - propositions
  corollary-fg: rgb("#42A5F5"),     // Light blue - derived results
  proof-fg: rgb("#546E7A"),         // Blue-gray - logical reasoning

  // Educational Group - Green/Gray family (learning, practice)
  exercise-fg: rgb("#2C3E50"),      // Keep original - works perfectly
  exercise-bg: rgb("#F8F9FA"),      // Light background for exercises
  solution-fg: rgb("#2F7D32"),      // Keep refined green
  solution-bg: rgb("#F8F9FA"),      // Light background for solutions
  example-fg: rgb("#388E3C"),       // Educational green
  definition-fg: rgb("#455A64"),    // Blue-gray for definitions

  // Informational Group - Neutral grays (information, notes)
  note-fg: rgb("#616161"),          // Medium gray
  insight-fg: rgb("#37474F"),       // Dark gray-blue
  historical-fg: rgb("#5D4037"),    // Warm brown-gray

  // Experimental Group - Teal family (science, discovery)
  experiment-fg: rgb("#00695C"),    // Dark teal
  application-fg: rgb("#00796B"),   // Medium teal
  significance-fg: rgb("#26A69A"),  // Light teal

  // Analytical Group - Purple family (analysis, computation)
  derivation-fg: rgb("#512DA8"),    // Deep purple
  approximation-fg: rgb("#7B1FA2"), // Purple-magenta
  challenge-fg: rgb("#C2185B"),     // Deep pink (challenging)

  // Interactive Group - Orange/Red family (attention, warnings)
  question-fg: rgb("#F57C00"),      // Orange - questions need attention
  warning-fg: rgb("#D32F2F"),       // Red - warnings/errors
  wrong-concept-fg: rgb("#D32F2F"), // Red - warnings/errors (alias)

  // Algorithm - Special case
  algorithm-fg: rgb("#455A64"),     // Technical blue-gray

  // Additional environments
  claim-fg: rgb("#42A5F5"),         // Light blue - claims
  intuition-fg: rgb("#4CAF50"),     // Green - intuition
  keyresult-fg: rgb("#FF6F00")      // Amber - key results
)

// =============================================================================
// THEOREM ENVIRONMENTS USING CTHEOREMS
// =============================================================================

// Theorem - Professional mathematical authority design
#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: colors.bg-light,
  stroke: colors.theorem-fg.lighten(70%) + 1pt,
  radius: 4pt,
  inset: (x: 12pt, y: 8pt),
  titlefmt: text.with(weight: "bold", fill: colors.theorem-fg)
).with(numbering: none)

// Lemma - Supporting mathematical result
#let lemma = thmbox(
  "lemma",
  "Lemma",
  fill: colors.bg-light,
  stroke: colors.lemma-fg.lighten(70%) + 1pt,
  radius: 4pt,
  inset: (x: 12pt, y: 8pt),
  titlefmt: text.with(weight: "bold", fill: colors.lemma-fg)
).with(numbering: none)

// Proposition - Mathematical statement
#let proposition = thmbox(
  "proposition",
  "Proposition",
  fill: colors.bg-light,
  stroke: colors.proposition-fg.lighten(70%) + 1pt,
  radius: 4pt,
  inset: (x: 12pt, y: 8pt),
  titlefmt: text.with(weight: "bold", fill: colors.proposition-fg)
).with(numbering: none)

// Corollary - Derived mathematical result
#let corollary = thmbox(
  "corollary",
  "Corollary",
  fill: colors.bg-light,
  stroke: colors.corollary-fg.lighten(70%) + 1pt,
  radius: 4pt,
  inset: (x: 12pt, y: 8pt),
  titlefmt: text.with(weight: "bold", fill: colors.corollary-fg)
).with(numbering: none)

// Definition - Foundational concept explanation
#let definition(title, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Definition: #title],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.definition-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.definition-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Example - Educational demonstration
#let example = thmbox(
  "example",
  "Example",
  fill: colors.bg-light,
  stroke: colors.example-fg.lighten(70%) + 1pt,
  radius: 4pt,
  inset: (x: 12pt, y: 8pt),
  titlefmt: text.with(weight: "bold", fill: colors.example-fg),
  base: none
).with(numbering: none)

// Exercise using showybox with professional design principles
#let exercise(number, description, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Exercise #number: #description],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.exercise-fg,
    body-color: colors.exercise-bg,
    footer-color: colors.exercise-bg,
    border-color: colors.exercise-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Claim - Mathematical assertion
#let claim = thmbox(
  "claim",
  "Claim",
  fill: colors.bg-light,
  stroke: colors.claim-fg.lighten(70%) + 1pt,
  radius: 4pt,
  inset: (x: 12pt, y: 8pt),
  titlefmt: text.with(weight: "bold", fill: colors.claim-fg)
).with(numbering: none)

// Proof environment - styled box version
#let proof = thmproof(
  "proof",
  "Proof",
  titlefmt: text.with(weight: "bold", fill: colors.proof-fg, style: "italic")
)

// Alternative boxed proof environment
#let proofbox(body) = thmbox(
  "proofbox",
  "Proof",
  fill: colors.bg-light,
  stroke: (left: 2pt + colors.proof-fg),
  radius: 0pt,
  inset: (left: 8pt, right: 4pt, top: 4pt, bottom: 4pt),
  titlefmt: text.with(weight: "bold", fill: colors.proof-fg, style: "italic"),
  base: none
)[#body #h(1fr) $square$]

// Problem environment (custom implementation to avoid caption issues)
#let problem(title, body) = block(
  fill: white,
  stroke: (left: 2pt + black),
  radius: 0pt,
  inset: (left: 8pt, right: 4pt, top: 4pt, bottom: 4pt),
  breakable: true,
  [
    #text(weight: "bold")[Problem #title] #h(1fr)

    #body
  ]
)

// Question environment using showybox (similar to LaTeX question style)
#let question(title, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Question: #title],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.question-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.question-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Simple question box (quon equivalent)
#let quon(title, body) = showybox(
  title: title,
  title-style: (
    color: black,
    weight: "bold",
  ),
  frame: (
    title-color: white,
    body-color: white,
    border-color: black,
    radius: 0pt,
  ),
  stroke: (left: 2pt + black),
  body
)

// Solution environment with cohesive design system
#let solution(title: "Solution", body) = showybox(
  title: title,
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.solution-fg,
    body-color: colors.solution-bg,
    border-color: colors.solution-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Solution with custom title (solushun equivalent)
#let solushun(body) = [
  #set text(fill: colors.theorem-fg)
  #set par(hanging-indent: 2mm)
  #line(length: 100%, stroke: (paint: colors.theorem-fg, thickness: 0.5pt))
  *Solution:*

  #body
]

// Wrong Concept environment (error/warning style)
#let wrong-concept(title, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Wrong Concept: #title],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.warning-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.warning-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Theorem container (Theoremcon equivalent - just a simple box)
#let theoremcon(body) = rect(
  fill: colors.bg-light,
  stroke: (left: 2pt + colors.theorem-fg),
  radius: 0pt,
  inset: 8pt,
  body
)

// Note - Important information highlight
#let note(body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Note],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.note-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.note-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// =============================================================================
// ESSENTIAL MATH SHORTCUTS (Only commonly used ones)
// =============================================================================

// Vector notation shortcuts (commonly used)
#let vb(input) = $bold(input)$
#let vu(input) = $hat(input)$
#let va(input) = $arrow(input)$

// Common sets and fields
#let RR = $bb(R)$
#let CC = $bb(C)$
#let NN = $bb(N)$
#let ZZ = $bb(Z)$
#let QQ = $bb(Q)$

// Operators
#let dd = $dif$ // differential from physica
#let pp = $pdv$ // partial derivative from physica

// Delimiters (using mathtools-like syntax)
#let abs(input) = $lr(|input|)$
#let norm(input) = $lr(||input||)$
#let ceil(input) = $lr(⌈input⌉)$
#let floor(input) = $lr(⌊input⌋)$

// Expectation and variance
#let E = $op("E")$
#let Var = $op("Var")$
#let Cov = $op("Cov")$

// =============================================================================
// TEXT FORMATTING MACROS
// =============================================================================

// Line spacing control - Typst equivalent of LaTeX \doublespacing
// Just use: #set par(leading: 2em) anywhere in your document
// Examples:
// #set par(leading: 0.65em)  // normal/single spacing
// #set par(leading: 1.2em)   // 1.5x spacing
// #set par(leading: 2em)     // double spacing

// Underline text
#let ul(input) = underline(input)

// Highlight text with yellow background (default)
#let hl(input) = highlight(fill: yellow, radius: 3pt)[#input]

// Highlight text with specific colors
#let hlr(input) = highlight(fill: red.lighten(70%), radius: 3pt)[#input]      // red highlight
#let hlb(input) = highlight(fill: blue.lighten(70%), radius: 3pt)[#input]     // blue highlight
#let hlg(input) = highlight(fill: green.lighten(70%), radius: 3pt)[#input]    // green highlight
#let hlo(input) = highlight(fill: orange.lighten(70%), radius: 3pt)[#input]   // orange highlight
#let hlp(input) = highlight(fill: purple.lighten(70%), radius: 3pt)[#input]   // purple highlight
#let hly(input) = highlight(fill: yellow, radius: 3pt)[#input]               // yellow highlight

// =============================================================================
// FIGURE HELPERS
// =============================================================================

// Simple figure wrapper with proper numbering
#let fig(image-content, width: 70%, border: false) = align(center, {
  let img = if type(image-content) == str {
    image(image-content, width: width)
  } else {
    box(width: width, image-content)
  }

  if border {
    box(stroke: 0.5pt, img)
  } else {
    img
  }
})

// Figure helper for SVG files (compatibility with old at.typ)
#let incfig(name, width: auto) = figure(
  image("./figures/" + name + ".svg", width: width),
  supplement: [Figure]
)

// Boxed figure with caption inside the box
// Boxed figure with caption inside the box
// image-path should be relative to project root (e.g., "hall_effect/plots/image.png")
#let boxfig(image-path, width: 75%, box-width: auto, caption-text) = {
  // Resolve path relative to project root by going up from shared/ directory
  let resolved-path = if image-path.starts-with("/") {
    image-path  // Already absolute
  } else {
    "../" + image-path  // Make relative to shared/ directory
  }

  figure(
    align(center, box(
      width: if box-width == auto { width } else { box-width },
      stroke: 0.5pt,
      inset: 8pt,
      [
        #align(center, image(resolved-path, width: width))
        #v(0.5em)
        #line(length: 103%, stroke: 0.25pt)
        #v(0.3em)
        #align(center)[Figure #context counter(figure).display(): #caption-text]
      ]
    ))
  )
}

// Algorithm - Procedural instructions
#let algorithm(title: "Algorithm", body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[#title],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.algorithm-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.algorithm-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// =============================================================================
// DECORATIVE FOOTER HELPER
// =============================================================================

#let decorative-footer(decorative: true) = context {
  let page-num = counter(page).get().first()
  if decorative {
    align(center)[
      #text(6pt)[♦ #h(0.3em) ——————————— #h(0.3em) ♦] \
      #text(10pt, str(page-num))
    ]
  } else {
    align(center)[
      #text(10pt, str(page-num))
    ]
  }
}

// =============================================================================
// MAIN TEMPLATE FUNCTION
// =============================================================================

#let ad(
  title: "Document Title",
  author: "Author Name",
  course: none,
  experiment: none,
  show-title-page: false,
  title-page: false,  // Alternative parameter name for compatibility
  show-contents: false,  // Toggle for table of contents
  decorative: true,  // Toggle for decorative footer elements
  date: datetime.today(),
  body
) = {

  // Page setup with A4 and custom margins
  set page(
    paper: "a4",
    margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm),
    footer: decorative-footer(decorative: decorative),
    footer-descent: 0.5cm
  )

  // Font and text settings - 11pt New Computer Modern
  set text(
    font: "New Computer Modern",
    size: 11pt,
    lang: "en"
  )

  // Paragraph settings - normal academic spacing
  set par(
    justify: true,
    first-line-indent: 0em,
    leading: 0.65em
  )

  // Heading numbering
  set heading(numbering: "1.1")

  // Equation numbering (disabled by default - enable manually with #set math.equation(numbering: "(1)") when needed)
  // set math.equation(numbering: "(1)")

  // Lists with LaTeX-tight spacing
  set enum(numbering: "1.a.i.")
  set list(indent: 1em)

  // Normal heading spacing and smaller font sizes
  show heading: set block(above: 1.4em, below: 0.8em)
  show heading.where(level: 1): set text(size: 14pt, weight: "bold")
  show heading.where(level: 2): set text(size: 12pt, weight: "bold")
  show heading.where(level: 3): set text(size: 11pt, weight: "bold")

  // Tighter spacing for figures
  show figure: set block(above: 1em, below: 1em)

  // Tighter spacing for equations
  show math.equation: set block(above: 0.8em, below: 0.8em)

  // Enhanced math formatting for better readability
  // Note: Manual fraction sizing with frac() in document works best
  // Template provides good baseline math formatting

  // Title page (optional) - support both parameter names
  if show-title-page or title-page {
    page(
      margin: 2cm,
      [
        #align(center)[
          #text(size: 24pt, weight: "bold", title)

          #v(1cm)

          #text(size: 14pt, fill: rgb("#4A5568"), author)

          #if course != none and course != "" [
            #v(0.5cm)
            #text(size: 12pt, fill: rgb("#C53030"), course)
          ]

          #v(0.5cm)
          #if experiment != none and experiment != "" [
            #text(size: 12pt, fill: rgb("#805AD5"), experiment) #text(size: 12pt, fill: rgb("#718096"), " · " + date.display("[month repr:long] [day], [year]"))
          ] else [
            #text(size: 12pt, fill: rgb("#718096"), date.display("[month repr:long] [day], [year]"))
          ]
        ]
      ]
    )
    pagebreak()
  } else {
    // Inline header for non-title-page documents
    align(center)[
      #text(size: 20pt, weight: "bold", title)
      #if author != "" [
        #v(0.3em)
        #text(size: 12pt, fill: rgb("#4A5568"), author)
      ]
      #if course != none and course != "" [
        #v(0.2em)
        #text(size: 11pt, fill: rgb("#C53030"), course)
      ]
      #v(0.2em)
      #if experiment != none and experiment != "" [
        #text(size: 11pt, fill: rgb("#805AD5"), experiment) #text(size: 11pt, fill: rgb("#718096"), " · " + date.display("[month repr:long] [day], [year]"))
      ] else [
        #text(size: 11pt, fill: rgb("#718096"), date.display("[month repr:long] [day], [year]"))
      ]
      #v(0.8em)
    ]
  }

  // Table of contents (optional)
  if show-contents {
    outline(title: "Contents", depth: 3, indent: true)
    pagebreak()
  }

  // Document body
  body
}

// =============================================================================
// PHYSICS-SPECIFIC ENVIRONMENTS
// =============================================================================

// Physical significance environment
#let significance(title, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Significance: #title],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.significance-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.significance-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Physical intuition environment
#let intuition(title, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Physical Intuition: #title],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.intuition-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.intuition-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Application environment for real-world applications
#let application(title, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Application: #title],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.application-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.application-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Experiment environment for experimental descriptions
#let experiment(title, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Experiment: #title],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.experiment-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.experiment-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Historical context environment
#let historical(title, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white, style: "italic")[Historical Note: #title],
  title-style: (
    color: white,
    weight: "bold",
    style: "italic",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.historical-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.historical-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Key result environment for important physics results
#let keyresult(title, body) = showybox(
  title: text(size: 11pt, weight: "bold", fill: white)[Key Result: #title],
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 4pt, top-right: 4pt, bottom-right: 0pt, bottom-left: 0pt),
      inset: (x: 12pt, y: 8pt),
    )
  ),
  frame: (
    title-color: colors.keyresult-fg,
    body-color: colors.bg-light,
    footer-color: colors.bg-light,
    border-color: colors.keyresult-fg.lighten(70%),
    radius: 4pt,
    thickness: 1pt,
  ),
  breakable: true,
  body
)

// Derivation environment for step-by-step mathematical work
#let derivation(title, body) = showybox(
  title: "Derivation: " + title,
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 0pt, top-right: 5pt, bottom-right: 0pt, bottom-left: 0pt),
    )
  ),
  frame: (
    title-color: rgb("#64748B"),
    body-color: rgb("#F8FAFC"),
    border-color: rgb("#64748B"),
    radius: 0pt,
  ),
  body
)

// Approximation environment for limiting cases and approximations
#let approximation(title, body) = showybox(
  title: "Approximation: " + title,
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 0pt, top-right: 5pt, bottom-right: 0pt, bottom-left: 0pt),
    )
  ),
  frame: (
    title-color: rgb("#EC4899"),
    body-color: rgb("#FDF2F8"),
    border-color: rgb("#EC4899"),
    radius: 0pt,
  ),
  body
)

// Challenge environment for difficult problems
#let challenge(title, body) = showybox(
  title: "Challenge: " + title,
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 0pt, top-right: 5pt, bottom-right: 0pt, bottom-left: 0pt),
    )
  ),
  frame: (
    title-color: rgb("#D97706"),
    body-color: rgb("#FEF7E3"),
    border-color: rgb("#D97706"),
    radius: 0pt,
  ),
  body
)

// Insight environment for key insights
#let insight(title, body) = showybox(
  title: "Insight: " + title,
  title-style: (
    color: white,
    weight: "bold",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 0pt, top-right: 5pt, bottom-right: 0pt, bottom-left: 0pt),
    )
  ),
  frame: (
    title-color: rgb("#0369A1"),
    body-color: rgb("#E0F2FE"),
    border-color: rgb("#0369A1"),
    radius: 0pt,
  ),
  shadow: (
    offset: 2pt,
    color: rgb("#0369A1").lighten(70%)
  ),
  body
)

// =============================================================================
// CONVENIENCE SHORTCUTS FOR ALL ENVIRONMENTS (matching LaTeX preamble)
// =============================================================================

// Theorem environments (matching LaTeX shortcuts exactly)
#let thm(title, body) = theorem(title)[#body]
#let cor(title, body) = corollary(title)[#body]
#let mlenma(title, body) = lemma(title)[#body]  // matches \mlenma from preamble
#let mer(number, description, body) = exercise(number, description, body)  // matches \mer from preamble
#let mprop(title, body) = proposition(title)[#body]  // matches \mprop from preamble
#let clm(title, label, body) = claim(title)[#body] // matches 3-arg \clm from preamble
#let ex(title, body) = example(title)[#body]

// Definition shortcuts
#let dfn(title, body) = definition(title)[#body]   // matches \dfn from preamble
#let dfnc(title, body) = definition(title)[#body]  // matches \dfnc from preamble

// Question and problem environments
#let qs(title, body) = question(title)[#body]      // matches \qs from preamble
#let pbm(title, body) = problem(title)[#body]      // matches \pbm from preamble (questtion)
#let pex(title, body) = quon(title)[#body]         // matches \pex from preamble (quon)

// Solution environments
#let sol(body) = solushun[#body]                   // matches \sol from preamble (solushun)

// Wrong concept
#let wc(title, body) = wrong-concept(title)[#body] // matches \wc from preamble

// Theorem container
#let thmcon(body) = theoremcon[#body]              // matches \thmcon from preamble

// Proof shortcuts
#let pf(body) = proof[#body]                       // matches \pf from preamble
#let pfbox(body) = proofbox[#body]                 // boxed proof shortcut

// Note shortcut
#let nt(body) = note[#body]                        // matches \nt from preamble

// Additional shortcuts for commonly used patterns
#let lem(title, body) = lemma(title)[#body]        // standard lemma shortcut
#let prop(title, body) = proposition(title)[#body] // standard proposition shortcut
#let exer(number, description, body) = exercise(number, description, body)    // standard exercise shortcut
#let cl(title, body) = claim(title)[#body]         // standard claim shortcut (2-arg version)

// Compatibility aliases
#let algo = algorithm  // alias for lovelace compatibility if needed

// =============================================================================
// PHYSICS ENVIRONMENT SHORTCUTS
// =============================================================================

// Physics environment shortcuts
#let sig(title, body) = significance(title)[#body]
#let intui(title, body) = intuition(title)[#body]
#let app(title, body) = application(title)[#body]
#let exp(title, body) = experiment(title)[#body]
#let hist(title, body) = historical(title)[#body]
#let keyres(title, body) = keyresult(title)[#body]
#let deriv(title, body) = derivation(title)[#body]
#let approx(title, body) = approximation(title)[#body]
#let chal(title, body) = challenge(title)[#body]
#let ins(title, body) = insight(title)[#body]

// Alternative names for physics environments
#let physical-intuition(title, body) = intuition(title)[#body]
#let key-result(title, body) = keyresult(title)[#body]
#let historical-note(title, body) = historical(title)[#body]

// =============================================================================
// BOXED MATH MACRO
// =============================================================================

// Boxed math - centered wrapper for display equations
// NOTE: Use as #boxed[$ ... $] where $ ... $ is on its own line to get display style
#let boxed(
  stroke: 1pt + black,
  fill: none,
  radius: 4pt,
  inset: 12pt,
  body
) = {
  align(center, block(
    stroke: stroke,
    fill: fill,
    radius: radius,
    inset: inset,
    breakable: false,
    body
  ))
}
