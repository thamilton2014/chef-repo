#!/bin/bash --login

file=$1

if [ -z "${file}" ]; then
    echo "usage: $ sh delete_cookbook.sh <cookbook_name>"
    exit 1
fi

knife cookbook delete ${file}