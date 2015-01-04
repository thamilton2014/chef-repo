#!/bin/bash --login

file=$1

if [ -z "${file}" ]; then
    echo "usage: $ sh install_cookbook_sitelist.sh"
    exit 1
fi

knife cookbook site install ${file}