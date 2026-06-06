.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblWoodenSpike
sprTblWoodenSpike:
	.word sprWoodenSpikeUp
	.word sprWoodenSpikeDown
sprWoodenSpikeUp:
	.byte $02
	.byte $08
	.byte $CF
	.byte $CC, $CD
	.byte $CE, $CF
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C4, $C5
	.byte $C6, $C7
sprWoodenSpikeDown:
	.byte $02
	.byte $08
	.byte $CF
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C8, $C9
	.byte $CA, $CB
