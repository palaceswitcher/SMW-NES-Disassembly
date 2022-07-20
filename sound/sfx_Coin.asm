Coin_P1:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte $07
	.byte DutySet
	.byte $38
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte E5
	.byte NLen+3
	.byte E5
	.byte $86
	.byte $45
	.byte $FF
Coin_Footer:
	.byte $80
	.word Coin_P1
	.byte $FF