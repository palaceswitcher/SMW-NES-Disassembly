.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8F15
ptr6_8F15:
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA objVar,X
	CMP #$20
	BCS bra9_8F32
	LDY #$02
	LDA $05F0
	ORA #$80
	STA $05F0
bra9_8F32:
	LDA frameCount
	AND #$08
	BEQ bra9_8F39
	INY
bra9_8F39:
	TYA
	ASL
	TAX
	LDA tbl9_8F59,X
	STA $32
	LDA tbl9_8F59+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8F53
	LDY #$C0
bra9_8F53:
	STY $36
	JSR jmp_54_A118
	RTS
