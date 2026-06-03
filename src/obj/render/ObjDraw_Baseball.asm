.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8B71
ptr6_8B71:
	LDY #$00
	LDX $A4
	LDA objFrameCount
	AND #$10
	BEQ bra4_8B7E
	LDY #$40
bra4_8B7E:
	STY $05F0
	LDA #$00
	JMP loc4_90CE
