FROM nyholm/roave-bc-check:base
MAINTAINER Tobias Nyholm <tobias.nyholm@gmail.com>

ENV BC_CHECK_VERSION 5.x

RUN composer global require "roave/backward-compatibility-check:^5.0" \
    && composer global show | grep backward-compatibility-check