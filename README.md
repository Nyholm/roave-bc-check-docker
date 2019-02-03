# Docker image for [Roave Backward Compatibility Check](https://github.com/Roave/BackwardCompatibilityCheck)

This repository has taken much inspiration from [PHPStan](https://github.com/phpstan/docker-image) and 
[OskarStark](https://github.com/OskarStark/phpstan-ga)

The image is based on [Alpine Linux](https://alpinelinux.org/) and built daily.

## Supported tags

- `latest` [(latest/Dockerfile)](latest/Dockerfile)
- `stable` [(stable/Dockerfile)](stable/Dockerfile)
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
docker pull nyholm/roave-bc-check:2.x
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

## Github Action

You can use it as a Github Action like this:

_.github/main.workflow_
```
workflow "Main" {
  on = "push"
  resolves = ["Roave BC Check"]
}

action "Roave BC Check" {
  uses = "docker://nyholm/roave-bc-check-ga"
  secrets = ["GITHUB_TOKEN"]
  args = ""
}
```

**You can copy/paste the .github folder (under examples/) to your project and thats all!**

## Docker

Docker images are built automatically every day. They are located here: 

* [nyholm/roave-bc-check](https://cloud.docker.com/u/nyholm/repository/docker/nyholm/roave-bc-check)
* [nyholm/roave-bc-check-ga](https://cloud.docker.com/u/nyholm/repository/docker/nyholm/roave-bc-check-ga)
