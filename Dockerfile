FROM nginx:1.21

RUN apt-get update && \
    apt-get install --no-install-recommends -y python3 python3-pip &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /src

COPY requirements.txt /src

RUN pip3 install -r requirements.txt 

COPY Covid.ipynb /src

COPY build.sh /src

RUN ./build.sh

WORKDIR /app
COPY CHECKS /app
COPY nginx.conf.sigil .
COPY app.json .

COPY nginx.conf /etc/nginx/conf.d/default.conf