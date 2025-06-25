EnemyHit8_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	.byte A5-9, A#5-9
	.byte $FF
EnemyHit8_Footer:
	sfxsq1 EnemyHit8_P1
	.byte $FF