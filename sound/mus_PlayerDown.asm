PlayerDown_P1:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte $0C
	.byte DutySet
	.byte $38
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $41
	.byte $81
	.byte G5
	.byte NRest
	.byte B5
	.byte $87
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $81
	.byte NRest
	.byte Transpose
	.byte $0C
	.byte DutySet
	.byte NRest
	.byte PitchSet
	.byte NRest
	.byte VolSet
	.byte $53
	.byte $87
	.byte $33
	.byte E4
	.byte $33
	.byte E4
	.byte C4
	.byte $2B
	.byte A3
	.byte C4
	.byte G#3
	.byte A3
	.byte E3
	.byte C3
	.byte D3
	.byte C3
	.byte D3
	.byte E3
	.byte C3
	.byte NRest
	.byte NRest
	.byte NRest
	.byte DutySet
	.byte $17
	.byte PitchSet
	.byte $16
	.byte VolSet
	.byte $14
	.byte $9C
	.byte F2
	.byte $FF
PlayerDown_P2:
	.byte Transpose
	.byte NRest
	.byte DutySet
	.byte $12
	.byte PitchSet
	.byte NRest
	.byte VolSet
	.byte $11
	.byte $87
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $8E
	.byte C2
	.byte C3
	.byte $16
	.byte $22
	.byte $15
	.byte A2
	.byte $9C
	.byte $13
	.byte $87
	.byte C2
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $9C
	.byte F2
	.byte $FF
PlayerDown_End:
	.byte $FF
PlayerDown_Footer:
	mussq1 PlayerDown_P1
	mussq2 PlayerDown_P2
	mustri PlayerDown_End
	musnoise PlayerDown_End
	musdpcm PlayerDown_End
	.byte $FF