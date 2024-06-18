Feather_P1Noise:
	sndspeed 1
	transpose 7
	duty $00
	pitch $64
	volenv $11
	notelen 44
	db G3
	db $FF
Feather_Footer:
	db $80
	.word Feather_P1Noise
	db $83
	.word Feather_P1Noise
	db $FF