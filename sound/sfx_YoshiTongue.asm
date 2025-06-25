YoshiTongue_P1:
	sndspeed 1
	transpose 9
	duty $12
	pitch 0
	volenv $13
	notelen 8
	.byte NRest
	
	notelen 4
	.byte G5-9

	duty $38
	pitch $39
	volenv $41
	notelen 16
	.byte F#6-9
	.byte $FF
YoshiTongue_Footer:
	sfxsq1 YoshiTongue_P1
	.byte $FF