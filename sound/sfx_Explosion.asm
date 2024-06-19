Explosion_Noise:
	.byte $F5
	.byte $03
	.byte Transpose, $01
	.byte DutySet, $34
	.byte PitchSet, $39
	.byte VolSet, $46
	.byte NLen+24
	.byte A3
	.byte $FF
Explosion_Footer:
	.byte NLen+3
	.word Explosion_Noise
	.byte $FF