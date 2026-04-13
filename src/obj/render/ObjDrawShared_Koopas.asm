.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; KOOPA GRAPHICAL CODE ($820E)
; Used by every Koopa variant
;----------------------------------------
.export ptr6_820E
ptr6_820E:
	LDX $A4 ; Get current object index
	LDA enemyAnimFrame,X
	ASL
	TAX ; Get index for current frame
	LDA sprTblKoopa,X
	STA $32
	LDA sprTblKoopa+1,X
	STA $33 ; Load mapping pointer
	LDY #$80 ; Use CHR sprite bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ @continue
		LDY #$C0 ; Use CHR sprite bank 3 if lower bit of ID is set

@continue:
	STY $36 ; Set bank number
	LDA objFlags,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_52_A118 ; Render mapping data
	RTS

sprTblKoopa:
	.word sprBeachKoopaWalk1
	.word sprBeachKoopaWalk2
	.word sprBeachKoopaSlide
	.word sprKoopaWalk1
	.word sprKoopaWalk2
	.word sprParatroopaWalk1
	.word sprParatroopaWalk2
sprBeachKoopaWalk1:
	.byte $02
	.byte $02
	.byte $94
	.byte $01, $02
	.byte $06, $07
sprBeachKoopaWalk2:
	.byte $02
	.byte $02
	.byte $94
	.byte $01, $03
	.byte $08, $09
sprBeachKoopaSlide:
	.byte $02
	.byte $02
	.byte $94
	.byte $04, $05
	.byte $0A, $0B
sprKoopaWalk1:
	.byte $02
	.byte $04
	.byte $94
	.byte $0E, $0F
	.byte $18, $19
	.byte $27, $28
	.byte $35, $36
sprKoopaWalk2:
	.byte $02
	.byte $04
	.byte $94
	.byte $10, $11
	.byte $1A, $1B
	.byte $29, $2A
	.byte $37, $38
sprParatroopaWalk1:
	.byte $04
	.byte $04
	.byte $94
	.byte $FF, $12, $13, $FF
	.byte $1C, $1D, $1E, $1F
	.byte $FF, $2C, $2D, $2E
	.byte $FF, $39, $3A, $FF
sprParatroopaWalk2:
	.byte $04
	.byte $04
	.byte $94
	.byte $FF, $16, $17, $FF
	.byte $23, $24, $25, $26
	.byte $31, $32, $33, $34
	.byte $FF, $3E, $3F, $FF