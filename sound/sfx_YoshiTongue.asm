YoshiTongue_P1:
	sndspeed 1
	transpose 9
	duty $12
	pitch 0
	volenv $13
	notelen 8
	db NRest
	
	notelen 4
	db G5-9

	duty $38
	pitch $39
	volenv $41
	notelen 16
	db F#6-9
	db $FF
YoshiTongue_Footer:
	sfxsq1 YoshiTongue_P1
	db $FF