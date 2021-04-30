# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build-scripts
if [ "${target_platform}" == "linux-aarch64" ]; then
    EXTRA_ARGS="--host=aarch64-unknown-linux-gnu --build=aarch64-unknown-linux-gnu"
fi

./configure --prefix=$PREFIX ${EXTRA_ARGS}
make -j${CPU_COUNT}
make install
