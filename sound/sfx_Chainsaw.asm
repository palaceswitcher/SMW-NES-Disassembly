Chainsaw_Noise:
	sndspeed 3
	transpose 1
	duty $38
	pitch $39
	volenv $41
	.byte $46-1
	.byte $FF

Chainsaw_Footer:
	sfxnoise Chainsaw_Noise
	.byte $FF