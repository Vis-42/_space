# _space

Personal workspace for academic projects, research, and experiments.

[![Python](https://img.shields.io/badge/Python-3.12+-blue.svg)](https://www.python.org/)
[![Typst](https://img.shields.io/badge/Typst-0.11+-orange.svg)](https://typst.app/)
[![License](https://img.shields.io/badge/License-Private-red.svg)]()

---

## 📁 Repository Structure

```
_space/
├── 1010S/              # CS1010S Programming Methodology assignments
├── cplus/              # C++ projects and experiments
├── data/               # Data files and analysis notebooks
├── jl/                 # Julia projects and simulations
├── ms/                 # Academic manuscripts, reports, and presentations
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

## 🚀 Quick Start

### Prerequisites

- **Python 3.12+** with [uv](https://github.com/astral-sh/uv) installed
- **Typst** for document compilation
- **Git** with SSH configured

### Setup

1. **Clone the repository:**
   ```bash
   git clone git@github.com:Vis-42/_space.git
   cd _space
   ```

2. **Set up Python environments:**
   ```bash
   # For main Python workspace
   cd py && uv sync
   
   # For other projects
   cd ../1010S && uv sync
   cd ../ms/at && uv sync
   ```

3. **Compile Typst documents:**
   ```bash
   cd ms/at
   typst compile --root . hall_effect/he.typ hall_effect/he.pdf
   ```

---

## 🛠️ Technologies

- **Python** - Data analysis, simulations, and scripting
- **Typst** - Academic document typesetting
- **Julia** - High-performance scientific computing
- **C++** - System-level programming
- **LaTeX** - Traditional document preparation

---

## 📚 Documentation

- **[GUIDE.md](GUIDE.md)** - Complete guide to working with this repository (Git, SSH, Python, etc.)
- **[AI_README.md](AI_README.md)** - Technical documentation for AI agents

---

## 🔧 Project Management

This repository uses:
- **[uv](https://github.com/astral-sh/uv)** for Python dependency management
- **Git** with SSH authentication
- **Typst** for academic document compilation

---

## 📝 License

Private repository - All rights reserved.

---

## 👤 Author

**Parth Bhargava**
- Email: bhargava.parth07@gmail.com
- GitHub: [@Vis-42](https://github.com/Vis-42)

---

## 📖 See Also

For detailed guides on using this repository, see [GUIDE.md](GUIDE.md).
