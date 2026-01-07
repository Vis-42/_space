# CS1010S Programming Methodology

Assignments and projects for CS1010S at National University of Singapore.

## System Setup

**Python Version:** 3.13.11 (managed via pyenv)  
**Package Manager:** uv  
**Shell:** zsh 5.9 on macOS

### Quick Start

```bash
# Python version is auto-selected via .python-version
cd /Users/parthbhargava/_space/1010S

# Verify Python version
python --version  # Should show 3.13.11

# Install dependencies
uv sync

# Run assignments
python assignment.py
```

### Dependencies

Defined in `pyproject.toml`:
- cocos2d >= 0.6.10
- pillow >= 11.3.0
- seaborn >= 0.13.2

**Minimum Python:** 3.13+  
**Required:** 3.13.11 (installed via pyenv)

## AI Agent Notes

**Environment:**
- This project uses pyenv for Python version management
- The `.python-version` file pins Python to 3.13.11
- Dependencies managed via uv (not pip)
- Shell configuration: pyenv initialized in `~/.zshrc`

**Running Code:**
```bash
cd /Users/parthbhargava/_space/1010S
python script.py  # Uses 3.13.11
```

**Course-specific notes:**
- Graphics assignments may require cocos2d
- Data visualization uses seaborn
- Some assignments work with image processing (pillow)