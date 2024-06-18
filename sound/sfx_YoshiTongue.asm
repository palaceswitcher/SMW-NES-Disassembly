YoshiTongue_P1:
	db $F5
	db $01
	db Transpose
	db $09
	db DutySet
	db $12
	db PitchSet
	db NRest
	db VolSet
	db $13
	db $88
	db NRest
	db $84
	db $3A
	db DutySet
	db $38
	db PitchSet
	db $39
	db VolSet
	db $41
	db $90
	db $45
	db $FF
YoshiTongue_Footer:
	db $80
	.word YoshiTongue_P1
	db $FF