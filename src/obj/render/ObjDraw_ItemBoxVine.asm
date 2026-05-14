.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub6_99EF
sub6_99EF:
	LDX $A4
	LDA objVar,X
	BPL bra6_99FF_RTS
	LDA #$02
	STA $2D
	JSR sub2_A5D0
	PLA
	PLA
bra6_99FF_RTS:
	RTS
