# CMake, Ninja, Boost, cppcheck/cpplint, Doxygen Docker Image

All the packages you will ever need to build your modern C++ code with [Cmake](https://cmake.org/) in a Docker container.  
Using a Debian **slim** base images.

Optionally you can use the [Ninja build system](https://ninja-build.org/) and [Boost libaries](https://www.boost.org/).

The image also includes test tools (like `cppcheck`, `cpplint` and `doxygen`).  
This Docker image also contains other useful programs, like: `gdb`, `valgrind`, `clang-format` and `dot` (generating directed graphs) are installed.

## Usage

Use this Docker image within a CI/CD pipeline of your choice.

Alternatively, you could use: `docker run danger89/cmake:trixie-cppcheck-2.19.0`. Mount any volume via `-t` option on your host OS, like the `/root` folder.

### Docker Tags

Use a specific tag:

```sh
docker pull danger89/cmake:trixie-cppcheck-2.19.0
```

**Important:** We moved to a different kind of tagging. The Docker tag is now a simple combination of the base Debian image name + cppcheck version. Eg. `bookworm-cppcheck-2.19.0`. Hopefully that is much easier to understand. We no longer will provide `latest` either.

**NEW:** We deployed new Trixie based docker image (tag: `trixie-cppcheck-2.19.0`).

**NEW NEW:** We deployed Ubuntu based docker images as well now (tag: `noble-cppcheck-2.19.0` or `plucky-cppcheck-2.19.0`). Which allows specific `.deb` packages for both Debian and Ubuntu if you wish to use this Docker image for packaging as well.

## Docker Image

- [Dockerfile](https://gitlab.melroy.org/melroy/docker-images/-/blob/main/cmake/Dockerfile).

## Build (Optional)

Optionally, building the image yourself locally is possible. CHange directory to this sub-directory:

```sh
cd cmake
```

Debian build:

```sh
docker build --no-cache --tag cmake -f debian.Dockerfile .
```

Ubuntu build:

```sh
docker build --no-cache --tag cmake -f ubuntu.Dockerfile .
```

