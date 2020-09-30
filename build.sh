#!/usr/bin/env bash

git clone https://github.com/qemu/qemu && cd qemu
git checkout v5.1.0

# Apply a patch as a workaround to fix Qemu Sphinx-related problem
git apply ../fix_qemu_sphinx_warning.patch

# Now tweak the build options for Linux target OS. We maintain a patch
# for that purpose.
git apply ../tweak_linux_config_options.patch

echo 'Successfully applied the required patches. Configuring now...'
# Most importantly, note '--static'
mkdir build-riscv64 && cd build-riscv64

../configure --target-list=riscv64-softmmu --static --audio-drv-list=""   --disable-vnc

echo "Successfully configured. Building now..."
# On my machine, configuration step did not collect all the dependencies
# required to build Qemu. So manually appending them here, even if they
# are present already.
awk -F '=' -i inplace '{ if ($1 == "GIO_LIBS") { print $0 " -lblkid -luuid" } else { print $0 } }' config-host.mak

make -j4
