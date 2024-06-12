Jump_P1:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte DutySet, $38
	.byte PitchSet, $7C
	.byte VolSet, $11
	.byte NLen+8, D5
	.byte $FF	;End
Jump_Footer:
	.byte $82
	.word Jump_P1
	.byte $FF