EnemyHit3_P1:
	.byte Transpose, $04
	.byte SongJump
	.word EnemyHitTemplate
	.byte $FF
EnemyHit3_Footer:
	.byte $82
	.word EnemyHit3_P1
	.byte $FF