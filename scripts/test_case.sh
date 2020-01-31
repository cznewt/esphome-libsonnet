#!/bin/bash

MIXIN=$1
UPDATE=$2

function globexists {
  test -e "$1" -o -L "$1"
}

echo "Testing '${MIXIN}.jsonnet'..."

mkdir -p "build/${MIXIN}"
rm -rf "build/${MIXIN}/*.yaml"

jsonnet -S -J tests -m "build/${MIXIN}" "${MIXIN}.jsonnet"
bash ./scripts/remove_quotes.sh "./build/${MIXIN}/*.yaml"

if [ "${UPDATE}" == "update" ]
then
    rm -rf "${MIXIN}_compiled"
    mkdir -p "${MIXIN}_compiled"
    cp build/${MIXIN}/*.yaml ${MIXIN}_compiled/
fi
