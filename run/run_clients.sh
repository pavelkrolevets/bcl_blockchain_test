#!/bin/bash
docker stop client2
docker rm client2
docker run -d -i -t --name client2 \
    -p 30314:30314 -p 30314:30314/udp \
    nodes/node:latest
docker cp clients/. client2:/clients/
docker exec -d client2 chmod +x /clients/run2.sh
docker exec -d client2 /clients/run2.sh

# docker stop client3
# docker rm client3
# docker run -d -i -t --name client3 \
#     -p 30315:30315 -p 30315:30315/udp \
#     nodes/node:latest
# docker cp clients/. client3:/clients/
# docker exec -d client3 chmod +x /clients/run3.sh
# docker exec -d client3 /clients/run3.sh
#
# docker stop client4
# docker rm client4
# docker run -d -i -t --name client4 \
#     -p 30316:30316 -p 30316:30316/udp \
#     nodes/node:latest
# docker cp clients/. client4:/clients/
# docker exec -d client4 chmod +x /clients/run4.sh
# docker exec -d client4 /clients/run4.sh

docker stop client1
docker rm client1
docker run -d -i -t --name client1 \
    -p 127.0.0.1:8545:8545 -p 30313:30313 -p 30313:30313/udp \
    nodes/node:latest
docker cp clients/. client1:/clients/
docker exec -d client1 chmod +x /clients/run1.sh
docker exec -i client1 /clients/run1.sh

# docker exec -i ethereum-node1 ./nodes/geth --datadir /nodes/node1/ --exec 'admin.peers' attach
# docker exec -i client1 ./clients/geth --datadir /clients/client1/ --exec 'eth.sendTransaction({'from':'0xc29553e4d9b2d1ffde5d89763dcc6bfaa0e006c3', 'to':'0xd08a05283ad35600ab448c08db31a7c3797c8319', 'value':100})' attach
