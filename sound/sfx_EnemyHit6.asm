EnemyHit6_P1:
	db $F5
	db $01
	db Transpose
	db $09
	db DutySet
	db $38
	db PitchSet
	db $39
	db VolSet
	db $41
	db $84
	db $39
	db $3A
	db $FF
EnemyHit6_Footer:
	db $80
	.word EnemyHit6_P1
	db $FF