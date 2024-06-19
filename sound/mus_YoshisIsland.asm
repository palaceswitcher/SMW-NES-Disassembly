YoshisIsland_P1:
YoshisIsland_P1Loop:
	.byte SongSpeed, $01
	.byte Transpose, $0C
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+19
	.byte E3
	.byte NLen+7
	.byte E3
	.byte NLen+13
	.byte E3
	.byte G2
	.byte NLen+26
	.byte A2
	.byte G2
	.byte NLen+13
	.byte E3
	.byte E3
	.byte E3
	.byte Transpose, $18
	.byte DutySet, $0E
	.byte PitchSet, $0F
	.byte VolSet, $03
	.byte G3
	.byte NLen+26
	.byte A3
	.byte G3
	.byte Transpose, $0C
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+19
	.byte F3
	.byte NLen+7
	.byte F3
	.byte NLen+13
	.byte F3
	.byte A2
	.byte NLen+26
	.byte B2
	.byte A2
	.byte NLen+13
	.byte F3
	.byte F3
	.byte F3
	.byte Transpose, $18
	.byte DutySet, $0E
	.byte PitchSet, $0F
	.byte VolSet, $03
	.byte A3
	.byte NLen+26
	.byte B3
	.byte A3
	.byte Transpose, $0C
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+19
	.byte E3
	.byte NLen+7
	.byte E3
	.byte NLen+13
	.byte E3
	.byte G2
	.byte NLen+26
	.byte A2
	.byte G2
	.byte Transpose, $06
	.byte DutySet, $12
	.byte PitchSet, 0
	.byte VolSet, $11
	.byte NLen+13
	.byte A#2
	.byte A2
	.byte G#2
	.byte G2
	.byte NLen+52
	.byte F#2
	.byte $F4
	.word YoshisIsland_P1Loop
	.byte $FF
YoshisIsland_P2:
YoshisIsland_P2Loop:
	.byte Transpose, $0C
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+19
	.byte C3
	.byte NLen+7
	.byte C3
	.byte NLen+13
	.byte C3
	.byte E2
	.byte NLen+26
	.byte F2
	.byte E2
	.byte NLen+13
	.byte C3
	.byte C3
	.byte C3
	.byte Transpose, $18
	.byte DutySet, $0E
	.byte PitchSet, $0F
	.byte VolSet, $03
	.byte E3
	.byte NLen+26
	.byte F3
	.byte E3
	.byte Transpose, $0C
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+19
	.byte D3
	.byte NLen+7
	.byte D3
	.byte NLen+13
	.byte D3
	.byte F2
	.byte NLen+26
	.byte G2
	.byte F2
	.byte NLen+13
	.byte D3
	.byte D3
	.byte D3
	.byte Transpose, $18
	.byte DutySet, $0E
	.byte PitchSet, $0F
	.byte VolSet, $03
	.byte F3
	.byte NLen+26
	.byte G3
	.byte F3
	.byte Transpose, $0C
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+19
	.byte C3
	.byte NLen+7
	.byte C3
	.byte NLen+13
	.byte C3
	.byte E2
	.byte NLen+26
	.byte F2
	.byte E2
	.byte Transpose, 0
	.byte DutySet, $12
	.byte PitchSet, 0
	.byte VolSet, $11
	.byte NLen+13
	.byte A#2
	.byte A2
	.byte G#2
	.byte G2
	.byte NLen+52
	.byte F#2
	.byte $F4
	.word YoshisIsland_P2Loop
	.byte $FF
YoshisIsland_Tri:
YoshisIsland_TriLoop:
	.byte Transpose, 0
	.byte DutySet, $12
	.byte PitchSet, 0
	.byte VolSet, $11
	.byte NLen+39
	.byte C3
	.byte NLen+13
	.byte G3
	.byte NLen+26
	.byte C4
	.byte G3
	.byte NLen+6
	.byte C3
	.byte NRest
	.byte NLen+7
	.byte C3
	.byte NRest
	.byte NLen+13
	.byte C3
	.byte NLen+39
	.byte NRest
	.byte NLen+26
	.byte C3
	.byte NLen+39
	.byte D3
	.byte NLen+13
	.byte A3
	.byte NLen+26
	.byte D4
	.byte A3
	.byte NLen+6
	.byte D3
	.byte NRest
	.byte NLen+7
	.byte D3
	.byte NRest
	.byte NLen+13
	.byte D3
	.byte NLen+39
	.byte NRest
	.byte NLen+26
	.byte D3
	.byte NLen+39
	.byte C3
	.byte NLen+13
	.byte G3
	.byte NLen+26
	.byte C4
	.byte G3
	.byte NLen+13
	.byte C3
	.byte B2
	.byte A#2
	.byte A2
	.byte NLen+52
	.byte G#2
	.byte $F4
	.word YoshisIsland_TriLoop
	.byte $FF
YoshisIsland_Noise:
YoshisIsland_NoiseLoop:
	.byte Transpose, $00
	.byte DutySet, $00
	.byte PitchSet, 0
	.byte VolSet, $77
	.byte SongLoop,2
	.byte NLen+6
	.byte $01
	.byte $01
	.byte NLen+7
	.byte $01
	.byte $01
	.byte NLen+13
	.byte $01
	.byte $01
	.byte NLen+26
	.byte $01
	.byte $01
	.byte NLen+13
	.byte $01
	.byte $01
	.byte NLen+78
	.byte $01
	.byte SongLoopEnd
	.byte NLen+6
	.byte $01
	.byte $01
	.byte NLen+7
	.byte $01
	.byte $01
	.byte NLen+13
	.byte $01
	.byte $01
	.byte NLen+26
	.byte $01
	.byte $01
	.byte NLen+78
	.byte NRest
	.byte VolSet, $53
	.byte NLen+26
	.byte $04
	.byte SongJump
	.word YoshisIsland_NoiseLoop
	.byte $FF
YoshisIsland_End:
	.byte $FF
YoshisIsland_Footer:
	.byte NRest
	.word YoshisIsland_P1
	.byte $01
	.word YoshisIsland_P2
	.byte $02
	.word YoshisIsland_Tri
	.byte $03
	.word YoshisIsland_Noise
	.byte $04
	.word YoshisIsland_End
	.byte $FF