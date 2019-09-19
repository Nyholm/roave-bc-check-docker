FROM php:7.3-alpine3.8
MAINTAINER Tobias Nyholm <tobias.nyholm@gmail.com>

ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH /composer/vendor/bin:$PATH

RUN apk --update --progress --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/community add \
    git  \
    && docker-php-ext-install pcntl  \
    && docker-php-ext-install intl  \
    && echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/99_memory-limit.ini \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

COPY --from=composer:1.8.0 /usr/bin/composer /usr/local/bin/composer

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["roave-backward-compatibility-check"]