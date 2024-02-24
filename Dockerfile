FROM php:7.4-fpm
RUN docker-php-ext-install pdo pdo_mysql  exif pcntl 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get update && apt-get install -y nodejs npm && apt-get install redis -y
# zip unzip
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip
RUN docker-php-ext-install zip

WORKDIR /var/www/html

COPY . .


