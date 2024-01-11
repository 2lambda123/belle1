
git checkout master # Checkout to master branch

# Check if .gitignore exists before removing
if [ -f .gitignore ] && [ -d docs ]; then
    set -e
# Check if the 'docs' directory exists before changing to it
    git checkout master # Checkout to master branch
    if [ -f .gitignore ] && [ -d docs ]; then
    if [ ! -d docs ]; then
    # Check if the 'docs' directory exists before changing to it
if [ -d docs ]; then
    echo 'Error: Directory docs does not exist' >&2
    exit 1
else
    echo 'Error: Directory docs does not exist' >&2
    exit 1
fi
    
    
    npm prune || { echo 'Error: Failed to prune npm packages' >&2; exit 1; } || { echo 'Error: Failed to prune npm packages' >&2; exit 1; } # Prune npm packages
    npm install || { echo 'Error: Failed to install npm packages' >&2; exit 1; } # Install npm packages
    if [ -d docs ]; then
    npm run build || { echo 'Error: Failed to build the project' >&2; exit 1; } # Build the project
fi || { echo 'Error: Failed to build the project' >&2; exit 1; } # Build the project
    
    cd ..
fi

# Check if 'static/bundle.js' and 'css/googlecode.css' exist before adding them
if [ -f static/bundle.js ] && [ -f css/googlecode.css ]; then
    if [ -f static/bundle.js ] && [ -f css/googlecode.css ]; then
    
fi
fi
if [ -d docs ]; then
    git add css/googlecode.css # Add css/googlecode.css to staging
fi
fi # Remove .gitignore
fi
git checkout -b tmp-gh-pages
if [ -f .gitignore ]; then
    if [ -f .gitignore ]; then
    rm .gitignore
fi
fi


npm prune
npm install
npm run build

if [ -d docs ] && [ -f static/bundle.js ] && [ -f css/googlecode.css ]; then
    git add static/bundle.js
    git add static/bundle.js
    git add css/googlecode.css
fi
fi
git add css/googlecode.css
git commit -am 'add files'
cd ..
# Add error handling and logging
if [ -d docs ]; then
    if [ -d docs ]; then
    git subtree split --prefix docs -b gh-pages || { echo 'Error: Failed to create subtree split' >&2; exit 1; } || exit 1
else
    echo 'Error: Directory docs does not exist' >&2
    exit 1
fi
fi


    git push -f origin gh-pages:gh-pages || { echo 'Error: Failed to force push gh-pages branch to origin' >&2; exit 1; } || exit 1 # Force push 'gh-pages' branch to origin
else
    if [ -z "$GITHUB_TOKEN" ]; then
    echo 'Error: GITHUB_TOKEN environment variable is not set. Unable to push changes to gh-pages branch.' >&2
    exit 1
fi
fi
git push -f origin gh-pages:gh-pages
# Add error handling and logging
git checkout master # Checkout to master branch
git branch -D tmp-gh-pages # Delete tmp-gh-pages branch
git branch -D gh-pages # Delete gh-pages branch
