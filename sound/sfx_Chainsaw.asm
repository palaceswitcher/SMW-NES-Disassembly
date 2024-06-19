Chainsaw_Noise:
	sndspeed 3
	transpose 1
	duty $38
	pitch $39
	volenv $41
	db $46-1
	db $FF

Chainsaw_Footer:
	sfxnoise Chainsaw_Noise
	db $FF