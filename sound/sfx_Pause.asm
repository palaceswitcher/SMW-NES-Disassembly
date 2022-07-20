Pause_P2:
	.byte SongSpeed, 1
	.byte Transpose, 24
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+3, E3, NRest, C3, NRest, E3, NRest, C3
	.byte $FF
Pause_Footer:
	.byte $81
	.word Pause_P2
	.byte $FF