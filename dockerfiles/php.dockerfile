# dockerfiles/php.dockerfile

FROM php:8.2-fpm-alpine

WORKDIR /var/www/laravel

# Установите системные зависимости и библиотеки PostgreSQL
RUN apk update && apk add --no-cache \
    libpq \
    postgresql-dev \
    zip \
    unzip \
    git \
    curl

# Установите расширения PHP
RUN docker-php-ext-install pdo pdo_pgsql fileinfo

# Очистите кеш
RUN apk del postgresql-dev

# Создайте пустую директорию для проекта Laravel
RUN mkdir -p /var/www/laravel

# Установите права доступа
RUN chown -R www-data:www-data /var/www/laravel

# Экспонируйте порт (не обязательно для PHP-FPM)
EXPOSE 9000

# Команда по умолчанию
CMD ["php-fpm"]