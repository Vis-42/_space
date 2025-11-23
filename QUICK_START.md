# Quick Start Guide

## 🚀 First Time Setup

### 1. Update Git Configuration

Update your email (currently set to placeholder):

```bash
git config user.email "your-email@example.com"
git config user.name "Your Name"
```

### 2. Connect to GitHub

1. Create a new repository on GitHub (don't initialize with README)
2. Run these commands:

```bash
cd /Users/parthbhargava/_space
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
git push -u origin main
```

**Note**: You'll need a GitHub Personal Access Token (not password):
- GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
- Generate token with `repo` scope
- Use token as password when pushing

## 🐍 Using uv for Python Projects

### Projects with pyproject.toml

```bash
# Navigate to project
cd py/
# or cd 1010S/
# or cd py/manim/
# or cd ms/at/

# Sync dependencies (creates .venv automatically)
uv sync

# Run scripts
uv run python script.py

# Add new dependency
uv add package-name

# Update dependencies
uv sync
```

### Your Projects Using uv

- `py/` - Main Python workspace
- `1010S/` - CS1010S assignments  
- `py/manim/` - Manim animations
- `ms/at/` - Physics analysis scripts

## 📝 Daily Git Workflow

```bash
# 1. Check what changed
git status

# 2. Stage your changes
git add .

# 3. Commit with message
git commit -m "Description of changes"

# 4. Push to GitHub
git push
```

## 📚 Learn More

- See `GIT_GUIDE.md` for comprehensive Git tutorial
- See `README.md` for repository structure

