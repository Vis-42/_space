# Personal Academic Website Setup Guide

This guide will help you create and maintain your personal academic website on GitHub Pages, similar to [Kevin Zhou's site](https://knzhou.github.io/).

## What We're Building

Your website will be hosted at: **https://vis-42.github.io/** (or a custom domain if you set one up)

The site uses:
- **Hugo** - Static site generator
- **HugoBlox Academic Theme** - Professional academic website theme
- **GitHub Pages** - Free hosting

## Current Status

✅ Hugo installed  
✅ Website structure created  
✅ Academic theme installed  
⏳ Configuration in progress  
⏳ Content creation needed  
⏳ GitHub repository setup needed  
⏳ Deployment needed  

## Next Steps

1. **Configure your personal information** (see below)
2. **Create content** (biography, projects, publications, etc.)
3. **Create GitHub repository** for the website
4. **Deploy to GitHub Pages**

## How to Update Your Website

Once set up, updating is simple:

```bash
cd /Users/parthbhargava/_space/website

# Make your changes to content files
# Test locally
hugo server

# Build and deploy
git add .
git commit -m "Update website"
git push
```

The site will automatically rebuild on GitHub Pages.

## File Structure

- `config/_default/` - Site configuration
- `content/` - Your content (biography, projects, publications, etc.)
- `static/` - Images, PDFs, and other static files
- `themes/academic/` - The theme (don't edit directly)

## Key Files to Edit

1. `config/_default/params.yaml` - Your name, bio, social links
2. `content/authors/admin/_index.md` - Your author profile
3. `content/home/` - Homepage sections
4. `content/publications/` - Your papers
5. `content/projects/` - Your projects
6. `content/experience.md` - Your experience/education

## Local Development

```bash
cd /Users/parthbhargava/_space/website
hugo server
# Visit http://localhost:1313
```

## Deployment

The website will be deployed automatically when you push to GitHub. See deployment instructions below.

