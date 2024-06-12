EnemyHit6_P1:
	.byte Transpose, $09
	.byte SongJump
	.word EnemyHitTemplate
	.byte $FF
EnemyHit6_Footer:
	.byte $82
	.word EnemyHit6_P1
	.byte $FF