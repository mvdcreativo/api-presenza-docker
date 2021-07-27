FROM php:7.4.2-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

RUN set -e; \
         apk add --no-cache \
                coreutils \
                freetype-dev \
                libjpeg-turbo-dev \
                libjpeg-turbo \
                libpng-dev \
                libzip-dev \
                jpeg-dev \
                icu-dev \
                zlib-dev \
                curl-dev \
                imap-dev \
                libxslt-dev libxml2-dev \
                postgresql-dev \
                libgcrypt-dev \
                oniguruma-dev 

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-configure intl
RUN docker-php-ext-configure imap

RUN set -e; docker-php-ext-install -j "$(nproc)" \
                gd soap imap bcmath mbstring iconv curl sockets \
                opcache \
                pdo_pgsql \
                xsl \
                exif \
                mysqli pdo pdo_mysql \
                intl \
                zip
                
RUN chown laravel:laravel /var/www/html

# RUN chmod -R 777 /var/www/html

# Install Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/bin/composer

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql
