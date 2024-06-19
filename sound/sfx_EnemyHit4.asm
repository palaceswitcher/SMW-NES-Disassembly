EnemyHit4_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	db D5-9, D#5-9
	db $FF
EnemyHit4_Footer:
	sfxsq1 EnemyHit4_P1
	db $FF