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
  image: danger89/pnpm:22-alpine
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

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd pnpm
docker build --no-cache --tag pnpm .
```
