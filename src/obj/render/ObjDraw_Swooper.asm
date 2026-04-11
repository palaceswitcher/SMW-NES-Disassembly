.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8F90
ptr6_8F90:
	LDX $A4
	LDA objVar,X
	BPL bra8_8FA1
	LDY #$00
	CMP #$82
	BCC bra8_8FAB
	LDY #$02
	BNE bra8_8FAB
bra8_8FA1:
	LDY #$01
	LDA objFrameCount
	AND #$04
	BEQ bra8_8FAB
	INY
bra8_8FAB:
	TYA
	ASL
	TAX
	LDA sprTblSwooper,X
	STA $32
	LDA sprTblSwooper+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8FC5
	LDY #$C0
bra8_8FC5:
	STY $36
	LDA objFlags,X
	AND #$40
	STA objAttrs
	JSR jmp_54_A118
	RTS

sprTblSwooper:
	.word sprSwooper1
	.word sprSwooper2
	.word sprSwooper3
sprSwooper1:
	.byte $03
	.byte $02
	.byte $96
	.byte $FF
	.byte $2E
	.byte $2F
	.byte $FF
	.byte $36
	.byte $37
sprSwooper2:
	.byte $03
	.byte $02
	.byte $96
	.byte $FF
	.byte $29
	.byte $2A
	.byte $30
	.byte $31
	.byte $32
sprSwooper3:
	.byte $03
	.byte $02
	.byte $96
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $33
	.byte $34
	.byte $35
