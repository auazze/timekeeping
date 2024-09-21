FROM composer:latest

WORKDIR /var/www/laravel

RUN apk add --no-cache bash

ENV COMPOSER_MEMORY_LIMIT=-1
ENV COMPOSER_PROCESS_TIMEOUT=0

RUN composer config --global process-timeout 0
