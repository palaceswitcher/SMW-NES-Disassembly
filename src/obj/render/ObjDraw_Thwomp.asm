.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_83B3
ptr6_83B3:
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDA objVar,X
	AND #$0F
	ASL
	TAX
	LDA sprPtrs_Thwomp,X
	STA $32
	LDA sprPtrs_Thwomp+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra6_83DB
	LDY #$C0
bra6_83DB:
	STY $36
	JSR jmp_54_A118
	RTS
