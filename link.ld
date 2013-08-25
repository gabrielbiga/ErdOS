/*
 * ErdOS Operating System
 * erdos/link.ld
 * 
 * 24/08/2013 @ 02:40 AM
 * Copyright (C) 2013 Gabriel Marinho <gabrielbiga@me.com>
 */

/*
 * Script de 'linkagem' de todo Kernel
 */

OUTPUT_FORMAT("binary")

ENTRY(start)

/* Endereco fisico onde o Kernel sera alocado */
phys = 0x00100000;

/* Exposicoes ao ld */
SECTIONS
{
  .text phys : AT(phys) {
    code = .;
    *(.text)
    *(.rodata)
    . = ALIGN(4096);
  }
  .data : AT(phys + (data - code))
  {
    data = .;
    *(.data)
    . = ALIGN(4096);
  }
  .bss : AT(phys + (bss - code))
  {
    bss = .;
    *(.bss)
    . = ALIGN(4096);
  }
  end = .;
}
