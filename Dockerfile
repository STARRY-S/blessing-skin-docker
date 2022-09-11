FROM ubuntu:22.04
ARG HTTP_PROXY
ARG HTTPS_PROXY
# Avoid dpkg show interactive dialog
ARG DEBIAN_FRONTEND=noninteractiv
WORKDIR /server

# Copy source files
COPY src .
COPY server.zip .
COPY start.sh .

# Install utils
RUN apt -y update
RUN apt -y install zip unzip wget curl ca-certificates \
    lsb-release ca-certificates apt-transport-https software-properties-common
# Install nginx and php
RUN add-apt-repository ppa:ondrej/php
RUN apt -y update
RUN apt -y install \
    nginx php8.2-fpm

# Uncompressing blessing skin server
RUN unzip server.zip && rm server.zip
RUN ls -alh

# Generate configuration
RUN cp .env.example .env
RUN php artisan key:generate
# Update nginx configuration
RUN cp nginx.conf /etc/nginx/sites-enabled/default

# Start nginx
CMD ["./start.sh"]
