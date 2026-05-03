.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xD4
obj0xD4:
	LDX $A4
	objDistCalc bra_80C8

bra_80C8:
	LDY #$46
	LDA objState,X
	BEQ bra_80D0
	INY
bra_80D0:
	STY $32
	LDA frameCount
	AND #$01
	BNE bra_80DD
	LDA $32
	JSR parseMovementData
bra_80DD:
	JSR sub_82EA
	JSR jmp_54_BF74
	RTS
