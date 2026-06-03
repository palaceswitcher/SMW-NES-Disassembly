.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr9_843B
ptr9_843B:
	LDX $A4
	LDA objVar,X
	BPL bra4_8446
	LDY #$03
	BNE bra4_8468
bra4_8446:
	CMP #$08
	BCS bra4_845D
	LDY #$00
	LDA objFrameCount
	AND #$20
	BEQ bra4_8455
	LDY #$40
bra4_8455:
	STY $05F0
	LDA #$00
	JMP loc4_9104
bra4_845D:
	LDY #$01
	LDA objFrameCount
	AND #$04
	BEQ bra4_8468
	LDY #$02
bra4_8468:
	LDA objFlags,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $40
	.byte $01
	.byte $00
