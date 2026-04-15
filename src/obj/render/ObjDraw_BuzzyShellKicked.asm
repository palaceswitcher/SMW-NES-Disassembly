.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9A68
ptr6_9A68:
	LDA objFrameCount
	AND #$0C
	LSR
	LSR
	LDY #$00
	CMP #$03
	BNE bra7_9A77
	LDY #$40
bra7_9A77:
	STY $05F0
	ASL
	TAX
	LDA sprPtrs_BuzzyShell,X
	STA $32
	LDA sprPtrs_BuzzyShell+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra7_9A93
	LDY #$C0
bra7_9A93:
	STY $36
	JSR jmp_54_A118
	RTS
