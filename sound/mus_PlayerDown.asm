PlayerDown_P1:
	.byte SongSpeed, 1
	.byte Transpose, $00
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $41
	.byte NLen+2
	.byte E5
	.byte D5
	.byte E5
	.byte NLen+1
	.byte NRest
	.byte NLen+7
	.byte NRest
	.byte NRest
	.byte NRest
	.byte Transpose, $0C
	.byte DutySet, $79
	.byte PitchSet, 0
	.byte VolSet, $78
	.byte D#4
	.byte E4
	.byte D#4
	.byte E4
	.byte C4
	.byte G3
	.byte G#3
	.byte A3
	.byte D#3
	.byte E3
	.byte C3
	.byte G2
	.byte G#2
	.byte A2
	.byte D#2
	.byte E2
	.byte NLen+28
	.byte C2
	.byte NLen+21
	.byte C1
	.byte $FF
PlayerDown_P2:
	.byte Transpose, 0
	.byte DutySet, $79
	.byte PitchSet, 0
	.byte VolSet, $78
	.byte NLen+28
	.byte NRest
	.byte NLen+14
	.byte C2
	.byte C3
	.byte A#1
	.byte A#2
	.byte A1
	.byte A2
	.byte G1
	.byte G2
	.byte C1
	.byte NRest
	.byte NLen+28
	.byte C1
	.byte $FF
PlayerDown_Tri:
	.byte Transpose, 12
	.byte DutySet, $79
	.byte PitchSet, 0
	.byte VolSet, $78
	.byte NLen+28
	.byte NRest
	.byte NLen+14
	.byte C2
	.byte E3
	.byte A#1
	.byte D3
	.byte A1
	.byte C3
	.byte G1
	.byte B2
	.byte NLen+7
	.byte G2
	.byte NRest
	.byte NRest
	.byte NRest
	.byte G1
	.byte $FF
PlayerDown_End:
	.byte $FF
PlayerDown_Footer:
	.byte NRest
	.word PlayerDown_P1
	.byte $01
	.word PlayerDown_P2
	.byte $02
	.word PlayerDown_Tri
	.byte $03
	.word PlayerDown_End
	.byte $04
	.word PlayerDown_End
	.byte $FF