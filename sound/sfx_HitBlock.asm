HitBlock_Noise:
	.byte SongSpeed, $01
	.byte Transpose, 0
	.byte DutySet, 0
	.byte PitchSet, $05
	.byte VolSet, $52
	.byte NLen+2
	.byte $3E
	.byte $28
	.byte $ff
HitBlock_Footer:
	.byte $83
	.word HitBlock_Noise
	.byte $ff