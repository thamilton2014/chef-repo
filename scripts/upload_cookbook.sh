#!/bin/bash --login

file=$1

if [ -z "${file}" ]; then
    echo "usage: $ sh upload_cookbook.sh <cookbook_name>"
    exit 1
fi

# -d, --include-dependencies
# Use to ensure that when a cookbook has dependency on one (or more), those cookbooks will also upload.
knife cookbook upload ${file} -d