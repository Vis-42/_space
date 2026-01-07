# Manim Animation Projects

Mathematical animations using [Manim Community](https://www.manim.community/).

## System Setup

**Python Version:** 3.13.11 (managed via pyenv)  
**Package Manager:** uv  
**Shell:** zsh 5.9 on macOS

### Quick Start

```bash
# Python version is auto-selected via .python-version
cd /Users/parthbhargava/_space/py/manim

# Verify Python version
python --version  # Should show 3.13.11

# Install dependencies
uv sync

# Render animation
manim -pql scene.py SceneName
```

### Dependencies

Defined in `pyproject.toml`:
- manim >= 0.19.0

**Minimum Python:** 3.13+  
**Required:** 3.13.11 (installed via pyenv)

### Manim Commands

```bash
# Preview low quality
manim -pql file.py SceneName

# High quality render
manim -pqh file.py SceneName

# Save last frame as image
manim -sqh file.py SceneName
```

## AI Agent Notes

**Environment:**
- This subproject uses Python 3.13.11 (different from parent `py/` which uses 3.14.2)
- The `.python-version` file takes precedence when in this directory
- Dependencies managed via uv
- pyenv automatically switches Python version when entering this directory

**Running Manim:**
```bash
cd /Users/parthbhargava/_space/py/manim
manim -pql animation.py MyScene  # Uses 3.13.11
```

**Why Python 3.13.11?**
- Manim's dependencies require Python 3.13+
- Using 3.13.11 for stability (3.14.x may have compatibility issues with some libraries)