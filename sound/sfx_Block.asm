Block_Tri:
	.byte SongSpeed, 1
	.byte Transpose, $00
	.byte DutySet, $07
	.byte PitchSet, $39
	.byte VolSet, $7f
	.byte NLen+2
	.byte D#4
	.byte NLen+1
	.byte A#4
	.byte NRest
	.byte B4
	.byte E4
	.byte NRest
	.byte B4
	.byte NRest
	.byte C5
	.byte F4
	.byte NRest
	.byte C5
	.byte C#5
	.byte NRest
	.byte F#4
	.byte NRest
	.byte C#5
	.byte D5
	.byte NRest
	.byte G4
	.byte D5
	.byte NRest
	.byte D#5
	.byte $FF
Block_Footer:
	.byte $82
	.word Block_Tri
	.byte $FF