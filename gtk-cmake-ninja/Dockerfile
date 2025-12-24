ARG distro_version=trixie
ARG cppcheck_version=2.19.0
FROM registry.melroy.org/melroy/docker-images/cmake:${distro_version}-cppcheck-${cppcheck_version}

ARG gtk_versions=3.0,4.0
ARG build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
LABEL org.opencontainers.image.title="GTK with Gtkmm CMake Docker Image" \
      org.opencontainers.image.description="GTK + Gtkmm Cmake Docker image with xvfb, gcc, g++, Boost, Ninja, Doxygen, Graphviz, clang-format, cppcheck, cpplint, gdb, valgrind, dot" \
      org.opencontainers.image.created="${build_date}" \
      org.opencontainers.image.authors="melroy@melroy.org" \
      org.opencontainers.image.url="https://gitlab.melroy.org/melroy/docker-images" \
      org.opencontainers.image.source="https://gitlab.melroy.org/melroy/docker-images"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y curl libcurl4-openssl-dev xvfb $(echo ${gtk_versions} | tr ',' ' ' | xargs -n 1 printf "libgtkmm-%s-dev ") && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
