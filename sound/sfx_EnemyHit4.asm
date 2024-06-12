EnemyHit4_P1:
	.byte Transpose, $06
	.byte SongJump
	.word EnemyHitTemplate
	.byte $FF
EnemyHit4_Footer:
	.byte $82
	.word EnemyHit4_P1
	.byte $FF