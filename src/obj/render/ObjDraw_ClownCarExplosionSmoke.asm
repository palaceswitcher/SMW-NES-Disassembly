.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8F2E
ptr6_8F2E:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8F66,X
	STA $32
	LDA tbl_8F66+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8F4E
	LDY #$C0
bra_8F4E:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA #$00
	STA $06E1
	JSR jmp_54_A118
	LDA #$20
	STA $06E1
	RTS
