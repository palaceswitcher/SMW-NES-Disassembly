YoshiSwallow_P2:
	.byte SongSpeed, $01
	.byte Transpose, $00
	.byte DutySet, $60
	.byte PitchSet, $63
	.byte VolSet, $61
	.byte NLen+12
	.byte D1
	.byte PitchSet, $64
	.byte C1-3
	.byte $FF
YoshiSwallow_Footer:
	.byte $81
	.word YoshiSwallow_P2
	.byte $FF