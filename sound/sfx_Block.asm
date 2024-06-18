Block_Tri:
	sndspeed 1
	transpose 0
	duty $5B
	pitch $39
	volenv $11
	notelen 3
	db G3
	db NRest
	db A3
	db NRest
	db B3
	db NRest
	db $FF
Block_Footer:
	sfxtri Block_Tri
	db $FF