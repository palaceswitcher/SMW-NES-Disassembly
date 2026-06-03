.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export loc4_90CE
loc4_90CE:
	ASL
	TAX
	LDA sprTblChuckProjectiles,X
	STA $32
	LDA sprTblChuckProjectiles+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra4_90E7
	LDY #$C0
bra4_90E7:
	STY $36
	JMP jmp_52_AC3B
