.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_BuzzyShell
sprPtrs_BuzzyShell:
	.word sprMap_BuzzyShell1
	.word sprMap_BuzzyShell2
	.word sprMap_BuzzyShell3
	.word sprMap_BuzzyShell2
	.word sprMap_BuzzyShell4
sprMap_BuzzyShell1:
	.byte $02
	.byte $02
	.byte $97
	.byte $1C, $1D
	.byte $22, $23
sprMap_BuzzyShell2:
	.byte $02
	.byte $02
	.byte $97
	.byte $1C, $1D
	.byte $24, $25
sprMap_BuzzyShell3:
	.byte $02
	.byte $02
	.byte $97
	.byte $1C, $1D
	.byte $2A, $2B
sprMap_BuzzyShell4:
	.byte $02
	.byte $02
	.byte $97
	.byte $2A, $2B
	.byte $1C, $1D
