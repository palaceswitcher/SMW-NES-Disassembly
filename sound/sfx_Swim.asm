Swim_Tri:
	sndspeed 1
	transpose 0
	duty $38
	pitch $63
	volenv $11
	notelen 4
	.byte C4

	notelen 8
	.byte D5
	.byte $FF
Swim_Footer:
	sfxtri Swim_Tri
	.byte $FF