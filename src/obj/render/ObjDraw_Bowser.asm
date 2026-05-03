.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_88F9
ptr6_88F9:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8938,X
	STA $32
	LDA tbl_8938+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8919
	LDY #$C0
bra_8919:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA enemyAnimFrame,X
	CMP #$55
	BCS bra_892F
	LDA #$00
	STA $06E1
bra_892F:
	JSR jmp_54_A118
	LDA #$20
	STA $06E1
	RTS
