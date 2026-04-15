.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; This is pointer to in Spr_GlobalObjects.asm
.export sprMap_Checkpoint
sprMap_Checkpoint:
	.byte $02
	.byte $01
	.byte $90
	.byte $3E, $3E
