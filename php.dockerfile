FROM php:7.4-fpm-buster

ADD ./php/www.conf /usr/local/etc/php-fpm.d/

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/bash -D laravel

RUN mkdir -p /var/www/html

RUN chown laravel:laravel /var/www/html

RUN chmod -R 777 /var/www/html

# Install Composer
RUN mkdir -p /usr/bin/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/bin/composer

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql
