__sp = 0x0200;

SECTIONS
{
    . = 0x0200;
    .text.init : {
        *(.text.init)
    }

    .text : {
        *(.text)
    }

    . = 0x0400;
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
