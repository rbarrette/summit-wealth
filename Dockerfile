# ---- Builder for Caddy with Cloudflare Plugin ----
FROM caddy:2-builder AS caddy_builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

# ---- Base Evironment for Node App ----
FROM node:20-alpine AS base
WORKDIR /app
COPY package*.json ./

# ---- Dependencies ----
FROM base AS deps
RUN npm install

# ---- Build Astro Site ----
FROM deps AS build
COPY . .
RUN npm run build

# ---- Final Release ----
FROM caddy:2-alpine AS release
# Copy the custom Caddy binary from the builder stage
COPY --from=caddy_builder /usr/bin/caddy /usr/bin/caddy
# Copy the built Astro site
COPY --from=build /app/dist /usr/share/caddy
# Copy the Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile
# Expose ports (optional but good practice)
EXPOSE 80
EXPOSE 443
EXPOSE 2019
