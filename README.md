# Docker Images

These are various Docker images by Melroy (also uploaded to [my Docker Hub](https://hub.docker.com/u/danger89)).

## Images

- [CMake](./cmake): A Debian slim base image with CMake, Boost, Ninja, Doxygen and Cppcheck pre-installed. Including also: `cpplint`, `valgrind`, `pip`, `clang-format` and more.
- [GTK, Gtkmm, Cmake](./gtk-cmake-ninja): Based on the CMake image (see above). However, with GTK and Gtkmm (C++), both GTK3 and GTK4 dev packages are pre-installed. With all the same tools like Ninja, Doxygen, etc from the CMake image.
- [pnpm](./pnpm): A Node.js alpine base image with `pnpm` (npm replacement) pre-installed.
- [php](./php): A PHP Docker CLI image with `composer`, as well as `ssh`, `rsync`, `unzip` and `7z` installed. Ideal for [CodeIgniter 4](https://www.codeigniter.com/) projects with `phpmetrics`.
- [rust](./rust): A Rust Docker image (Debian based) with Node.js and `build-essential` installed. Ideal for projects that uses [NAPI-RS](https://napi.rs/).

For example:

```sh
docker pull registry.melroy.org/melroy/docker-images/gtk-cmake-ninja:trixie
docker pull registry.melroy.org/melroy/docker-images/cmake:trixie-cppcheck-2.19.0
docker pull registry.melroy.org/melroy/docker-images/pnpm:24
docker pull registry.melroy.org/melroy/docker-images/php:8.5
docker pull registry.melroy.org/melroy/docker-images/rust:1.93-node-24.13.0
```

## License

[AGPL v3](LICENSE)

## Author

Melroy van den Berg

## Contact

[melroy.org](https://melroy.org)

## ♥ Donate

[Donate](https://melroy.org/donate.html)
