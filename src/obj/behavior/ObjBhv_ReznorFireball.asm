.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x78
obj0x78:
	JSR sub5_82EC
	LDA frameCount
	AND #$00
	BNE bra5_82DC
	LDA #$2C
	JSR jmp_54_B11D
bra5_82DC:
	LDY #$03
	LDA objFrameCount
	AND #$04
	BEQ bra5_82E7
	LDY #$C4
bra5_82E7:
	TYA
	STA enemyAnimFrame,X
	RTS
