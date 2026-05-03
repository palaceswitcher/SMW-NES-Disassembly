.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_88D1
ptr6_88D1:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8938,X
	STA $32
	LDA tbl_8938+1,X
	STA $33
	LDA #$C0
	STA $36
	LDA #$00
	STA $05F0
	STA $06E1
	JSR sub2_A2CA
	LDA #$20
	STA $06E1
	RTS
