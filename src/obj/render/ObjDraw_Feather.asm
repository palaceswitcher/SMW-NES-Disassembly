.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9769
ptr6_9769:
	JSR sub7_9792
	LDA #$08
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDY #$00
	LDA objVar,X
	CMP #$14
	BCC bra7_978B
	LDY #$40
bra7_978B:
	STY $05F0
	JSR jmp_54_A118
	RTS
