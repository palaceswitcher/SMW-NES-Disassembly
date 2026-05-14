.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9364
ptr6_9364:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA $32
	LDA tbl6_8D45+1,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
