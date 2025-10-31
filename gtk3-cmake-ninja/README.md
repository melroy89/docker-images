# GTK3, Gtkmm, Cmake, Ninja, cpack, Cppcheck, doxygen Docker Image 

A docker image based on my [Cmake Docker image](../cmake).
With the extension of gtkmm library installed.

**Note:** Since version tag `4.0` (or higher) we will use GCC v12. Based on the [CMake image 5.0](https://hub.docker.com/r/danger89/cmake) tag.

**Important:** We moved to a different tagging scheme. The tag is just the Debian version we use. Eg. `bookworm`. Also `latest` is no longer created.

**NEW:** We deployed Trixie Docker images as well now, based on the latest Debian LTS release.

## Docker Image

- [Dockerfile](./Dockerfile).

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd gtk3-cmake-ninja
docker build --no-cache --tag gtk3-cmake-ninja .
```
