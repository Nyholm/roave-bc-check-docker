FROM nyholm/roave-bc-check:base
MAINTAINER Tobias Nyholm <tobias.nyholm@gmail.com>

ENV BC_CHECK_VERSION 4.x

RUN composer global require --no-update "roave/backward-compatibility-check:^4.0" \
    && composer global update \
    && composer global show | grep backward-compatibility-check
