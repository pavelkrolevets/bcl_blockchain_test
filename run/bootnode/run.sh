#!/bin/bash
chmod 777 ./bootnode/bootnode
./bootnode/bootnode -nodekey /bootnode/boot.key -verbosity 9 -addr :30301
