FROM nyholm/roave-bc-check:base
MAINTAINER Tobias Nyholm <tobias.nyholm@gmail.com>

ENV BC_CHECK_VERSION 6.1.x

RUN composer global config minimum-stability dev \
    && composer global config prefer-stable true

RUN composer global require --no-update "roave/backward-compatibility-check:6.1.x-dev" \
    && composer global update \
    && composer global show | grep backward-compatibility-check
