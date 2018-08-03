#!/bin/bash
./nodes/geth-linux-amd64 --datadir /nodes/node2/ init /nodes/dpos_test_genesis.json
./nodes/geth-linux-amd64 --datadir /nodes/node2/ --syncmode 'full' --port 30312 --rpc --rpcaddr '0.0.0.0' --rpcport 8545 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://fd8b7d623070867bd0458369f5e9f6f4031d105fe559180719846d4a2a82f96d5a5cb987047e86b55b0dafcca786349173f18a3565db9d7ba8c2aecbdfd1ea8d@172.17.0.2:30301' --networkid 1515 --gasprice '0' -unlock '0x01665a4eb869efbf3af991e0b791d5347718a49d' --password /nodes/node2/password.txt --mine &
