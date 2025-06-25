Beep_P1:
	sndspeed 1
	transpose $09
	duty $38
	pitch $39
	volenv $41
	notelen 2
	.byte F#6-9
	.byte G#6-9
	.byte $FF
Beep_Footer:
	sfxsq1 Beep_P1
	.byte $FF