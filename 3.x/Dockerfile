FROM nyholm/roave-bc-check:base
MAINTAINER Tobias Nyholm <tobias.nyholm@gmail.com>

ENV BC_CHECK_VERSION 3.x

RUN composer global require --no-update "roave/backward-compatibility-check:^3.0" \
    && composer global update \
    && composer global show | grep backward-compatibility-check
