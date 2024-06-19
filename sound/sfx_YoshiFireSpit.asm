YoshiFireSpit_Noise:
	sndspeed 3
	transpose 24
	duty $50
	pitch $51
	volenv $52
	notelen 10
	db C4-24

	duty $12
	pitch 0
	volenv $11
	notelen 15
	db C5-24
	db $FF
YoshiFireSpit_Footer:
	sfxnoise YoshiFireSpit_Noise
	db $FF