FireBall_Tri:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte PitchSet, $39
	.byte VolSet, $7f
	.byte NLen+1
	.byte G#5
	.byte C6
	.byte F#6
	.byte $ff
FireBall_Footer:
	.byte $82
	.word FireBall_Tri
	.byte $ff