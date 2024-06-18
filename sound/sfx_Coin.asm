Coin_P1:
	db $F5
	db $01
	db Transpose
	db $07
	db DutySet
	db $38
	db PitchSet
	db $39
	db VolSet
	db E5
	notelen 3
	db E5
	db $86
	db $45
	db $FF
Coin_Footer:
	db $80
	.word Coin_P1
	db $FF