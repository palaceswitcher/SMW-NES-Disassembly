.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr5_92C3
ptr5_92C3:
	LDX $A4
	LDA objFlags,X
	AND #$80|OBJFLAG_HORIZ|OBJFLAG_VERT
	STA objFlags,X
	RTS
