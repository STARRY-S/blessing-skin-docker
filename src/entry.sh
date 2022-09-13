#!/bin/bash

cd /server/

# First initialize
if [[ ! -e ".env" ]]; then
    echo "========== Start first initialize =========="

    # Uncompressing blessing skin server
    mkdir -p html
    unzip server.zip -d /server/html

    # Generate configuration
    cd html/
    cp .env.example .env
    php artisan key:generate

    # Change source file owner to www-data
    chown -R www-data:www-data ./*
    chown -R www-data:www-data ./.env
    cd ..
fi

service php8.2-fpm restart
service nginx restart

sleep infinity
