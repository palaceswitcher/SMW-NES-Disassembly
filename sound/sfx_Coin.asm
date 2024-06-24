Coin_P1:
	.byte SongSpeed, 1
	.byte Transpose, $00
	.byte DutySet, $38
	.byte PitchSet, $7A
	.byte VolSet, $7E
	.byte NLen+3
	.byte B5
	.byte NLen+18
	.byte E6
	.byte $FF
Coin_Footer:
	.byte $80
	.word Coin_P1
	.byte $FF