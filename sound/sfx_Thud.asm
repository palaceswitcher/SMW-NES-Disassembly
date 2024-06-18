Thud_P1:
	db $F5
	db $01
	db Transpose
	db NRest
	db DutySet
	db E4
	db PitchSet
	db $39
	db VolSet
	db $41
	db $9C
	db $15
	db $FF
Thud_Footer:
	db $80
	.word Thud_P1
	db $FF