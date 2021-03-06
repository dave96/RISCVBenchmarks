#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Need an argument"
	exit 1
fi

mkdir -p build

riscv64-linux-gnu-as -march=rv64i $1.s -o build/prog.bin
riscv64-linux-gnu-gcc -march=rv64i -o build/program.elf build/prog.bin -T link.ld -nostdlib -Wl,--build-id=none
riscv64-linux-gnu-objcopy -O binary --only-section=.data* --only-section=.text* build/program.elf build/mem.bin
hexdump -v -e '"%08x\n"' build/mem.bin > build/mem.txt
python tohex.py build/mem.txt > $1.hex
riscv64-linux-gnu-objdump -S -s build/program.elf > $1.dump
