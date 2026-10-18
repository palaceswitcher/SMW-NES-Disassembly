.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9B79
ptr6_9B79:
	LDY #$00
	LDX $A4
	LDA frameCount
	AND #$0E
	TAY
	LDA tbl9_9BAA+1,Y
	STA $05F0
	LDA tbl9_9BAA,Y
	ASL
	TAX
	LDA tbl9_9BBA,X
	STA $32
	LDA tbl9_9BBA+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_9BA4
	LDY #$C0
bra9_9BA4:
	STY $36
	JSR jmp_54_A118
	RTS
