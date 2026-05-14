.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_817B
ptr6_817B:
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA objVar,X
	BMI bra6_8196
	AND #$0F
	BEQ bra6_8196
	CMP #$09
	BCS bra6_8196
	LDY #$01
bra6_8196:
	TYA
	ASL
	TAX
	LDA sprPtrs_Ninji,X
	STA $32
	LDA sprPtrs_Ninji+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra6_81B0
	LDY #$C0
bra6_81B0:
	STY $36
	JSR jmp_54_A118
	RTS
