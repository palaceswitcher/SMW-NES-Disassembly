EnemyHit3_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	.byte C#5-9, D5-9
	.byte $FF
EnemyHit3_Footer:
	sfxsq1 EnemyHit3_P1
	.byte $FF