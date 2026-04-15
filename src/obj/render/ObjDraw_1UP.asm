.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_96B7
ptr6_96B7:
	JSR sub7_9792 ; Don't render if still an item block
	LDA #$09
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
