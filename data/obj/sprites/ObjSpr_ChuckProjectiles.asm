.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblChuckProjectiles
sprTblChuckProjectiles:
	.word sprBaseball
	.word sprFootball
	.word sprRock ; Unused
sprBaseball:
	.byte $01
	.byte $01
	.byte $AA
	.byte $01
sprFootball:
	.byte $02
	.byte $02
	.byte $AA
	.byte $02, $03
	.byte $06, $07
sprRock:
	.byte $02
	.byte $02
	.byte $AF
	.byte $04, $05
	.byte $08, $00
