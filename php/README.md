# PHP Docker Image

Docker Image for CI/CD pipelines, including PHP intl (Internationalization) extension and including `composer` command.  As well as `ssh`, `ssh-add`, `rsync`, `unzip` and `7z` are preinstalled.

Ideal for projects that are using CodeIgniter 4 *or alike* together with `codeigniter/coding-standard` and/or `phpmetrics`. Including deployment of your website in CI/CD.

## Usage

Use this Docker image within a CI/CD pipeline of your choice.


GitLab usage example:

```yaml
stages:
  - test

coding-style:
  stage: test
  image: danger89/php:8.5
  script:
    - vendor/bin/php-cs-fixer fix --dry-run --diff
```

### Docker Tags

Use a specific tag:

```sh
docker pull danger89/php:8.5
```

The Docker tag refers to the PHP version.

## Docker Image

- [Dockerfile](https://gitlab.melroy.org/melroy/docker-images/-/blob/main/php/Dockerfile).

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd php
docker build --no-cache --tag php .
```

