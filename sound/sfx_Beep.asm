Beep_P1:
	sndspeed 1
	transpose $09
	duty $38
	pitch $39
	volenv $41
	notelen 2
	db F#6-9
	db G#6-9
	db $FF
Beep_Footer:
	sfxsq1 Beep_P1
	db $FF