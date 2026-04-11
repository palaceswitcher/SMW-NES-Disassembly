.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9118
ptr6_9118:
	LDY #$00
	LDX $A4
	LDA objFlags,X
	AND #$0F
	CMP #$04
	BNE bra8_912B
	LDY #$02
	LDA #$80
	BNE bra8_9130
bra8_912B:
	LDA objFlags,X
	AND #$40
bra8_9130:
	STA objAttrs
	LDA objFrameCount
	AND #$04
	BEQ bra8_913B
	INY
bra8_913B:
	TYA
	ASL
	TAX
	LDA sprTblBlurp,X
	STA $32
	LDA sprTblBlurp+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_9155
	LDY #$C0
bra8_9155:
	STY $36
	JSR jmp_54_A118
	RTS

sprTblBlurp:
	.word sprBlurp1
	.word sprBlurp2
	.word sprBlurp3
	.word sprBlurp4
sprBlurp1:
	.byte $02
	.byte $02
	.byte $A6
	.byte $03
	.byte $04
	.byte $0D
	.byte $0E
sprBlurp2:
	.byte $02
	.byte $02
	.byte $A6
	.byte $05
	.byte $06
	.byte $0F
	.byte $0E
sprBlurp3:
	.byte $02
	.byte $02
	.byte $A6
	.byte $0D
	.byte $0E
	.byte $03
	.byte $04
sprBlurp4:
	.byte $02
	.byte $02
	.byte $A6
	.byte $0F
	.byte $0E
	.byte $05
	.byte $06
