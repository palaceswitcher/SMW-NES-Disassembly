.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9093
ptr6_9093:
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA objFrameCount
	AND #$10
	BEQ bra9_90A8
	LDY #$01
bra9_90A8:
	TYA
	ASL
	TAX
	LDA tbl9_90C8,X
	STA $32
	LDA tbl9_90C8+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_90C2
	LDY #$C0
bra9_90C2:
	STY $36
	JSR jmp_54_A118
	RTS
