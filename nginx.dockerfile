FROM nginx

ADD ./nginx/nginx.conf /etc/nginx/
ADD ./nginx/default.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/html

# RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/bash -D laravel

# RUN chown laravel:laravel /var/www/html