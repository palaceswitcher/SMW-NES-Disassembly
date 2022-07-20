Swim_Tri:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte DutySet, $38
	.byte PitchSet, $63
	.byte VolSet, $11
	.byte NLen+4, C4
	.byte NLen+8, D5
	.byte $FF
Swim_Footer:
	.byte $82
	.word Swim_Tri
	.byte $FF