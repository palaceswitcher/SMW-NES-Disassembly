YoshiMount_P1:
	sndspeed 1
	transpose 7
	duty 0
	pitch $63
	volenv $11
	notelen 14
	db D4-7

	duty $00
	pitch $64
	volenv $11
	db G3-7
	db $FF
YoshiMount_P2:
	transpose 7
	duty $34
	pitch $39
	volenv $41
	notelen 3
	db E2-7

	notelen 10
	db NRest

	notelen 3
	db E2-7
	db $FF
YoshiMount_Noise:
	transpose 7
	duty $5B
	pitch $39
	volenv $11
	notelen 14
	db D4-7, G3-7
	db $FF
YoshiMount_Footer:
	sfxsq1 YoshiMount_P1
	sfxsq2 YoshiMount_P2
	sfxnoise YoshiMount_Noise
	db $FF