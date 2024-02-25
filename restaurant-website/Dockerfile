#Definir la variable d'environnement en production
ARG APP_ENV=prod

#On utilise l'image php alpine, et on definis une étape php_base
FROM php:8.3-fpm-alpine AS php_base

# Copier les dossier du répertoire courant, vers le dossier du conteneur
COPY . /usr/src/restaurant-website

# Declarer le dossier du conteneur comme le dossier de travail par défaut
WORKDIR /usr/src/restaurant-website

# Installer les dependance necaissaire a la construction de l'image Docker, puis a l'execution PHP : libicu-dev : bibliotèque PHP pour les texte et les langues, unzip, libzip-dev : pour deziper et manipuler les dossier .zip, git : outil de gestion de version
#intl : formatage de texte PHP, zip : extention pour la manipulation des fichiers zip en php
# apcu : gestion de cache PHP
# docker-php-ext-enable apcu : active l'extention apcu
RUN apk --no-cache add libicu-dev git unzip libzip-dev \
    && docker-php-ext-install intl zip \
    && pecl install apcu \
    && docker-php-ext-enable apcu
    
# Installer Symfony Cli seulement si la variable d'environement est à prod
RUN if [ "$APP_ENV" != "prod" ]; then \
        curl -sS https://get.symfony.com/cli/installer | bash -s -- --install-dir=/usr/local/bin; \
    fi

# On déclare une étape production basée sur php_base dédiée a la construction de l'image en environnement de production
FROM php_base AS production

# On creer le répertoire var et definir les permission pour l'utilisateur www-data pour qu'il puisse lire les fichiers
RUN mkdir -p /usr/src/restaurant-website/var \
    && chown -R www-data:www-data /usr/src/restaurant-website \
    && find /usr/src/restaurant-website/var -type d -exec chmod 755 {} \; \
    && find /usr/src/restaurant-website/var -type f -exec chmod 644 {} \;

# Changer l'utilisateur par défaut a www-data
USER www-data

# Installer Composer, ainsi que les dépendances nécaissaires via Composer :
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --no-dev --optimize-autoloader

# Compiler les assets JS et CSS
RUN php bin/console asset-map:compile
