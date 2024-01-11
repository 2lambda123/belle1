# Add error handling and logging
git checkout master || { echo 'Error: Failed to checkout to master branch' >&2; exit 1; } # Checkout to master branch with error handling and logging

# Check if .gitignore exists before removing
if [ -f .gitignore ] && [ -d docs ]; then
    # Check if the 'docs' directory exists before changing to it
if [ -f .gitignore ]; then
    if [ ! -d docs ]; then
    # Check if the 'docs' directory exists before changing to it
if [ -d docs ]; then
    echo 'Error: Directory docs does not exist' >&2
    exit 1
else
    echo 'Error: Directory docs does not exist' >&2
    exit 1
fi
    
    # Add error handling and logging
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
    git add static/bundle.js # Add static/bundle.js to staging
fi # Remove .gitignore
fi
if [ -d docs ]; then
    git add css/googlecode.css # Add css/googlecode.css to staging
fi
fi # Remove .gitignore
fi
git checkout -b tmp-gh-pages || { echo 'Error: Failed to create tmp-gh-pages branch' >&2; exit 1; }
if [ -f .gitignore ]; then
    rm .gitignore || { echo 'Error: Failed to remove .gitignore' >&2; exit 1; } # Remove .gitignore with error handling and logging

cd docs
if [ -d docs ]; then
    npm prune
fi
if [ -d docs ]; then
    npm install
fi
if [ -d docs ]; then
    npm run build
fi

if [ -d docs ] && [ -f static/bundle.js ] && [ -f css/googlecode.css ]; then
    git add static/bundle.js
    if [ -d docs ] && [ -f static/bundle.js ] && [ -f css/googlecode.css ]; then
    git add static/bundle.js
    git add css/googlecode.css
fi
fi
git add css/googlecode.css
git commit -am 'add files'
cd ..
# Add error handling and logging
if [ ! -d docs ]; then
    echo 'Error: Directory docs does not exist' >&2
    exit 1
fi
if [ -d docs ] && [ -f static/bundle.js ] && [ -f css/googlecode.css ]; then
    git subtree split --prefix docs -b gh-pages || { echo 'Error: Failed to create subtree split' >&2; exit 1; } # Create subtree split with error handling and logging
else
    echo 'Error: Necessary files (static/bundle.js and css/googlecode.css) are missing' >&2
    exit 1
fi
# Add error handling and logging
if [ -z "$GITHUB_TOKEN" ]; then
    echo 'Error: GITHUB_TOKEN environment variable is not set. Unable to push changes to gh-pages branch.' >&2
    exit 1
fi

if [ -z "$GITHUB_TOKEN" ]; then
    echo 'Error: GITHUB_TOKEN environment variable is not set. Unable to push changes to gh-pages branch.' >&2
    exit 1
fi
# Push the changes to the 'gh-pages' branch

    if [ -z "$GITHUB_TOKEN" ]; then
    echo 'Error: GITHUB_TOKEN environment variable is not set. Unable to push changes to gh-pages branch.' >&2
    exit 1
fi
if [ -z "${GITHUB_TOKEN}" ]; then
    echo 'Error: GITHUB_TOKEN environment variable is not set. Unable to push changes to gh-pages branch.' >&2
    exit 1
fi
if [ -z "${GITHUB_TOKEN}" ]; then
    echo 'Error: GITHUB_TOKEN environment variable is not set. Unable to push changes to gh-pages branch.' >&2
    exit 1
fi
git push -f origin gh-pages:gh-pages || { echo 'Error: Failed to push changes to gh-pages branch' >&2; exit 1; }
git push -f origin gh-pages:gh-pages
# Add error handling and logging
git checkout master || { echo 'Error: Failed to checkout to master branch' >&2; exit 1; } # Checkout to master branch with error handling and logging
git branch -D tmp-gh-pages || { echo 'Error: Failed to delete tmp-gh-pages branch' >&2; exit 1; } # Delete tmp-gh-pages branch with error handling and logging
git branch -D gh-pages || { echo 'Error: Failed to delete gh-pages branch' >&2; exit 1; } # Delete gh-pages branch with error handling and logging
