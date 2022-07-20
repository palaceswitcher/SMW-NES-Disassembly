Powerdown_P1Noise:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte $07
	.byte DutySet
	.byte NRest
	.byte PitchSet
	.byte $64
	.byte VolSet
	.byte $11
	.byte $85
	.byte G2
	.byte NRest
	.byte G2
	.byte NRest
	.byte $8B
	.byte G2
	.byte $FF
Powerdown_Footer:
	.byte $80
	.word Powerdown_P1Noise
	.byte NLen+3
	.word Powerdown_P1Noise
	.byte $FF