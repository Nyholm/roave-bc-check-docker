# Docker image for [Roave Backward Compatibility Check](https://github.com/Roave/BackwardCompatibilityCheck)

This repository has taken much inspiration from [PHPStan](https://github.com/phpstan/phpstan) and
[OskarStark](https://github.com/OskarStark/phpstan-ga)

The image is based on [Alpine Linux](https://alpinelinux.org/) and built daily.

## Supported tags

- `latest` [(latest/Dockerfile)](latest/Dockerfile)
- `stable` [(stable/Dockerfile)](stable/Dockerfile)
- `5.x` [(5.x/Dockerfile)](5.x/Dockerfile)
- `4.x` [(4.x/Dockerfile)](4.x/Dockerfile)
- `3.x` [(3.x/Dockerfile)](3.x/Dockerfile)
- `2.x` [(2.x/Dockerfile)](2.x/Dockerfile)
- `1.x` [(1.x/Dockerfile)](1.x/Dockerfile)

## How to use this image

### Install

Install the container:

```
docker pull nyholm/roave-bc-check
```

Alternatively, pull a specific version:

```
docker pull nyholm/roave-bc-check:5.x
```

### Usage

We are recommend to use the images as an shell alias to access via short-command.
To use simply *roave-bc-check* everywhere on CLI add this line to your ~/.zshrc, ~/.bashrc or ~/.profile.

```
alias roave-bc-check='docker run -v $PWD:/app --rm nyholm/roave-bc-check'
```

If you don't have set the alias, use this command to run the container:

```
docker run --rm -v /path/to/app:/app nyholm/roave-bc-check [some arguments for Roave Backward Compatibility Check]
```

For example:

```
docker run --rm -v `pwd`:/app nyholm/roave-bc-check  --format=markdown
```

### Config

You may specify a config file named `roave-bc-check.yaml` in the root of your project.
With that config file you may ignore errors.

```
parameters:
    ignoreErrors:
        - '#\[BC\] CHANGED: Property Acme\\Foobar::\$bar changed default value from array#'
        - '#\[BC\] CHANGED: Property .+ changed default value#'
        - '#bar#'

```

## Github Action

You can use it as a Github Action like this:

_.github/workflow/test.yml_
```
on: [push, pull_request]
name: Test
jobs:
    roave_bc_check:
        name: Roave BC Check
        runs-on: ubuntu-latest
        steps:
            - uses: actions/checkout@v2
            - name: Roave BC Check
              uses: docker://nyholm/roave-bc-check-ga
```

**You can copy/paste the .github folder (under examples/) to your project and that's all!**

The github action is always using the latest stable release of `roave/backward-compatibility-check`.

## Docker

Docker images are built automatically every day. They are located here:

* [nyholm/roave-bc-check](https://cloud.docker.com/u/nyholm/repository/docker/nyholm/roave-bc-check)
* [nyholm/roave-bc-check-ga](https://cloud.docker.com/u/nyholm/repository/docker/nyholm/roave-bc-check-ga)
