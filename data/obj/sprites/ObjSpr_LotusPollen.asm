.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblLotusPollen
sprTblLotusPollen:
	.word sprLotusPollen1
	.word sprLotusPollen2
sprLotusPollen1:
	.byte $01
	.byte $01
	.byte $97
	.byte $07
sprLotusPollen2:
	.byte $01
	.byte $01
	.byte $97
	.byte $08
