EnemyHit7_P1:
	.byte Transpose, $0B
	.byte SongJump
	.word EnemyHitTemplate
	.byte $FF
EnemyHit7_Footer:
	.byte $82
	.word EnemyHit7_P1
	.byte $FF