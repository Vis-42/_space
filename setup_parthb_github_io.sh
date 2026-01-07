#!/bin/bash
# Setup script for parthb.github.io GitHub Pages deployment

set -e

echo "🚀 Setting up parthb.github.io GitHub Pages"
echo ""

# Check if we're in the right directory
if [ ! -d "website" ]; then
    echo "❌ Error: website directory not found. Run this from the _space root directory."
    exit 1
fi

# Check if git remote exists
if git remote get-url origin > /dev/null 2>&1; then
    CURRENT_REMOTE=$(git remote get-url origin)
    echo "📦 Current remote: $CURRENT_REMOTE"
    echo ""
fi

echo "📋 Next Steps:"
echo ""
echo "1. CREATE NEW REPOSITORY ON GITHUB:"
echo "   - Go to: https://github.com/new"
echo "   - Repository name: parthb.github.io (must be exact)"
echo "   - Make it PUBLIC (required for GitHub Pages)"
echo "   - DO NOT initialize with README, .gitignore, or license"
echo "   - Click 'Create repository'"
echo ""
echo "2. After creating the repository, run:"
echo "   git remote add parthb git@github.com:parthb/parthb.github.io.git"
echo "   git push -u parthb main"
echo ""
echo "3. ENABLE GITHUB PAGES:"
echo "   - Go to: https://github.com/parthb/parthb.github.io/settings/pages"
echo "   - Source: GitHub Actions"
echo "   - Your site will be live at: https://parthb.github.io/"
echo ""
echo "✅ Configuration already updated in website/config.toml"
echo ""

