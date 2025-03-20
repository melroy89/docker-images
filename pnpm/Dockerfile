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
RUN corepack enable
RUN corepack prepare "pnpm@${pnpm_version}" --activate
RUN pnpm config set store-dir .pnpm-store

CMD ["node"]
