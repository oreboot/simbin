#!/usr/bin/env bash

git clone https://github.com/qemu/qemu && cd qemu
git checkout v5.1.0

# Apply a patch as a workaround to fix Qemu Sphinx-related problem
git apply ../fix_qemu_sphinx_warning.patch

# Now tweak the build options for Linux target OS. We maintain a patch
# for that purpose.
git apply ../tweak_linux_config_options.patch

echo 'Successfully applied the required patches. Building now...'

mkdir build-riscv64 && cd build-riscv64
../configure --target-list=riscv64-softmmu --static --audio-drv-list=""  --without-default-devices --disable-vnc
make -j4
