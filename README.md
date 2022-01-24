# JupyterLite Demo + Quickstart

Deploy JupyterLite as a static site, with custom example notebooks

This fork of [jupyterlite/demo](https://github.com/jupyterlite/demo) tries to minimize the number of files+steps required to deploy your own Jupyterlite notebooks.

The simplest way to deploy Jupyterlite involves using the Python library to generate a static bundle:
```bash
mkdir content && cp <some notebook>.ipynb content/       # Create a directory with one or more example notebooks
pip install jupyterlite jupyterlab                       # Install jupyterlite and jupyterlab (the latter is required for indexing the example notebooks)
jupyter lite build --contents content --output-dir dist  # Build the bundle
```
At this point, `dist/` is a full static Jupyterlite bundle, including `<some notebook>.ipynb`, which you can copy to any static host. If you commit it to a location served by GitHub Pages, it will be served there!

Two other approaches are described below:
- ["Quickstart"](#quickstart)
  - fork this repo (automatically publishes a copy of Jupyterlite under your username)
  - customize the example notebooks under `content/`
  - link people directly to static, interactive versions of notebooks you create
  - Example: [runsascoded.github.io/jupyterlite-demo](https://runsascoded.github.io/jupyterlite-demo/)
- ["Embed as a submodule inside an existing GitHub Pages site"](#embedded)
  - embed a Jupyterlite bundle, including custom example notebooks, in an existing GitHub Pages site
  - link people directly to static, interactive versions of notebooks you create
  - Example: [runsascoded.com/jupyter/lite/](https://runsascoded.com/jupyter/lite/)

## Quickstart <a id="quickstart"></a>

### Fork this repo (or [jupyterlite/demo](https://github.com/jupyterlite/demo))
- [`.github/workflows/deploy.yml`](./.github/workflows/deploy.yml) will automatically build+publish to a new GitHub Pages site owned by your user/org  (e.g. this repo is deployed at [runsascoded.github.io/jupyterlite-demo](https://runsascoded.github.io/jupyterlite-demo/))
- Specific notebooks can be linked to, in "retro" mode, like this: [runsascoded.github.io/jupyterlite-demo/retro/notebooks/?path=plotly-test.ipynb](https://runsascoded.github.io/jupyterlite-demo/retro/notebooks/?path=plotly-test.ipynb)
- The [`content/`](./content) directory contains notebooks that the server is seeded with
  - The GitHub Action picks them up [here](./.github/workflows/deploy.yml#L27) during the build process
  - In this fork, there's just one notebook: [`content/plotly-test.ipynb`](./content/plotly-test.ipynb)

### Add your own notebook (for easy sharing)
- add an `.ipynb` to the [`content/`](./content) folder
- Add, commit, and push:
    ```bash
    git add content
    git commit 'add notebook'
    git push
    ```

Your fork's GitHub Action will build+publish a new Jupyterlite bundle (including your new notebooks).

## Embed as a submodule inside an existing GitHub Pages site <a id="embedded"></a>
You may want to publish a Jupyterlite bundle, including custom example notebooks, to a specific sub-path within an existing GitHub Pages site.

One way to do this is:
- add your fork of this repo as a submodule inside an existing GitHub Pages site dir
- customize the example notebooks (in `content/`)
- build and commit the bundle (within your submodule)
- commit the new submodule state within the outer GitHub Pages site repo

The outer GitHub Pages repo will then include your Jupyterlite bundle, with custom example notebooks, at a sub-path of your choosing.

For example:
- here's a GitHub Pages site where I've embedded Jupyterlite at `/jupyter/lite`: [runsascoded.com/jupyter/lite/](https://runsascoded.com/jupyter/lite/)
- here's a direct link to an example notebook there (in "retro" mode): [runsascoded.com/jupyter/lite/retro/notebooks/?path=plotly-test.ipynb](https://runsascoded.com/jupyter/lite/retro/notebooks/?path=plotly-test.ipynb)

That GitHub Pages site is built from a private repo, and contains many projects embedded at different paths in this manner, which is a useful way to combine different repos into one GitHub Pages site.

Detailing the steps:

### Add your fork of this repo to an existing GitHub Pages site repo
From within a directory published as a GitHub Pages site:
```bash
git submodule add https://github.com/<your username>/jupyterlite-demo.git jupyter
cd jupyter
```

In this example, the source is cloned into `jupyter/`, and the built bundle will go in a further subdirectory called `lite/`, meaning the Jupyterlite bundle will be accessible in the existing GitHub Pages site at path `/jupyter/lite`, e.g. [runsascoded.com/jupyter/lite](https://runsascoded.com/jupyter/lite). Those directory names can be whatever you like, and you can make them two separate directories (so that the final path is only one level below the root, instead of two), if you like. 

### Customize the example notebooks under `content/`
```bash
# remove the example notebook from this repo
git rm content/plotly-test.ipynb

# copy in a new example notebook from your Downloads folder
cp ~/Downloads/<some notebook>.ipynb content/

# Add/Commit/Push, within submodule
git add content
git commit -m 'Add my custom example notebook!'
git push  
```

### Build Jupyterlite (including new example notebook)
```bash
pip install jupyterlite jupyterlab
jupyter lite build --contents content --output-dir lite
```

`jupyterlite` is the main `pip` requirement, but `jupyterlab` is also required in order for the `jupyter lite build` to correctly index the example notebooks in `content/`, so that they get presented to users on the frontend (see [this jupyterlite#318 comment](https://github.com/jupyterlite/jupyterlite/issues/318#issuecomment-945492049)).

### Commit+Push the built Jupyterlite bundle (in the submodule)
At this point you have a bunch of files inside `lite/` now, that all need to get pushed (inside the submodule) and then included in the outer GitHub Pages repo:
```bash
git add lite
git commit -m "Add built jupyterlite bundle"
git push
```
This will be a huge number of files the first time, but should be many fewer in the future, when the built bundle is all there and you are just tweaking which example notebooks are presented.

### Commit+Push the `jupyter` submodule (in the outer, GitHub Pages repo)
Now we're ready to tell the GitHub Pages site to include the new files, and publish them:
```bash
cd ..  # move to the parent GitHub Pages repo
git add jupyter  # add the changes to the `jupyter` submodule (your fork of this repo)
git commit -m 'Add jupyterlite bundle'
git push
```

That's it! You should have a Jupyterlite bundle, with custom example notebooks of your choosing, embedded within your GitHub Pages site at `/jupyter/lite`.
