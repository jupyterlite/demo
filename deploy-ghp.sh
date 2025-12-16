#!/bin/bash

# make sure git is clear:
# git status --porcelain

git push origin --delete gh-pages
git branch -D gh-pages

git checkout --orphan gh-pages

git rm --cached -rf .

git add deploy-ghp.sh
git commit -m "Add deploy script"

# git clean -n
git clean -f

git rm --cached deploy-ghp.sh
git commit -m "Remove deploy script"

# remove all but deploy script
rm -rf .github content repl .gitignore .jupyterlite.doit.db deploy-ghp.bat README.md requirements.txt

# only files/dir from ./dist will be commited
cp -r ./dist/* ./

git add .
git commit -m "Deploy"
git push --set-upstream origin gh-pages

git checkout main
