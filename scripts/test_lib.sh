#!/bin/bash

UPDATE=${1-noupdate} 

for i in tests/*/*.jsonnet
do
    MIXIN="$(dirname $i)/$(basename $i .jsonnet)"
    ./scripts/test_case.sh "${MIXIN}" "${UPDATE}"

    t="Checking $i..."

    if diff -urt "build/${MIXIN}/" "${MIXIN}_compiled/"
    then
        echo $t OK
    else
        echo $t NOK
        x=1
    fi
    echo ""
done

exit $x