// Academic Typst Presentation Template (atp.typ)
// Math-heavy, figure-heavy, well-designed slides inspired by at.typ
// Simplified approach for reliable functionality

// Required package imports
#import "@preview/ctheorems:1.1.3": *
#import "@preview/showybox:2.0.4": *
#import "@preview/physica:0.9.5": *
#import "@preview/unify:0.4.3": qty, num, unit
#import "@preview/tablex:0.0.8": tablex, hlinex, vlinex
#import "@preview/lovelace:0.3.0": *
#import "@preview/delimitizer:0.1.0": *

// =============================================================================
// COLOR DEFINITIONS (Adapted for presentations)
// =============================================================================

#let colors = (
  // Primary colors from at.typ template
  myg: rgb("#388C46"),
  myb: rgb("#2D6FB1"),
  myr: rgb("#C74440"),
  myp: rgb("#C55CD4"),
  mygr: rgb("#2C3338"),
  myred: rgb("#7F0000"),
  myyellow: rgb("#A97945"),

  // Presentation-optimized theorem environment colors
  theorem-bg: rgb("#F8F9FF"),
  theorem-fr: rgb("#1E3A8A"),
  lemma-bg: rgb("#FFFEF7"),
  lemma-fr: rgb("#B45309"),
  prop-bg: rgb("#F0FDFF"),
  prop-fr: rgb("#0F3460"),
  example-bg: rgb("#F0FFFE"),
  example-fr: rgb("#0D9488"),
  example-ti: rgb("#0D9488"),
  definition-bg: rgb("#FEF2F2"),
  definition-fr: rgb("#DC2626"),
  exercise-bg: rgb("#F0FDF4"),
  exercise-fg: rgb("#059669"),
  note-bg: rgb("#F5F5F5"),
  note-fr: rgb("#525252"),
  proof-bg: rgb("#FAFAFA"),
  proof-fr: rgb("#374151"),

  // Presentation theme colors
  primary: rgb("#2D6FB1"),
  secondary: rgb("#388C46"),
  accent: rgb("#C74440"),
  text: rgb("#1F2937"),
  light-gray: rgb("#F9FAFB"),

  // Physics-specific environment colors
  challenge-bg: rgb("#FEF7E3"),
  challenge-fr: rgb("#D97706"),
  insight-bg: rgb("#E0F2FE"),
  insight-fr: rgb("#0369A1"),
  significance-bg: rgb("#ECFDF5"),
  significance-fr: rgb("#059669"),
  application-bg: rgb("#F3E8FF"),
  application-fr: rgb("#7C3AED"),
  experiment-bg: rgb("#F0FDFA"),
  experiment-fr: rgb("#0D9488"),
  historical-bg: rgb("#FEF3E2"),
  historical-fr: rgb("#EA580C"),
  keyresult-bg: rgb("#FFFBEB"),
  keyresult-fr: rgb("#D97706"),
  intuition-bg: rgb("#F0FDF4"),
  intuition-fr: rgb("#16A34A"),
  derivation-bg: rgb("#F8FAFC"),
  derivation-fr: rgb("#64748B"),
  approximation-bg: rgb("#FDF2F8"),
  approximation-fr: rgb("#EC4899")
)

// =============================================================================
// SLIDE-OPTIMIZED THEOREM ENVIRONMENTS
// =============================================================================

// Show theorem rules
#show: thmrules

// Function to create slide-friendly theorem boxes
#let slide-thmbox(
  identifier,
  head,
  fill: white,
  stroke: none,
  inset: 12pt,
  titlefmt: auto,
  bodyfmt: auto,
  separator: [:]
) = thmbox(
  identifier,
  head,
  fill: fill,
  stroke: stroke,
  radius: 8pt,
  inset: inset,
  titlefmt: if titlefmt == auto { text.with(weight: "bold", size: 1em) } else { titlefmt },
  bodyfmt: if bodyfmt == auto { text.with(size: 1em) } else { bodyfmt },
  separator: separator
).with(numbering: none)

// Theorem environments optimized for slides
#let theorem(title, body) = showybox(
  title: "Theorem: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 1em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.theorem-fr,
    body-color: colors.theorem-bg,
    footer-color: colors.theorem-bg,
    border-color: colors.theorem-fr,
    radius: 8pt,
  ),
  body
)

#let lemma(title, body) = showybox(
  title: "Lemma: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 1em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.lemma-fr,
    body-color: colors.lemma-bg,
    footer-color: colors.lemma-bg,
    border-color: colors.lemma-fr,
    radius: 8pt,
  ),
  body
)

#let proposition(title, body) = showybox(
  title: "Proposition: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 1em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.prop-fr,
    body-color: colors.prop-bg,
    footer-color: colors.prop-bg,
    border-color: colors.prop-fr,
    radius: 8pt,
  ),
  body
)

#let corollary(title, body) = showybox(
  title: "Corollary: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 1em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.myp,
    body-color: colors.myp.lighten(95%),
    footer-color: colors.myp.lighten(95%),
    border-color: colors.myp,
    radius: 8pt,
  ),
  body
)

#let example(title, body) = showybox(
  title: "Example: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 1em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.example-fr,
    body-color: colors.example-bg,
    footer-color: colors.example-bg,
    border-color: colors.example-fr,
    radius: 8pt,
  ),
  body
)

#let exercise(title, body) = showybox(
  title: "Exercise: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 1em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.exercise-fg.darken(20%),
    body-color: colors.exercise-bg,
    footer-color: colors.exercise-bg,
    border-color: colors.exercise-fg,
    radius: 8pt,
  ),
  body
)

#let claim(title, body) = showybox(
  title: "Claim: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 1em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.myg,
    body-color: colors.myg.lighten(95%),
    footer-color: colors.myg.lighten(95%),
    border-color: colors.myg,
    radius: 8pt,
  ),
  body
)

// Slide-optimized definition box
#let definition(title, body) = showybox(
  title: "Definition: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 10pt, top-right: 10pt, bottom-right: 0pt, bottom-left: 10pt),
    )
  ),
  frame: (
    title-color: colors.definition-fr,
    body-color: colors.definition-bg,
    footer-color: colors.definition-bg,
    border-color: colors.definition-fr,
    radius: 8pt,
  ),
  body
)

// Slide-optimized proof environment
#let proof = thmproof(
  "proof",
  "Proof",
  titlefmt: text.with(weight: "bold", fill: colors.proof-fr, style: "italic", size: 0.95em)
)

// Alternative boxed proof for emphasis
#let proofbox(body) = showybox(
  title: "Proof",
  title-style: (
    color: colors.proof-fr,
    weight: "bold",
    style: "italic",
    size: 0.95em,
  ),
  frame: (
    title-color: colors.proof-bg,
    body-color: colors.proof-bg.lighten(50%),
    border-color: colors.proof-fr.lighten(60%),
    radius: 8pt,
  ),
  [#body #h(1fr) $square$]
)

// Note box for slides
#let note(body) = showybox(
  title: "Note",
  title-style: (
    color: colors.note-fr,
    weight: "bold",
    align: center,
    size: 0.95em,
  ),
  frame: (
    title-color: colors.note-bg,
    body-color: colors.note-bg.lighten(30%),
    border-color: colors.note-fr.lighten(40%),
    radius: 10pt,
  ),
  shadow: (
    offset: 3pt,
    color: colors.note-fr.lighten(70%)
  ),
  body
)

// Alert box for important information
#let alert(title: "Important", body) = showybox(
  title: title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
  ),
  frame: (
    title-color: colors.accent,
    body-color: colors.accent.lighten(95%),
    border-color: colors.accent,
    radius: 8pt,
  ),
  body
)

// Question environment using showybox (similar to at.typ)
#let question(title, body) = showybox(
  title: "Question: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 0pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 0pt),
    )
  ),
  frame: (
    title-color: colors.myb.darken(20%),
    body-color: white,
    border-color: colors.myb.darken(20%),
    radius: 8pt,
  ),
  body
)

// Simple question box (quon equivalent)
#let quon(title, body) = showybox(
  title: title,
  title-style: (
    color: black,
    weight: "bold",
    size: 0.95em,
  ),
  frame: (
    title-color: white,
    body-color: white,
    border-color: black,
    radius: 8pt,
  ),
  stroke: (left: 3pt + black),
  body
)

// Solution environment
#let solution(body) = showybox(
  title: "Solution",
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 0pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 0pt),
    )
  ),
  frame: (
    title-color: colors.myg.darken(20%),
    body-color: white,
    border-color: colors.myg.darken(20%),
    radius: 8pt,
  ),
  body
)

// Solution with custom title (solushun equivalent)
#let solushun(body) = [
  #set text(fill: colors.theorem-fr, size: 0.95em)
  #set par(hanging-indent: 3mm)
  #line(length: 100%, stroke: (paint: colors.theorem-fr, thickness: 1pt))
  *Solution:*

  #body
]

// Wrong Concept environment
#let wrong-concept(title, body) = showybox(
  title: "Wrong Concept: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
  ),
  frame: (
    title-color: colors.myr,
    body-color: white,
    border-color: colors.myr,
    radius: 8pt,
  ),
  body
)

// Problem environment
#let problem(title, body) = block(
  fill: white,
  stroke: (left: 3pt + black),
  radius: 8pt,
  inset: 12pt,
  breakable: true,
  [
    #text(weight: "bold", size: 0.95em)[Problem #title] #h(1fr)
    #v(0.5em)
    #body
  ]
)

// =============================================================================
// PHYSICS-SPECIFIC ENVIRONMENTS
// =============================================================================

// Challenge environment for difficult problems
#let challenge(title, body) = showybox(
  title: "Challenge: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.challenge-fr,
    body-color: colors.challenge-bg,
    footer-color: colors.challenge-bg,
    border-color: colors.challenge-fr,
    radius: 8pt,
  ),
  body
)

// Insight environment for key insights
#let insight(title, body) = showybox(
  title: "Insight: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.insight-fr,
    body-color: colors.insight-bg,
    footer-color: colors.insight-bg,
    border-color: colors.insight-fr,
    radius: 8pt,
  ),
  shadow: (
    offset: 2pt,
    color: colors.insight-fr.lighten(70%)
  ),
  body
)

// Significance environment for explaining importance
#let significance(title, body) = showybox(
  title: "Significance: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.significance-fr,
    body-color: colors.significance-bg,
    footer-color: colors.significance-bg,
    border-color: colors.significance-fr,
    radius: 8pt,
  ),
  body
)

// Application environment for real-world applications
#let application(title, body) = showybox(
  title: "Application: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.application-fr,
    body-color: colors.application-bg,
    footer-color: colors.application-bg,
    border-color: colors.application-fr,
    radius: 8pt,
  ),
  body
)

// Experiment environment for experimental descriptions
#let experiment(title, body) = showybox(
  title: "Experiment: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.experiment-fr,
    body-color: colors.experiment-bg,
    footer-color: colors.experiment-bg,
    border-color: colors.experiment-fr,
    radius: 8pt,
  ),
  body
)

// Historical Note environment
#let historical(title, body) = showybox(
  title: "Historical Note: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    style: "italic",
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.historical-fr,
    body-color: colors.historical-bg,
    footer-color: colors.historical-bg,
    border-color: colors.historical-fr,
    radius: 8pt,
  ),
  body
)

// Key Result environment for important results
#let keyresult(title, body) = showybox(
  title: "Key Result: " + title,
  title-style: (
    color: colors.keyresult-fr.darken(20%),
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.keyresult-bg,
    body-color: colors.keyresult-bg.lighten(30%),
    footer-color: colors.keyresult-bg.lighten(30%),
    border-color: colors.keyresult-fr,
    radius: 8pt,
  ),
  stroke: (all: 2pt + colors.keyresult-fr),
  shadow: (
    offset: 3pt,
    color: colors.keyresult-fr.lighten(70%)
  ),
  body
)

// Physical Intuition environment
#let intuition(title, body) = showybox(
  title: "Physical Intuition: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.intuition-fr,
    body-color: colors.intuition-bg,
    footer-color: colors.intuition-bg,
    border-color: colors.intuition-fr,
    radius: 8pt,
  ),
  body
)

// Derivation environment for step-by-step work
#let derivation(title, body) = showybox(
  title: "Derivation: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.derivation-fr,
    body-color: colors.derivation-bg,
    footer-color: colors.derivation-bg,
    border-color: colors.derivation-fr,
    radius: 8pt,
  ),
  body
)

// Approximation environment for limiting cases
#let approximation(title, body) = showybox(
  title: "Approximation: " + title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt, bottom-right: 0pt, bottom-left: 8pt),
    )
  ),
  frame: (
    title-color: colors.approximation-fr,
    body-color: colors.approximation-bg,
    footer-color: colors.approximation-bg,
    border-color: colors.approximation-fr,
    radius: 8pt,
  ),
  body
)

// =============================================================================
// MATH SHORTCUTS AND PHYSICS NOTATION (Same as at.typ)
// =============================================================================

// Vector notation shortcuts
#let vb = $bold$
#let vu = $hat$
#let va = $arrow$

// Common sets and fields
#let RR = $bb(R)$
#let CC = $bb(C)$
#let NN = $bb(N)$
#let ZZ = $bb(Z)$
#let QQ = $bb(Q)$

// Operators
#let dd = $dif$ // differential from physica
#let pp = $pdv$ // partial derivative from physica

// Delimiters
#let abs(x) = $lr(|x|)$
#let norm(x) = $lr(||x||)$
#let ceil(x) = $lr(⌈x⌉)$
#let floor(x) = $lr(⌊x⌋)$

// Statistics
#let E = $op("E")$
#let Var = $op("Var")$
#let Cov = $op("Cov")$

// =============================================================================
// FIGURE HELPERS FOR PRESENTATIONS
// =============================================================================

// Main figure function for slides - larger and more prominent
#let fig(image-content, width: 70%, box-width: auto, caption: none, placement: auto) = {
  let container-width = if box-width == auto { width } else { box-width }

  if caption == none {
    align(center, block(
      width: container-width,
      align(center)[
        #if type(image-content) == str {
          image(image-content, width: width)
        } else if "width" in image-content.fields() {
          image-content
        } else {
          box(width: width, image-content)
        }
      ]
    ))
  } else {
    figure(
      block(
        width: container-width,
        align(center)[
          #if type(image-content) == str {
            image(image-content, width: width)
          } else {
            image-content
          }
        ]
      ),
      caption: text(size: 0.9em, caption),
      placement: placement,
      supplement: [Figure]
    )
  }
}

// Two-column figure layout
#let twofig(img1, img2, cap1: "", cap2: "", width: 45%) = grid(
  columns: 2,
  gutter: 1.5em,
  figure(
    if type(img1) == str { image(img1, width: width) } else { img1 },
    caption: text(size: 0.85em, cap1)
  ),
  figure(
    if type(img2) == str { image(img2, width: width) } else { img2 },
    caption: text(size: 0.85em, cap2)
  )
)

// Figure with custom positioning for slides
#let sidefig(image-path, caption-text, width: 40%, side: left) = {
  let img = figure(
    if type(image-path) == str { image(image-path, width: width) } else { image-path },
    caption: text(size: 0.85em, caption-text)
  )

  if side == left {
    grid(columns: (1fr, 1.5fr), gutter: 1.5em, img, [])
  } else {
    grid(columns: (1.5fr, 1fr), gutter: 1.5em, [], img)
  }
}

// Boxed figure for emphasis
#let boxfig(image-path, width: 70%, caption-text) = align(center, box(
  stroke: 1.5pt + colors.primary.lighten(50%),
  radius: 8pt,
  inset: 15pt,
  [
    #if type(image-path) == str { image(image-path, width: width) } else { image-path }
    #v(0.5em)
    #line(length: 100%, stroke: 1pt + colors.primary.lighten(60%))
    #v(0.4em)
    #text(size: 0.95em, weight: "medium")[#caption-text]
  ]
))

// SVG figure helper (compatibility)
#let incfig(name, width: 70%) = figure(
  image("./figures/" + name + ".svg", width: width),
  supplement: [Figure]
)

// =============================================================================
// SLIDE LAYOUT HELPERS
// =============================================================================

// Two-column slide layout
#let two-col(left-content, right-content, split: 50%) = grid(
  columns: (split, 100% - split),
  gutter: 2em,
  left-content,
  right-content
)

// Three-column layout
#let three-col(content1, content2, content3) = grid(
  columns: 3,
  gutter: 1.5em,
  content1,
  content2,
  content3
)

// Centered content block
#let center-block(content) = align(center + horizon, content)

// Highlight box for key equations or results
#let highlight(content, color: colors.primary) = rect(
  fill: color.lighten(95%),
  stroke: 2pt + color.lighten(30%),
  radius: 10pt,
  inset: 1.2em,
  align(center, text(size: 0.95em, content))
)

// Algorithm environment
#let algorithm(title: "Algorithm", body) = showybox(
  title: title,
  title-style: (
    color: white,
    weight: "bold",
    size: 0.95em,
    boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 8pt, top-right: 8pt),
    )
  ),
  frame: (
    title-color: colors.myb,
    body-color: rgb("#FAFAFA"),
    border-color: colors.myb,
    radius: 8pt
  ),
  body
)

// =============================================================================
// MAIN TEMPLATE FUNCTION
// =============================================================================

#let atp(
  title: "Presentation Title",
  subtitle: none,
  author: "Your Name",
  institution: none,
  date: datetime.today(),
  body
) = {

  // Page setup for presentation (16:9 aspect ratio)
  set page(
    paper: "presentation-16-9",
    margin: (x: 2cm, y: 1.5cm),
    header: [],
    footer: context align(right)[
      #text(size: 10pt, fill: colors.primary.lighten(40%))[
        #author · #date.display("[month repr:short] [year]") · #counter(page).display()
      ]
    ]
  )

  // Configure text settings for presentations
  set text(
    font: "New Computer Modern",
    size: 20pt, // Base size for presentations
    lang: "en"
  )

  // Larger heading sizes for slides
  show heading.where(level: 1): set text(size: 1.4em, weight: "bold", fill: colors.primary)
  show heading.where(level: 2): set text(size: 1.2em, weight: "bold", fill: colors.secondary)
  show heading.where(level: 3): set text(size: 1.05em, weight: "bold")

  // Better spacing for slide content
  set par(leading: 0.8em, spacing: 1.2em)
  set list(indent: 1.2em, spacing: 1em)
  set enum(indent: 1.2em, spacing: 1em)

  // Larger equation display
  set math.equation(numbering: none)
  show math.equation: set text(size: 1em)
  show math.equation: set block(above: 1.2em, below: 1.2em)

  // Title slide
  page[
    #align(center + horizon)[
      #text(size: 2.0em, weight: "bold", fill: colors.primary)[#title]

      #if subtitle != none [
        #v(1em)
        #text(size: 1.2em, fill: colors.secondary)[#subtitle]
      ]

      #v(2em)
      #text(size: 1.05em, weight: "medium")[#author]

      #if institution != none [
        #v(0.5em)
        #text(size: 0.85em)[#institution]
      ]

      #v(1em)
      #text(size: 0.75em, style: "italic", fill: colors.text.lighten(30%))[
        #date.display("[month repr:long] [day], [year]")
      ]
    ]
  ]

  // Document body
  body
}

// =============================================================================
// CONVENIENCE SHORTCUTS (Matching at.typ style)
// =============================================================================

// Theorem environments
#let thm(title, body) = theorem(title)[#body]
#let lem(title, body) = lemma(title)[#body]
#let prop(title, body) = proposition(title)[#body]
#let cor(title, body) = corollary(title)[#body]
#let ex(title, body) = example(title)[#body]
#let exer(title, body) = exercise(title)[#body]
#let cl(title, body) = claim(title)[#body]

// Definition and proofs
#let dfn(title, body) = definition(title)[#body]
#let pf(body) = proof[#body]
#let pfbox(body) = proofbox[#body]

// Notes and alerts
#let nt(body) = note[#body]
#let important(body) = alert[#body]

// LaTeX-style compatibility shortcuts (matching at.typ exactly)
#let mlenma(title, body) = lemma(title)[#body]
#let mer(title, body) = exercise(title)[#body]
#let mprop(title, body) = proposition(title)[#body]
#let clm(title, label, body) = claim(title)[#body] // 3-arg version
#let dfnc(title, body) = definition(title)[#body]

// Question and solution environments
#let qs(title, body) = question(title)[#body]
#let pbm(title, body) = problem(title)[#body]
#let pex(title, body) = quon(title)[#body]
#let sol(body) = solushun[#body]
#let wc(title, body) = wrong-concept(title)[#body]

// Algorithm alias
#let algo = algorithm

// =============================================================================
// PHYSICS-SPECIFIC SHORTCUTS
// =============================================================================

// Physics environment shortcuts
#let chal(title, body) = challenge(title)[#body]
#let ins(title, body) = insight(title)[#body]
#let sig(title, body) = significance(title)[#body]
#let app(title, body) = application(title)[#body]
#let exp(title, body) = experiment(title)[#body]
#let hist(title, body) = historical(title)[#body]
#let keyres(title, body) = keyresult(title)[#body]
#let intui(title, body) = intuition(title)[#body]
#let deriv(title, body) = derivation(title)[#body]
#let approx(title, body) = approximation(title)[#body]

// Alternative names for physics environments
#let physical-intuition(title, body) = intuition(title)[#body]
#let key-result(title, body) = keyresult(title)[#body]
#let historical-note(title, body) = historical(title)[#body]

// =============================================================================
// SLIDE-SPECIFIC HELPERS
// =============================================================================

// Basic slide function for content
#let slide(title: none, body) = {
  if title != none {
    page[
      #text(size: 1.3em, weight: "bold", fill: colors.secondary)[== #title]
      #v(1em)
      #body
    ]
  } else {
    page[#body]
  }
}

// Section break slide
#let section-slide(title) = page[
  #align(center + horizon)[
    #text(size: 2.3em, weight: "bold", fill: colors.primary)[#title]
    #v(1em)
    #line(length: 60%, stroke: 3pt + colors.secondary)
  ]
]

// Focus slide for key points
#let focus-slide(content) = page[
  #rect(
    fill: colors.primary,
    width: 100%,
    height: 100%,
    inset: 0pt,
    [
      #align(center + horizon)[
        #text(size: 2em, weight: "bold", fill: white)[
          #content
        ]
      ]
    ]
  )
]
