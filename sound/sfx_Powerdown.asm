Powerdown_P1Noise:
	.byte SongSpeed, $01
	.byte Transpose, $07
	.byte DutySet, $00
	.byte PitchSet, $64
	.byte VolSet, $11
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