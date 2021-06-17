#!/bin/bash
# Ensure this file is executable: chmod u+x deploy.sh

# Ensure that jupyterlite is installed: ./jupyterlite-install.sh

# Create all.json manifest
pip3 install jupyter_server
python3 all_generator.py

# Ensure distrribtiuon file directory available
mkdir -p dist/api/contents/ dist/files

# Copy manifest
#cp all.json dist/api/contents/
cp -R file_manifests/* dist/api/contents/

cp jupyter-lite.json dist/
cp config-utils.js dist/
cp -R custom/* dist/

# Copy content
rm -rf dist/files/*
cp -r content/* dist/files/



# Local webserver
# python3 -m http.server 8111 -d dist/
