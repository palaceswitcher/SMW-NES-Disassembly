Powerup_Tri:
	sndspeed 1
	transpose 0
	duty $5B
	pitch $39
	volenv $11
	notelen 2
	db G4, NRest, G4, NRest
	notelen 4
	db G4
	
	notelen 2
	db A4, NRest, A4, NRest
	notelen 4
	db A4

	notelen 2
	db B4, NRest, B4, NRest
	notelen 4
	db B4
	db $FF
Powerup_Footer:
	sfxtri Powerup_Tri
	db $FF