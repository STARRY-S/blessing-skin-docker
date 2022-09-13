#!/bin/bash

cd $(dirname $0)/..

if [ ! -e "./certs/cert.key" ] || [ ! -e "./certs/cert.crt" ]; then
    echo "FATA: 'cert.key' and 'cert.crt' are required in 'certs/' folder!"
    exit 1
fi

docker run -v $(pwd)/certs:/certs -d -p 80:80 -p 443:443 --name bs-server --privileged bs-server
