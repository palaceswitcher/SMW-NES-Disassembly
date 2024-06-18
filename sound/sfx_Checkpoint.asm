Checkpoint_P1:
	sndspeed 1
	transpose 18
	duty $38
	pitch $39
	volenv $40
	notelen 3
	db B5, A5, G5, F5, E5, D5, C5
	db B4, A4, G4, F4, E4, D4, C4
	db $FF
Checkpoint_Footer:
	db $80
	.word Checkpoint_P1
	db $FF