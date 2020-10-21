#!/bin/sh

BUILD_PATH="$(pwd)"

if [ -d "${BUILD_PATH}/output/novotech_rk3308_release" ]; then
    make O="${BUILD_PATH}/output/novotech_rk3308_release" clean
fi
