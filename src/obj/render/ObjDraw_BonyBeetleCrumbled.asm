.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_93B7
ptr6_93B7:
	LDY #$00
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDA objVar,X
	CMP #$0D
	BCC bra9_93CC
	LDY #$01
bra9_93CC:
	TYA
	ASL
	TAX
	LDA tbl9_93EC,X
	STA $32
	LDA tbl9_93EC+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_93E6
	LDY #$C0
bra9_93E6:
	STY $36
	JSR jmp_54_A118
	RTS
