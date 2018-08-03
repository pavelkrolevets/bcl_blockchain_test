#!/bin/bash
cd clients
./geth --datadir client3/ init 2clients.json
./geth --datadir client3/ --syncmode 'full' --port 30315 --rpc --rpcaddr '0.0.0.0' --rpcport 8545 --rpcapi 'personal,db,eth,net,web3,txpool,miner,debug' --bootnodes 'enode://d9e4a988909ab063b5311cfa6aa593292133654fbc2f6ed444d99efa810f5bf01f673e3a623e6b381a0c40f196033518c41bdbb4ed30524b5f45971d1d8b3bd5@172.17.0.2:30301' --gasprice '0' --networkid 1515 -unlock '1fff0517d582296df96ee3f87e6ebde6272bfbf7' --password client3/password.txt console