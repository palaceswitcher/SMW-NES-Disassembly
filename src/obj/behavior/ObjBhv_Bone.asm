.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xA6
obj0xA6:
	LDX $A4
	objDistCalc bra9_9B5B

bra9_9B5B:
	LDA frameCount
	AND #$00
	BEQ bra9_9B62
	RTS
bra9_9B62:
	LDA #$8B
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	JSR objCollStompOrHurt
	JMP jmp_54_BF74
