.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x8C
obj0x8C:
	LDX $A4
	objDistCalc bra9_95DD

bra9_95DD:
	LDA objVar,X
	BPL bra9_960D
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	SEC
	SBC #$0C
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$30
	STA objYLo,X
	BCS bra9_960C_RTS
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra9_960C_RTS:
	RTS
bra9_960D:
	LDX $A4
	LDA objFrameCount
	AND #$07
	BNE bra9_9621
	INC objVar,X
	LDA objVar,X
	AND #$1F
	STA objVar,X
bra9_9621:
	LDA objFrameCount
	AND #$03
	BNE bra9_962B
	JSR jmp_54_BBC3
bra9_962B:
	JSR objCollStompOrHurt
	JSR jmp_54_BF74
	RTS
