#!/bin/bash

DIR=$1

for y in ${DIR}
do
  yq r "${y}" > "${y}.tmp"
  mv "${y}.tmp" "${y}"
done
