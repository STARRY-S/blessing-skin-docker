#!/bin/bash

cd $(dirname $0)/..

if [ ! -e "./certs/cert.key" ] || [ ! -e "./certs/cert.crt" ]; then
    echo "FATA: 'cert.key' and 'cert.crt' are required in 'certs/' folder!"
    exit 1
fi

mkdir -p certs
mkdir -p html

docker run -v $(pwd)/certs:/certs \
    -v $(pwd)/html:/server/html \
    -d -p 80:80 -p 443:443 \
    --name bs-server \
    --privileged \
    bs-server
