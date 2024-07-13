FROM php:8.2-fpm-alpine

ADD ./docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel
RUN mkdir -p /var/www/html

ADD ./src/ /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache $PHPIZE_DEPS linux-headers
RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN chown -R laravel:laravel /var/www/html