SpinJump_P1:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte PitchSet, $39
	.byte VolSet, $7F
	.byte NLen+1
	.byte D5
	.byte NLen+5
	.byte D#5
	.byte NLen+2
	.byte F5
	.byte F#5
	.byte NLen+1
	.byte G5
	.byte NLen+2
	.byte G#5
	.byte F5
	.byte NLen+1
	.byte F#5
	.byte NLen+2
	.byte G5
	.byte G#5
	.byte NLen+1
	.byte F5
	.byte NLen+2
	.byte F#5
	.byte G5
	.byte NLen+1
	.byte G#5
	.byte $FF
SpinJump_Footer:
	.byte $82
	.word SpinJump_P1
	.byte $FF