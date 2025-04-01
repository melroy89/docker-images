# Docker Images

These are various Docker images by Melroy (also uploaded to [my Docker Hub](https://hub.docker.com/u/danger89)).

## Images

- [CMake](./cmake): A Debian slim base image with CMake, Boost, Ninja, Doxygen and Cppcheck pre-installed. Including also: `cpplint`, `valgrind`, `pip`, `clang-format` and more.
- [GTK3, Gtkmm, Cmake](./gtk3-cmake-ninja): Based on the CMake image above, but with GTK3 and Gtkmm (C++) pre-installed. And with all the same tools again like Ninja, Doxygen, etc.
- [pnpm](./pnpm): A Node.js alpine base image with `pnpm` (npm replacement) pre-installed.

For example:

```sh
docker pull registry.melroy.org/melroy/docker-images/gtk3-docker-cmake-ninja:bookworm
docker pull registry.melroy.org/melroy/docker-images/cmake:bookworm-cppcheck-2.16.0
docker pull registry.melroy.org/melroy/docker-images/pnpm:22
```

## License

[AGPL v3](LICENSE)

## Author

Melroy van den Berg

## Contact

[melroy.org](https://melroy.org)

## ♥ Donate

[Donate](https://melroy.org/donate.html)
