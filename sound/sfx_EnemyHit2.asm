EnemyHit2_P1:
	sndspeed 1
	transpose 9
	duty $38
	pitch $39
	volenv $41
	notelen 4
	db B4-9, C5-9
	db $FF
EnemyHit2_Footer:
	sfxsq1 EnemyHit2_P1
	db $FF