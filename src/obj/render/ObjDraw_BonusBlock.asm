.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9951
ptr6_9951:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl5_997F,X
	STA $32
	LDA tbl5_997F+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra5_9971
	LDY #$C0
bra5_9971:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR sub_52_ADAF
	RTS
