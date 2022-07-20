Powerup_Tri:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte DutySet, $5B
	.byte PitchSet, $39
	.byte VolSet, $11
	.byte $82
	.byte G4
	.byte NRest
	.byte G4
	.byte NRest
	.byte $84
	.byte G4
	.byte $82
	.byte A4
	.byte NRest
	.byte A4
	.byte NRest
	.byte $84
	.byte A4
	.byte $82
	.byte B4
	.byte NRest
	.byte B4
	.byte NRest
	.byte $84
	.byte B4
	.byte $FF
Powerup_Footer:
	.byte $82
	.word Powerup_Tri
	.byte $FF