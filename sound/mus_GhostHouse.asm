GhostHouse_P1:
GhostHouse_P1Loop:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte $1A
	.byte DutySet
	.byte NRest
	.byte PitchSet
	.byte NRest
	.byte VolSet
	.byte $33
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	transpose 24
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	.byte Transpose
	.byte $16
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	playsegment GhostHouse_P1Seq2
	sndjump GhostHouse_P1Loop
	.byte $FF
GhostHouse_P1Seq:
	.byte $8A
	.byte A3
	.byte B3
	.byte $2B
	.byte A3
	.byte A3
	.byte B3
	.byte $2B
	.byte A3
	endsegment

GhostHouse_P1Seq2:
	.byte $8A
	.byte A3
	.byte B3
	.byte $2B
	.byte B3
	.byte A3
	.byte B3
	.byte $2B
	.byte B3
	endsegment

GhostHouse_P2Tri:
GhostHouse_P2TriLoop:
	.byte Transpose
	.byte $0E
	playsegment GhostHouse_P2Seq
	playsegment GhostHouse_P2Seq2
	.byte Transpose
	.byte $0C
	playsegment GhostHouse_P2Seq
	playsegment GhostHouse_P2Seq2
	.byte Transpose
	.byte $0A
	playsegment GhostHouse_P2Seq
	playsegment GhostHouse_P2Seq2
	sndjump GhostHouse_P2TriLoop
	.byte $FF
GhostHouse_P2Seq:
	.byte DutySet
	.byte NRest
	.byte PitchSet
	.byte $62
	.byte VolSet
	.byte $02
	.byte $94
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
	endsegment

GhostHouse_P2Seq2:
	.byte DutySet
	.byte $12
	.byte PitchSet
	.byte NRest
	.byte VolSet
	.byte $11
	.byte $D0
	.byte C2
	.byte $A8
	.byte $15
	.byte $10
	.byte $11
	.byte $D0
	.byte $15
	.byte $94
	.byte NRest
	.byte NRest
	.byte $A8
	.byte $10
	.byte $15
	.byte $1C
	.byte $D0
	.byte C2
	.byte $17
	.byte $94
	.byte NRest
	.byte NRest
	endsegment

GhostHouse_End:
	.byte $FF
GhostHouse_Footer:
	mussq1 GhostHouse_P1
	mussq2 GhostHouse_P2Tri
	mustri GhostHouse_P2Tri
	musnoise GhostHouse_End
	musdpcm GhostHouse_End
	.byte $FF