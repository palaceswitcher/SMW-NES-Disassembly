.include "macros.asm"
.include "constants.asm"

YoshiSwallow_P2:
	sndspeed 1
	transpose 13
	duty $60
	pitch $5E
	volenv $61
	notelen 12
	.byte Cs3-13
	.byte Cs2-13
	.byte $FF
YoshiSwallow_Footer:
	sfxsq2 YoshiSwallow_P2
	.byte $FF