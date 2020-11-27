FROM php:7.3-fpm-alpine

ENV PHP_VERSION 7.3
ENV PHP_INI_DIR /usr/local/etc/php

RUN apk --no-cache --update upgrade

RUN `# ------- add usermod and groupmod tools -----------` && \
    echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk add --update shadow

# add packages for pecl
RUN apk add autoconf gcc g++ make git
RUN apk add fcgi

# add standart php extensions
RUN docker-php-ext-install bcmath && \
    docker-php-ext-install opcache && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install sockets

# add pecl php extensions
RUN pecl install redis && docker-php-ext-enable redis && \
    apk add libzip libzip-dev && pecl install zip && docker-php-ext-enable zip

# add standart ioncube php-extension
RUN    mkdir -p setup_php && cd setup_php && \
    curl -sSL https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz -o ioncube.tar.gz && \
    tar -xf ioncube.tar.gz && \
    mv ioncube/ioncube_loader_lin_${PHP_VERSION}.so `php-config --extension-dir` && \
    docker-php-ext-enable ioncube_loader_lin_${PHP_VERSION}.so && \
    cd .. && rm -rf setup_php && \
    `# ------- install composer -------------------------` && \
    mkdir -p setup_composer && cd setup_composer && \
    curl -s https://getcomposer.org/installer -o composer-setup.php && \
    /usr/local/bin/php composer-setup.php --1 --install-dir=/usr/bin --filename=composer && \
    cd .. && rm -rf setup_composer

RUN ln -s /usr/bin/php7.3 /usr/bin/php \
    && ln -s /opt/remi/php7.3/root/bin/php-config /usr/bin/php-config \
    && ln -s /etc/opt/remi/php7.3 /etc/php


WORKDIR /data

VOLUME ["/data", "/cache"]
