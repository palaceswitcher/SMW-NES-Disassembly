Explosion_Noise:
	.byte $F5
	.byte $03
	.byte Transpose
	.byte $01
	.byte DutySet
	.byte E4
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $46
	.byte NLen+24
	.byte A3
	.byte $FF
Explosion_Footer:
	.byte NLen+3
	.word Explosion_Noise
	.byte $FF