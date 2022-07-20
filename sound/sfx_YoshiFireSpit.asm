YoshiFireSpit_Noise:
	.byte $F5
	.byte $03
	.byte Transpose
	.byte C2
	.byte DutySet
	.byte $50
	.byte PitchSet
	.byte $51
	.byte VolSet
	.byte $52
	.byte $8A
	.byte C2
	.byte DutySet
	.byte $12
	.byte PitchSet
	.byte NRest
	.byte VolSet
	.byte $11
	.byte $8F
	.byte C3
	.byte $FF
YoshiFireSpit_Footer:
	.byte NLen+3
	.word YoshiFireSpit_Noise
	.byte $FF