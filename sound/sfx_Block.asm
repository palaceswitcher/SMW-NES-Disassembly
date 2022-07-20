Block_Tri:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte NRest
	.byte DutySet
	.byte $5B
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $11
	.byte NLen+3
	.byte $2B
	.byte NRest
	.byte A3
	.byte NRest
	.byte B3
	.byte NRest
	.byte $FF
Block_Footer:
	.byte $82
	.word Block_Tri
	.byte $FF