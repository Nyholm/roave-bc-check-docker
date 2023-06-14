FROM php:8.1-alpine
MAINTAINER Tobias Nyholm <tobias.nyholm@gmail.com>

ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH /composer/vendor/bin:$PATH

RUN set -e && \
    apk add --no-cache --update --progress git icu gmp && \
    apk add --no-cache --update --progress --virtual build-deps icu-dev gmp-dev && \
    docker-php-ext-install -j$(nproc) pcntl intl bcmath gmp sockets && \
    echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/99_memory-limit.ini && \
    apk del build-deps && \
    rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

VOLUME ["/app"]
WORKDIR /app
RUN git config --global --add safe.directory /app
RUN git config --global --add safe.directory /github/workspace

RUN composer global require "symfony/process:^4.4|^5.1|^6.0" "symfony/yaml:^4.4|^5.1|^6.0" --no-update
ADD config-support.php /composer/vendor/bin/roave-bc-with-config-support

ENTRYPOINT ["roave-bc-with-config-support"]
