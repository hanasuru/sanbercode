FROM php:7.2-fpm-alpine

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install -j$(nproc) pdo_mysql 
RUN rm -rf /var/www/

COPY --chown=82:www-data src /app
COPY ./conf/php/www.conf /usr/local/etc/php-fpm.d/www.conf

EXPOSE 9000

WORKDIR /var/www
