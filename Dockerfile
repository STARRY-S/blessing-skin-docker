FROM ubuntu:22.04
ARG HTTP_PROXY
ARG HTTPS_PROXY
# Avoid dpkg show interactive dialog
ARG DEBIAN_FRONTEND=noninteractiv
WORKDIR /server

COPY src .
COPY server.zip .

RUN apt -y update
RUN apt -y install zip unzip wget curl ca-certificates \
    lsb-release ca-certificates apt-transport-https software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt -y update
RUN apt -y install \
    php8.2-fpm

RUN unzip server.zip
RUN ls -alh