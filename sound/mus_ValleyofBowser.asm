ValleyofBowser_P1:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte C2
	.byte DutySet
	.byte $07
	.byte PitchSet
	.byte $05
	.byte VolSet
	.byte $02
	.byte $90
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
	.byte G#3
ValleyofBowser_P1Loop:
	.byte $C0
	.byte $2B
	.byte $90
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
	.byte $2B
	.byte $C0
	.byte G#3
	.byte $90
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
	.byte G#3
	.byte $F4
	.word ValleyofBowser_P1Loop
	.byte $FF
ValleyofBowser_P2:
ValleyofBowser_P2Loop:
	.byte Transpose
	.byte $01
	.byte DutySet
	.byte E4
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $41
	.byte $88
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $90
	.byte NRest
	.byte $15
	.byte $88
	.byte $15
	.byte $15
	.byte $90
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $88
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $90
	.byte NRest
	.byte $15
	.byte $88
	.byte $15
	.byte $15
	.byte $90
	.byte NRest
	.byte NRest
	.byte NRest
	.byte $F4
	.word ValleyofBowser_P2Loop
	.byte $FF
ValleyofBowser_Tri:
	.byte Transpose
	.byte $04
	.byte DutySet
	.byte $07
	.byte PitchSet
	.byte $05
	.byte VolSet
	.byte $02
	.byte $90
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
	.byte G#3
ValleyofBowser_TriLoop:
	.byte $C0
	.byte $2B
	.byte $90
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
	.byte $2B
	.byte $C0
	.byte G#3
	.byte $90
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
	.byte G#3
	.byte $F4
	.word ValleyofBowser_TriLoop
	.byte $FF
ValleyofBowser_Noise:
ValleyofBowser_NoiseLoop:
	.byte Transpose
	.byte $01
	.byte DutySet
	.byte NRest
	.byte PitchSet
	.byte NRest
	.byte VolSet
	.byte $53
	.byte $88
	.byte C3
	.byte C3
	.byte C3
	.byte C3
	.byte F3
	.byte C3
	.byte C3
	.byte C3
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