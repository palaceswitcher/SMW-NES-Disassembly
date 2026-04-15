.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8E17
ptr6_8E17:
	LDY #$00
	LDA objFrameCount
	AND #$04
	BEQ bra8_8E21
	INY
bra8_8E21:
	TYA
	ASL
	TAX
	LDA sprTblLotusPollen,X
	STA $32
	LDA sprTblLotusPollen+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8E3B
	LDY #$C0
bra8_8E3B:
	STY $36
	LDA #$00
	STA objAttrs
	JSR jmp_54_A118
	RTS
