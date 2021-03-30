FROM php:7.1-fpm-alpine3.4
RUN apk update --no-cache \
    && apk add --no-cache $PHPIZE_DEPS \
    && apk add --no-cache mysql-dev \
    && docker-php-ext-install pdo pdo_mysql


FROM nginx:1.13.8-alpine
COPY ./default.conf /etc/nginx/conf.d/default.conf

FROM mysql:5.7.21
