Warp_Tri:
	sndspeed 1
	transpose 24
	duty $38
	pitch $63
	volenv $11
	notelen 3
	db G6-24, NRest, G6-24, NRest, G6-24, NRest
	db A6-24, NRest, A6-24, NRest, A6-24, NRest
	db B6-24, NRest, B6-24, NRest, B6-24, NRest
	db $FF
Warp_Footer:
	sfxtri Warp_Tri
	db $FF