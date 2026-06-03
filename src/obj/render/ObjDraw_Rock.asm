.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_90C4
ptr6_90C4:
	LDY #$00
	STY $05F0
	LDA #$02
	JMP loc4_90CE
