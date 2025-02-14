#!/bin/sh

# Configure using the CMakeFiles
cmake -S . -B build ${CMAKE_ARGS} \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      $SDL_ARCHITECTURE_FLAG

# Build
cmake --build build --config Release

# Install
cmake --install build --config Release --prefix $PREFIX
