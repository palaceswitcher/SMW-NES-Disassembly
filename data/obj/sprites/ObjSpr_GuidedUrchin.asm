.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblUrchin
sprTblUrchin:
	.word sprWallUrchin1
	.word sprWallUrchin2
sprWallUrchin1:
	.byte $04
	.byte $04
	.byte $A8
	.byte $09, $0A, $0B, $0C
	.byte $0D, $0E, $0F, $10
	.byte $13, $14, $15, $16
	.byte $19, $1A, $1B, $1C
sprWallUrchin2:
	.byte $04
	.byte $04
	.byte $A8
	.byte $09, $0A, $0B, $0C
	.byte $0D, $11, $12, $10
	.byte $13, $17, $18, $16
	.byte $19, $1A, $1B, $1C
