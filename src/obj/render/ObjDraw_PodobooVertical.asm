.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8D95
ptr6_8D95:
	LDY #$00
	STY $05F0
	LDX $A4
	LDA objVar,X
	CMP #$06
	BCS bra9_8DA4
	RTS
bra9_8DA4:
	CMP #$15
	BCC bra9_8DAF
	LDY #$02
	LDA #$80
	STA $05F0
bra9_8DAF:
	LDA frameCount
	AND #$08
	BEQ bra9_8DB6
	INY
bra9_8DB6:
	TYA
	ASL
	TAX
	LDA tbl9_8DD6,X
	STA $32
	LDA tbl9_8DD6+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8DD0
	LDY #$C0
bra9_8DD0:
	STY $36
	JSR jmp_54_A118
	RTS
