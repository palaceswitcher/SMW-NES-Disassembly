.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x7D
obj0x7D:
	LDX $A4
	objDistCalc bra8_99A9

bra8_99A9:
	LDY #$00
	LDA objXDistHi,X
	BMI bra8_99B2
	LDY #$20
bra8_99B2:
	STY $06E0
	RTS
