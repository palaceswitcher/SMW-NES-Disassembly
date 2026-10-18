.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; This is completely unused
	LDY #$00
	LDX $A4
	LDA objFlags,X
	AND #$C0
	STA $05F0
	LDA objFlags,X
	BPL bra9_8C38
	LDY #$01
bra9_8C38:
	TYA
	ASL
	TAX
	LDA sprPtrs_VBulletBill,X
	STA $32
	LDA sprPtrs_VBulletBill+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8C52
	LDY #$C0
bra9_8C52:
	STY $36
	JSR jmp_54_A118
	RTS
