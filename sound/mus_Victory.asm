Victory_P1:
	.byte SongSpeed, $01
	.byte Transpose, $05
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+24
	.byte C4
	.byte C4
	.byte NLen+12
	.byte A3
	.byte NLen+24
	.byte C4
	.byte NLen+12
	.byte A3
	.byte C4
	.byte A3
	.byte $2B
	.byte NLen+48
	.byte C4
	.byte NLen+12
	.byte A3
	.byte G4
	.byte $39
	.byte G4
	.byte $39
	.byte $92
	.byte G4
	.byte $86
	.byte $2B
	.byte F4
	.byte E4
	.byte NLen+12
	.byte D4
	.byte NLen+48
	.byte C4
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $FF
Victory_P2:
	.byte Transpose, $05
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+24
	.byte C3
	.byte C3
	.byte B2
	.byte B2
	.byte $22
	.byte $22
	.byte A2
	.byte A2
	.byte NLen+12
	.byte C3
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte G2
	.byte A2
	.byte B2
	.byte NLen+24
	.byte C3
	.byte G2
	.byte NLen+48
	.byte C2
	.byte $FF
Victory_Tri:
	.byte Transpose, $05
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+24
	.byte C3
	.byte C3
	.byte B2
	.byte B2
	.byte A2
	.byte A2
	.byte G2
	.byte G2
	.byte NLen+12
	.byte C3
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte G2
	.byte A2
	.byte B2
	.byte NLen+24
	.byte C3
	.byte G2
	.byte NLen+48
	.byte C3
	.byte $FF
Victory_Noise:
	.byte Transpose, $00
	.byte DutySet, $00
	.byte PitchSet
	.byte $00
	.byte VolSet, $53
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $86
	.byte D3
	.byte D3
	.byte NLen+12
	.byte F3
	.byte $86
	.byte C3
	.byte C3
	.byte C3
	.byte C3
	.byte C3
	.byte C3
	.byte C3
	.byte C3
	.byte D3
	.byte D3
	.byte D3
	.byte D3
	.byte D3
	.byte D3
	.byte D3
	.byte D3
	.byte F3
	.byte F3
	.byte NLen+12
	.byte F3
	.byte NRest
	.byte $FF
Victory_End:
	.byte $FF
Victory_Footer:
	.byte NRest
	.word Victory_P1
	.byte $01
	.word Victory_P2
	.byte $02
	.word Victory_Tri
	.byte $03
	.word Victory_Noise
	.byte $04
	.word Victory_End
	.byte $FF