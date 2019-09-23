#!/usr/bin/env bash
rm -rf ./cmake-build-debug
mkdir -p ./cmake/Debug
cd ./cmake/Debug
cmake -DCMAKE_BUILD_TYPE=Debug ../.. && make -j 8
