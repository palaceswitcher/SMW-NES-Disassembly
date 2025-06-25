Warp_Tri:
	sndspeed 1
	transpose 24
	duty $38
	pitch $63
	volenv $11
	notelen 3
	.byte G6-24, NRest, G6-24, NRest, G6-24, NRest
	.byte A6-24, NRest, A6-24, NRest, A6-24, NRest
	.byte B6-24, NRest, B6-24, NRest, B6-24, NRest
	.byte $FF
Warp_Footer:
	sfxtri Warp_Tri
	.byte $FF