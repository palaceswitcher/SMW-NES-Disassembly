.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr7_96F8
ptr7_96F8:
	LDX $A4
	LDA objFlags,X
	STA $05F0
	LDA objFrameCount
	AND #$04
	BNE bra7_971A_RTS
	ASL
	TAX
	LDA sprPtrs_HPodoboo,X
	STA $32
	LDA sprPtrs_HPodoboo+1,X
	STA $33
	LDA #$40
	STA $36
	JSR jmp_54_A118
bra7_971A_RTS:
	RTS
