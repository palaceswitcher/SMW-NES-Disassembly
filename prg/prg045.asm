; disassembled by BZK 6502 Disassembler
	.incbin levels/lvl_Title.bin ; Self explanatory, includes data for the title screen level
	.dsb 4418, $00 ; Fills in 0x1142 of 00s
	.incbin prg/padding/padding045.bin
