#!/bin/bash

keypairs=(/build/openethereum/worker/keys/Bloxberg/UTC*)

if [[ -z "${NAT_IP}" ]]
then
  NAT_IP_STRING=""
else
  NAT_IP_STRING="extip:${NAT_IP}"
fi

if [ -f "/engine_signer" ]
then
  ENGINE_SIGNER=`cat /engine_signer`
fi

if [ -e ${keypairs[0]} ]
then
  echo "Keypair is present, skipping account generation"
  if [[ -z ${AUTH_ADDRESS} ]]
  then
    KEYPAIR_FILE=`ls -1tr /build/openethereum/worker/keys/Bloxberg/UTC* | head -1`
    ENGINE_SIGNER='0x'`cat ${KEYPAIR_FILE} | awk -F 'address":"' '{print $2}' | awk -F '"' '{print $1}'`
  else
    ENGINE_SIGNER='0x'${AUTH_ADDRESS}
  fi
else
  ENGINE_SIGNER=`/build/openethereum/git/target/release/openethereum --config /build/openethereum/validator-data/config.toml account new  2>&1 | grep 0x`
  echo "Generated keypair: ${ENGINE_SIGNER}"
  echo ${ENGINE_SIGNER} > /engine_signer
fi


cat /build/openethereum/config.tpl | sed s/"__ENGINE_SIGNER__"/${ENGINE_SIGNER}/ | sed s/"__NAT_IP__"/${NAT_IP_STRING}/ > /build/openethereum/validator-data/config.toml

echo "Using Authority Address: ${ENGINE_SIGNER}"

/build/openethereum/git/target/release/openethereum --config /build/openethereum/validator-data/config.toml
