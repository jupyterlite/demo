#!/bin/bash
# Ensure this file is executable: chmod u+x jupyterlite-install.sh

# Install jupyterlite
curl -L https://github.com/jtpio/jupyterlite/releases/download/v0.1.0a0/jupyterlite-app-0.1.0-alpha.0.tgz | tar -xz
mv package dist

# Install packages
#cp -R packages/* dist/