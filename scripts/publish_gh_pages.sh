if ! git show-ref --quiet --verify refs/heads/master; then
  echo 'Error: master branch does not exist'
  exit 1
fi

git checkout master
if git show-ref --verify --quiet refs/heads/tmp-gh-pages; then
  echo 'Error: tmp-gh-pages branch already exists'
  exit 1
fi
git checkout -b tmp-gh-pages
if ! rm -f .gitignore; then
  echo 'Error removing .gitignore file'
  exit 1i

if ! cd docs; then
  echo 'Error: could not navigate to docs directory'
  exit 1
fi
if ! npm prune; then
  echo 'Error: npm prune failed'
  exit 1
fi
if ! npm install; then
  echo 'Error: npm install failed'
  exit 1
fi
if ! npm run build; then
  echo 'Error: npm build failed'
  exit 1
}
if ! cd ..; then
  echo 'Error: could not navigate back to the root directory'
  exit 1
fi
if ! git subtree split --prefix docs -b gh-pages; then
  echo 'Error splitting the docs directory'
  exit 1
fi
if ! git push -f origin gh-pages:gh-pages; then
  echo 'Error pushing the gh-pages branch'
  exit 1
fi
if ! git checkout master; then
  echo 'Error checking out master branch'
  exit 1
fi
fi

if ! git add static/bundle.js; then
  echo 'Error adding static/bundle.js'
  exit 1
fi
if ! git add css/googlecode.css; then
  echo 'Error adding css/googlecode.css'
  exit 1
fi
if ! git commit -am 'add files'; then
  echo 'Error committing changes'
  exit 1
fi
if ! cd ..; then
  echo 'Error: could not navigate back to the root directory'
  exit 1
fi
if ! git subtree split --prefix docs -b gh-pages; then
  echo 'Error splitting the docs directory'
  exit 1
fi
if ! git push -f origin gh-pages:gh-pages; then
  echo 'Error pushing the gh-pages branch'
  exit 1
fi
if ! git checkout master; then
  echo 'Error checking out master branch'
  exit 1
fi
if ! git branch -D tmp-gh-pages; then
  echo 'Error: deleting tmp-gh-pages branch failed'
  exit 1
fi
if ! git branch -D gh-pages; then
  echo 'Error: deleting gh-pages branch failed'
  exit 1
fi
