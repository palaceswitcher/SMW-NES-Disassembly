YoshiFireSpit_Noise:
	.byte SongSpeed, $03
	.byte Transpose, $18
	.byte DutySet, $50
	.byte PitchSet, $51
	.byte VolSet, $52
	.byte $8A
	.byte C2
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte $8F
	.byte C3
	.byte $FF
YoshiFireSpit_Footer:
	.byte NLen+3
	.word YoshiFireSpit_Noise
	.byte $FF