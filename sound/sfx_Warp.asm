Warp_Noise:
	.byte SongSpeed, 1
	.byte Transpose, 0
	.byte DutySet, 0
	.byte PitchSet, 0
	.byte VolSet, $08
	.byte NLen+2
	.byte $2E
	.byte $2D
	.byte $2C
	.byte $2B
	.byte NLen+10
	.byte $2A
	.byte NLen+2
	.byte $2F
	.byte $2E
	.byte $2D
	.byte NLen+8
	.byte $2C
	.byte NLen+2
	.byte $2E
	.byte $2D
	.byte $2C
	.byte NLen+8
	.byte $2B
	.byte NLen+2
	.byte $2D
	.byte $2C
	.byte $2B
	.byte $2A
	.byte $FF
Warp_Footer:
	.byte $83
	.word Warp_Noise
	.byte $FF
