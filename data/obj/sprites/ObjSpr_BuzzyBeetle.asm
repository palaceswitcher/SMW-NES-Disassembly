.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_BuzzyBeetle
sprPtrs_BuzzyBeetle:
	.word sprMap_BuzzyWalk1
	.word sprMap_BuzzyWalk2
sprMap_BuzzyWalk1:
	.byte $02
	.byte $02
	.byte $97
	.byte $1E, $1F
	.byte $26, $27
sprMap_BuzzyWalk2:
	.byte $02
	.byte $02
	.byte $97
	.byte $20, $21
	.byte $28, $29
