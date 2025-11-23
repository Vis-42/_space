# AI Agent Technical Documentation

**Purpose:** This document provides technical context for AI agents working in this repository. It describes the setup, file types, configurations, and conventions used throughout the workspace.

---

## System Environment

- **OS:** macOS (darwin 25.1.0)
- **Python:** 3.14.0
- **RAM:** 18 GB
- **Shell:** zsh
- **Workspace Path:** `/Users/parthbhargava/_space`

---

## Repository Structure

```
_space/
├── 1010S/              # CS1010S Programming Methodology assignments
├── cplus/              # C++ projects
├── data/               # Data files and analysis notebooks
├── jl/                 # Julia projects and simulations
├── ms/                 # Academic manuscripts, reports, presentations
│   └── at/             # Physics experiment reports (PC2193)
├── nb_jpy/             # Jupyter notebooks
├── py/                 # Python projects
│   ├── manim/          # Manim animations
│   ├── missions/       # CS1010S mission assignments
│   └── qm_sim/         # Quantum mechanics simulations
├── saved_plots/        # Generated plots and figures
├── zimg/               # Images and graphics
└── zmpn/               # LaTeX documents and reports
```

---

## Python Environment Management

### Tool: `uv`

All Python projects use [uv](https://github.com/astral-sh/uv) for dependency management. Virtual environments are automatically created in `.venv/` directories and are git-ignored.

### Projects with `pyproject.toml`

1. **`py/pyproject.toml`**
   - Python: `>=3.12`
   - Dependencies: `matplotlib`, `pillow`, `scipy`, `pandas`, `openpyxl`
   - Description: Main Python workspace for data analysis, simulations, and visualizations

2. **`1010S/pyproject.toml`**
   - Python: `>=3.13`
   - Dependencies: `cocos2d`, `pillow`, `seaborn`
   - Description: CS1010S Programming Methodology assignments

3. **`py/manim/pyproject.toml`**
   - Python: `>=3.13`
   - Dependencies: `manim`
   - Description: Manim animation projects

4. **`ms/at/pyproject.toml`**
   - Python: `>=3.12`
   - Dependencies: `numpy`, `matplotlib`, `scipy`
   - Description: Physics experiment analysis scripts

### Working with Python Projects

```bash
# Navigate to project
cd py/  # or 1010S/, py/manim/, ms/at/

# Sync dependencies (creates .venv automatically)
uv sync

# Run scripts
uv run python script.py

# Add dependency
uv add package-name
```

### Python File Conventions

- **Executable scripts:** Should have `if __name__ == "__main__":` guard
- **Import style:** Prefer explicit imports over `import *`
- **Paths:** Use relative paths or `os.path.join()` / `pathlib.Path` (avoid hard-coded Windows paths)
- **File naming:** Use underscores, not spaces (e.g., `file_name.py` not `file name.py`)

---

## Typst Document System

### Configuration

- **Tool:** Typst (installed at `/opt/homebrew/bin/typst`)
- **Package Config:** `ms/at/typst.toml` (package name: "at", version: "0.1.0")

### Template System

**Main Template:** `ms/at/shared/_at.typ`
- Comprehensive academic template with 80+ functions
- Used by all Typst documents in `ms/at/`
- Provides theorem environments, problem/solution boxes, physics notation

**Key Packages:**
- `@preview/ctheorems:1.1.3` - Theorem environments
- `@preview/showybox:2.0.4` - Styled boxes
- `@preview/physica:0.9.5` - Physics notation
- `@preview/unify:0.4.3` - Unit formatting
- `@preview/tablex:0.0.8` - Enhanced tables
- `@preview/lovelace:0.3.0` - Algorithm typesetting
- `@preview/delimitizer:0.1.0` - Mathematical delimiters

### Compiling Typst Documents

```bash
# From ms/at/ directory
typst compile --root . path/to/document.typ path/to/output.pdf

# The --root . flag is required to access shared templates
```

### Document Structure Pattern

```typst
#import "../shared/_at.typ": *

#show: ad.with(
  title: "Document Title",
  author: [Parth Bhargava · A0310667E],
  course: "Course Name",
  title-page: false
)

# Content here...
```

### File Naming Conventions

- **Assignments:** `cma#.typ` (Classical Mechanics Assignment)
- **Worksheets:** `cmw#.typ` (Classical Mechanics Worksheet)
- **Reports:** Descriptive names like `he.typ`, `xrd.typ`, `mm.typ`

---

## Other File Types

### C++

- **Compiler:** `g++` (available at `/usr/bin/g++`)
- **Standard:** C++17
- **Compilation:** `g++ -std=c++17 -Wall -Wextra source.cpp -o output`
- **Output:** Compiled binaries (`a.out`, `*.out`) are git-ignored

### Julia

- **Version:** Available at `/opt/homebrew/bin/julia`
- **Projects:** `jl/qm_sim/` contains quantum mechanics simulations
- **Dependencies:** Managed via `Project.toml` and `Manifest.toml`

### LaTeX

- **Location:** `zmpn/` directory
- **Status:** `pdflatex` not available in current environment
- **Note:** LaTeX files exist but compilation not tested

### Jupyter Notebooks

- **Location:** `nb_jpy/`, `data/`
- **Checkpoints:** `.ipynb_checkpoints/` directories are git-ignored

---

## Git Configuration

### Repository State

- **Branch:** `main`
- **Remote:** Not yet configured (user needs to add GitHub remote)
- **User Config:**
  - Name: "Parth Bhargava"
  - Email: "bhargava.parth07@gmail.com" 

### Ignored Patterns

See `.gitignore` for complete list. Key exclusions:
- Virtual environments (`.venv/`, `venv/`, `venv_*/`)
- Python cache (`__pycache__/`, `*.pyc`)
- Compiled binaries (`*.out`, `a.out`)
- System files (`.DS_Store`)
- Generated files (PDFs, plots in `saved_plots/`)
- Jupyter checkpoints

---

## Code Quality Standards

### Python

- ✅ All 39 Python files have valid syntax
- ⚠️ Some files use `import *` (not recommended)
- ⚠️ Some files have hard-coded Windows paths (should be fixed)
- ⚠️ Some files lack `if __name__ == "__main__":` guards

### Best Practices

1. **Dependencies:** All dependencies must be in `pyproject.toml`
2. **Paths:** Use relative paths, not absolute/hard-coded paths
3. **Imports:** Use explicit imports, avoid `import *`
4. **File names:** Use underscores, no spaces
5. **Main guards:** Add `if __name__ == "__main__":` to executable scripts

---

## Common Patterns

### Python Scripts with Data Files

Many scripts in `py/randomLabs/` read Excel files. Pattern:
```python
import pandas as pd
import os

# Good: Relative path
file_path = os.path.join(os.path.dirname(__file__), "data", "file.xlsx")

# Bad: Hard-coded path
file_path = "C:/physicsLabs/FrankHertz/file.xlsx"
```

### Physics Analysis Scripts

Scripts in `ms/at/*/scripts/` follow pattern:
- Load data from `data/` directory
- Generate plots in `plots/` directory
- Use numpy, matplotlib, scipy
- Output publication-quality figures (300 dpi, serif fonts)

### Typst Reports

All reports in `ms/at/`:
- Import from `shared/_at.typ`
- Use `#show: ad.with(...)` for document setup
- Follow academic formatting standards
- Compile to PDF in same directory

---

## Working with This Repository

### When Creating New Python Scripts

1. Determine which project it belongs to (`py/`, `1010S/`, `ms/at/`)
2. Check if dependencies are in `pyproject.toml`
3. Use relative paths for data files
4. Add `if __name__ == "__main__":` guard
5. Use explicit imports

### When Creating Typst Documents

1. Place in appropriate directory (`ms/at/assignments/`, `ms/at/hall_effect/`, etc.)
2. Import from `shared/_at.typ`
3. Use `#show: ad.with(...)` for setup
4. Compile with `typst compile --root .`

### When Modifying Existing Files

1. Check dependencies in `pyproject.toml`
2. Maintain existing code style
3. Update paths if needed (fix hard-coded paths)
4. Test compilation/execution

---

## Important Notes

- **No data files committed:** Large data files (Excel, CSV) are not in git
- **PDFs ignored:** Generated PDFs are git-ignored (source `.typ` files are tracked)
- **Virtual environments:** Managed by `uv`, automatically created and ignored
- **Cache files:** `__pycache__` directories should be cleaned periodically
- **Compiled binaries:** C++ outputs are git-ignored

---

## Quick Reference

| Task | Command |
|------|---------|
| Setup Python project | `cd <project> && uv sync` |
| Run Python script | `uv run python script.py` |
| Compile Typst | `typst compile --root . input.typ output.pdf` |
| Compile C++ | `g++ -std=c++17 -Wall -Wextra source.cpp -o output` |
| Check Python syntax | `python3 -m py_compile file.py` |

---

**Last Updated:** November 23, 2025

