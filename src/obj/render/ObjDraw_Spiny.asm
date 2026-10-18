.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8A5E
ptr6_8A5E:
	LDA #$00
	STA $05F0
	LDA objFrameCount
	LSR
	LSR
	LSR
	AND #$01 ; Check if on an 8th frame
	ASL
	TAX ; Get pointer index for odd/even frame
	LDA tbl9_8A8A,X
	STA $32
	LDA tbl9_8A8A+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8A84
	LDY #$C0
bra9_8A84:
	STY $36
	JSR jmp_54_A118
	RTS
