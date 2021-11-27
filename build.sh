#!/bin/bash
set -e

curl --retry 3 https://hc-ping.com/da32db17-1285-4ffa-ac18-58fdc2a0cd83/start

cd /src

papermill Covid.ipynb Covid_out.ipynb
jupyter nbconvert --to=html Covid_out.ipynb
cp Covid_out.html /usr/share/nginx/html/index.html

curl --retry 3 https://hc-ping.com/da32db17-1285-4ffa-ac18-58fdc2a0cd83