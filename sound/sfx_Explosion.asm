Explosion_Noise:
	.byte SongSpeed, 1
	.byte Transpose, $01
	.byte DutySet, $34
	.byte PitchSet, $39
	.byte VolSet, $46
	.byte NLen+72
	.byte A3
	.byte $FF
Explosion_Footer:
	.byte NLen+3
	.word Explosion_Noise
	.byte $FF