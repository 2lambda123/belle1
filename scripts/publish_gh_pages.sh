# Add error handling and logging
git checkout master # Checkout to master branch

# Check if .gitignore exists before removing
if [ -f .gitignore ]; then
    # Check if the 'docs' directory exists before changing to it
if [ -d docs ]; then
    # Check if the 'docs' directory exists before changing to it
cd docs
    
    # Add error handling and logging
    npm prune || exit 1 # Prune npm packages
    npm install || exit 1 # Install npm packages
    npm run build || exit 1 # Build the project
    
    cd ..
fi

# Check if 'static/bundle.js' and 'css/googlecode.css' exist before adding them
if [ -f static/bundle.js ] && [ -f css/googlecode.css ]; then
    git add static/bundle.js # Add static/bundle.js to staging
    git add css/googlecode.css # Add css/googlecode.css to staging
fi # Remove .gitignore
fi
git checkout -b tmp-gh-pages
rm .gitignore

cd docs
npm prune
npm install
npm run build

git add static/bundle.js
git add css/googlecode.css
git commit -am 'add files'
cd ..
# Add error handling and logging
git subtree split --prefix docs -b gh-pages || exit 1 # Create a subtree split for the 'docs' directory

# Push the changes to the 'gh-pages' branch
if [ -n "$GITHUB_TOKEN" ]; then
    git push -f origin gh-pages:gh-pages # Force push 'gh-pages' branch to origin
else
    echo "Error: GITHUB_TOKEN environment variable is not set. Unable to push changes to 'gh-pages' branch." >&2
    exit 1
fi
git push -f origin gh-pages:gh-pages
# Add error handling and logging
git checkout master # Checkout to master branch
git branch -D tmp-gh-pages # Delete tmp-gh-pages branch
git branch -D gh-pages # Delete gh-pages branch
