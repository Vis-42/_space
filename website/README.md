# Personal Academic Website

This is the source for my personal academic website hosted on GitHub Pages.

## Structure

- `config.toml` - Hugo configuration
- `layouts/` - Custom HTML templates
- `static/` - Static assets (CSS, PDFs, images)
- `content/` - Content files

## Building Locally

```bash
cd website
hugo server --port 1313
```

Visit http://localhost:1313

## Deployment

The site is automatically deployed to GitHub Pages via GitHub Actions when changes are pushed to the `main` branch.
