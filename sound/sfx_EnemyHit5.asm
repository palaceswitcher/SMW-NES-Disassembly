EnemyHit5_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	.byte E5-9, F5-9
	.byte $FF
EnemyHit5_Footer:
	sfxsq1 EnemyHit5_P1
	.byte $FF