.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_95B5
ptr6_95B5:
	LDX $A4
	LDA objStateTimer,X
	CMP #$D0
	BCC bra8_95C6
	LDA objFrameCount
	AND #$04
	BNE bra8_95C6
	RTS
bra8_95C6:
	LDA objSlot,X
	LSR
	SEC
	SBC #$1E
	TAY
	LDA objFlags,X
	AND #$1F
	CMP #$05
	BNE bra8_95DC
	TYA
	CLC
	ADC #$03
	TAY
bra8_95DC:
	TYA
	ASL
	TAX
	LDA tbl8_9612,X
	STA $32
	LDA tbl8_9612+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_95F6
	LDY #$C0
bra8_95F6:
	STY $36
	LDA objFlags,X
	BPL bra8_960A
	AND #$BF
	STA $34
	LDA playerMoveFlags
	AND #$40
	ORA $34
	STA objFlags,X
bra8_960A:
	AND #$40
	STA objAttrs
	JMP loc8_9374
tbl8_9612:
	.word stunmechakoopa1
	.word stunmechakoopa2
	.word stunmechakoopa3
	.word stunMechakoopa4
	.word stunMechakoopa5
	.word stunMechakoopa6
stunmechakoopa1:
	.byte $03
	.byte $03
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $20
	.byte $21
	.byte $24
	.byte $25
	.byte $26
stunmechakoopa2:
	.byte $03
	.byte $03
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $20
	.byte $23
	.byte $24
	.byte $25
	.byte $26
stunmechakoopa3:
	.byte $03
	.byte $03
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $20
	.byte $31
	.byte $24
	.byte $25
	.byte $26
stunMechakoopa4:
	.byte $03
	.byte $03
	.byte $AE
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $2B
	.byte $2D
	.byte $2E
	.byte $2F
stunMechakoopa5:
	.byte $03
	.byte $03
	.byte $AE
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $30
	.byte $2D
	.byte $2E
	.byte $2F
stunMechakoopa6:
	.byte $03
	.byte $03
	.byte $AE
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $32
	.byte $2D
	.byte $2E
	.byte $2F
