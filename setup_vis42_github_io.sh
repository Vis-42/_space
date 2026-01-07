#!/bin/bash
# Setup script for Vis-42.github.io

echo "🚀 Setting up Vis-42.github.io"
echo ""

# Add remote
echo "Adding remote..."
git remote add vis42 git@github.com:Vis-42/Vis-42.github.io.git 2>&1 || git remote set-url vis42 git@github.com:Vis-42/Vis-42.github.io.git

# Push code
echo ""
echo "Pushing code..."
git push -u vis42 main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Success! Code pushed to Vis-42.github.io"
    echo ""
    echo "Next steps:"
    echo "1. Go to: https://github.com/Vis-42/Vis-42.github.io/settings/pages"
    echo "2. Source: GitHub Actions"
    echo "3. Save"
    echo ""
    echo "Your site will be live at: https://vis-42.github.io/"
else
    echo ""
    echo "❌ Push failed. Please check:"
    echo "  - Repository exists: https://github.com/Vis-42/Vis-42.github.io"
    echo "  - You have push access"
    echo "  - SSH keys are set up"
fi

