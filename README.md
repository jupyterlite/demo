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

## Usage

This repository provides a demonstration of how to:

- build a JupyterLite release using prebuilt JupyterLite assets that bundles a collection of pre-existing Jupyter notebooks as part of the distribution;
- deploy the release to GitHub Pages.

The process is automated using Github Actions.

You can use this repository in two main ways:

- generate a new repository from this template repository and build and deploy your own site to the corresponding Github Pages site;
- build a release from a PR made to this repository and download the release from the created GitHub Actions artifact.

### Co-opting This Repository to Build a Distribution

*Requires Github account.*

To use this repository to build your own release:

- create a fork of this repository by clicking on one of the files (such as [`requirements.txt`](https://github.com/jupyterlite/demo/blob/main/requirements.txt) and then click on the *edit* button to create your own fork of the repository;
- update the `requirements.txt` file as required (or just cancel the edit if you were simply forking the original repository);
- remove unwanted notebooks from the `contents` directory;
- upload your own notebooks intended for release to that directory;
- from the *Pull Requests* tab of your Github repository, make a pull request of the changes you made back to the main `jupyterlite-demo` repository.

![](https://user-images.githubusercontent.com/82988/132512423-ac5609b7-3e8e-4ea9-80ba-ddb08c9ffebb.png)

The PR will trigger a build on the repository. Go to the [Actions tab](https://github.com/jupyterlite/demo/actions) and find the build triggered by your pull request. When the build has completed, the release will be available as a generated asset.

![](https://user-images.githubusercontent.com/82988/132511258-aff31973-d7e2-4e39-89d5-3feb0ced139b.png)

Download the distribution/generated asset and unzip it, for example into a directory of the form `jupyterlite-demo dist 46`. The directory contains your JupyterLite distribution. To run the distribution via a web browser, it needs to be served by a web server.

If you have Python installed, on the command line change directory into the the unzipped distribution folder and run the command: `python -m http.server`. This will launch a web server from the directory, for example on port 8000. View the website in your browser (for example, at the web location `http://localhost:8000`).

### Using Your Own Repository to Build a Release and Deploy it to Github Pages

*Requires Github account.*

Click on "Use this template" to generate a repository of your own from this template:

![template](https://user-images.githubusercontent.com/21197331/125816904-5768008a-77de-4cb3-8013-f3999b135c02.gif)

From the [*Actions*](./actions) tab on your repository, ensure that workflows are enabled. When you make a commit to the `main` branch, a Github Action will run to build your JupoyterLite release and deploy it to the repository's Github Pages site. By default, the Github Pages site will be found at `YOUR_GITHUB_USERNAME.github.io/YOUR_REPOSITORY-NAME`. *You can also check the URL from the Repository `Settings` tab `Pages` menu item.*

__Add any additional requirements as required to the `requirements.txt` file.__

*You can do this via the Github website by selecting the `requirements.txt` file, clicking to edit it, making the required changes then saving ("committing") the result to the `main` branch of your repository.*

__Modify the contents of the `contents` folder to include the notebooks you want to distribute as part of your distribution.__

*You can do this by clicking on the `contents` directory and dragging notebooks from your desktop onto the contents listing. Wait for the files to be uploaded and then save them ("commit" them) to the `main` branch of the repository.*

Check that you have Github Pages enabled for your repository: from your repository [*Settings*](./settings) tab, select the [*Pages*](./settings/pages) menu item and ensure that the source is set to `gh-pages`.

When you commit a file, an updated release will be built and published on the Github Pages site. Note that it may take a few minutes for the Github Pages site to be updated. Do a hard refresh on your Github Pages site in your web browser to see the new release.



### Further Information and Updates

For more info, keep an eye on the JupyterLite documentation:

- Configuring: https://jupyterlite.readthedocs.io/en/latest/configuring.html
- Deploying: https://jupyterlite.readthedocs.io/en/latest/deploying.html

### Deploy a new version of JupyterLite

To change the version of the prebuilt JupyterLite assets, update the `jupyterlite` package version in the [requirements.txt](./blob/main/requirements.txt) file.

The `requirements.txt` file can also be used to add extra prebuilt ("federated") JupyterLab extensions to the deployed JupyterLite website.

Commit and push any changes. The site will be deployed on the next push to the `main` branch.

## Development

Create a new environment:

```bash
mamba create -n jupyterlite-demo
conda activate jupyterlite-demo
pip install -r requirements.txt
```

Then follow the steps documented in the [Configuring](https://jupyterlite.readthedocs.io/en/latest/configuring.html) section.
