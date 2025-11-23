# Modern Typst Academic Template

A comprehensive academic template for Typst that leverages modern community packages and follows Typst best practices. This template provides LaTeX-like functionality while being significantly more concise and readable.

## Features

- **Modern Package Integration**: Uses `ctheorems`, `showybox`, `physica`, `unify`, `tablex`, `lovelace`, and `delimitizer` packages
- **LaTeX-Compatible Layout**: A4 paper with 2cm margins on all sides
- **New Computer Modern Font**: 11pt with justified paragraphs and first-line indent
- **Comprehensive Theorem Environments**: Theorem, Lemma, Proposition, Corollary, Definition, Example, Exercise, Claim
- **Decorative Footer**: Custom footer with page numbers and optional decorative elements
- **Essential Math Shortcuts**: Common mathematical notation and operators using physica
- **Figure and Algorithm Helpers**: Easy figure insertion and algorithm formatting using showybox
- **Enhanced Color System**: Comprehensive color palette matching LaTeX styling

## Quick Start

```typst
#import "at.typ": *

#show: ad.with(
  title: "Your Document Title",
  author: "Your Name",
  course: "Course Name (optional)",
  experiment: "Lab/Assignment Name (optional)",
  show-title-page: false
)

= Introduction

Your content here...

#thm("Main Result")[
  Statement of your theorem.
]

#pf[
  Proof of your theorem.
]
```

## Package Requirements

The template automatically imports these packages:
- `@preview/ctheorems:1.1.3` - Theorem environments
- `@preview/showybox:2.0.4` - Colorful boxes and definitions  
- `@preview/physica:0.9.5` - Physics notation and derivatives
- `@preview/unify:0.4.3` - Unit formatting and quantities
- `@preview/tablex:0.0.8` - Enhanced table functionality
- `@preview/lovelace:0.3.0` - Algorithm typesetting
- `@preview/delimitizer:0.1.0` - Mathematical delimiter sizing

## Complete Environment Coverage

This template includes **ALL** environments from the original LaTeX preamble with identical shortcuts:

### Theorem Environments (LaTeX-Compatible Shortcuts)
- `#thm("Title", body)` - Theorem (matches `\thm`)
- `#cor("Title", body)` - Corollary (matches `\cor`)
- `#mlenma("Title", body)` - Lemma (matches `\mlenma`)
- `#mer("Title", body)` - Exercise (matches `\mer`)
- `#mprop("Title", body)` - Proposition (matches `\mprop`)
- `#clm("Title", "label", body)` - Claim with label (matches `\clm`)
- `#ex("Title", body)` - Example (matches `\ex`)

### Definition Environments
- `#dfn("Title", body)` - Definition (matches `\dfn`)
- `#dfnc("Title", body)` - Chapter Definition (matches `\dfnc`)

### Question and Problem Environments
- `#qs("Title", body)` - Question (matches `\qs`)
- `#pbm("Title", body)` - Problem (matches `\pbm`)
- `#pex("Title", body)` - Exercise Box (matches `\pex`)

### Solution Environments
- `#sol(body)` - Simple Solution (matches `\sol`)
- `#solution(body)` - Styled Solution Box

### Special Environments
- `#wc("Title", body)` - Wrong Concept (matches `\wc`)
- `#thmcon(body)` - Theorem Container (matches `\thmcon`)
- `#pf(body)` - Proof (matches `\pf`)
- `#nt(body)` - Note (matches `\nt`)

### Standard Shortcuts (Common Usage)
- `#lem("Title", body)` - Lemma (standard shortcut)
- `#prop("Title", body)` - Proposition (standard shortcut)
- `#exer("Title", body)` - Exercise (standard shortcut)
- `#cl("Title", body)` - Claim (2-argument version)

### Example Usage

```typst
#thm("Fundamental Theorem of Calculus")[
  If $f$ is continuous on $[a,b]$, then:
  $ integral_a^b f(x) dif x = F(b) - F(a) $
  where $F'(x) = f(x)$.
]

#pf[
  The proof follows from...
]
```

## Mathematical Shortcuts

### Common Sets
- `RR`, `CC`, `NN`, `ZZ`, `QQ` - Number systems
- `vb(v)` - Bold vectors (using `$bold$`)
- `vu(n)` - Unit vectors (using `$hat$`)
- `va(v)` - Arrow vectors (using `$arrow$`)

### Operators and Functions
- `abs(x)` - Absolute value
- `norm(x)` - Vector norm
- `ceil(x)`, `floor(x)` - Ceiling and floor
- `E`, `Var`, `Cov` - Expectation, variance, covariance
- `dd` - Differential (from physica package)
- `pp` - Partial derivative (from physica package)

## Template Configuration

The main template function `ad()` accepts these parameters:

```typst
#show: ad.with(
  title: "Document Title",           // Required
  author: "Author Name",             // Required
  course: "Course Name",             // Optional
  experiment: "Lab/Assignment",      // Optional
  show-title-page: false,           // true for separate title page
  title-page: false,                // Alternative parameter name
  decorative: true,                 // Toggle decorative footer elements
  date: datetime.today(),           // Custom date (optional)
)
```

## Advanced Features

### Custom Colors
The template defines a comprehensive color palette accessible via the `colors` dictionary:

```typst
// Primary colors
colors.myg, colors.myb, colors.myr, colors.myp, colors.mygr
colors.myred, colors.myyellow

// Theorem environment colors
colors.theorem-bg, colors.theorem-fr
colors.lemma-bg, colors.lemma-fr
colors.prop-bg, colors.prop-fr
colors.example-bg, colors.example-fr, colors.example-ti
colors.definition-bg, colors.definition-fr
colors.exercise-bg, colors.exercise-fg
colors.note-bg, colors.note-fr

// Example: Custom colored box
#rect(
  fill: colors.theorem-bg,
  stroke: colors.theorem-fr,
  [Custom content]
)
```

### Algorithm Formatting
Uses showybox for professional algorithm presentation:

```typst
#algorithm(title: "My Algorithm")[
  *Input:* Description
  
  1. Step one
  2. Step two
  3. Return result
]
```

### Figure Helpers
```typst
#fig(
  image("path/to/image.png"),
  caption: "Figure caption",
  placement: auto
)

// For SVG figures (legacy compatibility)
#incfig("figure-name", width: 80%)
```

### Enhanced Environments

All environments use modern styling with proper colors and borders:

- **Definitions**: Use showybox with red color scheme and rounded title boxes
- **Questions**: Blue-themed boxes with clean styling
- **Solutions**: Green-themed solution boxes
- **Wrong Concepts**: Red warning-style boxes for common mistakes
- **Notes**: Gray-themed note boxes with shadow effects

## Page Layout

- **Paper**: A4 format
- **Margins**: 2cm on all sides
- **Font**: New Computer Modern, 11pt
- **Paragraph**: Justified with 1.2em first-line indent
- **Footer**: Configurable decorative footer with page numbers

## Environment Styling Details

### Theorem-style Environments
Use `ctheorems` with colored left borders and subtle background fills:
- Theorem: Blue theme with light blue background
- Lemma: Orange theme with cream background  
- Proposition: Teal theme with light teal background
- Corollary: Purple theme with light purple background

### Box-style Environments
Use `showybox` for more complex styling:
- Definitions: Red header with white body
- Questions: Blue header with white body
- Solutions: Green header with white body
- Algorithms: Blue header with light gray body

## Files Structure

- `at.typ` - Main template file with all environments and styling
- Test files and examples should import from `at.typ`

## Environment Mapping from LaTeX

Every LaTeX command from the original preamble is mapped:

| LaTeX Command | Typst Equivalent | Description |
|---------------|------------------|-------------|
| `\thm{title}{body}` | `#thm("title", body)` | Main theorem |
| `\cor{title}{body}` | `#cor("title", body)` | Corollary |
| `\mlenma{title}{body}` | `#mlenma("title", body)` | Lemma |
| `\mer{title}{body}` | `#mer("title", body)` | Exercise |
| `\mprop{title}{body}` | `#mprop("title", body)` | Proposition |
| `\clm{title}{label}{body}` | `#clm("title", "label", body)` | Claim with label |
| `\ex{title}{body}` | `#ex("title", body)` | Example |
| `\dfn{title}{body}` | `#dfn("title", body)` | Definition |
| `\dfnc{title}{body}` | `#dfnc("title", body)` | Chapter definition |
| `\qs{title}{body}` | `#qs("title", body)` | Question |
| `\pbm{title}{body}` | `#pbm("title", body)` | Problem |
| `\pex{title}{body}` | `#pex("title", body)` | Exercise box |
| `\sol{body}` | `#sol(body)` | Solution |
| `\wc{title}{body}` | `#wc("title", body)` | Wrong concept |
| `\thmcon{body}` | `#thmcon(body)` | Theorem container |
| `\pf{body}` | `#pf(body)` | Proof |
| `\nt{body}` | `#nt(body)` | Note |

## Modern Package Integration

This template leverages several modern Typst packages for enhanced functionality:

- **ctheorems**: Provides numbered theorem environments with flexible styling
- **showybox**: Creates beautiful colored boxes for definitions, questions, and solutions
- **physica**: Offers physics notation and derivatives (`dd`, `pp` shortcuts)
- **unify**: Handles scientific units and quantities formatting
- **tablex**: Enhanced table functionality beyond basic Typst tables
- **lovelace**: Professional algorithm typesetting
- **delimitizer**: Automatic mathematical delimiter sizing

## License

This template is designed to be freely used and modified for academic work.