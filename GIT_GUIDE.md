# Git & GitHub Guide for Your Repository

This guide explains how to use Git and GitHub for version control with your academic and research projects.

## 🎯 What is Version Control?

Version control tracks changes to your files over time. Think of it like "Save As" but much smarter:
- **History**: See what changed and when
- **Backup**: Your code is safe in the cloud
- **Collaboration**: Work with others without conflicts
- **Experimentation**: Try things risk-free, then revert if needed

## 🚀 Getting Started

### 1. Connect Your Repository to GitHub

#### Step 1: Create a GitHub Repository

1. Go to [github.com](https://github.com) and sign in
2. Click the **"+"** icon in the top right → **"New repository"**
3. Name it (e.g., `_space` or `my-workspace`)
4. **Don't** initialize with README, .gitignore, or license (we already have these)
5. Click **"Create repository"**

#### Step 2: Connect Your Local Repository

After creating the GitHub repo, you'll see instructions. Run these commands in your terminal:

```bash
cd /Users/parthbhargava/_space

# Add GitHub as remote (replace YOUR_USERNAME and REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# Or if you prefer SSH (requires SSH key setup):
# git remote add origin git@github.com:YOUR_USERNAME/REPO_NAME.git

# Verify it's connected
git remote -v
```

#### Step 3: Push Your Code

```bash
# Make your first commit (if you haven't already)
git add .
git commit -m "Initial commit: workspace setup"

# Push to GitHub
git branch -M main  # Ensure branch is named 'main'
git push -u origin main
```

**Note**: You may be prompted for GitHub credentials. Use a Personal Access Token (not your password):
- Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
- Generate new token with `repo` permissions
- Use this token as your password when pushing

## 📚 Essential Git Commands

### Daily Workflow

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

### Common Workflows

#### Making Changes to Your Code

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

#### Working on Multiple Features

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

#### Undoing Changes

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

## 🎓 Best Practices for Your Repository

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

### Branching Strategy

For personal projects, you can keep it simple:
- **`main`**: Stable, working code
- **Feature branches**: For experiments or new features
  ```bash
  git checkout -b experiment/new-method
  # ... make changes ...
  git checkout main
  git merge experiment/new-method
  ```

## 🔄 Working with uv and Git

### Setting up a project

```bash
cd py/manim
uv sync  # Creates .venv/ (automatically ignored by git)
uv run python script.py
```

### When dependencies change

```bash
# Update pyproject.toml with new dependencies
# Then sync
uv sync

# Commit the pyproject.toml change
git add pyproject.toml
git commit -m "Add new dependency for plotting"
git push
```

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

## 📖 Learning Resources

1. **Interactive Tutorial**: [Learn Git Branching](https://learngitbranching.js.org/)
2. **Git Documentation**: [git-scm.com/book](https://git-scm.com/book)
3. **GitHub Guides**: [guides.github.com](https://guides.github.com/)

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

## 💡 Pro Tips

1. **Commit often**: Small, frequent commits are better than large, infrequent ones
2. **Write good messages**: Future you will thank present you
3. **Use branches**: Experiment freely without breaking main
4. **Pull before push**: Always `git pull` before `git push` when working with others
5. **Check status**: Run `git status` frequently to see what's happening

---

**Remember**: Git is a tool, not a burden. Start simple, and you'll naturally learn more advanced features as you need them!

