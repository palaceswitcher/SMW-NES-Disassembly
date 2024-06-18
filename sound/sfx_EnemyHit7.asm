EnemyHit7_P1:
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
	db B4
	db C5
	db $FF
EnemyHit7_Footer:
	db $80
	.word EnemyHit7_P1
	db $FF