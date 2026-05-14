.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_HPodoboo
sprPtrs_HPodoboo:
	.word sprMap_HPodoboo
sprMap_HPodoboo:
	.byte $02
	.byte $02
	.byte $90
	.byte $09, $0A
	.byte $13, $14
