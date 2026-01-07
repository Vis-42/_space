# Website Management Guide

Simple guide to understanding and updating your academic website.

## Quick Overview

Your website is built with **Hugo** (a static site generator) and hosted on **GitHub Pages**. When you push changes to GitHub, it automatically rebuilds and updates the live site.

**Live URL:** https://vis-42.github.io/

## Directory Structure

```
website/
├── config.toml              # Main site configuration (title, URL, etc.)
├── layouts/                  # HTML templates (how pages look)
│   └── _default/
│       ├── baseof.html      # Base template (header, footer, styles)
│       └── home.html        # Homepage content (THIS IS WHAT YOU EDIT)
├── static/                   # Files that get copied as-is
│   └── pdfs/                # Your PDFs go here
│       ├── experiments/     # Experiment reports
│       └── notes/           # Notes and assignments
└── content/                  # Content files (not used much in our setup)
```

## How to Make Changes

### 1. Edit Text Content

**File to edit:** `website/layouts/_default/home.html`

This file contains all the text on your homepage. Just open it and edit the HTML content between the `<p>` tags.

**Example:**
```html
<p>Your text here. Just write normally.</p>
```

**To see changes locally:**
```bash
cd /Users/parthbhargava/_space/website
hugo server --port 1313
```
Then visit http://localhost:1313

### 2. Add a New PDF

**For experiment reports:**
1. Copy your PDF to: `website/static/pdfs/experiments/`
2. Name it something clean like `new-experiment.pdf`
3. Edit `website/layouts/_default/home.html`
4. Add a new project card in the "Experimental Work" section:

```html
<div class="project-card">
  <h4>Your Experiment Name</h4>
  <p>Description of what you did.</p>
  <p><a href="/pdfs/experiments/new-experiment.pdf" target="_blank">📄 View Report (PDF)</a></p>
</div>
```

**For notes/assignments:**
1. Copy your PDF to: `website/static/pdfs/notes/`
2. Name it something like `new-note.pdf`
3. Edit `website/layouts/_default/home.html`
4. Add a new link in the "Notes and Assignments" section:

```html
<li><a href="/pdfs/notes/new-note.pdf" target="_blank">Note Name</a></li>
```

### 3. Update Site Title/Description

**File:** `website/config.toml`

```toml
title = 'Your Name'
description = "Your description"
```

### 4. Deploy Changes

After making changes:

```bash
cd /Users/parthbhargava/_space

# Add your changes
git add website/

# Commit with a message
git commit -m "Update website: added new PDF"

# Push to GitHub
git push parthb main
```

The GitHub Actions workflow will automatically:
1. Build your site
2. Deploy it to GitHub Pages
3. Make it live (usually takes 1-2 minutes)

Check deployment status: https://github.com/Vis-42/Vis-42.github.io/actions

## Common Tasks

### Change Colors/Fonts

**File:** `website/layouts/_default/baseof.html`

Look for the `<style>` section. Colors are defined as CSS variables:
- `--color-text-primary` - Main text color
- `--color-accent` - Link/button color
- `--color-bg-primary` - Background color

### Add a New Section

Edit `website/layouts/_default/home.html` and add a new `<section>`:

```html
<section id="new-section">
  <h2>Section Title</h2>
  <p>Your content here.</p>
</section>
```

Then add a link in the navigation (in `baseof.html`):
```html
<li><a href="#new-section">New Section</a></li>
```

### Test Locally Before Deploying

Always test changes locally first:

```bash
cd /Users/parthbhargava/_space/website
hugo server --port 1313
```

Visit http://localhost:1313 and check everything looks good.

## Workflow Summary

1. **Edit files** in `website/` directory
2. **Test locally** with `hugo server`
3. **Commit and push** to GitHub
4. **Wait 1-2 minutes** for automatic deployment
5. **Check** https://vis-42.github.io/

## Important Files Reference

| File | What It Does |
|------|-------------|
| `layouts/_default/home.html` | **Main content** - edit this for text changes |
| `layouts/_default/baseof.html` | **Design/styling** - colors, fonts, layout |
| `static/pdfs/` | **PDF storage** - put PDFs here |
| `config.toml` | **Site config** - title, URL, description |

## Troubleshooting

**Site not updating?**
- Check GitHub Actions: https://github.com/Vis-42/Vis-42.github.io/actions
- Make sure you pushed to `main` branch
- Wait a few minutes for propagation

**PDF not showing?**
- Make sure it's in `static/pdfs/` (not `public/`)
- Check the filename matches the link exactly
- PDFs must be committed to git

**Local site not working?**
- Make sure you're in the `website/` directory
- Try `hugo server --port 1313 --bind 127.0.0.1`

## Need Help?

- Hugo docs: https://gohugo.io/documentation/
- Your repo: https://github.com/Vis-42/Vis-42.github.io
- Actions: https://github.com/Vis-42/Vis-42.github.io/actions

