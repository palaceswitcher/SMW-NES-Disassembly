Life_P1:
	sndspeed 1
	transpose 12
	duty $38
	pitch $39
	volenv $40
	notelen 3
	.byte E4, NRest, C5, NRest, E5, NRest, C5, NRest, D5, NRest
	
	notelen 12
	.byte G5
	.byte $FF
Life_Footer:
	sfxsq1 Life_P1
	.byte $FF