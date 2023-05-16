REM make sure git is clear:
REM git status --porcelain

git push origin --delete gh-pages
git branch -D gh-pages

git checkout --orphan gh-pages

git rm --cached -rf . 

git add deploy-ghp.bat
git commit -m "Add deploy script"

REM git clean -n
git clean -f

git rm --cached deploy-ghp.bat
git commit -m "Remove deploy script"

REM delete folders/files
rd /s /q ph_tools
del README.md requirements.txt pyproject.toml setup.py

REM only files/dir from .\doc will be commited
xcopy /s doc .
copy index.html 404.html

echo doc > .gitignore
echo build >> .gitignore
echo dist >> .gitignore
echo wip >> .gitignore
echo utils >> .gitignore
echo scripts-* >> .gitignore
echo *.egg-info >> .gitignore

git add .
git commit -m "Deploy"
git push --set-upstream origin gh-pages

git checkout main