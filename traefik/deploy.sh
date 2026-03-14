#!/bin/bash

export MSYS_NO_PATHCONV=1

echo "load env.."
. env.sh

bash ../remove.sh "$CONTAINER_NAME"

docker run -d --restart always \
  --name "$CONTAINER_NAME" \
  --network "$NETWORK" \
  --publish 80:80 \
  --publish 443:443 \
  --publish 8080:8080 \
  --volume "$CERTS_PATH:/certs:ro" \
  --volume "$DOCKER_SOCKET:/var/run/docker.sock:ro" \
  --volume "$CONFIG_DIR:/etc/traefik:ro" \
  --label "traefik.enable=true" \
  traefik:"$VERSION"
