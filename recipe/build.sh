if [ "${target_platform}" == "linux-aarch64" ]; then
    export HOST="aarch64-unknown-linux-gnu"
    export BUILD="aarch64-unknown-linux-gnu"
fi

./configure --prefix=$PREFIX
make -j${CPU_COUNT}
make install
