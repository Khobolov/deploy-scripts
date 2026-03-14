CONTAINER_NAME="traefik"
VERSION="3.6"
NETWORK="traefik-public"

CERTS_PATH="/var/docker/traefik/certs"

# Windows (Docker Desktop + WSL2):   "/var/run/docker.sock"
# Windows (Docker Desktop, no WSL): "//./pipe/docker_engine"
# Linux (native Docker):            "/var/run/docker.sock"
DOCKER_SOCKET="/var/run/docker.sock"

# Dev: "/var/docker/traefik/config/dev"
# Prod: "/var/docker/traefik/config/prod"
CONFIG_DIR="/var/docker/traefik/config/dev"
