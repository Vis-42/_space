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

---

## 🚀 Quick Start

### First Time Setup

#### 1. Update Git Configuration

```bash
git config user.email "your-email@example.com"
git config user.name "Your Name"
```

#### 2. Connect to GitHub

1. Create a new repository on GitHub (don't initialize with README)
2. Run these commands:

```bash
cd /Users/parthbhargava/_space
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
git push -u origin main
```

**Note:** You'll need a GitHub Personal Access Token (not password):
- GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
- Generate token with `repo` scope
- Use token as password when pushing

---

## 🐍 Python Environment Management

This repository uses [uv](https://github.com/astral-sh/uv) for Python dependency management.

### Setting up a project with uv

For projects with `pyproject.toml`:

```bash
cd <project-directory>  # py/, 1010S/, py/manim/, or ms/at/
uv sync  # Creates virtual environment and installs dependencies
uv run python script.py  # Run scripts in the environment
```

### Projects with uv setup

- `py/` - Main Python workspace
- `1010S/` - CS1010S assignments
- `py/manim/` - Manim animations
- `ms/at/` - Physics analysis scripts

### Managing dependencies

```bash
# Add new dependency
uv add package-name

# Update all dependencies
uv sync
```

---

## 📝 Daily Git Workflow

### Basic Commands

```bash
# Check what files have changed
git status

# See what changed in files
git diff

# Stage files (prepare them for commit)
git add <file>           # Add specific file
git add .                # Add all changes
git add <directory>/     # Add entire directory

# Commit changes (save a snapshot)
git commit -m "Description of what you changed"

# Push to GitHub (upload your commits)
git push

# Pull from GitHub (download others' changes)
git pull
```

### Making Changes

```bash
# 1. Make your changes to files
# 2. Check what changed
git status

# 3. Stage your changes
git add .

# 4. Commit with a descriptive message
git commit -m "Add quantum simulation for 3D barrier"

# 5. Push to GitHub
git push
```

### Working on Multiple Features

```bash
# Create a new branch for a feature
git checkout -b feature/new-analysis

# Make changes, commit as usual
git add .
git commit -m "Add new data analysis"

# Switch back to main branch
git checkout main

# Merge your feature branch
git merge feature/new-analysis

# Delete the feature branch (optional)
git branch -d feature/new-analysis
```

### Undoing Changes

```bash
# Undo changes to a file (before staging)
git restore <file>

# Unstage a file (keep changes, but don't commit)
git restore --staged <file>

# Undo last commit (keep changes)
git reset --soft HEAD~1

# See commit history
git log --oneline
```

---

## 🎓 Best Practices

### Commit Messages

Write clear, descriptive commit messages:

✅ **Good:**
- `"Add Hall effect analysis script"`
- `"Fix typo in magnetic moment calculation"`
- `"Update README with setup instructions"`

❌ **Bad:**
- `"fix"`
- `"update"`
- `"changes"`

### What to Commit

✅ **Commit:**
- Source code (`.py`, `.jl`, `.typ`, `.tex`)
- Configuration files (`pyproject.toml`, `README.md`)
- Documentation
- Small data files if needed for reproducibility

❌ **Don't Commit:**
- Virtual environments (handled by `uv`)
- Large data files (use Git LFS or external storage)
- Generated files (PDFs, plots, compiled binaries)
- System files (`.DS_Store`, `__pycache__`)

---

## 🐛 Troubleshooting

### "Your branch is ahead of origin/main"

This means you have local commits not pushed to GitHub:
```bash
git push
```

### "Your branch is behind origin/main"

Someone (or you from another computer) pushed changes:
```bash
git pull
```

### Merge conflicts

If you and someone else edited the same lines:
1. Git will mark conflicts in files
2. Edit files to resolve conflicts (look for `<<<<<<<`, `=======`, `>>>>>>>`)
3. Stage resolved files: `git add <file>`
4. Complete merge: `git commit`

### Accidentally committed large files

```bash
# Remove from git history (but keep file locally)
git rm --cached <large-file>
git commit -m "Remove large file from tracking"
git push
```

---

## 📖 Typst Documents

### Compiling Reports

All reports in `ms/at/` are written in [Typst](https://typst.app/):

```bash
cd ms/at
typst compile --root . hall_effect/he.typ hall_effect/he.pdf
```

The `--root .` flag is required to access shared templates in `shared/_at.typ`.

---

## 🎯 Quick Reference

| Task | Command |
|------|---------|
| Check status | `git status` |
| See changes | `git diff` |
| Stage files | `git add .` |
| Commit | `git commit -m "message"` |
| Push to GitHub | `git push` |
| Pull from GitHub | `git pull` |
| Create branch | `git checkout -b branch-name` |
| Switch branch | `git checkout branch-name` |
| See history | `git log --oneline` |
| Undo uncommitted changes | `git restore <file>` |
| Setup Python project | `cd <project> && uv sync` |
| Run Python script | `uv run python script.py` |

---

## 💡 Pro Tips

1. **Commit often**: Small, frequent commits are better than large, infrequent ones
2. **Write good messages**: Future you will thank present you
3. **Use branches**: Experiment freely without breaking main
4. **Pull before push**: Always `git pull` before `git push` when working with others
5. **Check status**: Run `git status` frequently to see what's happening

---

## 📚 Learning Resources

1. **Interactive Tutorial**: [Learn Git Branching](https://learngitbranching.js.org/)
2. **Git Documentation**: [git-scm.com/book](https://git-scm.com/book)
3. **GitHub Guides**: [guides.github.com](https://guides.github.com/)

---

**Remember**: Git is a tool, not a burden. Start simple, and you'll naturally learn more advanced features as you need them!
