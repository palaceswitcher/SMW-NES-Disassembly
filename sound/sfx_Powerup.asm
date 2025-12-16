Powerup_Tri:
	sndspeed 1
	transpose 0
	duty $5B
	pitch $39
	volenv $11
	notelen 2
	.byte G4, NRest, G4, NRest
	notelen 4
	.byte G4
	
	notelen 2
	.byte A4, NRest, A4, NRest
	notelen 4
	.byte A4

	notelen 2
	.byte B4, NRest, B4, NRest
	notelen 4
	.byte B4
	.byte $FF
Powerup_Footer:
	sfxtri Powerup_Tri
	.byte $FF