.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_99CD
ptr6_99CD:
	LDY #$00
	LDA objFrameCount
	AND #$08
	BEQ bra7_99D7
	INY
bra7_99D7:
	TYA
	ASL
	TAX
	LDA sprPtrs_BuzzyBeetle,X
	STA $32
	LDA sprPtrs_BuzzyBeetle+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra7_99F1
	LDY #$C0
bra7_99F1:
	STY $36
	LDA objFlags,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
