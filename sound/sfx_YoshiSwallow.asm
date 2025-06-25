YoshiSwallow_P2:
	sndspeed 1
	transpose 13
	duty $60
	pitch $5E
	volenv $61
	notelen 12
	.byte C#3-13
	.byte C#2-13
	.byte $FF
YoshiSwallow_Footer:
	sfxsq2 YoshiSwallow_P2
	.byte $FF