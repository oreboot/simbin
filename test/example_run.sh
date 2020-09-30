#!/usr/bin/env bash

IMAGE=./softmmu/hifive ./qemu-system-riscv64 -m 1g -machine sifive_u,start-in-flash=true -nographic -device loader,addr=0x20000000,file=${IMAGE} -bios none -smp 4
