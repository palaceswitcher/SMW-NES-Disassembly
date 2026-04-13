.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub7_9538
sub7_9538:
	LDA objFlags,X
	AND #OBJFLAG_HORIZ
	BEQ bra7_9550
	LDA objXLo,X
	SEC
	SBC #$03
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	JMP loc7_955E
bra7_9550:
	LDA objXLo,X
	CLC
	ADC #$03
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
loc7_955E:
	STA objXHi,X
	RTS
