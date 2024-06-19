Feather_P1Noise:
	sndspeed 1
	transpose 7
	duty $00
	pitch $64
	volenv $11
	notelen 44
	db D4-7
	db $FF
Feather_Footer:
	sfxsq1 Feather_P1Noise
	sfxnoise Feather_P1Noise
	db $FF