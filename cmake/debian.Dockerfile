ARG debian_version=bookworm
FROM debian:${debian_version}-slim

# By default all ARGs are no longer available after the FROM statement.
# So we need to redefine them if we want to use them later on.
ARG debian_version
ARG cppcheck_version=2.21.0
ARG cmake_version=4.3.2
ARG build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

LABEL org.opencontainers.image.title="CMake C++ Debian Docker image with various additional tools" \
      org.opencontainers.image.description="CMake Docker image with gcc, g++, Boost, Ninja, Doxygen, Graphviz, clang-format, cppcheck, cpplint, gdb, valgrind, dot" \
      org.opencontainers.image.created="${build_date}" \
      org.opencontainers.image.authors="melroy@melroy.org" \
      org.opencontainers.image.url="https://gitlab.melroy.org/melroy/docker-images" \
      org.opencontainers.image.source="https://gitlab.melroy.org/melroy/docker-images"

ENV DEBIAN_FRONTEND=noninteractive

# Install the toolchain and clear APT metadata in the same layer.
RUN echo "deb-src http://deb.debian.org/debian ${debian_version} main" >>/etc/apt/sources.list && \
    apt-get --allow-releaseinfo-change update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential libboost-all-dev pkg-config libssl-dev openssl \
        ninja-build doxygen graphviz && \
    apt-get install -y --no-install-recommends \
        curl wget locales python3-pip ca-certificates netbase gnupg dirmngr git \
        openssh-client rpm sshpass valgrind gdb clang-format gperf \
        libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev && \
    apt-get build-dep -y cppcheck && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download, build, install and remove each source tree within one layer.
# Deleting these files in a later RUN would retain their bytes in the image.
RUN mkdir /tmp/cmake-build && \
    cd /tmp/cmake-build && \
    wget -q -O source.tar.gz https://github.com/Kitware/CMake/releases/download/v${cmake_version}/cmake-${cmake_version}.tar.gz && \
    tar -xzf source.tar.gz && \
    cd cmake-${cmake_version} && \
    ./bootstrap --parallel=6 --generator=Ninja && \
    ninja && \
    ninja install && \
    cd / && \
    rm -rf /tmp/cmake-build && \
    /usr/local/bin/cmake --version

RUN mkdir /tmp/cppcheck-build && \
    cd /tmp/cppcheck-build && \
    wget -q -O source.tar.gz https://github.com/danmar/cppcheck/archive/${cppcheck_version}.tar.gz && \
    tar -xzf source.tar.gz && \
    cmake -S cppcheck-${cppcheck_version} -B build \
        -DUSE_MATCHCOMPILER=ON -DCMAKE_BUILD_TYPE=Release -G Ninja && \
    cmake --build build && \
    cmake --install build && \
    cd / && \
    rm -rf /tmp/cppcheck-build && \
    /usr/local/bin/cppcheck --version

RUN pip3 install --no-cache-dir cpplint --break-system-packages

# set the locale to en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >/etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
