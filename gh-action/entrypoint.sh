#!/bin/sh -l

set -e

REPO="https://github.com/$GITHUB_REPOSITORY.git"
git remote remove bc_origin_https  >/dev/null 2>&1 || true
git remote add bc_origin_https $REPO

git fetch bc_origin_https --tags || true
COMPOSER_COMMAND="composer install --no-scripts --no-progress"
echo "::group::$COMPOSER_COMMAND"
$COMPOSER_COMMAND
echo "::endgroup::"
/composer/vendor/bin/roave-backward-compatibility-check --version
/composer/vendor/bin/roave-bc-with-config-support $*

git remote remove bc_origin_https
