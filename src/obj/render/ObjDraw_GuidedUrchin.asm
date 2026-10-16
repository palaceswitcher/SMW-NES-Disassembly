.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9670
ptr6_9670:
	LDY #$00
	LDX $A4
	LDA objFrameCount
	AND #$10
	BEQ bra5_967C
	INY
bra5_967C:
	TYA
	ASL
	TAX
	LDA sprTblUrchin,X
	STA $32
	LDA sprTblUrchin+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra5_9696
	LDY #$C0
bra5_9696:
	STY $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS

