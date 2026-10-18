.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_Paragoomba
sprPtrs_Paragoomba:
	.word sprMap_Paragoomba1
	.word sprMap_Paragoomba2
sprMap_Paragoomba1:
	.byte $04
	.byte $04
	.byte $A5
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $FF, $FF, $FF
	.byte $03, $04, $05, $FF
	.byte $0A, $0B, $0C, $FF
sprMap_Paragoomba2:
	.byte $04
	.byte $04
	.byte $A5
	.byte $0F, $FF, $10, $11
	.byte $12, $13, $14, $15
	.byte $16, $17, $18, $19
	.byte $1A, $1B, $1C, $FF
