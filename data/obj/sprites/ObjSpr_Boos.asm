.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblBoo
sprTblBoo:
	.word sprBoo_Tease1
	.word sprBoo_Tease2
	.word sprBoo_ChaseAlt ; Only used by Boo Buddies
	.word sprBoo_Chase
	.word sprBoo_MouthOpen ; Only used by Boo Buddies
	.word sprBoo_Hide
	.word sprBoo_Tease1 ; Unused
	.word sprBoo_Tease2 ; Unused
sprBoo_Tease1:
	.byte $02
	.byte $02
	.byte $AB
	.byte $01, $02
	.byte $04, $05
sprBoo_Tease2:
	.byte $02
	.byte $02
	.byte $AB
	.byte $01, $03
	.byte $06, $07
sprBoo_ChaseAlt:
	.byte $02
	.byte $2
	.byte $AB
	.byte $17, $18
	.byte $1D, $1E
sprBoo_Chase:
	.byte $02
	.byte $02
	.byte $AB
	.byte $17, $19
	.byte $1F, $20
sprBoo_MouthOpen:
	.byte $02
	.byte $02
	.byte $AB
	.byte $08, $09
	.byte $0F, $10
sprBoo_Hide:
	.byte $02
	.byte $02
	.byte $AB
	.byte $08, $0A
	.byte $11, $12
