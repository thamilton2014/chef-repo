#!/bin/bash --login

file=$1

if [ -z "${file}" ]; then
    echo "usage: $ sh search_cookbook_sitelist.sh <search_query>"
    exit 1
fi

knife cookbook site search ${file}