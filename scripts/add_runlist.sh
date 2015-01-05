#!/bin/bash --login

node=$1
item=$2

if [ -z "${node}" -o -z "${item}" ]; then
    echo "usage: $ sh add_runlist.sh <node_name> <recipe[COOKBOOK::RECIPE_NAME>"
    exit 1
fi

knife node run_list add ${node} ${item}