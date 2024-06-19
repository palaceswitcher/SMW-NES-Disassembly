EnemyHit6_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	db F#5-9, G5-9
	db $FF
EnemyHit6_Footer:
	sfxsq1 EnemyHit6_P1
	db $FF