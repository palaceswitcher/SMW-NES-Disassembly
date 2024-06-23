Thwomp_Noise:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte PitchSet, $00
	.byte DutySet, $00
	.byte VolSet, $52
	.byte NLen+2
	.byte $2E
	.byte NLen+3
	.byte NRest
	.byte NLen+4
	.byte $2D
	.byte $2E
	.byte $FF
Thwomp_Footer:
	.byte $83
	.word Thwomp_Noise
	.byte $FF