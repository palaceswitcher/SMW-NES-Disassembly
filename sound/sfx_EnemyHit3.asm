EnemyHit3_P1:
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
	.byte E4
	.byte F4
	.byte $FF
EnemyHit3_Footer:
	.byte $80
	.word EnemyHit3_P1
	.byte $FF