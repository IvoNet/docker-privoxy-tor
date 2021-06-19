#!/usr/bin/env bash

docker run \
    -it \
    --rm \
    --name proxy \
    -p 8118:8118 \
    -p 9050:9050 \
    ivonet/privoxy-tor:latest
