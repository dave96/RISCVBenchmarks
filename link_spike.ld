__sp = 0x80010000;

SECTIONS
{
    . = 0x80000000;
    .text.init : {
        *(.text.init)
    }

    .text : {
        *(.text)
    }

    . = 0x80008000;
    .data : {
        *(.sbss)
        *(COMMON)
        *(.bss)
        *(.sdata)
        *(.rodata)
        *(.data*)
        *(.got*)
    }
}
