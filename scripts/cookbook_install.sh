#!/bin/bash --login

file=$1

if [ -z "${file}" ]; then
    echo "usage: $ sh cookbook_install.sh <cookbook_name>"
    exit 1
fi

knife cookbook site install ${file}