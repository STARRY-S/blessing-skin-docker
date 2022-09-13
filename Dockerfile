FROM ubuntu:22.04
ARG HTTP_PROXY
ARG HTTPS_PROXY
# Avoid dpkg show interactive dialog
ARG DEBIAN_FRONTEND=noninteractiv
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
    nginx php8.2-fpm php8.2-gd php8.2-mbstring php8.2-xml php8.2-zip \
    php8.2-mysql

RUN cp nginx.conf /etc/nginx/sites-enabled/default

# Create php8.2-fpm socket folder
RUN mkdir -p /run/php && chown www-data:www-data /run/php

# Start nginx
CMD ["./entry.sh"]
