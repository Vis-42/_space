# _space

Personal workspace for academic projects, research, and experiments.

## 📁 Repository Structure

- **`1010S/`** - CS1010S Programming Methodology assignments
- **`cplus/`** - C++ projects and experiments
- **`data/`** - Data files and analysis notebooks
- **`jl/`** - Julia projects and simulations
- **`ms/`** - Academic manuscripts, reports, and presentations
  - **`at/`** - Physics experiment reports (PC2193)
- **`nb_jpy/`** - Jupyter notebooks
- **`py/`** - Python projects
  - **`manim/`** - Manim animations
  - **`missions/`** - CS1010S mission assignments
  - **`qm_sim/`** - Quantum mechanics simulations
- **`saved_plots/`** - Generated plots and figures
- **`zimg/`** - Images and graphics
- **`zmpn/`** - LaTeX documents and reports

## 🐍 Python Environment Management

This repository uses [uv](https://github.com/astral-sh/uv) for Python dependency management.

### Setting up a project with uv

For projects with `pyproject.toml`:

```bash
cd <project-directory>
uv sync  # Creates virtual environment and installs dependencies
uv run python script.py  # Run scripts in the environment
```

### Projects with uv setup

- `py/` - Main Python workspace
- `1010S/` - CS1010S assignments
- `py/manim/` - Manim animations
- `ms/at/` - Physics analysis scripts

## 📝 Notes

- Virtual environments are managed by `uv` and are automatically ignored by git
- Large data files and generated plots are excluded from version control
- PDFs and compiled files are generally ignored (see `.gitignore`)

