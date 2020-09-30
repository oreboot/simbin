We can't build softmmu-* targets with --static flag, here is a
[thread](https://lists.gnu.org/archive/html/qemu-devel/2011-11/msg02878.html)
from QEMU mailing list that shows why (and I have experienced more or
less the same - qemu would just not build and complain about missing
libraries). In other words, running programs which are not intended to
be run in user mode is not possible with --static binaries. I have also
found this
[Debian wiki page](https://wiki.debian.org/RISC-V#Manual_qemu-user_installation)
that talks about static qemu-riscv binaries,
and they only mention linux-user target (not softmmu, and we need the
latter). So maybe it is just not possible to build softmmu targets with
static flag :unamused:? But suppose rminnich knows what he is doing.

- Current build is useless, as it is for running programs in
linux-user mode.

The origial PR failed because device loader was not found. However, it
used a flag --without-default-devices, or something like that, which
could just disable that device.

- :x: Try removing that flag.

Also anyway need to update QEMU to version 5.1.0, so all the builds
should be executed with that version.

Also I thought that using softmmut-* target requries that we also copy
the qemu-img binary to usr/bin, but now seems like that is not a
requirement with --static flag.