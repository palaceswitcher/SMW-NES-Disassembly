YoshiFireSpit_Noise:
	.byte SongSpeed, 1
	.byte Transpose, $18
	.byte DutySet, 0
	.byte PitchSet, $51
	.byte VolSet, $52
	.byte NLen+30
	.byte C2
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+45
	.byte C3
YoshiFireSpit_End:
	.byte $FF
YoshiFireSpit_Footer:
	.byte NLen+3
	.word YoshiFireSpit_Noise
	.byte $FF