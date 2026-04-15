.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_979C
ptr6_979C:
	JSR sub7_9792
	LDY #$07
	LDA frameCount
	AND #$08
	BEQ bra7_97A9
		LDY #$0A
bra7_97A9:
	TYA
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
