#!/bin/sh -l

sh -c "composer install && /composer/vendor/bin/roave-backward-compatibility-check --version && /composer/vendor/bin/roave-backward-compatibility-check $*"

