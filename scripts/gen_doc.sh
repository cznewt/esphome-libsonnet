#!/bin/bash


. venv/bin/activate

for i in esphome-mixins/*/entity.libsonnet
do
    MIXIN="$(dirname $i)/$(basename $i .jsonnet)"
    #./scripts/test_case.sh "${MIXIN}" "${UPDATE}"
    echo "Generating doc from $i..."
    python scripts/gen_doc.py $i
    #jdp --file $i

done

#venv/bin/deactivate