ARG ubuntu_version=noble
FROM ubuntu:${ubuntu_version}

# By default all ARGs are no longer available after the FROM statement.
# So we need to redefine them if we want to use them later on.
ARG ubuntu_version
ARG cppcheck_version=2.19.0
ARG build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

LABEL org.opencontainers.image.title="CMake C++ Ubuntu Docker image with various additional tools" \
      org.opencontainers.image.description="CMake Docker image with gcc, g++, Boost, Ninja, Doxygen, Graphviz, clang-format, cppcheck, cpplint, gdb, valgrind, dot" \
      org.opencontainers.image.created="${build_date}" \
      org.opencontainers.image.authors="melroy@melroy.org" \
      org.opencontainers.image.url="https://gitlab.melroy.org/melroy/docker-images" \
      org.opencontainers.image.source="https://gitlab.melroy.org/melroy/docker-images"

ENV DEBIAN_FRONTEND=noninteractive

# APT Update
RUN apt --allow-releaseinfo-change update
RUN apt update && apt upgrade -y

# APT install (base) packages
RUN apt install -y build-essential cmake libboost-all-dev pkg-config
RUN apt install -y ninja-build doxygen graphviz
RUN apt install -y --no-install-recommends curl wget

# Add Deb-src to ubuntu.sources file
RUN sed -i 's/^Types: deb$/Types: deb deb-src/' /etc/apt/sources.list.d/ubuntu.sources

# Get cppcheck dependencies from repo; that's good enough
RUN apt update
RUN apt build-dep -y cppcheck
# Download cppcheck source code, build and install
RUN wget -O cppcheck.tar.gz https://github.com/danmar/cppcheck/archive/${cppcheck_version}.tar.gz
RUN tar -xvzf cppcheck.tar.gz
RUN cd cppcheck-${cppcheck_version} && \
    mkdir build && \
    cd build && \
    cmake -DUSE_MATCHCOMPILER=ON .. && \
    cmake --build . -- -j 20 && \
    cmake --install .

# APT install additional packages
RUN apt install -y --no-install-recommends \
    locales \
    python3-pip \
    ca-certificates \
    netbase \
    gnupg \
    dirmngr \
    git \
    openssh-client \
    rpm \
    sshpass \
    valgrind \
    gdb \
    clang-format \
    libssl-dev && \
    apt clean

# Install cpplint via pip
RUN pip3 install cpplint --break-system-packages
# Clean-up
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Clean-up manual build(s)
RUN rm -rf cppcheck.tar.gz && rm -rf cppcheck-${cppcheck_version}

# set the locale to en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >/etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
