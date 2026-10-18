.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x8A
obj0x8A:
	LDX $A4
	LDA objVar,X
	BPL bra9_9470
	objDistCalc bra9_946D

bra9_946D:
	JMP objFacePlayer
bra9_9470:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra9_94DA

bra9_94DA:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_94EE,Y
	STA $32
	LDA tbl9_94EE+1,Y
	STA $33
	JMP ($32)
tbl9_94EE:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_94F6
ptr2_94F6:
	JSR sub9_9500
	JSR objCollStompOrHurt
	JSR jmp_54_BF74
	RTS
sub9_9500:
	LDA frameCount
	AND #$06
	BEQ bra9_9507
	RTS
bra9_9507:
	LDA #$83
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	RTS
