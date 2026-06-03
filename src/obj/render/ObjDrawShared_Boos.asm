.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export loc4_992B
loc4_992B:
	ASL
	TAX
	LDA sprTblBoo,X
	STA $32
	LDA sprTblBoo+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra4_9944
	LDY #$C0 ; unlogged
bra4_9944:
	STY $36
	JMP jmp_54_A118
