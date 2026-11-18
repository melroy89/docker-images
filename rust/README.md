# Rust Docker image with Node.js + Build essentials

This Docker image is based on Rust, but also contains Node.js.

As a bonus you will also get `build-essential`, `cmake`, `pkg-config` and `rsync` pre-installed.

The image defaults to root for GitLab Runner checkout compatibility, matching the
upstream Rust image. A prepared `user` account (UID/GID 1000) remains available;
application images can explicitly select it with `USER user` or `USER 1000` after
assigning ownership of their application files.

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd rust
docker build --no-cache --tag rust .
```
