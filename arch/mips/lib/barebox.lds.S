/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright (C) 2011 Antony Pavlov <antonynpavlov@gmail.com>
 */


#include <asm-generic/barebox.lds.h>

OUTPUT_ARCH(mips)
ENTRY(_start)
SECTIONS
{
	. = TEXT_BASE;

	. = ALIGN(4);
	.text      :
	{
		_stext = .;
		_text = .;
		*(.text_entry*)
		__bare_init_start = .;
		*(.text_bare_init*)
		__bare_init_end = .;
		*(.text*)
	}
	BAREBOX_BARE_INIT_SIZE

	PRE_IMAGE

	. = ALIGN(4);
	.rodata : { *(.rodata*) }

	_etext = .;			/* End of text and rodata section */
	_sdata = .;

	. = ALIGN(4);
	.data : { *(.data*) }

	.barebox_imd : { BAREBOX_IMD }

	. = .;
	__barebox_cmd_start = .;
	.barebox_cmd : { BAREBOX_CMDS }
	__barebox_cmd_end = .;

	__barebox_ratp_cmd_start = .;
	.barebox_ratp_cmd : { BAREBOX_RATP_CMDS }
	__barebox_ratp_cmd_end = .;

	__barebox_magicvar_start = .;
	.barebox_magicvar : { BAREBOX_MAGICVARS }
	__barebox_magicvar_end = .;

	__barebox_initcalls_start = .;
	.barebox_initcalls : { INITCALLS }
	__barebox_initcalls_end = .;

	__barebox_exitcalls_start = .;
	.barebox_exitcalls : { EXITCALLS }
	__barebox_exitcalls_end = .;

	__usymtab_start = .;
	__usymtab : { BAREBOX_SYMS }
	__usymtab_end = .;

#ifdef CONFIG_PCI
	__start_pci_fixups_early = .;
	.pci_fixup_early : { KEEP(*(.pci_fixup_early)) }
	__end_pci_fixups_early = .;
	__start_pci_fixups_header = .;
	.pci_fixup_header : { KEEP(*(.pci_fixup_header)) }
	__end_pci_fixups_header = .;
	__start_pci_fixups_enable = .;
	.pci_fixup_enable : { KEEP(*(.pci_fixup_enable)) }
	__end_pci_fixups_enable = .;
#endif
	.oftables : { BAREBOX_CLK_TABLE() }

	.dtb : { BAREBOX_DTB() }

	_edata = .;
	. = ALIGN(4);
	__bss_start = .;
	.bss : { *(.bss*) }
	__bss_stop = .;
	_end = .;
}
