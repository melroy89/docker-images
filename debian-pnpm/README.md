# Debian Pnpm Docker Image

Node.js **Debian** based image with `pnpm` installed using corepack & activated. Use the smaller [pnpm](../pnpm) docker image if possible. 
Since this image is larger, but contains also more like `apt`.

Use `.pnpm-store` path to cache the packages in your CI/CD pipeline.  
And optionally use `pnpm-lock.yaml` as your cache key to restore the cache.

## Usage

Use this Docker image within a build of your application. 

**Hint:** Try to use the smaller [`pnpm` docker image](../pnpm) in case you want to just use `pnpm` in CI/CD workflows.

GitLab usage example:

```docker
FROM danger89/debian-pnpm:24.14-trixie AS builder

ARG commitHash
ENV DOCKER_COMMIT_HASH=${commitHash}

ENV NODE_ENV=production

WORKDIR /build
COPY . .
RUN apt-get update
RUN apt-get install -y build-essential rsync
RUN pnpm install --prod
```

## Docker Tags

The _Docker tag_ is a combination of the pnpm version + Debian distro name.

For example: `24.14-trixie`. This is inline with the Node.js Docker image naming convention.

## Docker Image

- [Dockerfile](./Dockerfile).

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd pnpm
docker build --no-cache --tag node-pnpm .
```
