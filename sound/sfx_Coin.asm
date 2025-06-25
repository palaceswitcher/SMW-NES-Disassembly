Coin_P1:
	sndspeed 1
	transpose 7
	duty $38
	pitch $39
	volenv $40
	notelen 3
	.byte B5-7
	notelen 6
	.byte E6-7
	.byte $FF
Coin_Footer:
	sfxsq1 Coin_P1
	.byte $FF