#!/bin/bash
cd clients
./geth-linux-amd64 --datadir client1/ init dpos_test_genesis.json
./geth-linux-amd64 --datadir client1/ --syncmode 'full' --port 30313 --rpc --rpcaddr '0.0.0.0' --rpcport 8545 --rpcapi 'personal,db,eth,net,web3,txpool,miner,debug' --bootnodes 'enode://fd8b7d623070867bd0458369f5e9f6f4031d105fe559180719846d4a2a82f96d5a5cb987047e86b55b0dafcca786349173f18a3565db9d7ba8c2aecbdfd1ea8d@172.17.0.2:30301' --gasprice '0' --networkid 1515 -unlock 'c29553e4d9b2d1ffde5d89763dcc6bfaa0e006c3' --password client1/password.txt console
