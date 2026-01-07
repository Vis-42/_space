# Deploy to parthb.github.io

## Quick Setup Guide

### Step 1: Create GitHub Repository

1. Go to: https://github.com/new
2. Repository name: **parthb.github.io** (must be exact)
3. Make it **PUBLIC** (required for free GitHub Pages)
4. **DO NOT** initialize with README, .gitignore, or license
5. Click "Create repository"

### Step 2: Add Remote and Push

After creating the repository, run these commands:

```bash
# Add the new repository as a remote
git remote add parthb git@github.com:parthb/parthb.github.io.git

# Push the website code to the new repository
git push -u parthb main
```

**Note:** If you get an error about the remote already existing, use:
```bash
git remote set-url parthb git@github.com:parthb/parthb.github.io.git
```

### Step 3: Enable GitHub Pages

1. Go to: https://github.com/parthb/parthb.github.io/settings/pages
2. Under "Source", select: **GitHub Actions**
3. Save

The GitHub Actions workflow will automatically:
- Build your Hugo site
- Deploy it to GitHub Pages
- Make it live at: **https://parthb.github.io/**

### Step 4: Verify Deployment

- Check Actions tab: https://github.com/parthb/parthb.github.io/actions
- Wait for the workflow to complete (usually 1-2 minutes)
- Visit: https://parthb.github.io/

## Troubleshooting

**If the repository name is different:**
- The repository MUST be named `parthb.github.io` for GitHub Pages to work automatically
- If you use a different name, you'll need to configure a custom domain in GitHub Pages settings

**If you don't have access to 'parthb' GitHub account:**
- You'll need to either:
  1. Create a new GitHub account with username 'parthb', OR
  2. Use a different repository name and configure custom domain settings

## Current Configuration

- ✅ Base URL updated to: `https://parthb.github.io/`
- ✅ GitHub Actions workflow ready
- ✅ All website files committed and ready to push

