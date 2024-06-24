InvincibleStar_P1:
InvincibleStar_P1Loop:
	.byte DutySet, $3C
	.byte PitchSet, $05
	.byte VolSet, $3B
	.byte Transpose, $00
	.byte NLen+6
	.byte F3
	.byte NRest
	.byte F3
	.byte NRest
	.byte NLen+12
	.byte F3
	.byte NLen+6
	.byte D3
	.byte F3
	.byte NRest
	.byte NLen+12
	.byte F3
	.byte NLen+6
	.byte D3
	.byte F3
	.byte D3
	.byte NLen+12
	.byte F3
	.byte NLen+6
	.byte E3
	.byte NRest
	.byte E3
	.byte NRest
	.byte NLen+12
	.byte E3
	.byte NLen+6
	.byte C3
	.byte E3
	.byte NRest
	.byte NLen+12
	.byte E3
	.byte NLen+6
	.byte C3
	.byte E3
	.byte C3
	.byte NLen+12
	.byte E3
	.byte SongJump
	.word InvincibleStar_P1Loop
	.byte $FF
InvincibleStar_P2:
	.byte SongSpeed, 1
InvincibleStar_P2Loop:
	.byte DutySet, $3C
	.byte PitchSet, $05
	.byte VolSet, $3B
	.byte Transpose, $01
	.byte SegCall
	.word InvincibleStar_P2Sub
	.byte Transpose, $00
	.byte SegCall
	.word InvincibleStar_P2Sub
	.byte SongJump
	.word InvincibleStar_P2Loop
	.byte $FF
InvincibleStar_P2Sub:
	.byte NLen+6
	.byte B3
	.byte NRest
	.byte B3
	.byte NRest
	.byte NLen+12
	.byte B3
	.byte NLen+6
	.byte NRest
	.byte B3
	.byte NRest
	.byte NLen+12
	.byte B3
	.byte NLen+6
	.byte NRest
	.byte B3
	.byte NRest
	.byte NLen+12
	.byte B3
	.byte SegEnd
InvincibleStar_Tri:
InvincibleStar_TriLoop:
	.byte DutySet, $07
	.byte PitchSet, $05
	.byte VolSet, $02
	.byte Transpose, $02
	.byte SegCall
	.word InvincibleStar_TriSub
	.byte Transpose, $00
	.byte SegCall
	.word InvincibleStar_TriSub
	.byte SongJump
	.word InvincibleStar_TriLoop
	.byte $FF
InvincibleStar_TriSub:
	.byte NLen+18
	.byte C3
	.byte NLen+6
	.byte NRest
	.byte NLen+12
	.byte G3
	.byte NLen+6
	.byte NRest
	.byte NLen+12
	.byte C4
	.byte NLen+18
	.byte NRest
	.byte NLen+9
	.byte G3
	.byte NLen+3
	.byte NRest
	.byte NLen+9
	.byte C4
	.byte NLen+3
	.byte NRest
	.byte SegEnd
InvincibleStar_Noise:
InvincibleStar_NoiseLoop:
	.byte Transpose, $00
	.byte DutySet, $00
	.byte PitchSet, 0
	.byte VolSet, $77
	.byte NLen+6
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $23
	.byte NRest
	.byte $20
	.byte $20
	.byte SongJump
	.word InvincibleStar_NoiseLoop
	.byte $FF
InvincibleStar_End:
	.byte $FF
InvincibleStar_Footer:
	.byte $00
	.word InvincibleStar_P2
	.byte $01
	.word InvincibleStar_P1
	.byte $02
	.word InvincibleStar_Tri
	.byte $03
	.word InvincibleStar_Noise
	.byte $04
	.word InvincibleStar_End
	.byte $FF