FROM ubuntu:22.04
ARG HTTP_PROXY
ARG HTTPS_PROXY
# Avoid dpkg show interactive dialog
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /server

# Copy source files
COPY src .
COPY server.zip .

# Install utils
RUN apt -y update
RUN apt -y install less vim unzip wget curl ca-certificates \
    lsb-release ca-certificates apt-transport-https software-properties-common
# Install nginx and php
RUN add-apt-repository ppa:ondrej/php
RUN apt -y update
RUN apt -y install \
    nginx php8.1-fpm php8.1-gd php8.1-mbstring php8.1-xml php8.1-zip \
    php8.1-mysql

RUN cp nginx.conf /etc/nginx/sites-enabled/default

# Create php8.1-fpm socket folder
RUN mkdir -p /run/php && chown www-data:www-data /run/php

# Start nginx
CMD ["./entry.sh"]
