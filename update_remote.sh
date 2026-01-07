#!/bin/bash
# Helper script to update remote and push

echo "🔧 Repository Setup Helper"
echo ""
echo "Please provide the repository URL from GitHub:"
echo "1. Go to your repository: https://github.com/YOUR_USERNAME/parthb.github.io"
echo "2. Click the green 'Code' button"
echo "3. Copy the SSH URL (starts with git@github.com:)"
echo ""
read -p "Paste the repository URL here: " REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "❌ No URL provided. Exiting."
    exit 1
fi

echo ""
echo "Updating remote..."
git remote set-url parthb "$REPO_URL"

echo ""
echo "Attempting to push..."
git push -u parthb main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Success! Code pushed to repository."
    echo ""
    echo "Next steps:"
    echo "1. Go to: https://github.com/YOUR_USERNAME/parthb.github.io/settings/pages"
    echo "2. Source: GitHub Actions"
    echo "3. Save"
    echo ""
    echo "Your site will be live at: https://parthb.github.io/"
else
    echo ""
    echo "❌ Push failed. Please check:"
    echo "  - Repository URL is correct"
    echo "  - You have push access"
    echo "  - SSH keys are set up (if using SSH)"
fi

