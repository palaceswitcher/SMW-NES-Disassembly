.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x9E
obj0x9E:
	LDX $A4
	LDA objVar,X
	BMI bra9_8E04
	JMP loc9_8E6B
bra9_8E04:
	objDistCalc bra9_8E68

bra9_8E68:
	JMP objFacePlayer
loc9_8E6B:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra9_8ED5

bra9_8ED5:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8EE9,Y
	STA $32
	LDA tbl9_8EE9+1,Y
	STA $33
	JMP ($32)
tbl9_8EE9:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_8EF3
	.word objFlipKill
ptr2_8EF3:
	JSR sub9_8EFC ; unlogged
	JSR jmp_54_BC3E ; unlogged
	JMP jmp_54_BF74 ; unlogged
sub9_8EFC:
	LDA frameCount
	AND #$04
	BEQ bra9_8F03
	RTS
bra9_8F03:
	LDA #$88
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	RTS
