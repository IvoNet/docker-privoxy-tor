#!/usr/bin/env bash


docker run \
       -d \
       --rm \
       --cap-add=NET_ADMIN \
       --device /dev/net/tun \
       --name vpn \
       --restart unless-stopped \
       -v "/Users/ivonet/dev/ivonet-docker-images/_config/nordvpn/ovpn:/ovpn" \
       -v "/Users/ivonet/dev/ivonet-docker-images/_config/nordvpn/creds:/credentials" \
       -p 8118:8118 \
       -e LOCATION=nl \
       -e MAX_LOAD=25 \
       -e PROTOCOL=tcp \
       ivonet/nordvpn:latest
#       -e RECREATE_VPN_CRON="*/5 * * * *" \

docker run \
    -d \
    --rm \
    --name proxy \
    --net container:vpn \
    ivonet/privoxy-tor:latest
