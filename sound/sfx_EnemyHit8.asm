EnemyHit8_P1:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte $09
	.byte DutySet
	.byte $38
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $41
	.byte $84
	.byte C5
	.byte $3D
	.byte $FF
EnemyHit8_Footer:
	.byte $80
	.word EnemyHit8_P1
	.byte $FF