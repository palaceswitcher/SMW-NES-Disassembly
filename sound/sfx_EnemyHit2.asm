EnemyHit2_P1:
	.byte Transpose, $02
	.byte SongJump
	.word EnemyHitTemplate
	.byte $FF
EnemyHit2_Footer:
	.byte $82
	.word EnemyHit2_P1
	.byte $FF