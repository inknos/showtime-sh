#!/usr/bin/env bash

if [[ -f ./show ]]; then
    source ./show
else
    echo "ERROR: ./show not found"
    exit 1
fi
