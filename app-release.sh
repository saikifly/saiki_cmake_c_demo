#!/usr/bin/env bash
mkdir -p ./cmake/Release
cd ./cmake/Release
cmake -DCMAKE_BUILD_TYPE=Release ../.. && make -j 8  && cpack
