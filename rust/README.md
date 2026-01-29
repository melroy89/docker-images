# Rust Docker image with Node.js + Build essentials

This Docker image is based on Rust, but also contains Node.js.

As a bonus you will also get `build-essential`, `pkg-config` and `rsync` pre-installed.

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd rust
docker build --no-cache --tag rust .
```
