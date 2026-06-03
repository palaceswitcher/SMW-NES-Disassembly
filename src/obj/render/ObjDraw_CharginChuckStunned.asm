.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_87C8
ptr6_87C8:
	LDX $A4
	LDA objVar,X
	BPL bra4_87DC
	LDA objFlags,X ; unlogged
	AND #$40 ; unlogged
	STA $05F0 ; unlogged
	LDA #$03 ; unlogged
	JMP loc4_9104 ; unlogged
bra4_87DC:
	CMP #$0A
	BCS bra4_87F1
	AND #$0F
	TAY
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDA tbl4_8804,Y
	JMP loc4_9104
bra4_87F1:
	LDY #$00
	LDA objFrameCount
	AND #$04
	BEQ bra4_87FC
	LDY #$40
bra4_87FC:
	STY $05F0
	LDA #$07
	JMP loc4_9104
tbl4_8804:
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
