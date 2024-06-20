DryBones_Tri:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte PitchSet, $0F
	.byte VolSet, $76
	.byte NLen+6
	.byte C6
	.byte A#5
	.byte NLen+5
	.byte G#5
	.byte NLen+4
	.byte F#5
	.byte NLen+3
	.byte E5
	.byte NLen+2
	.byte D5
	.byte $FF
DryBones_Footer:
	.byte $82
	.word DryBones_Tri
	.byte $ff