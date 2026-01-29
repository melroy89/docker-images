ARG rust_version=1.93

FROM rust:${rust_version}-bullseye

ARG node_version=24.13.0
ARG build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

LABEL org.opencontainers.image.title="Rust image with Node.js" \
      org.opencontainers.image.description="Rust image with Node.js + build essential and pkg-config preinstalled" \
      org.opencontainers.image.created="${build_date}" \
      org.opencontainers.image.authors="melroy@melroy.org" \
      org.opencontainers.image.url="https://gitlab.melroy.org/melroy/docker-images" \
      org.opencontainers.image.source="https://gitlab.melroy.org/melroy/docker-images"

# Install Node.js
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs=${node_version}-1nodesource1 build-essential pkg-config && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

