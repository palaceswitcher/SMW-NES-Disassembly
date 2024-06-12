Powerup_Tri:
	.byte SongSpeed, 1
	.byte Transpose, $0C
	.byte PitchSet, $39
	.byte VolSet, $7f
	.byte NLen+1
	.byte Transpose, $04
	.byte G#4
	.byte NLen+2
	.byte D#4
	.byte G#4
	.byte C5
	.byte D#5
	.byte NLen+1
	.byte G#5
	.byte NLen+2
	.byte D#5
	.byte Transpose, $0C
	.byte G#3
	.byte C4
	.byte D#4
	.byte NLen+1
	.byte G#4
	.byte NLen+2
	.byte D#4
	.byte G#4
	.byte C5
	.byte D#5
	.byte NLen+1
	.byte G#5
	.byte NLen+2
	.byte D#5
	.byte Transpose, $0E
	.byte G#3
	.byte C4
	.byte D#4
	.byte NLen+1
	.byte G#4
	.byte NLen+2
	.byte D#4
	.byte G#4
	.byte C5
	.byte D#5
	.byte NLen+1
	.byte G#5
	.byte NLen+2
	.byte D#5
	.byte $FF
Powerup_Footer:
	.byte $82
	.word Powerup_Tri
	.byte $FF