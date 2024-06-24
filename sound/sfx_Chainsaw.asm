Chainsaw_Noise:
	.byte SongSpeed, 1
	.byte Transpose, $01
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $41
	.byte NLen+3
	.byte $45
	.byte $FF
Chainsaw_Footer:
	.byte NLen+3
	.word Chainsaw_Noise
	.byte $FF