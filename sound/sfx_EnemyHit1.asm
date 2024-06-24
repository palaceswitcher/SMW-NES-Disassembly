EnemyHit1_P1:
	.byte Transpose, $00
EnemyHitTemplate:
	.byte SongSpeed, 1
	.byte DutySet, $00
	.byte PitchSet, $05
	.byte VolSet, $11
	.byte NLen+2
	.byte A#4
	.byte NRest
	.byte F5
	.byte $FF
EnemyHit1_Footer:
	.byte $82
	.word EnemyHit1_P1
	.byte $FF