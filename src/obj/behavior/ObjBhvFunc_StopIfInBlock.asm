.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub7_9792
sub7_9792:
	LDX $A4
	LDA objVar,X
	BPL bra7_979B_RTS
	PLA
	PLA
bra7_979B_RTS:
	RTS
