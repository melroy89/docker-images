ARG distro_version=tumbleweed
FROM opensuse/${distro_version}

ARG distro_version
ARG build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

LABEL org.opencontainers.image.title="GTK with Gtkmm CMake openSUSE Docker Image" \
      org.opencontainers.image.description="openSUSE C++ build image with CMake, Ninja, GTK4, Gtkmm4, Doxygen, Graphviz, and RPM packaging tools" \
      org.opencontainers.image.created="${build_date}" \
      org.opencontainers.image.authors="melroy@melroy.org" \
      org.opencontainers.image.url="https://gitlab.melroy.org/melroy/docker-images" \
      org.opencontainers.image.source="https://gitlab.melroy.org/melroy/docker-images"

RUN zypper --non-interactive refresh && \
    zypper --non-interactive update && \
    zypper --non-interactive install --no-recommends \
      ca-certificates \
      ccache \
      cmake \
      curl \
      doxygen \
      gcc-c++ \
      git \
      glib2-tools \
      graphviz \
      gtkmm4-devel \
      libcurl-devel \
      libsecret-devel \
      ninja \
      nlohmann_json-devel \
      pkg-config \
      rpm-build && \
    zypper clean --all
