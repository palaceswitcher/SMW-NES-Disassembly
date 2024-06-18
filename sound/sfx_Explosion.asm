Explosion_Noise:
	db $F5
	db $03
	db Transpose
	db $01
	db DutySet
	db E4
	db PitchSet
	db $39
	db VolSet
	db $46
	notelen 24
	db A3
	db $FF
Explosion_Footer:
	notelen 3
	.word Explosion_Noise
	db $FF