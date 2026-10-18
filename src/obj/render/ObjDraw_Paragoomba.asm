.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_82C7
ptr6_82C7:
	LDY #$08
	LDX $A4
	LDA objVar,X
	CMP #$10
	BCC bra9_82D4
	LDY #$04
bra9_82D4:
	STY $25
	LDY #$00
	LDA objFrameCount
	AND $25
	BEQ bra9_82E1
	LDY #$01
bra9_82E1:
	LDA objFlags,X
	AND #$40
	STA $05F0
	TYA
	ASL
	TAX
	LDA sprPtrs_Paragoomba,X
	STA $32
	LDA sprPtrs_Paragoomba+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8303
	LDY #$C0
bra9_8303:
	STY $36
	JSR jmp_54_A118
	RTS
