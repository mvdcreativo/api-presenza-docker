FROM composer:2


RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel
RUN chown laravel:laravel /var/www/html
RUN chmod -R 777 /var/www/html

# RUN composer install

WORKDIR /var/www/html
