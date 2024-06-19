Switch_P1:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte DutySet, $38
	.byte PitchSet, $05
	.byte VolSet, $29
	.byte NLen+1
	.byte SongLoop,3
	.byte D5
	.byte C6
	.byte B6
	.byte B6
	.byte NRest
	.byte SongLoopEnd
	.byte $FF
Switch_Footer:
	.byte $80
	.word Switch_P1
	.byte $ff