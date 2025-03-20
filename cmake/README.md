# CMake, Ninja, Boost, cppcheck/cpplint, Doxygen Docker Image

All the packages you will ever need to build your modern C++ code with [Cmake](https://cmake.org/) in a Docker container.  
Using a Debian Bookworm **slim** base image.

Optionally you can use the [Ninja build system](https://ninja-build.org/) and [Boost libaries](https://www.boost.org/).

The image also includes test tools (like `cppcheck`, `cpplint` and `doxygen`).  
This Docker image also contains other useful programs, like: `gdb`, `valgrind`, `clang-format` and `dot` (generating directed graphs) are installed.

## Usage

Use this Docker image within a CI/CD pipeline of your choice.

Alternatively, you could use: `docker run danger89/cmake`. Mount any volume via `-t` option on your host OS, like the `/root` folder.

### Docker Tags

Use a specific tag:

```sh
docker pull danger89/cmake:bookworm-cppcheck-2.16.0
```

**Note:** Since tag `4.0` and until tag `4.6`, Debian Bullseye was used for GCC 10 compiler.

**Note:** Since tag `4.4` and higher, we build cppcheck ourselves, so we get the [latest stable cppcheck](https://cppcheck.sourceforge.io/).

**Note:** Since tag `5.0` and higher the base image is now based on Debian Bookworm instead of Bullseye. We're now using GCC/G++ v12 with CMake v3.25.

**Important:** We moved to a different kind of tagging. The Docker tag is now a simple combination of the base Debian image name + cppcheck version. Eg. `bookworm-cppcheck-2.16.0`. Hopefully that is much easier to understand. We no longer will provide `latest` either.

## Build (Optional)

Optionally, building the image yourself locally is possible, via:

```sh
cd cmake
docker build --no-cache --tag cmake .
```
