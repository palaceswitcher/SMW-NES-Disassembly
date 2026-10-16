.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x7E
obj0x7E:
	LDX $A4
	objDistCalc bra5_9645

bra5_9645:
	LDA objVar,X
	BPL bra5_964E
	JSR objFacePlayer
	RTS
bra5_964E:
	JSR sub5_82EC
	LDA $058C,X
	LSR
	SEC
	SBC #$24
	TAY
	LDA tbl5_9667,Y
	CMP #$FF
	BNE bra5_9661
	RTS
bra5_9661:
	ASL
	TAY
	JSR jmp_54_B896
	RTS
tbl5_9667:
	.byte $3A
	.byte $3B
	.byte $3C
	.byte $3D
	.byte $3C
	.byte $3C
	.byte $3B
	.byte $3B
	.byte $3D
