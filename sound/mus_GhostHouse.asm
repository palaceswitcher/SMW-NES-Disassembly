GhostHouse_P1:
GhostHouse_P1Loop:
	db $F5
	db $01
	db Transpose
	db $1A
	db DutySet
	db NRest
	db PitchSet
	db NRest
	db VolSet
	db $33
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
	db Transpose
	db $16
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
	db $FF
GhostHouse_P1Seq:
	db $8A
	db A3
	db B3
	db $2B
	db A3
	db A3
	db B3
	db $2B
	db A3
	endsegment

GhostHouse_P1Seq2:
	db $8A
	db A3
	db B3
	db $2B
	db B3
	db A3
	db B3
	db $2B
	db B3
	endsegment

GhostHouse_P2Tri:
GhostHouse_P2TriLoop:
	db Transpose
	db $0E
	playsegment GhostHouse_P2Seq
	playsegment GhostHouse_P2Seq2
	db Transpose
	db $0C
	playsegment GhostHouse_P2Seq
	playsegment GhostHouse_P2Seq2
	db Transpose
	db $0A
	playsegment GhostHouse_P2Seq
	playsegment GhostHouse_P2Seq2
	sndjump GhostHouse_P2TriLoop
	db $FF
GhostHouse_P2Seq:
	db DutySet
	db NRest
	db PitchSet
	db $62
	db VolSet
	db $02
	db $94
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	db NRest
	endsegment

GhostHouse_P2Seq2:
	db DutySet
	db $12
	db PitchSet
	db NRest
	db VolSet
	db $11
	db $D0
	db C2
	db $A8
	db $15
	db $10
	db $11
	db $D0
	db $15
	db $94
	db NRest
	db NRest
	db $A8
	db $10
	db $15
	db $1C
	db $D0
	db C2
	db $17
	db $94
	db NRest
	db NRest
	endsegment

GhostHouse_End:
	db $FF
GhostHouse_Footer:
	mussq1 GhostHouse_P1
	mussq2 GhostHouse_P2Tri
	mustri GhostHouse_P2Tri
	musnoise GhostHouse_End
	musdpcm GhostHouse_End
	db $FF