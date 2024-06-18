Pause_P2:
	sndspeed 1
	transpose 24
	duty $38
	pitch $39
	volenv $40
	notelen 3
	db E3, NRest, C3, NRest, E3, NRest, C3
	db $FF
Pause_Footer:
	db $81
	.word Pause_P2
	db $FF