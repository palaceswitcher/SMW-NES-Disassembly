.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_Ninji
sprPtrs_Ninji:
	.word sprMap_Ninji_Idle
	.word sprMap_Ninji_Jump
sprMap_Ninji_Idle:
	.byte $02 ; Tile Width
	.byte $02 ; Tile Height
	.byte $A6 ; 1K CHR Bank
	.byte $22, $23
	.byte $24, $25
sprMap_Ninji_Jump:
	.byte $02 ; Tile Width
	.byte $02 ; Tile Height
	.byte $A6 ; 1K CHR Bank
	.byte $26, $27
	.byte $28, $29
