YoshiTongue_P1:
	.byte SongSpeed, 1
	.byte Transpose, $18
	.byte DutySet, $07
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+1
	.byte A#3
	.byte NLen+2
	.byte A3
	.byte G#3
	.byte G3
	.byte NLen+1
	.byte NRest
	.byte D4
	.byte NLen+2
	.byte D#4
	.byte E4
	.byte F4
	.byte NLen+1
	.byte F#4
	.byte $FF
YoshiTongue_Footer:
	.byte $82
	.word YoshiTongue_P1
	.byte $FF