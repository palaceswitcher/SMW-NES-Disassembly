.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9349
ptr6_9349:
	LDX $A4
	LDA objVar,X
	AND #$06
	LSR
	ASL
	TAX
	LDA tbl8_9395,X
	STA $32
	LDA tbl8_9395+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_936A
	LDY #$C0
bra8_936A:
	STY $36
	LDA objFlags,X
	AND #$40
	STA objAttrs
.export loc8_9374
loc8_9374:
	LDA $06E1
	PHA
	LDA prgDataBank2
	CMP #$26
	BNE bra8_938D
	LDY #$00
	LDA objYLo,X
	CMP #$A0
	BCC bra8_938A
	LDY #$20
bra8_938A:
	STY $06E1
bra8_938D:
	JSR jmp_54_A118
	PLA
	STA $06E1
	RTS
tbl8_9395:
	.word sprMechakoopa1
	.word sprMechakoopa2
	.word sprMechakoopa3
	.word sprMechakoopa2
sprMechakoopa1:
	.byte $04
	.byte $03
	.byte $AE
	.byte $01
	.byte $02
	.byte $03
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
	.byte $14
	.byte $15
	.byte $16
	.byte $17
sprMechakoopa2:
	.byte $04
	.byte $03
	.byte $AE
	.byte $04
	.byte $05
	.byte $06
	.byte $FF
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
	.byte $18
	.byte $19
	.byte $1A
	.byte $1B
sprMechakoopa3:
	.byte $04
	.byte $03
	.byte $AE
	.byte $01
	.byte $07
	.byte $08
	.byte $FF
	.byte $09
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $1C
	.byte $1D
	.byte $1E
