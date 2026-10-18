
.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x82
obj0x82:
	LDX $A4
	LDA objVar,X
	BMI bra9_8F87
	JMP loc9_8FEF
bra9_8F87:
	objDistCalc bra9_8FEB

bra9_8FEB:
	JSR objFacePlayer
	RTS
loc9_8FEF:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra9_9059

bra9_9059:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_906D,Y
	STA $32
	LDA tbl9_906D+1,Y
	STA $33
	JMP ($32)
tbl9_906D:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_9075
ptr2_9075:
	LDA frameCount
	AND #$00
	BEQ bra9_907C
	RTS
bra9_907C:
	LDA #$80
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
