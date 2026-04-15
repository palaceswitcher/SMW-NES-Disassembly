.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr5_9DA5
ptr5_9DA5:
	LDA #$00
	ASL
	TAX
	LDA sprPtrs_HPodoboo,X
	STA $32
	LDA sprPtrs_HPodoboo+1,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
