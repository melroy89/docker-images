ARG node_version=current

FROM node:${node_version}-alpine

ARG pnpm_version=latest
ARG build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

LABEL org.opencontainers.image.title="Node.js image with pnpm" \
      org.opencontainers.image.description="Node.js image with pnpm" \
      org.opencontainers.image.created="${build_date}" \
      org.opencontainers.image.authors="melroy@melroy.org" \
      org.opencontainers.image.url="https://gitlab.melroy.org/melroy/docker-images" \
      org.opencontainers.image.source="https://gitlab.melroy.org/melroy/docker-images"

RUN npm install --global corepack@latest

# Enable corepack and prepare pnpm for root user
RUN corepack enable
RUN corepack prepare "pnpm@${pnpm_version}" --activate
RUN pnpm config set store-dir .pnpm-store
RUN pnpm setup

# Add turbo globally
RUN pnpm add -g turbo

# Enable corepack and prepare pnpm for node user
USER node
RUN corepack enable
RUN corepack prepare "pnpm@${pnpm_version}" --activate
RUN pnpm config set store-dir .pnpm-store
RUN pnpm setup

# Switch back to root for the CMD
USER root

CMD ["node"]
