Swim_Tri:
	sndspeed 1
	transpose 0
	duty $38
	pitch $63
	volenv $11
	notelen 4
	db C4
	notelen 8
	db D5
	db $FF
Swim_Footer:
	db $82
	.word Swim_Tri
	db $FF