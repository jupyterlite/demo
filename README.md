# JupyterLite Demo

JupyterLite deployed as a static site to GitHub Pages, for demo purposes.

## ✨ Try it in your browser ✨

➡️ **https://jtpio.github.io/jupyterlite-demo**

![image](https://user-images.githubusercontent.com/591645/120502698-ef40b880-c3c2-11eb-881b-d64591130e40.png)

## Requirements

JupyterLite is being tested against modern web browsers:

- Firefox 90+
- Chromium 89+

## Usage

This repository is meant to demo how to deploy JupyterLite to GitHub Pages, using the released prebuilt JupyterLite assets.

⚠️ The configuration in this repo is under active development, and the deployment story will soon improve a lot with the help of convenient tools.

For more info, keep an eye on the JupyterLite documentation:

- Configuring: https://jupyterlite.readthedocs.io/en/latest/configuring.html
- Deploying: https://jupyterlite.readthedocs.io/en/latest/deploying.html

### Deploy a new version

In the deploy workflow, update the version of JupyterLite: 

https://github.com/jtpio/jupyterlite-demo/blob/1cf3ac239a67a869418541654385d1905dfbb5ab/.github/workflows/deploy.yml#L19

Add notebooks and supporting files into the `content/` directory.

Then commit and push the changes. The site will be deployed on the next push to the `main` branch.

## Development

Create a new environment:

```bash
mamba env update --file .binder/environment.yml
mamba activate jupyterlite-dev
```

Then follow the steps documented in the [Configuring](https://jupyterlite.readthedocs.io/en/latest/configuring.html) section, to retrieve the list of federated extensions and settings and update `jupyter-lite.json`.
