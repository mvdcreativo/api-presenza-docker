FROM nginx:stable-alpine

ADD ./nginx/nginx.conf /etc/nginx/
ADD ./nginx/default.conf /etc/nginx/conf.d/

RUN apt-get install certbot
RUN certbot certonly \
    -d mvdcreativo.tk \
    --noninteractive \
    --standalone \
    --agree-tos \
    --register-unsafely-without-email

RUN mkdir -p /var/www/html

# RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/bash -D laravel

# RUN chown laravel:laravel /var/www/html