.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr7_9632
ptr7_9632:
	LDY #$00
	LDX $A4
	LDA #$00
	ASL
	TAX
	LDA tbl9_9657,X
	STA $32
	LDA tbl9_9657+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_9651
	LDY #$C0
bra9_9651:
	STY $36
	JSR jmp_54_A118
	RTS
