Thud_P1:
	sndspeed 1
	transpose 0
	duty $34
	pitch $39
	volenv $41
	notelen 28
	.byte A1
	.byte $FF
Thud_Footer:
	sfxsq1 Thud_P1
	.byte $FF