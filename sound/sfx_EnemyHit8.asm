EnemyHit8_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	db A5-9, A#5-9
	db $FF
EnemyHit8_Footer:
	sfxsq1 EnemyHit8_P1
	db $FF