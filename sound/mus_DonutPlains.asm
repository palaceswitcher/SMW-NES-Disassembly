DonutPlains_P1:
DonutPlains_P1Loop:
	.byte SongSpeed, $01
	.byte Transpose, $0C
	.byte DutySet, $07
	.byte PitchSet, $39
	.byte VolSet, $11
	.byte SegCall
	.word DonutPlains_P1Sub
	.byte NLen+8
	.byte C4
	.byte NLen+43
	.byte NRest
	.byte NLen+25
	.byte E3
	.byte NLen+26
	.byte D3
	.byte SegCall
	.word DonutPlains_P1Sub
	.byte NLen+102
	.byte NRest
	.byte SongJump
	.word DonutPlains_P1Loop
	.byte $FF
DonutPlains_P1Sub:
	.byte NLen+25
	.byte NRest
	.byte NLen+9
	.byte B3
	.byte NLen+8
	.byte NRest
	.byte NLen+9
	.byte B3
	.byte NLen+25
	.byte NRest
	.byte NLen+26
	.byte A3
	.byte NLen+25
	.byte NRest
	.byte NLen+9
	.byte C4
	.byte NLen+8
	.byte NRest
	.byte NLen+9
	.byte C4
	.byte NLen+25
	.byte NRest
	.byte NLen+26
	.byte B3
	.byte NLen+25
	.byte NRest
	.byte NLen+9
	.byte B3
	.byte NLen+8
	.byte NRest
	.byte NLen+9
	.byte B3
	.byte NLen+25
	.byte NRest
	.byte NLen+26
	.byte A3
	.byte SegEnd
DonutPlains_P2:
DonutPlains_P2Loop:
	.byte Transpose, $0C
	.byte DutySet, $07
	.byte PitchSet, $39
	.byte VolSet, $11
	.byte SegCall
	.word DonutPlains_P2Sub
	.byte NLen+8
	.byte F3
	.byte NLen+9
	.byte NRest
	.byte NLen+8
	.byte A3
	.byte NLen+9
	.byte NRest
	.byte NLen+8
	.byte F3
	.byte NLen+9
	.byte NRest
	.byte NLen+42
	.byte F2
	.byte NLen+9
	.byte NRest
	.byte SegCall
	.word DonutPlains_P2Sub
	.byte NLen+8
	.byte D3
	.byte NLen+9
	.byte NRest
	.byte NLen+8
	.byte E3
	.byte NLen+9
	.byte F3
	.byte NLen+8
	.byte NRest
	.byte NLen+9
	.byte G3
	.byte NLen+51
	.byte NRest
	.byte SongJump
	.word DonutPlains_P2Loop
	.byte $FF
DonutPlains_P2Sub:
	.byte NLen+17
	.byte NRest
	.byte NLen+8
	.byte C3
	.byte NLen+9
	.byte E3
	.byte NLen+8
	.byte C3
	.byte NLen+9
	.byte E3
	.byte NLen+25
	.byte NRest
	.byte NLen+26
	.byte C3
	.byte NLen+17
	.byte NRest
	.byte NLen+8
	.byte D3
	.byte NLen+9
	.byte F3
	.byte NLen+8
	.byte D3
	.byte NLen+9
	.byte F3
	.byte NLen+25
	.byte NRest
	.byte NLen+26
	.byte D3
	.byte NLen+17
	.byte NRest
	.byte NLen+8
	.byte C3
	.byte NLen+9
	.byte E3
	.byte NLen+8
	.byte C3
	.byte NLen+9
	.byte E3
	.byte NLen+25
	.byte NRest
	.byte NLen+26
	.byte C3
	.byte SegEnd
DonutPlains_Tri:
DonutPlains_TriLoop:
	.byte Transpose, $00
	.byte DutySet, $07
	.byte PitchSet, $05
	.byte VolSet, $02
	.byte SegCall
	.word DonutPlains_TriSub1
	.byte NLen+25
	.byte D3
	.byte NLen+26
	.byte NRest
	.byte NLen+51
	.byte C#3
	.byte SegCall
	.word DonutPlains_TriSub1
	.byte NLen+68
	.byte NRest
	.byte Transpose, $18
	.byte NLen+2
	.byte G4
	.byte NRest
	.byte A4
	.byte NRest
	.byte NLen+9
	.byte G4
	.byte NLen+17
	.byte NRest
	.byte SongJump
	.word DonutPlains_TriLoop
	.byte $FF
DonutPlains_TriSub1:
	.byte NLen+8
	.byte C3
	.byte NLen+17
	.byte NRest
	.byte NLen+9
	.byte C4
	.byte NLen+17
	.byte NRest
	.byte NLen+8
	.byte A2
	.byte NLen+17
	.byte NRest
	.byte NLen+9
	.byte A3
	.byte NLen+17
	.byte NRest
	.byte NLen+8
	.byte D3
	.byte NLen+17
	.byte NRest
	.byte NLen+9
	.byte D4
	.byte NLen+17
	.byte NRest
	.byte NLen+8
	.byte G2
	.byte NLen+17
	.byte NRest
	.byte NLen+9
	.byte G3
	.byte NLen+17
	.byte NRest
	.byte NLen+8
	.byte C3
	.byte NLen+17
	.byte NRest
	.byte NLen+9
	.byte C4
	.byte NLen+17
	.byte NRest
	.byte NLen+8
	.byte A2
	.byte NLen+17
	.byte NRest
	.byte NLen+9
	.byte A3
	.byte NLen+17
	.byte NRest
	.byte SegEnd
DonutPlains_Noise:
	.byte Transpose, $00
	.byte DutySet, $00
	.byte PitchSet, 0
	.byte VolSet, $77
DonutPlains_NoiseLoop:
	.byte SongLoop,6
	.byte NLen+17
	.byte $01
	.byte NLen+8
	.byte $01
	.byte NLen+26
	.byte $03
	.byte SongLoopEnd
	.byte NLen+25
	.byte $03
	.byte NLen+8
	.byte $01
	.byte NLen+9
	.byte $01
	.byte $01
	.byte NLen+25
	.byte $03
	.byte NLen+26
	.byte $01
	.byte SongJump
	.word DonutPlains_NoiseLoop
	.byte $FF
DonutPlains_End:
	.byte $FF
DonutPlains_Footer:
	.byte NRest
	.word DonutPlains_P1
	.byte $01
	.word DonutPlains_P2
	.byte $02
	.word DonutPlains_Tri
	.byte $03
	.word DonutPlains_Noise
	.byte $04
	.word DonutPlains_End
	.byte $FF