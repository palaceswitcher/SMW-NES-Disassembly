YoshiCoin_P1:
	sndspeed 1
	transpose 7
	duty $38
	pitch $39
	volenv $41
	notelen 3
	.byte F#6-7, F#6-7

	duty $38
	pitch $39
	volenv $40
	.byte F#6-7, F#6-7, F#6-7, F#6-7
	.byte $FF
YoshiCoin_Footer:
	sfxsq1 YoshiCoin_P1
	.byte $FF