Title_P1:
	sndspeed $01
	transpose $07
	duty $12
	pitch $00
	volenv $11
	notelen 12
	.byte G3, G3, G3, G2, G3, G3, G3, G2, NLen+48, G#3, NLen+36, G3, NLen+12, G2
Title_P1Loop:
	transpose $13
	duty $38
	pitch $39
	volenv E5
	notelen 12
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
	notelen 6
	.byte E3
	.byte F3
	notelen 24
	.byte E3
	notelen 12
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
	notelen 6
	.byte D3
	.byte E3
	notelen 24
	.byte D3
	notelen 12
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
	notelen 6
	.byte D3
	.byte E3
	notelen 24
	.byte F3
	notelen 12
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
	notelen 48
	.byte C3
	notelen 12
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
	notelen 24
	.byte E3
	.byte G3
	notelen 36
	.byte C4
	notelen 12
	.byte B3
	notelen 24
	.byte G#3
	.byte A3
	notelen 36
	.byte D4
	notelen 12
	.byte C4
	.byte DutySet
	.byte $07
	.byte PitchSet
	.byte $05
	.byte VolSet
	.byte $02
	notelen 24
	.byte B3
	.byte C4
	.byte D4
	.byte F4
	notelen 48
	.byte E4
	notelen 12
	.byte NRest
	.byte NRest
	duty $12
	pitch $00
	volenv $11
	.byte G3
	.byte F3
	notelen 24
	.byte E3
	.byte G3
	notelen 36
	.byte C4
	notelen 12
	.byte B3
	notelen 24
	.byte G#3
	.byte A3
	notelen 36
	.byte D4
	notelen 12
	.byte C4
	duty $07
	pitch $05
	volenv $02
	notelen 24
	.byte B3
	notelen 12
	.byte A#3
	.byte B3
	notelen 36
	.byte F4
	notelen 12
	.byte B3
	notelen 48
	.byte C4
	notelen 12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte G3
	.byte A3
	.byte A3
	.byte A3
	.byte B3
	notelen 24
	.byte C4
	.byte F4
	duty $12
	pitch $00
	volenv $11
	notelen 12
	.byte E4
	notelen 6
	.byte F4
	.byte E4
	notelen 12
	.byte D4
	notelen 6
	.byte E4
	.byte D4
	notelen 36
	.byte C4
	duty $07
	pitch $05
	volenv $02
	notelen 12
	.byte G3
	.byte A3
	.byte A3
	.byte A3
	.byte B3
	notelen 24
	.byte C4
	.byte F4
	duty $12
	pitch $00
	volenv $11
	notelen 12
	.byte E4
	notelen 6
	.byte F4
	.byte E4
	notelen 12
	.byte D4
	notelen 6
	.byte E4
	.byte D4
	notelen 36
	.byte C4
	duty $07
	pitch $05
	volenv $02
	notelen 12
	.byte G3
	.byte A3
	.byte A3
	.byte A3
	.byte B3
	notelen 24
	.byte C4
	.byte F4
	duty $12
	pitch $00
	volenv $11
	notelen 12
	.byte G4
	.byte F#4
	.byte G4
	.byte D4
	.byte D4
	.byte C#4
	.byte D4
	.byte G3
	notelen 48
	.byte G#3
	.byte G3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte C2
	.byte SongJump
	.word Title_P1Loop
	.byte $FF
Title_P2:
	transpose $13
	duty $17
	pitch $16
	volenv $14
	notelen 12
	.byte G3
	.byte G3
	.byte G3
	.byte G2
	.byte G3
	.byte G3
	.byte G3
	.byte G2
	notelen 48
	.byte G#3
	notelen 36
	.byte G3
	notelen 12
	.byte NRest
Title_P2Loop:
	duty $12
	pitch $00
	volenv $11
	notelen 12
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
	notelen 6
	.byte E3
	.byte F3
	notelen 24
	.byte E3
	notelen 12
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
	notelen 6
	.byte D3
	.byte E3
	notelen 24
	.byte D3
	notelen 12
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
	notelen 6
	.byte D3
	.byte E3
	notelen 24
	.byte F3
	notelen 12
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
	notelen 48
	.byte C3
	notelen 12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	duty $17
	pitch $16
	volenv $15
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
	notelen 48
	.byte C3
	duty $38
	pitch $39
	volenv $41
	notelen 3
	.byte C4
	.byte E4
	.byte G4
	.byte B4
	.byte C5
	.byte E5
	.byte G5
	.byte B5
	notelen 12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	duty $17
	pitch $16
	volenv $14
	.byte E4
	notelen 6
	.byte F4
	.byte E4
	notelen 12
	.byte D4
	notelen 6
	.byte E4
	.byte D4
	notelen 48
	.byte C4
	duty $38
	pitch $39
	volenv $41
	notelen 3
	.byte C4
	.byte E4
	.byte G4
	.byte B4
	.byte C5
	.byte E5
	.byte G5
	.byte B5
	notelen 12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	duty $17
	pitch $16
	volenv $14
	.byte E4
	notelen 6
	.byte F4
	.byte E4
	notelen 12
	.byte D4
	notelen 6
	.byte E4
	.byte D4
	notelen 48
	.byte C4
	duty $38
	pitch $39
	volenv $41
	notelen 3
	.byte C4
	.byte E4
	.byte G4
	.byte B4
	.byte C5
	.byte E5
	.byte G5
	.byte B5
	notelen 12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	duty $17
	pitch $16
	volenv $14
	.byte G4
	.byte F#4
	.byte G4
	.byte D4
	.byte D4
	.byte C#4
	.byte D4
	.byte G3
	notelen 48
	.byte G#3
	transpose $13
	duty $38
	pitch $39
	volenv $40
	notelen 12
	.byte G3
	.byte F#3
	.byte C4
	.byte E4
	.byte G4
	.byte NRest
	duty $12
	pitch $00
	volenv $11
	notelen 24
	.byte G2
	.byte SongJump
	.word Title_P2Loop
	.byte $FF
Title_Tri:
	transpose $07
	duty $07
	pitch $05
	volenv $02
	notelen 12
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
	notelen 24
	.byte C3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte C3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte C3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte G2
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte G2
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte G2
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte G2
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte C3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte C3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte E3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte F3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte F#3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte G3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte B2
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte C3
	.byte G2
	.byte C3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 48
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
	notelen 12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	notelen 24
	.byte F3
	notelen 12
	.byte NRest
	.byte F3
	notelen 24
	.byte F3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte E3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte C3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte F3
	notelen 12
	.byte NRest
	.byte F3
	notelen 24
	.byte F3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte E3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte C3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte F3
	notelen 12
	.byte NRest
	.byte F3
	notelen 24
	.byte F3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte G3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte D3
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte G2
	notelen 12
	.byte NRest
	.byte NRest
	notelen 24
	.byte F2
	notelen 12
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	notelen 24
	.byte G2
	.byte SongJump
	.word Title_TriLoop
	.byte $FF
Title_End:
	.byte $FF
Title_Footer:
	mussq1 Title_P1
	mussq2 Title_P2
	mustri Title_Tri
	musnoise Title_End
	musdpcm Title_End
	.byte $FF