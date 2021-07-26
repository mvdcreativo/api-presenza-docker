FROM composer:2

ENV PHP_VERSION=7.2.5

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

# RUN composer install

WORKDIR /var/www/html
