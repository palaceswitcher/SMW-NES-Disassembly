.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9BFB
ptr6_9BFB:
	LDA #$10
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra7_9C16
	LDY #$C0
bra7_9C16:
	STY $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
