.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_87FE
ptr6_87FE:
	LDY #$00
	LDX $A4
	LDA objFrameCount
	AND #$10
	BEQ bra6_880A
	INY
bra6_880A:
	TYA
	ASL
	TAX
	LDA sprPtrs_Urchin,X
	STA $32
	LDA sprPtrs_Urchin+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra6_8824
	LDY #$C0
bra6_8824:
	STY $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
