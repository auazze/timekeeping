FROM composer:latest

WORKDIR /var/www/laravel

# Устанавливаем необходимые инструменты
RUN apk add --no-cache bash

# Устанавливаем переменные окружения
ENV COMPOSER_MEMORY_LIMIT=-1
ENV COMPOSER_PROCESS_TIMEOUT=0

# Устанавливаем глобальный тайм-аут для Composer
RUN composer config --global process-timeout 0

ENTRYPOINT ["composer", "--ignore-platform-reqs", "--ignore-platform-req=ext-fileinfo"]