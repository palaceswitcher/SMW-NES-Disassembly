.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9742
ptr6_9742:
	JSR sub7_9792
	LDA #$05
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDY #$40
	LDA objFrameCount
	AND #$10
	BEQ bra7_9762
	LDY #$00
bra7_9762:
	STY $05F0
	JSR jmp_54_A118
	RTS
