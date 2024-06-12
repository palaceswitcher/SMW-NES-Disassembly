ValleyofBowser_P1:
	.byte SongSpeed, $01
	.byte Transpose, $02
	.byte DutySet, $3B
	.byte PitchSet, $05
	.byte VolSet, $02
	.byte NLen+60
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NLen+45
	.byte NRest
	.byte NLen+15
	.byte G#2
ValleyofBowser_P1Loop:
	.byte NLen+90
	.byte G2
	.byte NRest
	.byte NLen+45
	.byte NRest
	.byte NLen+15
	.byte G2
	.byte NLen+90
	.byte G#2
	.byte NRest
	.byte NLen+45
	.byte NRest
	.byte NLen+15
	.byte G#2
	.byte $F4
	.word ValleyofBowser_P1Loop
	.byte $FF
ValleyofBowser_P2:
ValleyofBowser_P2Loop:
	.byte Transpose, $00
	.byte DutySet, $34
	.byte VolSet, $41
	.byte SegCall
	.word ValleyofBowser_P2Sub
	.byte E2
	.byte SegCall
	.word ValleyofBowser_P2Sub
	.byte B1
	.byte $F4
	.word ValleyofBowser_P2Loop
	.byte $FF
ValleyofBowser_P2Sub:
	.byte PitchSet, $39
	.byte NLen+7
	.byte NRest
	.byte NLen+8
	.byte E1
	.byte NLen+7
	.byte E1
	.byte NLen+8
	.byte E1
	.byte NLen+15
	.byte E1
	.byte NLen+7
	.byte E1
	.byte NLen+15
	.byte E1
	.byte NLen+8
	.byte E1
	.byte NLen+15
	.byte E1
	.byte E1
	.byte PitchSet, $3A
	.byte SegEnd
ValleyofBowser_Tri:
	.byte Transpose, $18
	.byte DutySet, $07
	.byte PitchSet, $05
	.byte VolSet, $02
	.byte NLen+60
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NLen+45
	.byte NRest
	.byte NLen+15
	.byte G#2
ValleyofBowser_TriLoop:
	.byte NLen+90
	.byte G2
	.byte NRest
	.byte NLen+45
	.byte NRest
	.byte NLen+15
	.byte G2
	.byte NLen+90
	.byte G#2
	.byte NRest
	.byte NLen+45
	.byte NRest
	.byte NLen+15
	.byte G#2
	.byte $F4
	.word ValleyofBowser_TriLoop
	.byte $FF
ValleyofBowser_Noise:
ValleyofBowser_NoiseLoop:
	.byte Transpose, $01
	.byte DutySet, 0
	.byte PitchSet, 0
	.byte VolSet, $53
	.byte NLen+7
	.byte $1e
	.byte NLen+8
	.byte $20
	.byte NLen+7
	.byte $20
	.byte NLen+8
	.byte $20
	.byte NLen+7
	.byte $28
	.byte NLen+8
	.byte $20
	.byte NLen+7
	.byte $20
	.byte NLen+8
	.byte $20
	.byte NLen+7
	.byte $20
	.byte NLen+8
	.byte $20
	.byte NLen+7
	.byte $1e
	.byte NLen+8
	.byte $20
	.byte NLen+7
	.byte $28
	.byte NLen+8
	.byte $20
	.byte NLen+7
	.byte $20
	.byte NLen+8
	.byte $20
	.byte $F4
	.word ValleyofBowser_NoiseLoop
	.byte $FF
ValleyofBowser_End:
	.byte $FF
ValleyofBowser_Footer:
	.byte NRest
	.word ValleyofBowser_P1
	.byte $01
	.word ValleyofBowser_P2
	.byte $02
	.word ValleyofBowser_Tri
	.byte $03
	.word ValleyofBowser_Noise
	.byte $04
	.word ValleyofBowser_End
	.byte $FF