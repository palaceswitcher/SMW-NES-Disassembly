Feather_P1Noise:
	.byte SongSpeed, 1
	.byte Transpose, 7
	.byte DutySet, $00
	.byte PitchSet, $64
	.byte VolSet, $11
	.byte NLen+44
	.byte G3
	.byte $FF
Feather_Footer:
	.byte $80
	.word Feather_P1Noise
	.byte $FF