.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_88E0
ptr6_88E0:
	LDX $A4
	LDY #$00
	LDA objFrameCount
	AND #$08
	BEQ bra9_88ED
	LDY #$01
bra9_88ED:
	LDA objFlags,X
	AND #$C0
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_8915,X
	STA $32
	LDA tbl9_8915+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_890F
	LDY #$C0
bra9_890F:
	STY $36
	JSR jmp_54_A118
	RTS
