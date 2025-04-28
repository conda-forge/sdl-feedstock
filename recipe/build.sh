#!/bin/sh

# Configure using the CMakeFiles
cmake -G Ninja -S . -B build ${CMAKE_ARGS} -DCMAKE_PREFIX_PATH=$PREFIX

# Build
cmake --build build --config Release

# Install
cmake --install build --config Release --prefix $PREFIX
