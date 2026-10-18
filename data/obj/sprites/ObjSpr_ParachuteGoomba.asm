.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_ParachuteGoomba
sprPtrs_ParachuteGoomba:
	.word sprMap_ParachuteGoomba1
	.word sprMap_ParachuteGoomba2
sprMap_ParachuteGoomba1:
	.byte $03
	.byte $04
	.byte $A5
	.byte $1D, $1E, $1F
	.byte $22, $23, $24
	.byte $27, $28, $FF
	.byte $2C, $2D, $FF
sprMap_ParachuteGoomba2:
	.byte $03
	.byte $04
	.byte $A5
	.byte $FF, $20, $21
	.byte $FF, $25, $26
	.byte $29, $2A, $2B
	.byte $2E, $2F, $30
