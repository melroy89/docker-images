FROM registry.melroy.org/melroy/docker-images/rust:1.98.1-node-24.22.1
USER root
ENV COREPACK_HOME=/opt/corepack
RUN mkdir -p /opt/corepack && corepack prepare pnpm@11.16.0 pnpm@11.24.0 && chmod -R a+rX /opt/corepack
USER user
WORKDIR /build
RUN mkdir -p /tmp/backend /tmp/frontend && \
    printf '{"packageManager":"pnpm@11.16.0"}' > /tmp/backend/package.json && \
    printf '{"packageManager":"pnpm@11.24.0"}' > /tmp/frontend/package.json && \
    cd /tmp/backend && pnpm --version && cd /tmp/frontend && pnpm --version
