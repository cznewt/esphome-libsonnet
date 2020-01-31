#!/bin/bash

jsonnet_fmt='-n 2 --max-blank-lines 2 --sort-imports --string-style s --comment-style s'
x=0

for i in `find . -name '*.jsonnet' -or -name '*.libsonnet'`
do
    t="Formatting $i..."
    if [[ "$1" == "update" ]]; then
        jsonnetfmt -i $jsonnet_fmt $i
    fi
    if jsonnetfmt --test $jsonnet_fmt $i;
    then
        echo $t OK
    else
        echo $t NOK
        x=1
    fi
done
