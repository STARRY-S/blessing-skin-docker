#!/bin/bash

cd $(dirname $0)/..

if [[ -z "$VERSION" ]]; then
    echo "VERSION environment variable not specified, set to default: 6.0.2"
    VERSION="6.0.2"
fi

echo "Downloading Blessing Skin Server v$VERSION from GitHub Releas"

if [[ -r "server.zip" ]]; then
    echo "Delete existing server.zip file first"
    rm server.zip
fi

wget https://github.com/bs-community/blessing-skin-server/releases/download/$VERSION/blessing-skin-server-$VERSION.zip -O server.zip
