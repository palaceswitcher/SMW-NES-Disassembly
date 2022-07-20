Life_P1:
	.byte SongSpeed, 1
	.byte Transpose, 12
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+3, E4, NRest, C5, NRest, E5, NRest, C5, NRest, D5, NRest
	.byte NLen+12, G5
	.byte $FF
Life_Footer:
	.byte $80
	.word Life_P1
	.byte $FF