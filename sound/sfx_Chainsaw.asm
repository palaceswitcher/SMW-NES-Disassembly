Chainsaw_Noise:
	.byte $F5
	.byte $03
	.byte Transpose
	.byte $01
	.byte DutySet
	.byte $38
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $41
	.byte $45
	.byte $FF
Chainsaw_Footer:
	.byte NLen+3
	.word Chainsaw_Noise
	.byte $FF