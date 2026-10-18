.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8BF1
ptr6_8BF1:
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDA #$00
	ASL
	TAX
	LDA sprPtrs_BulletBill,X
	STA $32
	LDA sprPtrs_BulletBill+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8C16
	LDY #$C0
bra9_8C16:
	STY $36
	JSR jmp_54_A118
	RTS
