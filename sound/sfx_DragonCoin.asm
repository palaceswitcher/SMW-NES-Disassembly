.include "macros.asm"
.include "constants.asm"

YoshiCoin_P1:
	sndspeed 1
	transpose 7
	duty $38
	pitch $39
	volenv $41
	notelen 3
	.byte Fs6-7, Fs6-7

	duty $38
	pitch $39
	volenv $40
	.byte Fs6-7, Fs6-7, Fs6-7, Fs6-7
	.byte $FF
YoshiCoin_Footer:
	sfxsq1 YoshiCoin_P1
	.byte $FF