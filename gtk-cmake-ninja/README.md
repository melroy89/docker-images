# GTK, Gtkmm, Cmake, Ninja, cpack, Cppcheck, doxygen Docker Image 

A docker image based on my [Cmake Docker image](../cmake).
With the extension of gtkmm library installed.

**Important:** We moved to a different tagging scheme. The tag is just the Debian version we use. Eg. `bookworm`. Also `latest` is no longer created.

**NEW:** We deployed Trixie Docker images as well now, based on the latest Debian LTS release.

**EXTRA NEW:** We now install multiple GTK versions (both GTK3 and GTK4 at the moment), the tags are still: `<DISTRO_RELEASE_NAME>`. Eg. `gtk-cmake-ninja:trixie` or `gtk-cmake-ninja:noble`

## Docker Image

- [Dockerfile](./Dockerfile).

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd gtk-cmake-ninja
docker build --no-cache --tag gtk-cmake-ninja .
```
