Castle_P1:
	.byte SongSpeed, 1
	.byte Transpose, 6
	.byte DutySet, $38
	.byte PitchSet, $05
	.byte VolSet, $29
	.byte NLen+16
	.byte NRest
	.byte NLen+22
	.byte G1
	.byte NLen+19
	.byte G2
	.byte NLen+70
	.byte G3
	.byte NLen+4
	.byte NRest
	.byte Transpose, 0
	.byte SongLoop,2
	.byte NLen+73
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte SegCall
	.word Castle_PSub1
	.byte SegCall
	.word Castle_PSub2
	.byte Transpose, 1
	.byte SegCall
	.word Castle_PSub2
	.byte Transpose, 0
	.byte SegCall
	.word Castle_PSub2
	.byte SongLoopEnd
	.byte NLen+109
	.byte NRest
	.byte VolSet, $21
	.byte SongLoop,2
	.byte NLen+32
	.byte F5
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte G5
	.byte NLen+78
	.byte NRest
	.byte SongLoopEnd
	.byte NLen+32
	.byte F5
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte G5
	.byte NLen+5
	.byte NRest
	.byte NLen+32
	.byte G#5
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte F#5
	.byte NLen+5
	.byte NRest
	.byte NLen+68
	.byte G5
	.byte NLen+111
	.byte NRest
	.byte NLen+62
	.byte NRest
	.byte VolSet, $22
	.byte SegCall
	.word Castle_PSub3
	.byte NLen+2
	.byte B2
	.byte NRest
	.byte G#2
	.byte NLen+1
	.byte NRest
	.byte NLen+92
	.byte G2
	.byte NLen+22
	.byte NRest
	.byte NLen+110
	.byte NRest
	.byte NLen+109
	.byte NRest
	.byte NLen+110
	.byte NRest
Castle_P1Loop:
	.byte SongLoop,4
	.byte SegCall
	.word Castle_PSub4
	.byte SegCall
	.word Castle_PSub5
	.byte SongLoopEnd
	.byte SegCall
	.word Castle_PSub4
	.byte VolSet, $23
	.byte NLen+5
	.byte D3
	.byte NLen+4
	.byte G#2
	.byte NLen+5
	.byte D3
	.byte VolSet, $24
	.byte NLen+4
	.byte F3
	.byte NLen+5
	.byte D3
	.byte NLen+4
	.byte F3
	.byte VolSet, $25
	.byte NLen+5
	.byte G#3
	.byte F3
	.byte NLen+4
	.byte G#3
	.byte VolSet, $26
	.byte NLen+5
	.byte D4
	.byte NLen+4
	.byte G#3
	.byte NLen+5
	.byte D4
	.byte VolSet, $27
	.byte NLen+4
	.byte F4
	.byte NLen+5
	.byte D4
	.byte NLen+4
	.byte F4
	.byte VolSet, $26
	.byte NLen+5
	.byte D4
	.byte G#3
	.byte NLen+4
	.byte D4
	.byte VolSet, $25
	.byte NLen+5
	.byte G#3
	.byte NLen+4
	.byte F3
	.byte NLen+5
	.byte G#3
	.byte VolSet, $24
	.byte NLen+4
	.byte F3
	.byte NLen+5
	.byte D3
	.byte F3
	.byte SegCall
	.word Castle_PSub6
	.byte SegCall
	.word Castle_PSub4
	.byte VolSet, $23
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte F#2
	.byte NLen+4
	.byte C3
	.byte VolSet, $24
	.byte NLen+5
	.byte D#3
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte D#3
	.byte VolSet, $25
	.byte NLen+4
	.byte F#3
	.byte NLen+5
	.byte D#3
	.byte F#3
	.byte VolSet, $26
	.byte NLen+4
	.byte C4
	.byte NLen+5
	.byte F#3
	.byte NLen+4
	.byte C4
	.byte VolSet, $27
	.byte NLen+5
	.byte D#4
	.byte NLen+4
	.byte C4
	.byte NLen+5
	.byte D#4
	.byte VolSet, $26
	.byte C4
	.byte NLen+4
	.byte F#3
	.byte NLen+5
	.byte C4
	.byte VolSet, $25
	.byte NLen+4
	.byte F#3
	.byte NLen+5
	.byte D#3
	.byte NLen+4
	.byte F#3
	.byte VolSet, $24
	.byte NLen+5
	.byte D#3
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte D#3
	.byte VolSet, $23
	.byte NLen+5
	.byte C3
	.byte NLen+4
	.byte A2
	.byte NLen+5
	.byte C3
	.byte VolSet, $24
	.byte NLen+4
	.byte D3
	.byte NLen+5
	.byte C3
	.byte NLen+4
	.byte D3
	.byte VolSet, $25
	.byte NLen+5
	.byte A3
	.byte D3
	.byte NLen+4
	.byte A3
	.byte VolSet, $26
	.byte NLen+5
	.byte C4
	.byte NLen+4
	.byte A3
	.byte NLen+5
	.byte C4
	.byte VolSet, $27
	.byte NLen+4
	.byte D4
	.byte NLen+5
	.byte C4
	.byte NLen+4
	.byte D4
	.byte VolSet, $26
	.byte NLen+5
	.byte C4
	.byte A3
	.byte NLen+4
	.byte C4
	.byte VolSet, $25
	.byte NLen+5
	.byte A3
	.byte NLen+4
	.byte D3
	.byte NLen+5
	.byte A3
	.byte VolSet, $24
	.byte NLen+4
	.byte D3
	.byte NLen+5
	.byte C3
	.byte D3
	.byte VolSet, $23
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte A2
	.byte NLen+4
	.byte C3
	.byte VolSet, $24
	.byte NLen+5
	.byte F#3
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte F#3
	.byte VolSet, $25
	.byte NLen+4
	.byte A3
	.byte NLen+5
	.byte F#3
	.byte A3
	.byte VolSet, $26
	.byte NLen+4
	.byte C4
	.byte NLen+5
	.byte A3
	.byte NLen+4
	.byte C4
	.byte VolSet, $27
	.byte NLen+5
	.byte F#4
	.byte NLen+4
	.byte C4
	.byte NLen+5
	.byte F#4
	.byte VolSet, $26
	.byte C4
	.byte NLen+4
	.byte A3
	.byte NLen+5
	.byte C4
	.byte VolSet, $25
	.byte NLen+4
	.byte A3
	.byte NLen+5
	.byte F#3
	.byte NLen+4
	.byte A3
	.byte VolSet, $24
	.byte NLen+5
	.byte F#3
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte F#3
	.byte VolSet, $23
	.byte NLen+5
	.byte C3
	.byte NLen+4
	.byte G2
	.byte NLen+5
	.byte C3
	.byte VolSet, $24
	.byte NLen+4
	.byte D3
	.byte NLen+5
	.byte C3
	.byte NLen+4
	.byte D3
	.byte VolSet, $25
	.byte NLen+5
	.byte G3
	.byte D3
	.byte NLen+4
	.byte G3
	.byte VolSet, $26
	.byte NLen+5
	.byte C4
	.byte NLen+4
	.byte G3
	.byte NLen+5
	.byte C4
	.byte VolSet, $27
	.byte NLen+4
	.byte D4
	.byte NLen+5
	.byte B3
	.byte NLen+4
	.byte D4
	.byte VolSet, $26
	.byte NLen+5
	.byte F4
	.byte D4
	.byte NLen+4
	.byte F4
	.byte VolSet, $25
	.byte NLen+5
	.byte B4
	.byte NLen+4
	.byte F4
	.byte NLen+5
	.byte B4
	.byte VolSet, $24
	.byte NLen+4
	.byte D5
	.byte NLen+5
	.byte B4
	.byte D5
	.byte SongJump
	.word Castle_P1Loop
	.byte $FF
Castle_P2:
	.byte Transpose, 5
	.byte DutySet, $38
	.byte PitchSet, $05
	.byte VolSet, $29
	.byte NLen+8
	.byte NRest
	.byte NLen+23
	.byte G1
	.byte NLen+20
	.byte G2
	.byte NLen+76
	.byte G3
	.byte NLen+4
	.byte NRest
	.byte Transpose, 0
	.byte DutySet, $7B
	.byte SongLoop,2
	.byte SegCall
	.word Castle_PSub1
	.byte SegCall
	.word Castle_PSub2
	.byte Transpose, 1
	.byte SegCall
	.word Castle_PSub2
	.byte Transpose, 0
	.byte SegCall
	.word Castle_PSub2
	.byte VolSet, $20
	.byte NLen+63
	.byte G#2
	.byte NLen+10
	.byte NRest
	.byte NLen+27
	.byte F2
	.byte NLen+9
	.byte NRest
	.byte NLen+27
	.byte C2
	.byte NLen+10
	.byte NRest
	.byte NLen+27
	.byte D2
	.byte NLen+9
	.byte NRest
	.byte NLen+91
	.byte F2
	.byte NLen+55
	.byte NRest
	.byte NLen+27
	.byte C2
	.byte NLen+10
	.byte NRest
	.byte NLen+27
	.byte F2
	.byte NLen+9
	.byte NRest
	.byte NLen+27
	.byte C3
	.byte NLen+10
	.byte NRest
	.byte NLen+54
	.byte G#2
	.byte NLen+19
	.byte NRest
	.byte NLen+54
	.byte G2
	.byte NLen+19
	.byte NRest
	.byte SongLoopEnd
	.byte SegCall
	.word Castle_P2Sub1
	.byte VolSet, $1A
	.byte SongLoop,2
	.byte NLen+32
	.byte C4
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte B3
	.byte NLen+78
	.byte NRest
	.byte SongLoopEnd
	.byte NLen+32
	.byte G#3
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte B3
	.byte NLen+5
	.byte NRest
	.byte NLen+32
	.byte C4
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte A#3
	.byte NLen+5
	.byte NRest
	.byte NLen+68
	.byte B3
	.byte PitchSet, $06
	.byte VolSet, $18
	.byte NLen+111
	.byte G5
	.byte PitchSet, $04
	.byte NLen+62
	.byte G5
	.byte NLen+12
	.byte NRest
	.byte PitchSet, $05
	.byte VolSet, $23
	.byte SegCall
	.word Castle_PSub3
	.byte SegCall
	.word Castle_PSub4
	.byte SegCall
	.word Castle_PSub5
Castle_P2Loop:
	.byte SongLoop,2
	.byte Transpose, 0
	.byte SegCall
	.word Castle_P2Sub2
	.byte NLen+14
	.byte NRest
	.byte Transpose, 6
	.byte SegCall
	.word Castle_P2Sub2
	.byte NLen+15
	.byte NRest
	.byte Transpose, 5
	.byte SegCall
	.word Castle_P2Sub2
	.byte NLen+14
	.byte NRest
	.byte Transpose, 7
	.byte SegCall
	.word Castle_P2Sub2
	.byte NLen+15
	.byte NRest
	.byte Transpose, 0
	.byte DutySet, $7B
	.byte VolSet, $21
	.byte NLen+50
	.byte D#4
	.byte NLen+4
	.byte NRest
	.byte NLen+23
	.byte C4
	.byte NLen+5
	.byte NRest
	.byte NLen+22
	.byte G3
	.byte NLen+5
	.byte NRest
	.byte NLen+23
	.byte F#3
	.byte NLen+4
	.byte NRest
	.byte NLen+78
	.byte C4
	.byte NLen+32
	.byte NRest
	.byte NLen+23
	.byte G3
	.byte NLen+4
	.byte NRest
	.byte NLen+23
	.byte C4
	.byte NLen+5
	.byte NRest
	.byte NLen+22
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte D#4
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte D4
	.byte NLen+5
	.byte NRest
	.byte SongLoopEnd
	.byte NLen+27
	.byte NRest
	.byte NLen+23
	.byte C4
	.byte NLen+4
	.byte NRest
	.byte NLen+23
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte NLen+22
	.byte C5
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte G#4
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte G4
	.byte NLen+32
	.byte NRest
	.byte NLen+23
	.byte G3
	.byte NLen+4
	.byte NRest
	.byte NLen+23
	.byte D4
	.byte NLen+5
	.byte NRest
	.byte NLen+22
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte D#4
	.byte NLen+32
	.byte NRest
	.byte NLen+23
	.byte D#4
	.byte NLen+4
	.byte NRest
	.byte NLen+23
	.byte D4
	.byte NLen+5
	.byte NRest
	.byte NLen+22
	.byte C4
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte D4
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte A3
	.byte NLen+32
	.byte NRest
	.byte NLen+23
	.byte D4
	.byte NLen+4
	.byte NRest
	.byte NLen+23
	.byte C4
	.byte NLen+5
	.byte NRest
	.byte NLen+22
	.byte D4
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte C4
	.byte NLen+5
	.byte NRest
	.byte NLen+50
	.byte B3
	.byte NLen+5
	.byte NRest
	.byte SongJump
	.word Castle_P2Loop
	.byte $FF
Castle_P2Sub1:
	.byte VolSet, $1F
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $18
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $19
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1A
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1B
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+6
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1C
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1D
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte SegEnd
Castle_P2Sub2:
	.byte DutySet, $3D
	.byte VolSet, $2B
	.byte NLen+21
	.byte C1
	.byte VolSet, $1D
	.byte NLen+1
	.byte C#1
	.byte D1
	.byte D#1
	.byte E1
	.byte F1
	.byte F#1
	.byte G1
	.byte G#1
	.byte A1
	.byte A#1
	.byte B1
	.byte VolSet, $1C
	.byte NLen+16
	.byte C2
	.byte VolSet, $1B
	.byte NLen+1
	.byte B1
	.byte A#1
	.byte A1
	.byte G#1
	.byte G1
	.byte F#1
	.byte F1
	.byte E1
	.byte D#1
	.byte D1
	.byte C#1
	.byte VolSet, $1A
	.byte NLen+36
	.byte C1
	.byte SegEnd
Castle_PSub1:
	.byte DutySet, $7B
	.byte VolSet, $1F
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $18
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $19
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1A
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1B
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+6
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1C
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1D
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1E
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1F
	.byte NLen+2
	.byte C4
	.byte F4
	.byte NLen+6
	.byte NRest
	.byte SegEnd
Castle_PSub2:
	.byte DutySet, $7B
	.byte VolSet, $1F
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $18
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $19
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1A
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1B
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+6
	.byte NRest
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1C
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1D
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1E
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+5
	.byte NRest
	.byte VolSet, $1F
	.byte NLen+2
	.byte B3
	.byte G4
	.byte NLen+6
	.byte NRest
	.byte SegEnd
Castle_PSub3:
	.byte NLen+4
	.byte F5
	.byte NLen+5
	.byte NRest
	.byte NLen+4
	.byte D5
	.byte NRest
	.byte B4
	.byte NRest
	.byte G#4
	.byte NRest
	.byte G4
	.byte NLen+3
	.byte NRest
	.byte F4
	.byte NLen+2
	.byte NRest
	.byte NLen+3
	.byte D4
	.byte NRest
	.byte B3
	.byte NRest
	.byte G#3
	.byte NRest
	.byte NLen+2
	.byte G3
	.byte NRest
	.byte NLen+3
	.byte F3
	.byte NLen+2
	.byte NRest
	.byte D3
	.byte NLen+1
	.byte NRest
	.byte SegEnd
Castle_PSub4:
	.byte VolSet, $23
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte G2
	.byte NLen+4
	.byte C3
	.byte VolSet, $24
	.byte NLen+5
	.byte D#3
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte D#3
	.byte VolSet, $25
	.byte NLen+4
	.byte G3
	.byte NLen+5
	.byte C4
	.byte G3
	.byte VolSet, $26
	.byte NLen+4
	.byte C4
	.byte NLen+5
	.byte G3
	.byte NLen+4
	.byte C4
	.byte VolSet, $27
	.byte NLen+5
	.byte D#4
	.byte NLen+4
	.byte C4
	.byte NLen+5
	.byte D#4
	.byte VolSet, $26
	.byte C4
	.byte NLen+4
	.byte G3
	.byte NLen+5
	.byte C4
	.byte VolSet, $25
	.byte NLen+4
	.byte G3
	.byte NLen+5
	.byte D#3
	.byte NLen+4
	.byte G3
	.byte VolSet, $24
	.byte NLen+5
	.byte D#3
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte D#3
	.byte SegEnd
Castle_PSub5:
	.byte VolSet, $23
	.byte NLen+5
	.byte C3
	.byte NLen+4
	.byte A2
	.byte NLen+5
	.byte C3
	.byte VolSet, $24
	.byte NLen+4
	.byte D#3
	.byte NLen+5
	.byte C3
	.byte NLen+4
	.byte D#3
	.byte VolSet, $25
	.byte NLen+5
	.byte F#3
	.byte D#3
	.byte NLen+4
	.byte F#3
	.byte VolSet, $26
	.byte NLen+5
	.byte C4
	.byte NLen+4
	.byte F#3
	.byte NLen+5
	.byte C4
	.byte VolSet, $27
	.byte NLen+4
	.byte D#4
	.byte NLen+5
	.byte C4
	.byte NLen+4
	.byte D#4
	.byte VolSet, $26
	.byte NLen+5
	.byte C4
	.byte F#3
	.byte NLen+4
	.byte C4
	.byte VolSet, $25
	.byte NLen+5
	.byte F#3
	.byte NLen+4
	.byte D#3
	.byte NLen+5
	.byte F#3
	.byte VolSet, $24
	.byte NLen+4
	.byte D#3
	.byte NLen+5
	.byte C3
	.byte D#3
	.byte VolSet, $23
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte G#2
	.byte NLen+4
	.byte C3
	.byte VolSet, $24
	.byte NLen+5
	.byte F3
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte F3
	.byte VolSet, $25
	.byte NLen+4
	.byte G#3
	.byte NLen+5
	.byte F3
	.byte G#3
	.byte VolSet, $26
	.byte NLen+4
	.byte C4
	.byte NLen+5
	.byte G#3
	.byte NLen+4
	.byte C4
	.byte VolSet, $27
	.byte NLen+5
	.byte F4
	.byte NLen+4
	.byte C4
	.byte NLen+5
	.byte F4
	.byte VolSet, $26
	.byte C4
	.byte NLen+4
	.byte G#3
	.byte NLen+5
	.byte C4
	.byte VolSet, $25
	.byte NLen+4
	.byte G#3
	.byte NLen+5
	.byte F3
	.byte NLen+4
	.byte G#3
	.byte VolSet, $24
	.byte NLen+5
	.byte F3
	.byte NLen+4
	.byte C3
	.byte NLen+5
	.byte F3
Castle_PSub6:
	.byte VolSet, $23
	.byte NLen+5
	.byte D3
	.byte NLen+4
	.byte B2
	.byte NLen+5
	.byte D3
	.byte VolSet, $24
	.byte NLen+4
	.byte F3
	.byte NLen+5
	.byte D3
	.byte NLen+4
	.byte F3
	.byte VolSet, $25
	.byte NLen+5
	.byte B3
	.byte F3
	.byte NLen+4
	.byte B3
	.byte VolSet, $26
	.byte NLen+5
	.byte D4
	.byte NLen+4
	.byte B3
	.byte NLen+5
	.byte D4
	.byte VolSet, $27
	.byte NLen+4
	.byte F4
	.byte NLen+5
	.byte D4
	.byte NLen+4
	.byte F4
	.byte VolSet, $26
	.byte NLen+5
	.byte D4
	.byte B3
	.byte NLen+4
	.byte D4
	.byte VolSet, $25
	.byte NLen+5
	.byte B3
	.byte NLen+4
	.byte F3
	.byte NLen+5
	.byte B3
	.byte VolSet, $24
	.byte NLen+4
	.byte F3
	.byte NLen+5
	.byte D3
	.byte F3
	.byte SegEnd
Castle_Tri:
	.byte Transpose, 12
	.byte DutySet, $38
	.byte PitchSet, $05
	.byte VolSet, $29
	.byte NLen+24
	.byte G1
	.byte NLen+21
	.byte G2
	.byte NLen+18
	.byte G3
	.byte NLen+64
	.byte G4
	.byte NLen+4
	.byte NRest
	.byte Transpose, 0
	.byte SongLoop,8
	.byte NLen+109
	.byte NRest
	.byte NLen+32
	.byte F2
	.byte NLen+5
	.byte NRest
	.byte NLen+63
	.byte G2
	.byte NLen+83
	.byte NRest
	.byte SongLoopEnd
	.byte NLen+109
	.byte NRest
	.byte SongLoop,2
	.byte NLen+32
	.byte F3
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte G3
	.byte NLen+5
	.byte NRest
	.byte NLen+32
	.byte F2
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte G2
	.byte NLen+5
	.byte NRest
	.byte SongLoopEnd
	.byte NLen+32
	.byte F2
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte G2
	.byte NLen+5
	.byte NRest
	.byte NLen+32
	.byte G#2
	.byte NLen+5
	.byte NRest
	.byte NLen+31
	.byte F#2
	.byte NLen+5
	.byte NRest
	.byte NLen+68
	.byte G2
	.byte NLen+41
	.byte NRest
	.byte NLen+73
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NLen+41
	.byte C2
	.byte NLen+13
	.byte NRest
	.byte NLen+41
	.byte C2
	.byte NLen+14
	.byte NRest
	.byte NLen+41
	.byte F#2
	.byte NLen+14
	.byte NRest
	.byte NLen+41
	.byte F#2
	.byte NLen+14
	.byte NRest
	.byte NLen+41
	.byte F2
	.byte NLen+13
	.byte NRest
	.byte NLen+41
	.byte F2
	.byte NLen+14
	.byte NRest
	.byte NLen+41
	.byte G2
	.byte NLen+14
	.byte NRest
	.byte NLen+41
	.byte G2
	.byte NLen+14
	.byte NRest
	.byte NLen+20
	.byte C2
	.byte NLen+7
	.byte NRest
	.byte NLen+20
	.byte C2
	.byte NLen+7
	.byte NRest
	.byte NLen+21
	.byte C2
	.byte NLen+7
	.byte NRest
	.byte NLen+20
	.byte C2
	.byte NLen+7
	.byte NRest
	.byte NLen+21
	.byte F#2
	.byte NLen+6
	.byte NRest
	.byte NLen+21
	.byte F#2
	.byte NLen+7
	.byte NRest
	.byte NLen+20
	.byte F#2
	.byte NLen+7
	.byte NRest
	.byte NLen+21
	.byte F#2
	.byte NLen+7
	.byte NRest
	.byte NLen+20
	.byte F2
	.byte NLen+7
	.byte NRest
	.byte NLen+20
	.byte F2
	.byte NLen+7
	.byte NRest
	.byte NLen+21
	.byte F2
	.byte NLen+7
	.byte NRest
	.byte NLen+20
	.byte F2
	.byte NLen+7
	.byte NRest
	.byte NLen+21
	.byte G2
	.byte NLen+6
	.byte NRest
	.byte NLen+21
	.byte G2
	.byte NLen+7
	.byte NRest
	.byte NLen+20
	.byte G2
	.byte NLen+7
	.byte NRest
	.byte NLen+21
	.byte G2
	.byte NLen+7
	.byte NRest
Castle_TriLoop:
	.byte SongLoop,3
	.byte Transpose, 0
	.byte SegCall
	.word Castle_TriSub1
	.byte Transpose, 6
	.byte SegCall
	.word Castle_TriSub2
	.byte Transpose, 5
	.byte SegCall
	.word Castle_TriSub1
	.byte Transpose, 7
	.byte SegCall
	.word Castle_TriSub2
	.byte SongLoopEnd
	.byte Transpose, 8
	.byte SegCall
	.word Castle_TriSub1
	.byte Transpose, 11
	.byte SegCall
	.word Castle_TriSub2
	.byte Transpose, 7
	.byte SegCall
	.word Castle_TriSub1
	.byte Transpose, 12
	.byte SegCall
	.word Castle_TriSub2
	.byte Transpose, 9
	.byte SegCall
	.word Castle_TriSub1
	.byte Transpose, 6
	.byte SegCall
	.word Castle_TriSub2
	.byte Transpose, 2
	.byte SegCall
	.word Castle_TriSub1
	.byte Transpose, 7
	.byte SegCall
	.word Castle_TriSub2
	.byte Transpose, 0
	.byte SegCall
	.word Castle_TriSub1
	.byte Transpose, 6
	.byte SegCall
	.word Castle_TriSub2
	.byte Transpose, 5
	.byte SegCall
	.word Castle_TriSub1
	.byte Transpose, 7
	.byte SegCall
	.word Castle_TriSub2
	.byte SongJump
	.word Castle_TriLoop
	.byte $FF
Castle_TriSub1:
	.byte NLen+10
	.byte C2
	.byte NLen+3
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+4
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+4
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+3
	.byte NRest
	.byte NLen+11
	.byte C2
	.byte NLen+3
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+4
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+3
	.byte NRest
	.byte NLen+11
	.byte C2
	.byte NLen+3
	.byte NRest
	.byte SegEnd
Castle_TriSub2:
	.byte NLen+10
	.byte C2
	.byte NLen+4
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+3
	.byte NRest
	.byte NLen+11
	.byte C2
	.byte NLen+3
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+4
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+3
	.byte NRest
	.byte NLen+11
	.byte C2
	.byte NLen+3
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+4
	.byte NRest
	.byte NLen+10
	.byte C2
	.byte NLen+4
	.byte NRest
	.byte SegEnd
Castle_Noise:
	.byte Transpose, 0
	.byte VolSet, $01
	.byte NLen+111
	.byte NRest
	.byte NLen+20
	.byte NRest
	.byte NLen+73
	.byte SongLoop,34
	.byte NRest
	.byte SongLoopEnd
	.byte NLen+36
	.byte NRest
	.byte NLen+37
	.byte $3E
	.byte NLen+36
	.byte $3E
	.byte NLen+73
	.byte NRest
	.byte SongLoop,3
	.byte NLen+37
	.byte $3E
	.byte NLen+36
	.byte $3E
	.byte SongLoopEnd
	.byte NLen+37
	.byte $3E
	.byte $FF
Castle_End:
	.byte $FF
Castle_Footer:
	.byte $00
	.word Castle_P1
	.byte $01
	.word Castle_P2
	.byte $02
	.word Castle_Tri
	.byte $03
	.word Castle_Noise
	.byte $04
	.word Castle_End
	.byte $FF