#!/bin/bash

mkdir -p build/release
cd build/release


cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cmake/arm_toolchain.cmake ../..
cmake --build . --target fibonacci_exe