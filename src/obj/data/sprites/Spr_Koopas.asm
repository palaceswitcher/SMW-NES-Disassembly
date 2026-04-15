.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblKoopa
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
