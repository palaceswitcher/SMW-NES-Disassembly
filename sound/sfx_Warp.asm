Warp_Tri:
	.byte SongSpeed, 1
	.byte Transpose, 24
	.byte DutySet, $38
	.byte PitchSet, $63
	.byte VolSet, $11
	.byte NLen+3
	.byte G4, NRest, G4, NRest, G4, NRest
	.byte A4, NRest, A4, NRest, A4, NRest
	.byte B4, NRest, B4, NRest, B4, NRest
	.byte $FF
Warp_Footer:
	.byte $82
	.word Warp_Tri
	.byte $FF