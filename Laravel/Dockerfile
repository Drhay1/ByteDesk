FROM php:8.3-cli

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libzip-dev \
    nodejs \
    npm \
    default-mysql-client \
 && docker-php-ext-install zip pdo_mysql \
 && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY . .

RUN composer install --no-interaction --prefer-dist --optimize-autoloader
RUN npm install --force
RUN npm run build

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["docker-entrypoint.sh"]




# FROM bitnami/laravel:latest

# USER root

# # RUN apt-get update -y
# # RUN apt-get upgrade -y

# ENV COMPOSER_ALLOW_SUPERUSER=1

# # RUN composer self-update --2

# COPY . .

# RUN composer install --no-interaction --prefer-dist --optimize-autoloader --ignore-platform-req=php


# RUN npm install --force

# # Build the frontend assets
# RUN npm run build

# # CMD php artisan migrate --force

# # Expose the port for the Laravel application
# EXPOSE 8000
