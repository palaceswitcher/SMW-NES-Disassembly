Pause_P2:
	sndspeed 1
	transpose 24
	duty $38
	pitch $39
	volenv $40
	notelen 3
	db E5-24, NRest, C5-24, NRest, E5-24, NRest, C5-24
	db $FF
Pause_Footer:
	sfxsq2 Pause_P2
	db $FF