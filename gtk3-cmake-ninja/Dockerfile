ARG debian_version=bookworm
ARG cppcheck_version=2.16.0
FROM registry.melroy.org/melroy/docker-images/cmake:${debian_version}-cppcheck-${cppcheck_version}

ARG build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
LABEL org.opencontainers.image.title="GTK3 with Gtkmm CMake Docker Image" \
      org.opencontainers.image.description="GTK3 + Gtkmm Cmake Docker image with xvfb, gcc, g++, Boost, Ninja, Doxygen, Graphviz, clang-format, cppcheck, cpplint, gdb, valgrind, dot" \
      org.opencontainers.image.created="${build_date}" \
      org.opencontainers.image.authors="melroy@melroy.org" \
      org.opencontainers.image.url="https://gitlab.melroy.org/melroy/docker-images" \
      org.opencontainers.image.source="https://gitlab.melroy.org/melroy/docker-images"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y libgtkmm-3.0-dev curl libcurl4-openssl-dev xvfb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
