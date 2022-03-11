#!/bin/sh

mkdir build && cd build

# DYLIB_COMPAT_VERSION is set for compatibility with autotools builds
# See https://github.com/conda-forge/sdl-feedstock/pull/6#issuecomment-1065039606
cmake ${CMAKE_ARGS} -GNinja -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DDYLIB_COMPAT_VERSION:STRING="12.0.0" \
      $SRC_DIR

ninja -j${CPU_COUNT}
ninja install

# Check compatibility numbr on macOS
otool -L ${CONDA_PREFIX}/lib/libSDL-1.2.0.dylib

# Add sdl.pc to support old pkg-config
# See https://github.com/libsdl-org/sdl12-compat/issues/162
cp $PREFIX/lib/pkgconfig/sdl12_compat.pc $PREFIX/lib/pkgconfig/sdl.pc
