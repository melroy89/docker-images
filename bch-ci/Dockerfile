FROM registry.melroy.org/melroy/docker-images/rust:1.98.1-node-24.22.1
USER root
ENV COREPACK_HOME=/opt/corepack
RUN mkdir -p /opt/corepack && corepack prepare pnpm@11.24.0 && chmod -R a+rX /opt/corepack
USER user
WORKDIR /build
RUN rustup toolchain install 1.95 --profile minimal
RUN mkdir -p /tmp/check &&     printf '{"packageManager":"pnpm@11.24.0"}' > /tmp/check/package.json &&     cd /tmp/check && pnpm --version
