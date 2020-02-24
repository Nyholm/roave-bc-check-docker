#!/bin/sh -l

REPO="https://github.com/$GITHUB_REPOSITORY.git"
git remote remove bc_origin_https  >/dev/null 2>&1 || true
git remote add bc_origin_https $REPO

git fetch bc_origin_https --tags || true
composer install
/composer/vendor/bin/roave-backward-compatibility-check --version
/composer/vendor/bin/roave-backward-compatibility-check $*

git remote remove bc_origin_https
