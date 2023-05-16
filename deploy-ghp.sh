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

# put all repo files/dif in .gitignore
ls -aI .gitignore -I . -I .. > .gitignore

# only files/dir from ./docs/.vitepress/dist will be commited
cp -r ./dist/* ./

git add .
git commit -m "Deploy"
git push --set-upstream origin gh-pages

git checkout main
