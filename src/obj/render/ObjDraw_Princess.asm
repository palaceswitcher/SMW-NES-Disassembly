.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"


.export ptr6_8ECE
ptr6_8ECE:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8EFC,X
	STA $32
	LDA tbl_8EFC+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8EEE
	LDY #$C0
bra_8EEE:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
