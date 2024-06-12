EnemyHit5_P1:
	.byte Transpose, $07
	.byte SongJump
	.word EnemyHitTemplate
	.byte $FF
EnemyHit5_Footer:
	.byte $82
	.word EnemyHit5_P1
	.byte $FF