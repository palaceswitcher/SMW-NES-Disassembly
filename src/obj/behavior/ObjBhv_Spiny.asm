.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x9A
obj0x9A:
	LDX $A4
	LDA objVar,X
	BPL bra9_89AE
	CMP #$81
	BEQ bra9_89AB
	objDistCalc bra9_89A8

bra9_89A8:
	JMP objFacePlayer
bra9_89AB:
	JMP sub_54_B4FC
bra9_89AE:
	LDA #$06
	STA $25
	LDX $A4
	objDistCalc bra9_8A18

bra9_8A18:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8A2C,Y
	STA $32
	LDA tbl9_8A2C+1,Y
	STA $33
	JMP ($32)
tbl9_8A2C:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_8A36
	.word objFlipKill
ptr2_8A36:
	JSR sub9_8A45
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR objKillOnSpinJump
	JMP jmp_54_BF74
sub9_8A45:
	LDA objFrameCount
	AND #$02
	BNE bra9_8A5D_RTS
	LDA #$86
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8A5D_RTS:
	RTS
