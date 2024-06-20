Spring_P1:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte PitchSet, $74
	.byte DutySet, $7B
	.byte VolSet, $75
	.byte NLen+39
	.byte C#3
	.byte $FF
Spring_Footer:
	.byte $80
	.word Spring_P1
	.byte $FF