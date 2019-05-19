#!/bin/bash
# docker run -d -v ~/dotfiles/.docker/bitcoin/mainnet.conf:/etc/bitcoin/bitcoin/bitcoin.conf -v /blockchain/bitcoin/mainnet:/data --name bitcoin-mainnet bitcoin

run_mainnet() {
    docker run --name bitcoind -p 18332:18332 \
        -d -v ~/dotfiles/.docker/bitcoin/mainnet.conf:/etc/bitcoin/bitcoin.conf \
        -v /blockchain/bitcoin-mainnet:/data \
        bitcoin
}

run_testnet() {
    docker run --name testnet-bitcoind -p 18433:18433 \
        -d -v ~/dotfiles/.docker/bitcoin/testnet.conf:/etc/bitcoin/bitcoin.conf \
        -v /blockchain/bitcoin-testnet:/data \
        bitcoin
}


case $1 in 
    testnet)
        echo running testnet
        run_testnet
    ;;
    mainnet)
        echo running mainnet
        run_mainnet
    ;;
    *)
        echo "unknown network type"

esac
