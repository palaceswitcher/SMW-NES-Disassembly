YoshiCoin_P1:
	.byte SongSpeed, 1
	.byte Transpose, 7
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $41
	.byte NLen+3, B5, B5
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte B5, B5, B5, B5
	.byte $FF
YoshiCoin_Footer:
	.byte $80
	.word YoshiCoin_P1
	.byte $FF