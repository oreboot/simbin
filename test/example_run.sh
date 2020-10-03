#!/usr/bin/env bash

./qemu-system-riscv64 -m 1g -machine sifive_u,start-in-flash=true -nographic -device loader,addr=0x20000000,file=softmmu/hifive -bios none -smp 4
