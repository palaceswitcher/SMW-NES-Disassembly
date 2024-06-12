Life_P1:
	.byte SongSpeed, 1
	.byte Transpose, 12
	.byte DutySet, $38
	.byte PitchSet, $05
	.byte VolSet, $7D
	.byte NLen+4, E4
	.byte NLen+5, G4
	.byte NLen+4, E5
	.byte NLen+5, C5
	.byte NLen+4, D5
	.byte NLen+5, G5
	.byte $FF
Life_Footer:
	.byte $80
	.word Life_P1
	.byte $FF