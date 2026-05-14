.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"


.export ptr6_99A9
ptr6_99A9:
	JSR sub6_99EF
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_99D7,X
	STA $32
	LDA tbl6_99D7+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra6_99CC
	LDY #$C0
bra6_99CC:
	STY $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
