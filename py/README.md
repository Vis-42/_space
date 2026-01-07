# Python Workspace

Python workspace for data analysis, simulations, and visualizations.

## System Setup

**Python Version:** 3.14.2 (managed via pyenv)  
**Package Manager:** uv  
**Shell:** zsh 5.9 on macOS

### Quick Start

```bash
# Python version is auto-selected via .python-version
cd /Users/parthbhargava/_space/py

# Verify Python version
python --version  # Should show 3.14.2

# Install dependencies
uv sync

# Run scripts
python main.py
```

### Dependencies

Defined in `pyproject.toml`:
- matplotlib >= 3.10.6
- pillow >= 11.3.0
- scipy >= 1.16.2
- pandas >= 2.0.0
- openpyxl >= 3.1.0

**Minimum Python:** 3.12+  
**Recommended:** 3.14.2 (installed via pyenv)

### Project Structure

```
py/
├── manim/          # Manim animation projects (Python 3.13.11)
├── missions/       # CS1010S mission assignments
├── qm_sim/         # Quantum mechanics simulations
├── randomLabs/     # Experimental scripts
└── *.py            # Analysis and visualization scripts
```

### Subprojects

**manim/**: Uses Python 3.13.11 (has separate `.python-version`)  
→ See `manim/README.md` for setup

## AI Agent Notes

**Environment:**
- This project uses pyenv for Python version management
- The `.python-version` file pins Python to 3.14.2
- Dependencies managed via uv (not pip/poetry/conda)
- Shell configuration: pyenv initialized in `~/.zshrc`

**Running Python:**
```bash
# pyenv automatically uses correct version when in this directory
cd /Users/parthbhargava/_space/py
python script.py  # Uses 3.14.2
```

**Adding dependencies:**
```bash
uv add package_name
```