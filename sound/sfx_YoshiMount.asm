YoshiMount_P1:
	sndspeed 1
	transpose 7
	duty $00
	pitch $63
	volenv $11
	notelen 14
	db G3
	duty $00
	pitch $64
	volenv $11
	db C3
	db $FF
YoshiMount_P2:
	transpose 7
	duty $34
	pitch $39
	volenv $41
	notelen 3
	db A1
	notelen 10
	db NRest
	notelen 3
	db A1
	db $FF
YoshiMount_Noise:
	transpose 7
	duty $5B
	pitch $39
	volenv $11
	notelen 14
	db G3, C3
	db $FF
YoshiMount_Footer:
	db $80
	.word YoshiMount_P1
	db $81
	.word YoshiMount_P2
	db $83
	.word YoshiMount_Noise
	db $FF