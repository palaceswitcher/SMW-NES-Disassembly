.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export loc4_9104
loc4_9104:
	ASL
	TAX
	LDA tbl4_9122,X
	STA $32
	LDA tbl4_9122+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra4_911D
	LDY #$C0
bra4_911D:
	STY $36
	JMP jmp_54_A118
