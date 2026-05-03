.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8475
ptr6_8475:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_84A3,X
	STA $32
	LDA tbl_84A3+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8495
	LDY #$C0
bra_8495:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
