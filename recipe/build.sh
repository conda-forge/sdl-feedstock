#!/bin/sh

mkdir build && cd build

cmake ${CMAKE_ARGS} -GNinja -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DUA_ENABLE_ENCRYPTION_OPENSSL=ON \
      -DUA_ENABLE_HISTORIZING=ON \
      -DUA_NAMESPACE_ZERO=REDUCED \
      -DOPEN62541_VERSION=v${PKG_VERSION} \
      -DUA_ARCH_REMOVE_FLAGS="-Werror" \
      $SRC_DIR

ninja -j${CPU_COUNT}
ninja install

# Add sdl.pc to support old pkg-config
# See https://github.com/libsdl-org/sdl12-compat/issues/162
cp $PREFIX/lib/pkgconfig/sdl12_compat.pc $PREFIX/lib/pkgconfig/sdl.pc
