.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_96D5
ptr6_96D5:
	LDY $A4
	LDA #$0B
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$00
	STA $36
	LDA objFrameCount
	AND #$08
	ASL
	ASL
	ASL
	STA $05F0
	JSR jmp_54_A118
	RTS
