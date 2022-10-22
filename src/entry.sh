#!/bin/bash

cd /server/

# First initialize
if [[ ! -e "html/.env" ]]; then
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

service php8.1-fpm restart
service nginx restart

echo "=========== Server started ==========="

tail -f /var/log/nginx/error.log
