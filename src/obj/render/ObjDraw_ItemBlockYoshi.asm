.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9562
ptr6_9562:
	JSR sub7_9792
	LDY #$0D
	LDX $A4
	LDA objVar,X
	BMI bra7_9573
	CMP #$10
	BCC bra7_9573
	INY
bra7_9573:
	TYA
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
