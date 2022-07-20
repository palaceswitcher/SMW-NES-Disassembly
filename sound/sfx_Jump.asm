Jump_P1:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte DutySet, $38
	.byte PitchSet, $63
	.byte VolSet, $11
	.byte NLen+8, A3
	.byte $FF	;End
Jump_Footer:
	.byte $80
	.word Jump_P1
	.byte $FF