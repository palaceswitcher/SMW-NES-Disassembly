.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x9C
obj0x9C:
	LDX $A4
	LDA objVar,X
	BPL bra9_8C76
	LDA #$00
	STA objVar,X
bra9_8C76:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra9_8CE0

bra9_8CE0:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8CF4,Y
	STA $32
	LDA tbl9_8CF4+1,Y
	STA $33
	JMP ($32)
tbl9_8CF4:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_8CFE
	.word objFlipKill
ptr2_8CFE:
	LDA objVar,X
	CMP #$06
	BCS bra9_8D73
	LDA frameCount
	AND #$1E
	BNE bra9_8D0E
	INC objVar,X
bra9_8D0E:
	objDistCalc bra9_8D72_RTS

bra9_8D72_RTS:
	RTS
bra9_8D73:
	JSR sub9_8D7C
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub9_8D7C:
	LDA frameCount
	AND #$02
	BEQ bra9_8D83
	RTS
bra9_8D83:
	LDA #$87
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B485
	RTS
