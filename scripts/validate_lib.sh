#!/bin/bash

for i in tests/*/*.jsonnet
do
    MIXIN="$(dirname $i)/$(basename $i .jsonnet)_compiled/"
    
    for j in ${MIXIN}*.yaml
    do
        t="Checking $j..."
        if esphome -q $j config
        then
            echo $t OK
        else
            echo $t NOK
            x=1
        fi
        echo ""
    done

done

exit $x