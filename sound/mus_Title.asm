Title_P1:
	.byte SongSpeed, $01
	.byte Transpose, $07
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+12, G3, G3, G3, G2, G3, G3, G3, G2, NLen+48, G#3, NLen+36, G3, NLen+12, G2
Title_P1Loop:
	.byte Transpose, $13
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, E5
	.byte NLen+12
	.byte E3
	.byte E3
	.byte E3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte NLen+6
	.byte E3
	.byte F3
	.byte NLen+24
	.byte E3
	.byte NLen+12
	.byte D3
	.byte G2
	.byte D3
	.byte D3
	.byte D3
	.byte G2
	.byte D3
	.byte D3
	.byte D3
	.byte G2
	.byte D3
	.byte D3
	.byte D3
	.byte NLen+6
	.byte D3
	.byte E3
	.byte NLen+24
	.byte D3
	.byte NLen+12
	.byte C3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte NLen+6
	.byte D3
	.byte E3
	.byte NLen+24
	.byte F3
	.byte NLen+12
	.byte A3
	.byte G2
	.byte G3
	.byte G3
	.byte G3
	.byte G2
	.byte F3
	.byte F3
	.byte F3
	.byte B2
	.byte NLen+48
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte Transpose
	.byte $07
	.byte DutySet
	.byte $12
	.byte PitchSet
	.byte NRest
	.byte VolSet
	.byte $11
	.byte G3
	.byte F3
	.byte NLen+24
	.byte E3
	.byte G3
	.byte NLen+36
	.byte C4
	.byte NLen+12
	.byte B3
	.byte NLen+24
	.byte G#3
	.byte A3
	.byte NLen+36
	.byte D4
	.byte NLen+12
	.byte C4
	.byte DutySet
	.byte $07
	.byte PitchSet
	.byte $05
	.byte VolSet
	.byte $02
	.byte NLen+24
	.byte B3
	.byte C4
	.byte D4
	.byte F4
	.byte NLen+48
	.byte E4
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte G3
	.byte F3
	.byte NLen+24
	.byte E3
	.byte G3
	.byte NLen+36
	.byte C4
	.byte NLen+12
	.byte B3
	.byte NLen+24
	.byte G#3
	.byte A3
	.byte NLen+36
	.byte D4
	.byte NLen+12
	.byte C4
	.byte DutySet, $07
	.byte PitchSet, $05
	.byte VolSet, $02
	.byte NLen+24
	.byte B3
	.byte NLen+12
	.byte A#3
	.byte B3
	.byte NLen+36
	.byte F4
	.byte NLen+12
	.byte B3
	.byte NLen+48
	.byte C4
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte G3
	.byte A3
	.byte A3
	.byte A3
	.byte B3
	.byte NLen+24
	.byte C4
	.byte F4
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+12
	.byte E4
	.byte NLen+6
	.byte F4
	.byte E4
	.byte NLen+12
	.byte D4
	.byte NLen+6
	.byte E4
	.byte D4
	.byte NLen+36
	.byte C4
	.byte DutySet, $07
	.byte PitchSet, $05
	.byte VolSet, $02
	.byte NLen+12
	.byte G3
	.byte A3
	.byte A3
	.byte A3
	.byte B3
	.byte NLen+24
	.byte C4
	.byte F4
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+12
	.byte E4
	.byte NLen+6
	.byte F4
	.byte E4
	.byte NLen+12
	.byte D4
	.byte NLen+6
	.byte E4
	.byte D4
	.byte NLen+36
	.byte C4
	.byte DutySet, $07
	.byte PitchSet, $05
	.byte VolSet, $02
	.byte NLen+12
	.byte G3
	.byte A3
	.byte A3
	.byte A3
	.byte B3
	.byte NLen+24
	.byte C4
	.byte F4
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+12
	.byte G4
	.byte F#4
	.byte G4
	.byte D4
	.byte D4
	.byte C#4
	.byte D4
	.byte G3
	.byte NLen+48
	.byte G#3
	.byte G3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte C2
	.byte SongJump
	.word Title_P1Loop
	.byte $FF
Title_P2:
	.byte Transpose, $13
	.byte DutySet, $17
	.byte PitchSet, $16
	.byte VolSet, $14
	.byte NLen+12
	.byte G3
	.byte G3
	.byte G3
	.byte G2
	.byte G3
	.byte G3
	.byte G3
	.byte G2
	.byte NLen+48
	.byte G#3
	.byte NLen+36
	.byte G3
	.byte NLen+12
	.byte NRest
Title_P2Loop:
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+12
	.byte E3
	.byte E3
	.byte E3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte NLen+6
	.byte E3
	.byte F3
	.byte NLen+24
	.byte E3
	.byte NLen+12
	.byte D3
	.byte G2
	.byte D3
	.byte D3
	.byte D3
	.byte G2
	.byte D3
	.byte D3
	.byte D3
	.byte G2
	.byte D3
	.byte D3
	.byte D3
	.byte NLen+6
	.byte D3
	.byte E3
	.byte NLen+24
	.byte D3
	.byte NLen+12
	.byte C3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte G2
	.byte E3
	.byte E3
	.byte E3
	.byte NLen+6
	.byte D3
	.byte E3
	.byte NLen+24
	.byte F3
	.byte NLen+12
	.byte A3
	.byte G2
	.byte G3
	.byte G3
	.byte G3
	.byte G2
	.byte F3
	.byte F3
	.byte F3
	.byte B2
	.byte NLen+48
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte DutySet, $17
	.byte PitchSet, $16
	.byte VolSet, $15
	.byte C3
	.byte E3
	.byte G3
	.byte E3
	.byte C3
	.byte E3
	.byte G3
	.byte E3
	.byte F3
	.byte A3
	.byte C4
	.byte A3
	.byte F3
	.byte A3
	.byte C4
	.byte A3
	.byte G3
	.byte B3
	.byte D3
	.byte B3
	.byte G3
	.byte B3
	.byte D3
	.byte B3
	.byte C3
	.byte E3
	.byte G3
	.byte E3
	.byte C3
	.byte E3
	.byte G3
	.byte E3
	.byte C3
	.byte E3
	.byte G3
	.byte E3
	.byte C4
	.byte E3
	.byte G3
	.byte E3
	.byte F3
	.byte A3
	.byte C4
	.byte A3
	.byte F4
	.byte A3
	.byte C4
	.byte A3
	.byte G3
	.byte B3
	.byte D3
	.byte B3
	.byte G3
	.byte B3
	.byte D3
	.byte B3
	.byte E3
	.byte G3
	.byte D3
	.byte G3
	.byte NLen+48
	.byte C3
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $41
	.byte NLen+3
	.byte C4
	.byte E4
	.byte G4
	.byte B4
	.byte C5
	.byte E5
	.byte G5
	.byte B5
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte DutySet, $17
	.byte PitchSet, $16
	.byte VolSet, $14
	.byte E4
	.byte NLen+6
	.byte F4
	.byte E4
	.byte NLen+12
	.byte D4
	.byte NLen+6
	.byte E4
	.byte D4
	.byte NLen+48
	.byte C4
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $41
	.byte NLen+3
	.byte C4
	.byte E4
	.byte G4
	.byte B4
	.byte C5
	.byte E5
	.byte G5
	.byte B5
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte DutySet, $17
	.byte PitchSet, $16
	.byte VolSet, $14
	.byte E4
	.byte NLen+6
	.byte F4
	.byte E4
	.byte NLen+12
	.byte D4
	.byte NLen+6
	.byte E4
	.byte D4
	.byte NLen+48
	.byte C4
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $41
	.byte NLen+3
	.byte C4
	.byte E4
	.byte G4
	.byte B4
	.byte C5
	.byte E5
	.byte G5
	.byte B5
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte DutySet, $17
	.byte PitchSet, $16
	.byte VolSet, $14
	.byte G4
	.byte F#4
	.byte G4
	.byte D4
	.byte D4
	.byte C#4
	.byte D4
	.byte G3
	.byte NLen+48
	.byte G#3
	.byte Transpose, $13
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+12
	.byte G3
	.byte F#3
	.byte C4
	.byte E4
	.byte G4
	.byte NRest
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+24
	.byte G2
	.byte SongJump
	.word Title_P2Loop
	.byte $FF
Title_Tri:
	.byte Transpose, $07
	.byte DutySet, $07
	.byte PitchSet, $05
	.byte VolSet, $02
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
	.byte NRest
	.byte NRest
Title_TriLoop:
	.byte NLen+24
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte E3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte F3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte F#3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte G3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte B2
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte C3
	.byte G2
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+48
	.byte C3
	.byte E3
	.byte F3
	.byte F#3
	.byte G3
	.byte D3
	.byte E3
	.byte C3
	.byte C3
	.byte E3
	.byte F3
	.byte F#3
	.byte G3
	.byte B2
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte F3
	.byte NLen+12
	.byte NRest
	.byte F3
	.byte NLen+24
	.byte F3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte E3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte F3
	.byte NLen+12
	.byte NRest
	.byte F3
	.byte NLen+24
	.byte F3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte E3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte C3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte F3
	.byte NLen+12
	.byte NRest
	.byte F3
	.byte NLen+24
	.byte F3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte G3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte D3
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte F2
	.byte NLen+12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte SongJump
	.word Title_TriLoop
	.byte $FF
Title_End:
	.byte $FF
Title_Footer:
	.byte NRest
	.word Title_P1
	.byte $01
	.word Title_P2
	.byte $02
	.word Title_Tri
	.byte $03
	.word Title_End
	.byte $04
	.word Title_End
	.byte $FF