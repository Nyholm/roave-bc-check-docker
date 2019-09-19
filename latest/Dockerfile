FROM nyholm/roave-bc-check:base
MAINTAINER Tobias Nyholm <tobias.nyholm@gmail.com>

ENV BC_CHECK_VERSION dev-master

RUN composer global require "roave/backward-compatibility-check:dev-master" \
    && composer global show | grep backward-compatibility-check