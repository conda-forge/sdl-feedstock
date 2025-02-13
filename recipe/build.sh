#!/bin/sh

# Configure using the CMakeFiles
cmake -S . -B build ${CMAKE_ARGS} \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_BUILD_TYPE=Release

# Build
cmake --build build --config Release

# Install
cmake --install build --config Release --prefix $PREFIX
