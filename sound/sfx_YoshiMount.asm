YoshiMount_P1:
	sndspeed 1
	transpose 7
	duty 0
	pitch $63
	volenv $11
	notelen 14
	.byte D4-7

	duty $00
	pitch $64
	volenv $11
	.byte G3-7
	.byte $FF
YoshiMount_P2:
	transpose 7
	duty $34
	pitch $39
	volenv $41
	notelen 3
	.byte E2-7

	notelen 10
	.byte NRest

	notelen 3
	.byte E2-7
	.byte $FF
YoshiMount_Noise:
	transpose 7
	duty $5B
	pitch $39
	volenv $11
	notelen 14
	.byte D4-7, G3-7
	.byte $FF
YoshiMount_Footer:
	sfxsq1 YoshiMount_P1
	sfxsq2 YoshiMount_P2
	sfxnoise YoshiMount_Noise
	.byte $FF