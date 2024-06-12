Castle_P1:
	.byte SongSpeed, 1
	.byte Transpose, 3
	.byte DutySet, 0
	.byte PitchSet, 0
	.byte VolSet, $33

	.byte SegCall
	.word Castle_P1Seg

	.byte SegCall
	.word Castle_P1Seg

	.byte SegCall
	.word Castle_P1Seg

	.byte SegCall
	.word Castle_P1Seg

	.byte NLen+6
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte DutySet, $12
	.byte PitchSet, 0
	.byte VolSet, $11
	.byte NLen+24
	.byte D3
	.byte NLen+48
	.byte E3
	.byte NLen+24
	.byte NRest
	.byte D3
	.byte NLen+48
	.byte E3
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte D3
	.byte E3
	.byte F3
	.byte D#3
	.byte NLen+96
	.byte E3
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
Castle_P1Loop:
	.byte DutySet, $12
	.byte PitchSet, 0
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
	.byte NLen+48
	.byte C4
	.byte NLen+24
	.byte A3
	.byte E3
	.byte $27
	.byte $C8
	.byte A3
	.byte NLen+24
	.byte NRest
	.byte E3
	.byte A3
	.byte E4
	.byte NLen+48
	.byte C4
	.byte B3
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
	.byte NLen+48
	.byte C4
	.byte NLen+24
	.byte A3
	.byte E3
	.byte $27
	.byte $C8
	.byte A3
	.byte NLen+24
	.byte NRest
	.byte E3
	.byte A3
	.byte E4
	.byte NLen+48
	.byte C4
	.byte B3
	.byte NLen+24
	.byte NRest
	.byte A3
	.byte E4
	.byte $39
	.byte NLen+48
	.byte F4
	.byte E4
	.byte NLen+24
	.byte NRest
	.byte E3
	.byte D4
	.byte E4
	.byte NLen+48
	.byte D4
	.byte C4
	.byte NLen+24
	.byte NRest
	.byte C4
	.byte B3
	.byte A3
	.byte NLen+48
	.byte B3
	.byte F#3
	.byte NLen+24
	.byte NRest
	.byte B3
	.byte A3
	.byte B3
	.byte NLen+48
	.byte A3
	.byte G#3
	.byte $F4
	.word Castle_P1Loop
	.byte $FF
Castle_P1Seg:
	.byte NLen+6
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte A3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte C4
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte $F1
	.byte $FF
Castle_P2:
	.byte Transpose, $03
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte $E0
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte $E0
	.byte $10
	.byte NLen+48
	.byte F2
	.byte NLen+24
	.byte $1A
	.byte $15
	.byte $17
	.byte $C8
	.byte $1A
	.byte NLen+24
	.byte NRest
	.byte $15
	.byte $1A
	.byte A2
	.byte NLen+48
	.byte F2
	.byte $1C
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte $E0
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte $E0
	.byte $10
	.byte NLen+48
	.byte F2
	.byte NLen+24
	.byte $1A
	.byte $15
	.byte $17
	.byte $C8
	.byte $1A
	.byte NLen+24
	.byte NRest
	.byte $15
	.byte $1A
	.byte A2
	.byte NLen+48
	.byte F2
	.byte $1C
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte $10
	.byte DutySet, $34
	.byte PitchSet
	.byte $39
	.byte VolSet, $41
	.byte $15
	.byte $15
	.byte DutySet, $17
	.byte PitchSet
	.byte $16
	.byte VolSet, $14
	.byte $0E
	.byte $10
	.byte DutySet, $34
	.byte PitchSet
	.byte $39
	.byte VolSet, $41
	.byte $15
	.byte $15
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NRest
	.byte $0E
	.byte $10
	.byte $11
	.byte $0F
	.byte $C8
	.byte $10
	.byte Transpose, $0F
	.byte DutySet, $07
	.byte PitchSet, $05
	.byte VolSet, $02
	.byte $E0
	.byte E5
	.byte NLen+24
	.byte NRest
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte NLen+12
	.byte $3E
	.byte B4
	.byte G4
	.byte F4
	.byte Transpose, $0D
	.byte $86
	.byte $3E
	.byte B4
	.byte G4
	.byte F4
	.byte Transpose, $0B
	.byte $3E
	.byte B4
	.byte G4
	.byte F4
	.byte Transpose, $09
	.byte $3E
	.byte B4
	.byte G4
	.byte F4
	.byte Transpose, $07
	.byte $3E
	.byte B4
	.byte G4
	.byte F4
	.byte Transpose, $05
	.byte $3E
	.byte B4
	.byte G4
	.byte F4
	.byte Transpose, $03
	.byte $3E
	.byte B4
	.byte G4
	.byte F4
	.byte Transpose, $0F
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $15
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $14
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $16
	.byte SegCall
	.word Castle_P2Seg
Castle_P2Loop:
	.byte Transpose, $0F
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $15
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $14
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $16
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $0F
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $15
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $14
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $16
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $0F
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $15
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $14
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $16
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $0F
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $15
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $14
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $16
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $17
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $1A
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $16
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $1B
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $17
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $16
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $11
	.byte SegCall
	.word Castle_P2Seg
	.byte Transpose, $16
	.byte SegCall
	.word Castle_P2Seg
	.byte $F4
	.word Castle_P2Loop
	.byte $FF
	.byte DutySet, 0
	.byte PitchSet, 0
	.byte VolSet, $33
Castle_P2Seg:
	.byte $86
	.byte E3
	.byte A3
	.byte E3
	.byte A3
	.byte C4
	.byte A3
	.byte C4
	.byte A3
	.byte B3
	.byte $2B
	.byte A2
	.byte E3
	.byte C3
	.byte $1C
	.byte B2
	.byte $20
	.byte $F1
	.byte $FF
Castle_Tri:
	.byte Transpose, $1B
	.byte DutySet, $07
	.byte PitchSet
	.byte $05
	.byte VolSet, $02
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte NLen+48
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte NLen+48
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte NLen+48
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte NLen+48
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte NLen+48
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte NLen+48
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte NLen+48
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte NLen+48
	.byte $10
	.byte NLen+24
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $0E
	.byte $10
	.byte NRest
	.byte NRest
	.byte $0E
	.byte $10
	.byte NRest
	.byte $0E
	.byte $10
	.byte $11
	.byte $0E
	.byte $E0
	.byte $10
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
	.byte Transpose, $0F
	.byte DutySet, $38
	.byte PitchSet
	.byte $39
	.byte VolSet, $40
	.byte NLen+48
	.byte $15
	.byte $15
	.byte $1B
	.byte $1B
	.byte $1A
	.byte $1A
	.byte $1C
	.byte $1C
	.byte NLen+24
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
Castle_TriLoop:
	.byte Transpose, $0F
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $15
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $14
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $16
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $0F
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $15
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $14
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $16
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $0F
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $15
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $14
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $16
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $17
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $1A
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $16
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $1B
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $17
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $16
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $11
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $16
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $0F
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $15
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $14
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte Transpose, $16
	.byte SegCall
	.byte $C3
	.byte $A4
	.byte $F4
	.word Castle_TriLoop
	.byte $FF
	.byte $86
	.byte $15
	.byte NRest
	.byte $15
	.byte NRest
	.byte $15
	.byte NRest
	.byte $15
	.byte NRest
	.byte $15
	.byte NRest
	.byte $15
	.byte NRest
	.byte $15
	.byte NRest
	.byte $15
	.byte NRest
	.byte $F1
	.byte $FF
Castle_Noise:
	.byte Transpose, $01
	.byte DutySet, $00
	.byte PitchSet, $00
	.byte VolSet, $53
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
	.byte NRest
	.byte B3
	.byte B3
	.byte NRest
	.byte NRest
	.byte B3
	.byte B3
	.byte NRest
	.byte B3
	.byte B3
	.byte B3
	.byte B3
	.byte $E0
	.byte B3
	.byte $FF
Castle_End:
	.byte $FF
Castle_Footer:
	.byte NRest
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