.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; P-Switch item block
.export ptr6_958D
ptr6_958D:
	JSR sub7_9792

.export ptr6_9590
ptr6_9590:
	LDA #$01
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
