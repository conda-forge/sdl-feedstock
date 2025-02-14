#!/bin/sh

if [[ ${HOST} =~ .*darwin.* ]]; then
  # Additional build option depending on target architecture for SDL see:
  # https://github.com/libsdl-org/SDL/blob/c16b7bcb7acb35c5b91153e6cd6b0da847394a09/docs/README-cmake.md?plain=1#L46
  if [[ "${target_platform}" == "osx-arm64" ]]; then
    export SDL_ARCHITECTURE_FLAG="-DCMAKE_OSX_ARCHITECTURES=arm64"
  fi
  if [[ "${target_platform}" == "osx-64" ]]; then
    export SDL_ARCHITECTURE_FLAG="-DCMAKE_OSX_ARCHITECTURES=x86_64"
  fi
fi

# Configure using the CMakeFiles
cmake -S . -B build ${CMAKE_ARGS} \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      $SDL_ARCHITECTURE_FLAG

# Build
cmake --build build --config Release

# Install
cmake --install build --config Release --prefix $PREFIX
