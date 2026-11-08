# BCH Explorer CI toolchain

This additive image preloads pnpm 11.24.0 for BCH Explorer on the existing
Rust 1.98.1 / Node 24.22.1 base, with the repository-required Rust 1.95 toolchain preinstalled. Other projects keep their existing images.

Build and verify before publishing a new, immutable tag:

```sh
docker build -t registry.melroy.org/melroy/docker-images/bch-ci:rust1.95-node24.22.1-pnpm11.24.0-20261108 bch-ci
docker run --rm --network none --entrypoint bash registry.melroy.org/melroy/docker-images/bch-ci:rust1.95-node24.22.1-pnpm11.24.0-20261108 -c 'cd /tmp/check && pnpm --version'
```

Published digest:
`sha256:1783506a5e592cb7db50a58cb9ab36f05812f3da508b644da8264f9bd2738fd5`.

Use a new tag when changing the Dockerfile or rebuilding against an updated base.
This image is published explicitly, not by the scheduled rebuild of shared images.
Runner concurrency and existing images are unchanged.
