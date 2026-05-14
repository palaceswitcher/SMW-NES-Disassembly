.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8CA2
ptr6_8CA2:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA $32
	LDA tbl6_8D45+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra6_8CC2
	LDY #$C0 ; unlogged
bra6_8CC2:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA worldNumber
	CMP #$04
	BEQ bra6_8CD7
	JSR jmp_54_A118
	RTS
bra6_8CD7:
	JSR sub_52_A2A8
	RTS
