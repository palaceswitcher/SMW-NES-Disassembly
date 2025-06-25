EnemyHit2_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	.byte B4-9, C5-9
	.byte $FF
EnemyHit2_Footer:
	sfxsq1 EnemyHit2_P1
	.byte $FF