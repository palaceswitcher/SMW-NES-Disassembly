YoshiSwallow_P2:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte $0D
	.byte DutySet
	.byte $60
	.byte PitchSet
	.byte $5E
	.byte VolSet
	.byte $61
	.byte NLen+12
	.byte C2
	.byte $0C
	.byte $FF
YoshiSwallow_Footer:
	.byte $81
	.word YoshiSwallow_P2
	.byte $FF