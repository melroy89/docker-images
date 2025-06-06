# Pnpm Docker Image

Node.js **alpine** base image with `pnpm` installed using corepack & activated.

Use `.pnpm-store` path to cache the packages in your CI/CD pipeline.  
And optionally use `pnpm-lock.yaml` as your cache key to restore the cache.

## Usage

Use this Docker image within a CI/CD pipeline of your choice.

GitLab usage example:

```yaml
stages:
  - build

build:
  stage: build
  image: danger89/pnpm:22
  script:
    - pnpm install # install dependencies
    # - ... Do more ...
  cache:
    key:
      files:
        - pnpm-lock.yaml
    paths:
      - .pnpm-store
```

## Docker Tags

While there is a specific pnpm version used (ideally the latest pnpm v10 at the moment of writing).

The _Docker tag_ however is simply the Node.js version.

For example: `23`. This is inline with the Node.js Docker image naming convention. Just note we use the Alpine version.

## Docker Image

- [Dockerfile](https://gitlab.melroy.org/melroy/docker-images/-/blob/main/pnpm/Dockerfile).

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd pnpm
docker build --no-cache --tag pnpm .
```
