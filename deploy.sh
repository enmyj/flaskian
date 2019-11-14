#!/bin/bash

# THESE INSTRUCTIONS ARE THE BEST
# https://github.com/buchdag/letsencrypt-nginx-proxy-companion-compose

# create network
docker network create nginx-proxy

# stand up nginx proxy and letsencrypt
docker-compose up -d

# BUILD IAN
docker build -t ian .

# RUN IAN (yelled from car window)
docker run --rm --detach \
    --name flaskian \
    --network nginx-proxy \
    --env "VIRTUAL_HOST=ianmyjer.com" \
    --env "LETSENCRYPT_HOST=ianmyjer.com" \
    ian:latest
