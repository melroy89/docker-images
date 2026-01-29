ARG rust_version=1.93

FROM rust:${rust_version}-trixie

ARG node_version=24.13.0
ARG build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

LABEL org.opencontainers.image.title="Rust image with Node.js" \
      org.opencontainers.image.description="Rust image with Node.js + build essential, pkg-config and rsync preinstalled" \
      org.opencontainers.image.created="${build_date}" \
      org.opencontainers.image.authors="melroy@melroy.org" \
      org.opencontainers.image.url="https://gitlab.melroy.org/melroy/docker-images" \
      org.opencontainers.image.source="https://gitlab.melroy.org/melroy/docker-images"

# Install Node.js
RUN apt update && \
      apt upgrade -y && \
      apt install -y curl ca-certificates && \
      curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
      apt install -y nodejs=${node_version}-1nodesource1 build-essential pkg-config rsync && \
      apt clean && \
      rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN groupadd -g 1000 user && \
     useradd -u 1000 -g 1000 -s /bin/bash user

USER user
