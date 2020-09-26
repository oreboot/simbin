#!/usr/bin/env bash

git clone https://github.com/qemu/qemu && cd qemu
git checkout v5.1.0

# Now tweak the build options for Linux target OS. We maintain a patch
# for that purpose.
git apply ../tweak_linux_config_options.patch

mkdir build-riscv64 && cd build-riscv64
../configure --target-list=riscv64-softmmu --static --audio-drv-list=""  --without-default-devices --disable-vnc
make -j4
