.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9724
ptr6_9724:
	JSR sub7_9792
.export ptr6_9727
ptr6_9727:
	LDA #$00
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
