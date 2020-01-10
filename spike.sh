#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Need an argument"
	exit 1
fi

mkdir -p build

# riscv64-linux-gnu-gcc -O2 $1.c -o build/spike.bin -static
# spike -d /usr/riscv64-linux-gnu/bin/pk build/spike.bin

riscv64-linux-gnu-gcc -march=rv64im -O2 -mabi=lp64 -c $1.c -mcmodel=medany -o build/prog.bin
riscv64-linux-gnu-gcc -march=rv64im -mcmodel=medany -o build/program.elf build/prog.bin -T link_spike.ld -nostdlib -Wl,--build-id=none
spike -l --isa=RV64IM --pc=0x80000000 ./build/program.elf
