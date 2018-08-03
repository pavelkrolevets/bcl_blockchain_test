
## Testing evironment for a DPOS private blockchain

1. Create docker image from Dockerfile in `run` folder. Command: `docker build -t nodes/node:latest .`

2. Run `./run/bootnode.sh` to start a bootnode.

3. Run (in another window)`./run/run_node.sh` to start 3 (or n) mining nodes (validators). You will be able to see ethereum console and mining process.

4. Run (in another window) `./run/run_clients.sh` to start 5(or n) clients. You will be able to see ethereum console of the first client.

5. Run `./eth_rpc_client_py/test.py` to starts testing. This script will send in the loop `send_etherium` transactions between clients and show how many transactions per second the blockchain setup can process.

**Addresses**

*Nodes:*

- node1: b47f736b9b15dcc888ab790c38a6ad930217cbee
- node2: 01665a4eb869efbf3af991e0b791d5347718a49d
- node3: 3833067356d624e36fa8cfaf208e97263f3e0703

*Clients:*

- c29553e4d9b2d1ffde5d89763dcc6bfaa0e006c3
- d08a05283ad35600ab448c08db31a7c3797c8319
- 1fff0517d582296df96ee3f87e6ebde6272bfbf7
- 466dc84c439bb4cc4546b62811ffc7d046ced1cb

**Some useful commands**

Run node1 in the docker container:

1. `docker run -it --name node1 -p 30311:30311 -p 30311:30311/udp nodes/node:latest /bin/bash`
2. `docker cp nodes/. node1:/nodes/`
3. `./geth --datadir node1/ init dpos_test_genesis.json`
4. `./geth --datadir node1/ --syncmode 'full' --port 30311 --rpc --rpcaddr 'localhost' --rpcport 8501 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://fd8b7d623070867bd0458369f5e9f6f4031d105fe559180719846d4a2a82f96d5a5cb987047e86b55b0dafcca786349173f18a3565db9d7ba8c2aecbdfd1ea8d@127.0.0.1:30301' --networkid 1515 --gasprice '1' -unlock '0xb47f736b9b15dcc888ab790c38a6ad930217cbee' --password node1/password.txt --mine`

Run client1 in the docker container:

1. `docker stop client1`
2. `docker rm client1`
3. `docker run -d -i -t --name client1 \
    -p 30313:30313 -p 30313:30313/udp \
    nodes/node:latest`
4. `docker cp clients/. client1:/clients/`
5. `docker exec -it client1 /bin/bash`
6. `cd clients`
7. `./geth --datadir client1/ init dpos_test_genesis.json`
8. `./geth --datadir client1/ --syncmode 'full' --port 30313 --rpc --rpcaddr 'localhost' --rpcport 8545 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://fd8b7d623070867bd0458369f5e9f6f4031d105fe559180719846d4a2a82f96d5a5cb987047e86b55b0dafcca786349173f18a3565db9d7ba8c2aecbdfd1ea8d@172.17.0.2:30301' --networkid 1515 --gasprice '1' -unlock 'c29553e4d9b2d1ffde5d89763dcc6bfaa0e006c3' --password client1/password.txt console`

## Results
1. Consensus - DPOS. 3 nodes. 1 sec for a block. Maximum speed 170 tps.

## Future development

#### TODO
- encrease a block size.
- decrease block speed.
- test threaded RPC requests.
