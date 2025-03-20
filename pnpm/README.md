# Pnpm Docker Image

Node.js **alpine** base image with `pnpm` installed using corepack & activated.

Use `.pnpm-store` path to cache the packages in your CI/CD pipeline.  
And optionally use `pnpm-lock.yaml` as your cache key to restore the cache.

## Usage

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
