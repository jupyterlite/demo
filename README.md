# JupyterLite Demo

JupyterLite deployed as a static site to GitHub Pages, for demo purposes.

## ✨ Try it in your browser ✨

➡️ **https://jupyterlite.github.io/demo**

![github-pages](https://user-images.githubusercontent.com/591645/120649478-18258400-c47d-11eb-80e5-185e52ff2702.gif)

## Requirements

JupyterLite is being tested against modern web browsers:

- Firefox 90+
- Chromium 89+

## Usage

This repository is meant to demo how to deploy JupyterLite to GitHub Pages, using the released prebuilt JupyterLite assets.

To generate a new repository from this template, click on "Use this template":

![template](https://user-images.githubusercontent.com/21197331/125816904-5768008a-77de-4cb3-8013-f3999b135c02.gif)

For more info, keep an eye on the JupyterLite documentation:

- Configuring: https://jupyterlite.readthedocs.io/en/latest/configuring.html
- Deploying: https://jupyterlite.readthedocs.io/en/latest/deploying.html

### Deploy a new version of JupyterLite

To deploy a new version of JupyterLite, you can update the version in https://github.com/jtpio/jupyterlite-demo/blob/main/requirements.txt.

The `requirements.txt` file can also be used to add extra JupyterLab extensions to the deployed JupyterLite website.

Then commit and push the changes. The site will be deployed on the next push to the `main` branch.

## Development

Create a new environment:

```bash
mamba create -n jupyterlite-demo
conda activate jupyterlite-demo
pip install -r requirements.txt
```

Then follow the steps documented in the [Configuring](https://jupyterlite.readthedocs.io/en/latest/configuring.html) section.
