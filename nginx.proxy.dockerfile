FROM jwilder/nginx-proxy:alpine

ADD ./nginx/custom_proxy_settings.conf /etc/nginx/conf.d/
ADD ./nginx/default.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/html

# RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/bash -D laravel

# RUN chown laravel:laravel /var/www/html