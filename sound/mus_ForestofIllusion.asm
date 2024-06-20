ForestofIllusion_P1:
ForestofIllusion_P1Loop:
	.byte Transpose, $03
	.byte DutySet, $12
	.byte PitchSet, 0
	.byte VolSet, $11
	.byte SongLoop,2
	.byte NLen+7
	.byte A3
	.byte B3
	.byte NLen+14
	.byte A3
	.byte NLen+7
	.byte A3
	.byte B3
	.byte NLen+14
	.byte A3
	.byte A3
	.byte NLen+28
	.byte A4
	.byte NLen+14
	.byte A4
	.byte G#4
	.byte NLen+7
	.byte B3
	.byte NRest
	.byte B3
	.byte NRest
	.byte B3
	.byte NRest
	.byte NLen+42
	.byte B3
	.byte NLen+14
	.byte NRest
	.byte SongLoopEnd
	.byte SegCall
	.word ForestofIllusion_P1Sub
	.byte NLen+28
	.byte D4
	.byte Transpose, $02
	.byte SegCall
	.word ForestofIllusion_P1Sub
	.byte NLen+28
	.byte D4
	.byte Transpose, $03
	.byte SegCall
	.word ForestofIllusion_P1Sub
	.byte NLen+14
	.byte D4
	.byte NLen+28
	.byte A4
	.byte NLen+70
	.byte G#4
	.byte NLen+28
	.byte NRest
	.byte $F4
	.word ForestofIllusion_P1Loop
	.byte $FF
ForestofIllusion_P1Sub:
	.byte NLen+14
	.byte D4
	.byte NLen+7
	.byte C4
	.byte NRest
	.byte C4
	.byte NRest
	.byte NLen+14
	.byte D4
	.byte NLen+7
	.byte C4
	.byte NRest
	.byte C4
	.byte NRest
	.byte SegEnd
ForestofIllusion_P2:
	.byte SongSpeed, $01
ForestofIllusion_P2Loop:
	.byte Transpose, $00
	.byte DutySet, $17
	.byte PitchSet, $16
	.byte VolSet, $14
	.byte SongLoop,2
	.byte NLen+56
	.byte G#1
	.byte NLen+14
	.byte C3
	.byte NLen+42
	.byte D#3
	.byte NLen+56
	.byte G1
	.byte NLen+14
	.byte F#3
	.byte NLen+42
	.byte G3
	.byte SongLoopEnd
	.byte NLen+14
	.byte F#3
	.byte NRest
	.byte NRest
	.byte F#3
	.byte NRest
	.byte NRest
	.byte NLen+28
	.byte F#3
	.byte NLen+14
	.byte F3
	.byte NRest
	.byte NRest
	.byte F3
	.byte NRest
	.byte NRest
	.byte NLen+28
	.byte F3
	.byte NLen+14
	.byte F#3
	.byte NRest
	.byte NRest
	.byte F#3
	.byte NRest
	.byte NRest
	.byte NLen+28
	.byte F#3
	.byte NLen+56
	.byte F3
	.byte NRest
	.byte $F4
	.word ForestofIllusion_P2Loop
	.byte $FF
ForestofIllusion_Tri:
ForestofIllusion_TriLoop:
	.byte Transpose, $00
	.byte DutySet, $07
	.byte PitchSet, $39
	.byte VolSet, $11
	.byte SongLoop,2
	.byte NLen+28
	.byte G#2
	.byte D#3
	.byte NLen+14
	.byte D#4
	.byte NLen+42
	.byte G#4
	.byte NLen+28
	.byte G2
	.byte G3
	.byte NLen+14
	.byte A#4
	.byte NLen+42
	.byte B4
	.byte SongLoopEnd
	.byte Transpose, $0C
	.byte NLen+14
	.byte A#3
	.byte NRest
	.byte NRest
	.byte A#3
	.byte NRest
	.byte NRest
	.byte NLen+28
	.byte A#3
	.byte NLen+14
	.byte A3
	.byte NRest
	.byte NRest
	.byte A3
	.byte NRest
	.byte NRest
	.byte NLen+28
	.byte A3
	.byte NLen+14
	.byte A#3
	.byte NRest
	.byte NRest
	.byte A#3
	.byte NRest
	.byte NRest
	.byte NLen+28
	.byte A#3
	.byte NLen+56
	.byte A3
	.byte NRest
	.byte $F4
	.word ForestofIllusion_TriLoop
	.byte $FF
ForestofIllusion_End:
	.byte $FF
ForestofIllusion_Footer:
	.byte NRest
	.word ForestofIllusion_P2
	.byte $01
	.word ForestofIllusion_P1
	.byte $02
	.word ForestofIllusion_Tri
	.byte $03
	.word ForestofIllusion_End
	.byte $04
	.word ForestofIllusion_End
	.byte $FF