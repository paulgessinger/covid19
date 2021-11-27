#!/bin/bash
set -e

cd /src

papermill Covid.ipynb Covid_out.ipynb
jupyter nbconvert --to=html Covid_out.ipynb
cp Covid_out.html /usr/share/nginx/html/index.html