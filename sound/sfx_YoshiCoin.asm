YoshiCoin_P1:
	sndspeed 1
	transpose 7
	duty $38
	pitch $39
	volenv $41
	notelen 3
	db B5, B5
	duty $38
	pitch $39
	volenv $40
	db B5, B5, B5, B5
	db $FF
YoshiCoin_Footer:
	db $80
	.word YoshiCoin_P1
	db $FF