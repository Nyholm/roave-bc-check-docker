FROM nyholm/roave-bc-check:base
MAINTAINER Tobias Nyholm <tobias.nyholm@gmail.com>

ENV BC_CHECK_VERSION 3.x

RUN composer global require roave/backward-compatibility-check ^3.0 --ignore-platform-reqs \
    && composer global show | grep backward-compatibility-check