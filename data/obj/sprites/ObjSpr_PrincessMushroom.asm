.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblPeachMushroom
sprTblPeachMushroom:
	.word sprPeachMushroom
sprPeachMushroom:
	.byte $02
	.byte $02
	.byte $90
	.byte $01, $02
	.byte $0B, $0C
