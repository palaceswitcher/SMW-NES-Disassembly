YoshiSwallow_P2:
	db $F5
	db $01
	db Transpose
	db $0D
	db DutySet
	db $60
	db PitchSet
	db $5E
	db VolSet
	db $61
	notelen 12
	db C2
	db $0C
	db $FF
YoshiSwallow_Footer:
	db $81
	.word YoshiSwallow_P2
	db $FF