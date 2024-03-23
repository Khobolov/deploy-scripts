echo "load env.."

. $1.sh

bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
  --name "$CONTAINER_NAME" \
  --hostname "$HOST_NAME" \
  --env RABBITMQ_DEFAULT_USER="$RABBITMQ_DEFAULT_USER" \
  --env RABBITMQ_DEFAULT_PASS="$RABBITMQ_DEFAULT_PASS" \
  --env RABBITMQ_NODENAME="$HOST_NAME" \
  --network="$NETWORK" \
  --volume "$DATA_PATH":/var/lib/rabbitmq \
  --volume "$LOG_PATH":/var/log/rabbitmq \
  --restart unless-stopped \
  rabbitmq:"$VERSION"
chmod -R a+rwx "$SERVICE_PATH"  
