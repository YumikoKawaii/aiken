#!/bin/bash


# For mainnet
#NET="mainnet"
#NET_WITH_PREFIX="--mainnet"
# For preprod
#NET="testnet"
#NET_WITH_PREFIX="--testnet-magic 1"
# For preview
NET="testnet"
NET_WITH_PREFIX="--testnet-magic 2"
ADDR_COUNT=1

cardano-cli address build --payment-script-file contract.plutus --out-file contract.addr --testnet-magic 2