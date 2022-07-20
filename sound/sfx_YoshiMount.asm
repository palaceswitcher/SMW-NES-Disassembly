YoshiMount_P1:
	.byte SongSpeed, 1
	.byte Transpose, 7
	.byte DutySet, $00
	.byte PitchSet, $63
	.byte VolSet, $11
	.byte NLen+14
	.byte G3
	.byte DutySet, $00
	.byte PitchSet, $64
	.byte VolSet, $11
	.byte C3
	.byte $FF
YoshiMount_P2:
	.byte Transpose, 7
	.byte DutySet, $34
	.byte PitchSet, $39
	.byte VolSet, $41
	.byte NLen+3
	.byte A1
	.byte NLen+10
	.byte NRest
	.byte NLen+3
	.byte A1
	.byte $FF
YoshiMount_Noise:
	.byte Transpose, 7
	.byte DutySet, $5B
	.byte PitchSet, $39
	.byte VolSet, $11
	.byte NLen+14
	.byte G3, C3
	.byte $FF
YoshiMount_Footer:
	.byte $80
	.word YoshiMount_P1
	.byte $81
	.word YoshiMount_P2
	.byte $83
	.word YoshiMount_Noise
	.byte $FF