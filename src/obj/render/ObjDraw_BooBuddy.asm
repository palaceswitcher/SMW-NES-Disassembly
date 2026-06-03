.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_990E
ptr6_990E:
	LDX $A4
	LDY #$00
	LDA objFlags,X
	ROL
	ROL
	ROL
	ROL
	AND #$06
	TAY
	LDA frameCount
	AND #$10
	BEQ bra4_9923
	INY
bra4_9923:
	LDA #$00
	STA $05F0
	TYA
	AND #$07
