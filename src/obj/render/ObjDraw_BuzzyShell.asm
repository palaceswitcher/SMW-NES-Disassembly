.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9A11
ptr6_9A11:
	LDA #$02
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
	BEQ bra7_9A2C
	LDY #$C0
bra7_9A2C:
	STY $36
	LDA objFlags,X
	AND #$1F
	CMP #$04
	BEQ bra7_9A3B
	CMP #$06
	BNE bra7_9A5C
bra7_9A3B:
	LDA #$04
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
	BEQ bra7_9A56
	LDY #$C0
bra7_9A56:
	STY $36
	LDA #$80
	BNE bra7_9A61
bra7_9A5C:
	LDA objFlags,X
	AND #$40
bra7_9A61:
	STA $05F0
	JSR jmp_54_A118
	RTS
