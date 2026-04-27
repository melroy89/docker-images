ARG rust_version=1.95

FROM rust:${rust_version}-trixie

ARG pnpm_version=latest
ARG node_version=24.15.0
ARG build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

LABEL org.opencontainers.image.title="Rust image with Node.js" \
      org.opencontainers.image.description="Rust image with Node.js, pnpm, build essential, pkg-config and rsync preinstalled" \
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

# Update npm to latest version
RUN npm install -g npm@latest

RUN npm install --global --force corepack@latest

# Enable pnpm for root user
RUN corepack enable pnpm
# Pin pnpm version
RUN corepack prepare "pnpm@${pnpm_version}" --activate
# Configure pnpm store
RUN pnpm config set store-dir .pnpm-store

# Disable turbo telemetry
ENV TURBO_TELEMETRY_DISABLED=1
# Needed for global installs
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="${PATH}:${PNPM_HOME}"

# Add turbo globally
RUN pnpm add -g turbo

# Create a non-root user with UID and GID 1000
# and use /build as home directory
RUN groupadd -g 1000 user && \
      useradd -u 1000 -g 1000 -m -d /build -s /bin/bash user

USER user
# Enable corepack and prepare pnpm for user 'user'
RUN corepack enable
# Pin pnpm version
RUN corepack prepare "pnpm@${pnpm_version}" --activate
# Configure pnpm store
RUN pnpm config set store-dir .pnpm-store

WORKDIR /build
