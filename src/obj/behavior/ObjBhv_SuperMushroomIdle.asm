.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x6B
obj0x6B:
	LDX $A4
	objDistCalc bra7_90C4

bra7_90C4:
	JSR sub7_9149
	RTS
