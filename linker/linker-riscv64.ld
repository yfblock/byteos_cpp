OUTPUT_ARCH(riscv)
ENTRY(_start)

/* BASE_ADDRESS = 0xffffffc080200000; */
BASE_ADDRESS = 0x80200000;

SECTIONS
{
    /* Load the kernel at this address: "." means the current address */
    . = BASE_ADDRESS;
    .text ALIGN(4K):  {
        stext = .;
        *(.text .text.*)
        etext = .;
    }

    .init_array : {
        __start_init_array = .;
        *(.init_array .init_array.*)
        __stop_init_array = .;
    }

    .rodata ALIGN(4K): {
        srodata = .;
        *(.rodata .rodata.*)
        . = ALIGN(4K);
        erodata = .;
    }

    . = ALIGN(4K);

    .data ALIGN(4K): {
        _sdata = .;
        *(.data .data.*)
        *(.sdata .sdata.*)
        _edata = .;
    }

    .percpu ALIGN(4K): {
        _percpu_start = .;
        *(.percpu .percpu.*)
    }

    .bss ALIGN(4K): {
        *(.bss.stack)
        _sbss = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
        _ebss = .;
    }

    PROVIDE(end = .);
    /DISCARD/ : {
        *(.comment) *(.note*) *(.eh_frame*) *(.debug*)
    }
}
