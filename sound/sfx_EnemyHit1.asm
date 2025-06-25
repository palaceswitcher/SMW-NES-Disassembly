EnemyHit1_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	.byte A4-9, A#4-9
	.byte $FF
EnemyHit1_Footer:
	sfxsq1 EnemyHit1_P1
	.byte $FF