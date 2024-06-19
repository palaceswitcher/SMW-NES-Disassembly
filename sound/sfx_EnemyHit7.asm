EnemyHit7_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	db G#5-9, A5-9
	db $FF
EnemyHit7_Footer:
	sfxsq1 EnemyHit7_P1
	db $FF