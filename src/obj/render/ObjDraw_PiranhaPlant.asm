.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_884B
ptr6_884B:
	LDX $A4
	LDA objVar,X
	BPL bra8_8853
	RTS
bra8_8853:
	LDA objFrameCount
	AND #$18
	LSR
	LSR
	LSR
	ASL
	TAX
	LDA tbl8_887F,X
	STA $32
	LDA tbl8_887F+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8874
	LDY #$C0
bra8_8874:
	STY $36
	LDA #$00
	STA objAttrs
	JSR jmp_54_A118
	RTS
tbl8_887F:
	.word sprPiranhaJump1
	.word sprPiranhaJump2
	.word sprPiranhaJump3
	.word sprPiranhaJump4
sprPiranhaJump1:
	.byte $02
	.byte $03
	.byte $97
	.byte $0D
	.byte $0E
	.byte $11
	.byte $12
	.byte $15
	.byte $16
sprPiranhaJump2:
	.byte $02
	.byte $03
	.byte $97
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $17
	.byte $18
sprPiranhaJump3:
	.byte $02
	.byte $03
	.byte $97
	.byte $0D
	.byte $0E
	.byte $11
	.byte $12
	.byte $19
	.byte $1A
sprPiranhaJump4:
	.byte $02
	.byte $03
	.byte $97
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $19
	.byte $1B
