#!/usr/bin/env bash
set -e

if [ ! -f "CMakeLists.txt" ]; then
    echo "❌ Error: Please run this script from the project root (CMakeLists.txt not found)"
    exit 1
fi

BUILD_DIR=build

if [ -d "$BUILD_DIR" ]; then
    echo ">>> Removing existing build directory"
    rm -rf "$BUILD_DIR"
fi

mkdir "$BUILD_DIR"
cd "$BUILD_DIR"

cmake ..
make -j "$(nproc)"
