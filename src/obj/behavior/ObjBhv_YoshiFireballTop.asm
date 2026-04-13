.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x0A
obj0x0A:
	LDX $A4
	JSR sub7_9538
	LDA objYLo,X
	SEC
	SBC #$01
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	JSR sub7_8F50
	LDA #$10
	JSR objObjectHitCheck
	LDA #$00
	STA objSlot,X
	RTS

