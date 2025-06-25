EnemyHit6_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	.byte F#5-9, G5-9
	.byte $FF
EnemyHit6_Footer:
	sfxsq1 EnemyHit6_P1
	.byte $FF