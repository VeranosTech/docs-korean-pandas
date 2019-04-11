#!/usr/bin/env bash

git add . -A
git commit -m "automatic commit"
git push origin korean

git checkout -B gh-pages
git rebase korean

touch .nojekyll

echo '!doc/source/_build' >> .gitignore

cd doc/source
sphinx-build -D language='ko' . _build
cd ../..

git add . -A
git commit -m "build"
git push -f origin gh-pages
git reset --hard HEAD
git clean -f
git checkout korean