EnemyHit8_P1:
	.byte Transpose, $0C
	.byte SongJump
	.word EnemyHitTemplate
	.byte $FF
EnemyHit8_Footer:
	.byte $82
	.word EnemyHit8_P1
	.byte $FF