.data
orig:
	.word 0x12345678
	.word 0x90123456
	.word 0x78901234
	.word 0x56789012
dst:
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000

.text
.globl _start
_start:
	la a0, orig
	la a1, dst
	li a2, 3
loop:
	lw a3, 0(a0)
	sw a3, 0(a1)
	addi a0, a0, 4
	addi a1, a1, 4
	addi a2, a2, -1
	bge a2, zero, loop
end:
	j end
