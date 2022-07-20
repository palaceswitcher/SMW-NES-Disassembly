SpinJump_P1:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+2, E3, NRest, A4, NRest, G#4, NRest, A4
	.byte $FF
SpinJump_P2:
	.byte Transpose, 0
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+4, NRest
	.byte NLen+2, E3, NRest, A4, NRest, G#4, NRest, A4
	.byte $FF
SpinJump_Footer:
	.byte $80
	.word SpinJump_P1
	.byte $81
	.word SpinJump_P2
	.byte $FF