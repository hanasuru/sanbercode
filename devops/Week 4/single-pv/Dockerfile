FROM php:7.2-fpm-alpine

RUN apk add --update mysql mysql-client nginx
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install -j$(nproc) pdo_mysql

RUN mkdir /run/nginx
RUN mkdir /run/mysqld
RUN rm -f /var/cache/apk/*

WORKDIR /var/www/html

COPY --chown=82:www-data src /var/www/html
COPY ./conf/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/php/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/mysql/my.cnf /etc/my.cnf
COPY ./run.sh /run.sh

ENV MYSQL_DATABASE=laravel
ENV MYSQL_USER=devops
ENV MYSQL_PASSWORD=12345

ENTRYPOINT ["sh", "/run.sh"]

EXPOSE 80