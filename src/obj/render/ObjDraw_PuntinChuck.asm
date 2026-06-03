.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8D59
ptr6_8D59:
	LDX $A4
	LDY #$03
	LDA objFlags,X
	AND #$20
	BNE bra4_8D71
	LDY #$0E
	LDA objVar,X
	SEC
	SBC #$02
	CMP #$02
	BCC bra4_8D71
	DEY
bra4_8D71:
	LDA objFlags,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
