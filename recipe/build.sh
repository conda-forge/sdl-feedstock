#!/bin/sh

# Configure using the CMakeFiles
cmake -G Ninja -S . -B build ${CMAKE_ARGS} -DCMAKE_PREFIX_PATH=$PREFIX

# Build
cmake --build build --config Release

# Install
cmake --install build --config Release --prefix $PREFIX

# Add sdl.pc to support old pkg-config
# See https://github.com/libsdl-org/sdl12-compat/issues/162 and
# https://github.com/libsdl-org/sdl2-compat/issues/381
cp $PREFIX/lib/pkgconfig/sdl2-compat.pc $PREFIX/lib/pkgconfig/sdl2.pc
