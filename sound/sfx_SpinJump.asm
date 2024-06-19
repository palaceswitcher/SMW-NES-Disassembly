SpinJump_P1:
	sndspeed 1
	transpose 0
	duty $38
	pitch $39
	volenv $40
	notelen 2
	db E3, NRest, A4, NRest, G#4, NRest, A4
	db $FF
SpinJump_P2:
	transpose 0
	duty $38
	pitch $39
	volenv $40
	notelen 4
	db NRest

	notelen 2
	db E3, NRest, A4, NRest, G#4, NRest, A4
	db $FF
SpinJump_Footer:
	sfxsq1 SpinJump_P1
	sfxsq2 SpinJump_P2
	db $FF