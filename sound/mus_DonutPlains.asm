DonutPlains_P1:
DonutPlains_P1Loop:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte C2
	.byte DutySet
	.byte $5B
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $11
	.byte NLen+12
	.byte NRest
	.byte $86
	.byte NRest
	.byte C3
	.byte B3
	.byte A3
	.byte NLen+12
	.byte B3
	.byte A3
	.byte NRest
	.byte NLen+24
	.byte A3
	.byte NLen+12
	.byte NRest
	.byte $86
	.byte NRest
	.byte C3
	.byte C4
	.byte A3
	.byte NLen+12
	.byte C4
	.byte B3
	.byte NRest
	.byte NLen+24
	.byte B3
	.byte NLen+12
	.byte NRest
	.byte $86
	.byte NRest
	.byte C3
	.byte B3
	.byte A3
	.byte NLen+12
	.byte B3
	.byte A3
	.byte NRest
	.byte NLen+24
	.byte A3
	.byte NLen+12
	.byte C4
	.byte A3
	.byte F3
	.byte NLen+24
	.byte E3
	.byte $86
	.byte NRest
	.byte NLen+24
	.byte D3
	.byte $86
	.byte NRest
	.byte NLen+12
	.byte NRest
	.byte $86
	.byte NRest
	.byte C3
	.byte B3
	.byte A3
	.byte NLen+12
	.byte B3
	.byte A3
	.byte NRest
	.byte NLen+24
	.byte A3
	.byte NLen+12
	.byte NRest
	.byte $86
	.byte NRest
	.byte C3
	.byte C4
	.byte A3
	.byte NLen+12
	.byte C4
	.byte B3
	.byte NRest
	.byte NLen+24
	.byte B3
	.byte NLen+12
	.byte NRest
	.byte $86
	.byte NRest
	.byte C3
	.byte B3
	.byte A3
	.byte NLen+12
	.byte B3
	.byte A3
	.byte NRest
	.byte NLen+24
	.byte A3
	.byte $92
	.byte D3
	.byte $86
	.byte E3
	.byte NLen+12
	.byte F3
	.byte $2B
	.byte Transpose
	.byte $0C
	.byte DutySet
	.byte $07
	.byte PitchSet
	.byte $05
	.byte VolSet
	.byte $03
	.byte $86
	.byte $2B
	.byte A3
	.byte NLen+24
	.byte $2B
	.byte NLen+12
	.byte NRest
	.byte $F4
	.word DonutPlains_P1Loop
	.byte $FF
DonutPlains_P2:
DonutPlains_P2Loop:
	.byte Transpose
	.byte NRest
	.byte DutySet
	.byte $12
	.byte PitchSet
	.byte NRest
	.byte VolSet
	.byte $11
	.byte NLen+24
	.byte C2
	.byte C3
	.byte $15
	.byte A2
	.byte $1A
	.byte D3
	.byte $13
	.byte G2
	.byte C2
	.byte C3
	.byte $15
	.byte A2
	.byte NLen+12
	.byte $20
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NLen+48
	.byte G2
	.byte NLen+24
	.byte C2
	.byte C3
	.byte $15
	.byte A2
	.byte $1A
	.byte D3
	.byte $13
	.byte G2
	.byte C2
	.byte C3
	.byte NLen+12
	.byte $15
	.byte NRest
	.byte NLen+24
	.byte A2
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $F4
	.word DonutPlains_P2Loop
	.byte $FF
DonutPlains_Unused:
DonutPlains_UnusedLoop:
	.byte Transpose
	.byte $0C
	.byte DutySet
	.byte $07
	.byte PitchSet
	.byte $05
	.byte VolSet
	.byte $03
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte $86
	.byte B3
	.byte $92
	.byte B3
	.byte NLen+48
	.byte A3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte $86
	.byte C4
	.byte $92
	.byte C4
	.byte NLen+48
	.byte B3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte $86
	.byte B3
	.byte $92
	.byte B3
	.byte NLen+48
	.byte A3
	.byte E3
	.byte D3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte $86
	.byte B3
	.byte $92
	.byte B3
	.byte NLen+48
	.byte A3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte $86
	.byte C4
	.byte $92
	.byte C4
	.byte NLen+48
	.byte B3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte $86
	.byte B3
	.byte $92
	.byte B3
	.byte NLen+48
	.byte A3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $F4
	.word DonutPlains_UnusedLoop
	.byte $FF
DonutPlains_End:
	.byte $FF
DonutPlains_Footer:
	.byte NRest
	.word DonutPlains_P1
	.byte $01
	.word DonutPlains_P2
	.byte $02
	.word DonutPlains_End
	.byte $03
	.word DonutPlains_End
	.byte $04
	.word DonutPlains_End
	.byte $FF