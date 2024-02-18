ARG APP_ENV=prod

FROM php:8.3-fpm AS php_base

COPY . /usr/src/restaurant-website

WORKDIR /usr/src/restaurant-website

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
        libicu-dev \
        git \
        unzip \
        libzip-dev \
    && docker-php-ext-install \
        intl \
        zip \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && rm -rf /var/lib/apt/lists/*

RUN if [ "$APP_ENV" != "prod" ]; then \
        curl -sS https://get.symfony.com/cli/installer | bash -s -- --install-dir=/usr/local/bin; \
    fi

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

FROM php_base AS production

RUN mkdir -p /usr/src/restaurant-website/var \
    && chown -R www-data:www-data /usr/src/restaurant-website \
    && find /usr/src/restaurant-website/var -type d -exec chmod 755 {} \; \
    && find /usr/src/restaurant-website/var -type f -exec chmod 644 {} \;

USER www-data

RUN composer install --no-dev --no-interaction --optimize-autoloader

