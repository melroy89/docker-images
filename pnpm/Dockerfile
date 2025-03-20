ARG node=current
ARG pnpm=latest

FROM node:$node-alpine
RUN npm install --global corepack@latest
RUN corepack enable
RUN corepack prepare "pnpm@$pnpm" --activate
RUN pnpm config set store-dir .pnpm-store

CMD ["node"]
