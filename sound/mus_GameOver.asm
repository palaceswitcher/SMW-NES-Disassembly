GameOver_P1:
	.byte SongSpeed, $01
	.byte Transpose, $11
	.byte DutySet, $07
	.byte PitchSet, $39
	.byte VolSet, $11
	.byte $D0
	.byte D3
	.byte $A8
	.byte D3
	.byte B2
	.byte B2
	.byte NLen+20
	.byte D3
	.byte E3
	.byte $D0
	.byte D4
	.byte $FF
GameOver_P2:
	.byte Transpose, $11
	.byte DutySet, $07
	.byte PitchSet, $39
	.byte VolSet, $11
	.byte $85
	.byte NRest
	.byte $D0
	.byte E3
	.byte $A8
	.byte E3
	.byte D3
	.byte D3
	.byte NLen+20
	.byte E3
	.byte A3
	.byte $D0
	.byte D4
	.byte $FF
GameOver_End:
	.byte $FF
GameOver_Footer:
	.byte NRest
	.word GameOver_P1
	.byte $01
	.word GameOver_P2
	.byte $02
	.word GameOver_End
	.byte $03
	.word GameOver_End
	.byte $04
	.word GameOver_End
	.byte $FF