Jump_P1:
	sndspeed 1
	transpose 0
	duty $38
	pitch $63
	volenv $11
	notelen 8
	db A3
	db $FF
Jump_Footer:
	sfxsq1 Jump_P1
	db $FF