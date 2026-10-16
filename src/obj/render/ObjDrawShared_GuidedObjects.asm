.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; For various line-guided objects and platforms
.export ptr6_8039
ptr6_8039:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl5_805E,X
	STA $32
	LDA tbl5_805E+1,X
	STA $33
	LDA #$80
	STA $36
	LDX $A4
	LDA enemyAnimFrame,X
	AND #%11000000
	STA $05F0
	JSR jmp_54_A118
	RTS
