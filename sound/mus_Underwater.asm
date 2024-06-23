Underwater_P1:
	.byte SongSpeed, $01
	.byte Transpose, $00
	.byte DutySet, $7B
	.byte PitchSet, $0F
	.byte VolSet, $09
	.byte NLen+38
	.byte D5
	.byte NLen+4
	.byte NRest
	.byte NLen+24
	.byte A#4
	.byte NLen+4
	.byte NRest
	.byte NLen+10
	.byte F4
	.byte NLen+4
	.byte NRest
	.byte NLen+23
	.byte E4
	.byte NLen+3
	.byte E4
	.byte NLen+2
	.byte NRest
	.byte NLen+3
	.byte F4
	.byte NLen+2
	.byte NRest
	.byte NLen+3
	.byte F#4
	.byte NLen+2
	.byte NRest
	.byte NLen+42
	.byte G4
	.byte NLen+4
	.byte NRest
Underwater_P1Loop:
	.byte SongLoop,2
	.byte NLen+42
	.byte NRest
	.byte SegCall
	.word Underwater_PSub1
	.byte NLen+42
	.byte NRest
	.byte Transpose, 1
	.byte SegCall
	.word Underwater_P1Sub1
	.byte SongLoopEnd
	.byte SongLoop,2
	.byte SegCall
	.word Underwater_PSub1
	.byte SegCall
	.word Underwater_PSub1
	.byte SegCall
	.word Underwater_PSub2
	.byte Transpose, 2
	.byte SegCall
	.word Underwater_P1Sub1
	.byte SegCall
	.word Underwater_P1Sub2
	.byte Transpose, 3
	.byte SegCall
	.word Underwater_P1Sub1
	.byte SegCall
	.word Underwater_PSub2
	.byte Transpose, 2
	.byte SegCall
	.word Underwater_P1Sub2
	.byte SegCall
	.word Underwater_PSub1
	.byte SegCall
	.word Underwater_PSub1
	.byte SegCall
	.word Underwater_PSub2
	.byte Transpose, 2
	.byte SegCall
	.word Underwater_P1Sub1
	.byte SegCall
	.word Underwater_PSub2
	.byte SegCall
	.word Underwater_P1Sub3
	.byte SegCall
	.word Underwater_PSub1
	.byte NLen+42
	.byte NRest
	.byte SongLoopEnd
	.byte SongLoop,2
	.byte Transpose, 5
	.byte SegCall
	.word Underwater_P1Sub1
	.byte SegCall
	.word Underwater_P1Sub1
	.byte Transpose, 0
	.byte SegCall
	.word Underwater_P1Sub4
	.byte SegCall
	.word Underwater_P1Sub4
	.byte SegCall
	.word Underwater_P1Sub5
	.byte SegCall
	.word Underwater_P1Sub5
	.byte SegCall
	.word Underwater_P1Sub6
	.byte Transpose, 2
	.byte NLen+14
	.byte NRest
	.byte SegCall
	.word Underwater_P1Sub2T
	.byte NLen+14
	.byte NRest
	.byte SongLoopEnd
	.byte SegCall
	.word Underwater_PSub1
	.byte SegCall
	.word Underwater_PSub1
	.byte SegCall
	.word Underwater_PSub2
	.byte Transpose, 2
	.byte SegCall
	.word Underwater_P1Sub1
	.byte SegCall
	.word Underwater_PSub2
	.byte SegCall
	.word Underwater_P1Sub3
	.byte SegCall
	.word Underwater_PSub1
	.byte NLen+42
	.byte NRest
	.byte $F4
	.word Underwater_P1Loop
	.byte $FF
Underwater_P1Sub1:
	.byte NLen+14
	.byte NRest
	.byte NLen+2
	.byte A2
	.byte C3
	.byte NLen+10
	.byte NRest
	.byte NLen+2
	.byte A2
	.byte C3
	.byte NLen+10
	.byte NRest
	.byte SegEnd
Underwater_P1Sub2:
	.byte NLen+14
	.byte NRest
	.byte NLen+2
	.byte A#2
	.byte D3
	.byte NLen+10
	.byte NRest
Underwater_P1Sub2T:
	.byte NLen+2
	.byte A#2
	.byte D3
	.byte NLen+10
	.byte NRest
	.byte SegEnd
Underwater_P1Sub3:
	.byte NLen+14
	.byte NRest
	.byte NLen+2
	.byte A#2
	.byte C3
	.byte NLen+10
	.byte NRest
	.byte NLen+2
	.byte A#2
	.byte C3
	.byte NLen+10
	.byte NRest
	.byte SegEnd
Underwater_P1Sub4:
	.byte NLen+14
	.byte NRest
	.byte NLen+2
	.byte C3
	.byte F3
	.byte NLen+10
	.byte NRest
	.byte NLen+2
	.byte C3
	.byte F3
	.byte NLen+10
	.byte NRest
	.byte SegEnd
Underwater_P1Sub5:
	.byte NLen+14
	.byte NRest
	.byte NLen+2
	.byte B2
	.byte F3
	.byte NLen+10
	.byte NRest
	.byte NLen+2
	.byte B2
	.byte F3
	.byte NLen+10
	.byte NRest
	.byte SegEnd
Underwater_P1Sub6:
	.byte NLen+14
	.byte NRest
	.byte NLen+2
	.byte A#2
	.byte F3
	.byte NLen+10
	.byte NRest
	.byte NLen+2
	.byte A#2
	.byte F3
	.byte NLen+10
	.byte NRest
	.byte SegEnd
Underwater_P2:
	.byte Transpose, $00
	.byte DutySet, $7B
	.byte PitchSet, $0F
	.byte VolSet, $09
	.byte NLen+38
	.byte F4
	.byte NLen+4
	.byte NRest
	.byte NLen+24
	.byte D4
	.byte NLen+4
	.byte NRest
	.byte NLen+10
	.byte A#3
	.byte NLen+4
	.byte NRest
	.byte NLen+23
	.byte G3
	.byte NLen+3
	.byte G3
	.byte NLen+2
	.byte NRest
	.byte NLen+3
	.byte G#3
	.byte NLen+2
	.byte NRest
	.byte NLen+3
	.byte A3
	.byte NLen+2
	.byte NRest
	.byte NLen+42
	.byte A#3
	.byte NLen+4
	.byte NRest
Underwater_P2Loop:
	.byte SegCall
	.word Underwater_PSub1
	.byte SegCall
	.word Underwater_P2Sub4
	.byte SegCall
	.word Underwater_PSub2
	.byte SegCall
	.word Underwater_P2Sub5
	.byte NLen+28
	.byte D6
	.byte SegCall
	.word Underwater_PSub1
	.byte SegCall
	.word Underwater_P2Sub4
	.byte SegCall
	.word Underwater_PSub2
	.byte SegCall
	.word Underwater_P2Sub5
	.byte NLen+28
	.byte E6
	.byte SegCall
	.word Underwater_P2Sub1
	.byte SegCall
	.word Underwater_P2Sub1
	.byte SegCall
	.word Underwater_P2Sub3
	.byte NLen+14
	.byte D#3
	.byte NLen+70
	.byte D3
	.byte Transpose, 0
	.byte DutySet, $7B
	.byte VolSet, $19
	.byte NLen+2
	.byte C3
	.byte E3
	.byte NLen+10
	.byte NRest
	.byte SegCall
	.word Underwater_P2Sub3
	.byte NLen+14
	.byte G2
	.byte NLen+70
	.byte G3
	.byte Transpose, 0
	.byte DutySet, $7B
	.byte VolSet, $19
	.byte NLen+2
	.byte C3
	.byte E3
	.byte NLen+10
	.byte NRest
	.byte Transpose, $11
	.byte PitchSet, $0B
	.byte VolSet, $0A
	.byte SegCall
	.word Underwater_P2Sub2
	.byte $F4
	.word Underwater_P2Loop
	.byte $FF
Underwater_P2Sub1:
	.byte Transpose, $11
	.byte DutySet, $7B
	.byte PitchSet, $0B
	.byte VolSet, $0A
	.byte NLen+42
	.byte E3
	.byte NLen+28
	.byte C3
	.byte NLen+14
	.byte G2
	.byte NLen+28
	.byte A2
	.byte NLen+14
	.byte C3
	.byte NLen+42
	.byte C3
	.byte NLen+28
	.byte G2
	.byte NLen+14
	.byte C3
	.byte NLen+28
	.byte C3
	.byte NLen+14
	.byte G3
	.byte NLen+42
	.byte E3
	.byte D3
Underwater_P2Sub2:
	.byte NLen+42
	.byte E3
	.byte NLen+28
	.byte C3
	.byte NLen+14
	.byte G2
	.byte NLen+28
	.byte A2
	.byte NLen+14
	.byte C3
	.byte NLen+42
	.byte C3
	.byte NLen+28
	.byte G2
	.byte NLen+14
	.byte C3
	.byte F3
	.byte E3
	.byte D3
	.byte NLen+42
	.byte C3
	.byte SongJump
	.word Underwater_PSub1
Underwater_P2Sub3:
	.byte Transpose, $11
	.byte PitchSet, $0D
	.byte VolSet, $0C
	.byte NLen+42
	.byte E3
	.byte NLen+28
	.byte C3
	.byte NLen+14
	.byte G2
	.byte NLen+42
	.byte E3
	.byte C3
	.byte D#3
	.byte NLen+28
	.byte C3
	.byte SegEnd
Underwater_P2Sub4:
	.byte PitchSet, $0F
	.byte DutySet, $07
	.byte VolSet, $10
	.byte NLen+3
	.byte C5
	.byte NLen+4
	.byte D5
	.byte NLen+3
	.byte F5
	.byte NLen+4
	.byte A5
	.byte NLen+28
	.byte C6
	.byte SegEnd
Underwater_P2Sub5:
	.byte PitchSet, $0F
	.byte DutySet, $07
	.byte VolSet, $10
	.byte NLen+3
	.byte D5
	.byte NLen+4
	.byte E5
	.byte NLen+3
	.byte G5
	.byte NLen+4
	.byte A#5
	.byte SegEnd
Underwater_PSub1:
	.byte NLen+14
	.byte NRest
	.byte Transpose, 0
	.byte DutySet, $7B
	.byte VolSet, $19
	.byte NLen+2
	.byte A2
	.byte C3
	.byte NLen+10
	.byte NRest
	.byte NLen+2
	.byte A2
	.byte C3
	.byte NLen+10
	.byte NRest
	.byte SegEnd
Underwater_PSub2:
	.byte NLen+14
	.byte NRest
	.byte Transpose, 0
	.byte DutySet, $7B
	.byte VolSet, $19
	.byte NLen+2
	.byte A#2
	.byte D3
	.byte NLen+10
	.byte NRest
	.byte NLen+2
	.byte A#2
	.byte D3
	.byte NLen+10
	.byte NRest
	.byte SegEnd
Underwater_Tri:
	.byte Transpose, $00
	.byte DutySet, $7B
	.byte PitchSet, $0F
	.byte VolSet, $09
	.byte NLen+38
	.byte G3
	.byte NLen+4
	.byte NRest
	.byte NLen+24
	.byte G3
	.byte NLen+4
	.byte NRest
	.byte NLen+10
	.byte G3
	.byte NLen+4
	.byte NRest
	.byte NLen+23
	.byte C2
	.byte NLen+3
	.byte C2
	.byte NLen+2
	.byte NRest
	.byte NLen+3
	.byte D2
	.byte NLen+2
	.byte NRest
	.byte NLen+3
	.byte D#2
	.byte NLen+2
	.byte NRest
	.byte NLen+42
	.byte E2
	.byte NLen+4
	.byte NRest
Underwater_TriLoop:
	.byte SegCall
	.word Underwater_TriSub1
	.byte NLen+24
	.byte C2
	.byte NLen+18
	.byte NRest
	.byte SegCall
	.word Underwater_TriSub1
	.byte NLen+7
	.byte C2
	.byte NRest
	.byte D2
	.byte NRest
	.byte E2
	.byte NRest
	.byte SegCall
	.word Underwater_TriSub2
	.byte SegCall
	.word Underwater_TriSub2
	.byte SegCall
	.word Underwater_TriSub4
	.byte SegCall
	.word Underwater_TriSub4
	.byte SegCall
	.word Underwater_TriSub3
	.byte $F4
	.word Underwater_TriLoop
	.byte $FF
Underwater_TriSub1:
	.byte NLen+24
	.byte F2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte D2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte NLen+18
	.byte NRest
	.byte SegEnd
Underwater_TriSub2:
	.byte NLen+24
	.byte F2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte A2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte A#2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte B2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte A2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte G#2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte NLen+18
	.byte NRest
	.byte NLen+7
	.byte C2
	.byte NRest
	.byte D2
	.byte NRest
	.byte E2
	.byte NRest
Underwater_TriSub3:
	.byte NLen+24
	.byte F2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte A2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte A#2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte B2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte C3
	.byte NLen+18
	.byte NRest
	.byte NLen+7
	.byte F2
	.byte NRest
	.byte C3
	.byte NRest
	.byte A2
	.byte NRest
	.byte NLen+24
	.byte F2
	.byte NLen+18
	.byte NRest
	.byte SegEnd
Underwater_TriSub4:
	.byte NLen+24
	.byte A#2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte A#2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte A2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte A2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte G#2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte G#2
	.byte NLen+18
	.byte NRest
	.byte NLen+24
	.byte G2
	.byte NLen+18
	.byte NRest
	.byte NLen+7
	.byte C2
	.byte NRest
	.byte D2
	.byte NRest
	.byte E2
	.byte NRest
	.byte SegEnd
Underwater_End:
	.byte $FF
Underwater_Footer:
	.byte NRest
	.word Underwater_P1
	.byte $01
	.word Underwater_P2
	.byte $02
	.word Underwater_Tri
	.byte $03
	.word Underwater_End
	.byte $04
	.word Underwater_End
	.byte $FF