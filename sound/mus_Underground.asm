Underground_P1:
	.byte SongSpeed, 1
	.byte Transpose, $05
	.byte DutySet, $07
	.byte PitchSet, $39
	.byte VolSet, $11
	.byte NLen+24
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
	.byte NRest
	.byte NRest
Underground_P1Loop:
	.byte NLen+24
	.byte NRest
	.byte $27
	.byte $A4
	.byte C3
	.byte NLen+12
	.byte G2
	.byte A2
	.byte $C8
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NLen+24
	.byte NRest
	.byte G2
	.byte NLen+12
	.byte C3
	.byte $A4
	.byte $2B
	.byte NLen+48
	.byte $27
	.byte NLen+24
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
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $27
	.byte $A4
	.byte C3
	.byte NLen+12
	.byte G2
	.byte A2
	.byte $C8
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NLen+24
	.byte NRest
	.byte G2
	.byte NLen+12
	.byte C3
	.byte $A4
	.byte $2B
	.byte NLen+48
	.byte $27
	.byte NLen+24
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
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $27
	.byte $A4
	.byte C3
	.byte NLen+12
	.byte G2
	.byte NLen+24
	.byte $27
	.byte $C8
	.byte C3
	.byte NLen+12
	.byte D3
	.byte B2
	.byte G2
	.byte NLen+24
	.byte $27
	.byte $E0
	.byte D3
	.byte $A4
	.byte NRest
	.byte NLen+24
	.byte NRest
	.byte $27
	.byte $A4
	.byte C3
	.byte NLen+12
	.byte G2
	.byte NLen+24
	.byte $27
	.byte $C8
	.byte C3
	.byte NLen+12
	.byte D3
	.byte B2
	.byte G2
	.byte NLen+24
	.byte $27
	.byte $E0
	.byte D3
	.byte $A4
	.byte NRest
	.byte $F4
	.word Underground_P1Loop
	.byte $FF
Underground_Tri:
Underground_TriLoop:
	.byte Transpose, $05
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte $86
	.byte A2
	.byte NRest
	.byte C3
	.byte NRest
	.byte $22
	.byte NRest
	.byte D3
	.byte NRest
	.byte A2
	.byte NRest
	.byte C3
	.byte NRest
	.byte G2
	.byte NRest
	.byte $20
	.byte NRest
	.byte $F4
	.word Underground_TriLoop
	.byte $FF
Underground_Noise:
Underground_NoiseLoop:
	.byte Transpose, $01
	.byte DutySet, $00
	.byte PitchSet, $00
	.byte VolSet, $53
	.byte NLen+12
	.byte B3
	.byte $F4
	.word Underground_NoiseLoop
	.byte $FF
Underground_End:
	.byte $FF
Underground_Footer:
	.byte NRest
	.word Underground_P1
	.byte $01
	.word Underground_End
	.byte $02
	.word Underground_Tri
	.byte $03
	.word Underground_Noise
	.byte $04
	.word Underground_End
	.byte $FF