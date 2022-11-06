#!/bin/bash

cd $(dirname $0)/..

if [ ! -e "./certs/cert.key" ] || [ ! -e "./certs/cert.crt" ]; then
    echo "FATA: 'cert.key' and 'cert.crt' are required in 'certs/' folder!"
    exit 1
fi

mkdir -p certs
mkdir -p html

if [[ -d "default.conf" ]]; then
    rm -rf default.conf
    touch default.conf
else if [[ ! -f "default.conf" ]]; then
    touch default.conf
fi

docker run -v $(pwd)/certs:/certs \
    -v $(pwd)/html:/server/html \
    -v $(pwd)/default.conf:/etc/nginx/sites-enabled/default \
    --restart=unless-stopped \
    -d -p 80:80 -p 443:443 \
    --name bs-server \
    --privileged \
    bs-server
