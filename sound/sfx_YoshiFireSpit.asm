YoshiFireSpit_Noise:
	db $F5
	db $03
	db Transpose
	db C2
	db DutySet
	db $50
	db PitchSet
	db $51
	db VolSet
	db $52
	db $8A
	db C2
	db DutySet
	db $12
	db PitchSet
	db NRest
	db VolSet
	db $11
	db $8F
	db C3
	db $FF
YoshiFireSpit_Footer:
	notelen 3
	.word YoshiFireSpit_Noise
	db $FF