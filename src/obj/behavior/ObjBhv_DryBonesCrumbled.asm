.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xA8
obj0xA8:
	LDX $A4
	objDistCalc bra9_9A63

bra9_9A63:
	LDA frameCount
	AND #$07
	BNE bra9_9A86_RTS
	INC objVar,X
	LDA objVar,X
	CMP #$20
	BCC bra9_9A86_RTS
	LDA objSlot,X
	SEC
	SBC #$06
	STA objSlot,X
	LDA #$00
	STA objFlags,X
	LDA #$80
	STA objVar,X
bra9_9A86_RTS:
	RTS
