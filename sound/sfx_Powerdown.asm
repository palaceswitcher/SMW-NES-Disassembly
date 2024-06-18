Powerdown_P1Noise:
	db $F5
	db $01
	db Transpose
	db $07
	db DutySet
	db NRest
	db PitchSet
	db $64
	db VolSet
	db $11
	db $85
	db G2
	db NRest
	db G2
	db NRest
	db $8B
	db G2
	db $FF
Powerdown_Footer:
	db $80
	.word Powerdown_P1Noise
	notelen 3
	.word Powerdown_P1Noise
	db $FF