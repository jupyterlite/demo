# JupyterLite Demo

[![lite-badge](https://jupyterlite.rtfd.io/en/latest/_static/badge.svg)](https://jupyterlite.github.io/demo)

JupyterLite deployed as a static site to GitHub Pages, for demo purposes.

## ✨ Try it in your browser ✨

➡️ **https://jupyterlite.github.io/demo**

![github-pages](https://user-images.githubusercontent.com/591645/120649478-18258400-c47d-11eb-80e5-185e52ff2702.gif)

## Requirements

JupyterLite is being tested against modern web browsers:

- Firefox 90+
- Chromium 89+

## Deploy your JupyterLite website on GitHub Pages

Check out the guide on the JupyterLite documentation: https://jupyterlite.readthedocs.io/en/latest/quickstart/deploy.html

## Manual build and deploy to GitHub Pages

This section does the same as the Github Action based automatic build & deploy described in the previous one, but offers a step by step approach which possibly offers a better learning experience.

- git clone the repo:

  ```sh
  mkdir work-zone # a working dir
  cd work-zone

  git clone https://github.com/jupyterlite/demo.git
  cd demo
  rm -rf .git
  ```

- Create a dedicated conda/mamba env:

  ```sh
  conda create -n lite-demo python=3.10 -y
  conda activate lite-demo
  pip install -r requirements.txt
  ```

- Build jupyterlite static site:

  ```sh
  # rm to start from clean sheet
  rm ./.jupyterlite.doit.db
  rm -rf ./dist
  rm -rf ./lite/.cache

  jupyter lite build --contents content --output-dir dist
  ```

- Serve static site in `./dist` locally:

  ```sh
  python -m http.server -d dist 3000
  ```

  Visit http://localhost:3000

- git commit and push to your repo:

  ```sh
  git init
  git add . && git commit -m "Init"
  git remote add origin https://github.com/[YOURNAME]/jupyterlite-demo.git
  git branch -M main
  git push -u origin main
  ```

- Deploy static site in `./dist` to GitHub Pages:

  ```sh
  # linux
  . ./deploy-ghp.sh

  # win
  deploy-ghp.bath
  ```

  Visit [gh-pages](https://docs.github.com/en/pages) static site: `https://[YOURNAME].github.io/[YOURREPO]`.

## Further Information and Updates

For more info, keep an eye on the JupyterLite documentation:

- How-to Guides: https://jupyterlite.readthedocs.io/en/latest/howto/index.html
- Reference: https://jupyterlite.readthedocs.io/en/latest/reference/index.html
