Explosion_Noise:
	sndspeed 3
	transpose 1
	duty $34
	pitch $39
	volenv $46
	notelen 24
	db A#3-1
	db $FF
Explosion_Footer:
	sfxnoise Explosion_Noise
	db $FF