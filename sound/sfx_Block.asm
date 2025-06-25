Block_Tri:
	sndspeed 1
	transpose 0
	duty $5B
	pitch $39
	volenv $11
	notelen 3
	.byte G3
	.byte NRest
	.byte A3
	.byte NRest
	.byte B3
	.byte NRest
	.byte $FF
Block_Footer:
	sfxtri Block_Tri
	.byte $FF