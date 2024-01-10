if ! git show-ref --quiet refs/heads/master; then
  echo 'Master branch does not exist'
  exit 1
fi

# Log the step
echo 'Checking out master branch'
git checkout master || { echo 'Error checking out master branch' ; exit 1; }
if git show-ref --quiet refs/heads/tmp-gh-pages; then
  echo 'tmp-gh-pages branch already exists'
  exit 1
fi

# Log the step
echo 'Creating tmp-gh-pages branch'
git checkout -b tmp-gh-pages || { echo 'Error creating tmp-gh-pages branch' ; exit 1; }
if [ ! -f .gitignore ]; then
  echo '.gitignore file does not exist'
  exit 1
fi

# Log the step
echo 'Removing .gitignore file'
rm .gitignore || { echo 'Error removing .gitignore file' ; exit 1; }

cd docs
# Log the step
echo 'Running npm prune'
npm prune || { echo 'Error running npm prune' ; exit 1; }
# Log the step
echo 'Running npm install'
npm install || { echo 'Error running npm install' ; exit 1; }
# Log the step
echo 'Running npm run build'
npm run build || { echo 'Error running npm run build' ; exit 1; }

if [ ! -f static/bundle.js ]; then
  echo 'static/bundle.js file does not exist'
  exit 1
fi

# Log the step
echo 'Adding static/bundle.js to the Git index'
git add static/bundle.js || { echo 'Error adding static/bundle.js to git index' ; exit 1; }
if [ ! -f css/googlecode.css ]; then
  echo 'css/googlecode.css file does not exist'
  exit 1
fi

# Log the step
echo 'Adding css/googlecode.css to the Git index'
git add css/googlecode.css || { echo 'Error adding css/googlecode.css to git index' ; exit 1; }
# Log the step
echo 'Committing files'
git commit -am 'add files' || { echo 'Error committing files' ; exit 1; }
cd ..
# Log the step
echo 'Splitting subtree and creating gh-pages branch'
git subtree split --prefix docs -b gh-pages || { echo 'Error splitting subtree and creating gh-pages branch' ; exit 1; }
# Log the step
echo 'Pushing gh-pages branch'
git push -f origin gh-pages:gh-pages || { echo 'Error pushing gh-pages branch' ; exit 1; }
# Log the step
echo 'Checking out master branch'
git checkout master || { echo 'Error checking out master branch' ; exit 1; }
# Log the step
echo 'Deleting tmp-gh-pages branch'
git branch -D tmp-gh-pages || { echo 'Error deleting tmp-gh-pages branch' ; exit 1; }
# Log the step
echo 'Deleting gh-pages branch'
git branch -D gh-pages || { echo 'Error deleting gh-pages branch' ; exit 1; }
