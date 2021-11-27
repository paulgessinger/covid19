FROM python:3.9-slim-buster AS builder

WORKDIR /src

COPY requirements.txt /src

RUN pip install -r requirements.txt 

COPY Covid.ipynb /src

RUN papermill Covid.ipynb Covid_out.ipynb &&\
    jupyter nbconvert --to=html Covid_out.ipynb && \
    mkdir output && \
    mv Covid_out.html output/index.html

FROM nginx
WORKDIR /app

COPY CHECKS /app/
COPY nginx.conf.sigil .

COPY --from=builder /src/output /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf