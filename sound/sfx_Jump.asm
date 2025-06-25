Jump_P1:
	sndspeed 1
	transpose 0
	duty $38
	pitch $63
	volenv $11
	notelen 8
	.byte A3
	.byte $FF
Jump_Footer:
	sfxsq1 Jump_P1
	.byte $FF