#!/bin/env python
import sys

file_name = sys.argv[1]

# Parameters for memory
padding_bytes = 512
bytes_per_line = 16
bytes_per_instruction = 4

for i in range(int(padding_bytes/bytes_per_line)):
    print('0' * (bytes_per_line * 2))

fp = open(file_name, 'r')
lines = [s.rstrip() for s in fp.readlines()]
fp.close()

instructions_per_line = bytes_per_line / bytes_per_instruction
extra_pad = int(instructions_per_line - (len(lines) % instructions_per_line))

for i in range(extra_pad):
    lines.append('0' * (bytes_per_instruction * 2))

current_line = ""
stride = 0

for line in lines:
    current_line = line + current_line
    stride += 1

    if (stride == instructions_per_line):
        print(current_line)
        current_line = ""
        stride = 0
