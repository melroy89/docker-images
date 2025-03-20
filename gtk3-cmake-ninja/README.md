# GTK3, Gtkmm, Cmake, Ninja, cpack, Cppcheck, doxygen Docker Image 

A docker image based on my [Cmake Docker image](https://gitlab.melroy.org/melroy/docker-images/-/tree/main/cmake).
With the extension of gtkmm library installed.

**Note:** Since version tag `2.0` until  `3.4` we used GCC 10. Based on the [CMake image 4.3](https://hub.docker.com/r/danger89/cmake) tag.

**Note:** Since tag `3.0` the Docker image also contains virtual frame buffers (`xvfb`) package, allowing you to test the GTK even in CI/CD pipelines.

**Note:** Since tag `3.2` and up we build `cppcheck` ourselves to get the [latest stable Cppcheck version](https://cppcheck.sourceforge.io/). Based on [CMake image 4.4 and up](https://hub.docker.com/r/danger89/cmake) tag.

**Note:** Since version tag `4.0` (or higher) we will use GCC v12. Based on the [CMake image 5.0](https://hub.docker.com/r/danger89/cmake) tag.

**Important:** We moved to a different tagging scheme. The tag is just the Debian version we use. Eg. `bookworm`. Also `latest` is no longer created.

## Docker Image

- [Dockerfile](https://gitlab.melroy.org/melroy/docker-images/-/blob/main/gtk3-cmake-ninja/Dockerfile).

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd gtk3-cmake-ninja
docker build --no-cache --tag gtk3-cmake-ninja .
```
