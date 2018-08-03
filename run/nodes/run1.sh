#!/bin/bash
./nodes/geth-linux-amd64 --datadir /nodes/node1/ init /nodes/dpos_test_genesis.json
./nodes/geth-linux-amd64 --datadir /nodes/node1/ --syncmode 'full' --port 30311 --rpc --rpcaddr '0.0.0.0' --rpcport 8545 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://fd8b7d623070867bd0458369f5e9f6f4031d105fe559180719846d4a2a82f96d5a5cb987047e86b55b0dafcca786349173f18a3565db9d7ba8c2aecbdfd1ea8d@172.17.0.2:30301' --networkid 1515 --gasprice '0' -unlock '0xb47f736b9b15dcc888ab790c38a6ad930217cbee' --password /nodes/node1/password.txt --mine &
