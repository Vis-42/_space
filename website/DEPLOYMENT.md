# Deployment Guide for Your Academic Website

This guide will help you deploy your website to GitHub Pages so it's accessible at `https://vis-42.github.io/` (or your custom domain).

## Option 1: Deploy to a Separate Repository (Recommended)

This is the cleanest approach - your website lives in its own repository.

### Step 1: Create a New GitHub Repository

1. Go to https://github.com/new
2. Repository name: `vis-42.github.io` (must match your username exactly)
3. Description: "Personal academic website"
4. Make it **Public** (required for free GitHub Pages)
5. **Don't** initialize with README
6. Click "Create repository"

### Step 2: Prepare Your Website

```bash
cd /Users/parthbhargava/_space/website

# Build the site
hugo

# This creates a 'public' directory with your website
```

### Step 3: Deploy

```bash
# Initialize git if not already done
git init
git branch -M main

# Add the remote
git remote add origin git@github.com:Vis-42/vis-42.github.io.git

# Add all files
git add .

# Commit
git commit -m "Initial website deployment"

# Push
git push -u origin main
```

### Step 4: Enable GitHub Pages

1. Go to your repository: https://github.com/Vis-42/vis-42.github.io
2. Settings → Pages
3. Source: Deploy from a branch
4. Branch: `main` → `/ (root)`
5. Click Save

### Step 5: Wait and Visit

After a few minutes, your site will be live at:
**https://vis-42.github.io/**

---

## Option 2: Deploy from a Subdirectory (Alternative)

If you want to keep the website in your `_space` repository:

### Step 1: Create gh-pages Branch

```bash
cd /Users/parthbhargava/_space/website
git checkout -b gh-pages
hugo
# Copy public/ contents to root
```

### Step 2: Enable GitHub Pages

1. Go to your `_space` repository settings
2. Pages → Source: `gh-pages` branch
3. Your site will be at: `https://vis-42.github.io/_space/`

**Note**: This is less clean and the URL is longer.

---

## Updating Your Website

After making changes:

```bash
cd /Users/parthbhargava/_space/website

# Make your edits to content files
# Test locally
hugo server

# Build
hugo

# Commit and push
git add .
git commit -m "Update website content"
git push
```

GitHub Pages will automatically rebuild your site (takes 1-2 minutes).

---

## Local Development

Test your site locally before deploying:

```bash
cd /Users/parthbhargava/_space/website
hugo server

# Visit http://localhost:1313
```

Make changes and see them instantly!

---

## Custom Domain (Optional)

If you want a custom domain like `parthbhargava.com`:

1. Buy a domain
2. Add a `CNAME` file in your repository root with your domain
3. Configure DNS records (see GitHub Pages docs)

---

## Troubleshooting

**Site not updating?**
- Wait 1-2 minutes for GitHub to rebuild
- Check repository Settings → Pages for errors
- Verify `hugo` command completed successfully

**Build errors?**
- Check GitHub Actions tab for build logs
- Verify all required files are committed
- Test locally with `hugo server` first

**Theme not loading?**
- Make sure the `themes/academic` submodule is initialized
- Run: `git submodule update --init --recursive`

---

## Next Steps

1. ✅ Create the GitHub repository
2. ✅ Deploy your site
3. ✅ Customize content (add more projects, publications, etc.)
4. ✅ Add your photo to `content/authors/admin/avatar.jpg`
5. ✅ Share your website!

Your website will be searchable on Google and accessible to anyone on the internet!

