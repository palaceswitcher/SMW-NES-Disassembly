.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_96CB
ptr6_96CB:
	LDX $A4
	LDA enemyAnimFrame,X
	ASL
	TAX
	LDA tbl5_96EB,X
	STA $32
	LDA tbl5_96EB+1,X
	STA $33
	LDA #$80
	STA $36
	LDX $A4
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
