EnemyHit5_P1:
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
	.byte G4
	.byte $38
	.byte $FF
EnemyHit5_Footer:
	.byte $80
	.word EnemyHit5_P1
	.byte $FF