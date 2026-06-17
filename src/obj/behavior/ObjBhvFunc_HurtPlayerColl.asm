.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub5_82EC
sub5_82EC:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra5_8356

bra5_8356:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_836A,Y
	STA $32
	LDA tbl5_836A+1,Y
	STA $33
	JMP ($32)
tbl5_836A:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr10_8372
ptr10_8372:
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
