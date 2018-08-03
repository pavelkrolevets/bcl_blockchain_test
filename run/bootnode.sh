#!/bin/sh
#
# Runs a bootnode with ethereum official "alltools" image.
#
docker stop ethereum-bootnode
docker rm ethereum-bootnode
IMGNAME="nodes/node:latest"
CONTAINER_NAME="ethereum-bootnode"

echo "Destroying old container $CONTAINER_NAME..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

echo "Running new container $CONTAINER_NAME..."
docker run -d -t --name $CONTAINER_NAME \
    -p 30301:30301 -p 30301:30301/udp \
    $IMGNAME
docker cp bootnode/. $CONTAINER_NAME:/bootnode/
docker exec -d $CONTAINER_NAME chmod +x /bootnode/run.sh
docker exec -i $CONTAINER_NAME /bootnode/run.sh
