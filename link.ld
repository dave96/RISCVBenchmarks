
SECTIONS
{
    . = 0x0200;
    .text.init : {
        *(.text.init)
    }

    .text : {
        *(.text)
    }

    . = 0x800;
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
