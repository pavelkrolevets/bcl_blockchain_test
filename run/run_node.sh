#!/bin/bash
IMGNAME="nodes/node:latest"
CONTAINER_NAME_1="ethereum-node1"
CONTAINER_NAME_2="ethereum-node2"
CONTAINER_NAME_3="ethereum-node3"
# DATA_ROOT=${DATA_ROOT:-"$(pwd)/.ether-$NODE_NAME"}
# DATA_HASH=${DATA_HASH:-"$(pwd)/.ethash"}
echo "Destroying old container $CONTAINER_NAME_1..."
docker stop $CONTAINER_NAME_1
docker rm $CONTAINER_NAME_1

echo "Destroying old container $CONTAINER_NAME_2..."
docker stop $CONTAINER_NAME_2
docker rm $CONTAINER_NAME_2

echo "Destroying old container $CONTAINER_NAME_3..."
docker stop $CONTAINER_NAME_3
docker rm $CONTAINER_NAME_3

echo "Running new container $CONTAINER_NAME_1..."
docker run -d -t --name $CONTAINER_NAME_1 \
    -p 30311:30311 -p 30311:30311/udp \
    $IMGNAME
docker cp nodes/. $CONTAINER_NAME_1:/nodes/
docker exec -d $CONTAINER_NAME_1 chmod +x /nodes/run1.sh
docker exec -d $CONTAINER_NAME_1 /nodes/run1.sh

echo "Running new container $CONTAINER_NAME_2..."
docker run -d -t --name $CONTAINER_NAME_2 \
    -p 30312:30312 -p 30312:30312/udp \
    $IMGNAME
docker cp nodes/. $CONTAINER_NAME_2:/nodes/
docker exec -d $CONTAINER_NAME_2 chmod +x /nodes/run2.sh
docker exec -d $CONTAINER_NAME_2 /nodes/run2.sh

echo "Running new container $CONTAINER_NAME_3..."
docker run -d -t --name $CONTAINER_NAME_3 \
    -p 30317:30317 -p 30317:30317/udp \
    $IMGNAME
docker cp nodes/. $CONTAINER_NAME_3:/nodes/
docker exec -d $CONTAINER_NAME_3 chmod +x /nodes/run3.sh
docker exec -i $CONTAINER_NAME_3 /nodes/run3.sh
