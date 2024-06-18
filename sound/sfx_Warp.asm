Warp_Tri:
	sndspeed 1
	transpose 24
	duty $38
	pitch $63
	volenv $11
	notelen 3
	db G4, NRest, G4, NRest, G4, NRest
	db A4, NRest, A4, NRest, A4, NRest
	db B4, NRest, B4, NRest, B4, NRest
	db $FF
Warp_Footer:
	db $82
	.word Warp_Tri
	db $FF