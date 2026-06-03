.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8E28
ptr6_8E28:
	LDY #$00
	LDX $A4
	LDA objFrameCount
	AND #$10
	BEQ bra4_8E35
	LDY #$40
bra4_8E35:
	STY $05F0
	LDA #$01
	JMP loc4_90CE
