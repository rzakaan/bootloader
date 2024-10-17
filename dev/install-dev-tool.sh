#!/bin/sh

echo "OSTYPE : $OSTYPE"

if [[ $OSTYPE == "darvin"* ]]; then
    brew install nasm qemu
fi
