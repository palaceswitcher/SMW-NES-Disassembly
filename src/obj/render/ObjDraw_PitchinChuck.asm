.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8A81
ptr6_8A81:
	LDX $A4
	LDA objVar,X
	BPL bra4_8A8C
	LDY #$03
	BNE bra4_8A9F
bra4_8A8C:
	LDY #$0C
	LDA objFlags,X
	AND #$20
	BNE bra4_8A9F
	LDA objVar,X
	AND #$1F
	TAY
	LDA tbl4_8AAB,Y
	TAY
bra4_8A9F:
	LDA objFlags,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
tbl4_8AAB:
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $0A
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $0A
	.byte $08
	.byte $08
	.byte $08
	.byte $08
