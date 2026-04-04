.segment "PRG45"

	.incbin "levels/lvl_Title.bin" ; Self explanatory, includes data for the title screen level
	.repeat 4418 ; Fills in 0x1142 of 00s
	.byte $00
	.endrep
	.incbin "prg/padding/padding045.bin"
