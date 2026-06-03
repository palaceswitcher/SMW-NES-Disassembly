.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_901A
ptr6_901A:
	LDX $A4
	LDY #$0F
	LDA objVar,X
	CMP #$18
	BCS bra4_9034
	AND #$07
	TAY
	LDA tbl4_9038,Y
	TAY
	LDA objFlags,X
	AND #$40
	STA $05F0
bra4_9034:
	TYA
	JMP loc4_9104
tbl4_9038:
	.byte $0F
	.byte $10
	.byte $11
	.byte $11
	.byte $12
	.byte $0F
	.byte $0F
	.byte $0F
