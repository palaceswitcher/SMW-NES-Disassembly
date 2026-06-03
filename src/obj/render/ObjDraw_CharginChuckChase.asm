.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8640
ptr6_8640:
	LDX $A4
	LDA objVar,X
	BPL bra4_864B
	LDY #$03
	BNE bra4_8669
bra4_864B:
	LDA objFlags,X
	AND #$20
	BNE bra4_865E
	LDA objVar,X
	CMP #$11
	BCS bra4_865E
	LDY #$03
	JMP loc4_8669
bra4_865E:
	LDY #$01
	LDA objFrameCount
	AND #$02
	BEQ bra4_8669
	LDY #$02
bra4_8669:
loc4_8669:
	LDA objFlags,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
