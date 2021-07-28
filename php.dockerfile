FROM php:7.4-fpm-buster

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    vim \
    unzip \
    # needed for gd
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev 

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd \
    --with-jpeg=/usr/include/ \
    --with-freetype=/usr/include/
    
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

RUN mkdir -p /var/www/html

RUN apt-get install certbot
RUN certbot certonly \
    -d mvdcreativo.tk \
    --noninteractive \
    --standalone \
    --agree-tos \
    --register-unsafely-without-email

# RUN chown laravel:laravel /var/www/html

RUN chmod -R 777 /var/www/html

# Install Composer
# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql
