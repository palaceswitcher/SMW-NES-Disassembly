GhostHouse_P1:
GhostHouse_P1Loop:
	.byte SongSpeed, $01
	.byte Transpose, $1A
	.byte DutySet, $00
	.byte PitchSet, $00
	.byte VolSet, $33
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte Transpose
	.byte C2
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte Transpose, $16
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F0
	.word GhostHouse_P1Seq2
	.byte $F4
	.word GhostHouse_P1Loop
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
	.byte $F1
	.byte $FF
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
	.byte $F1
	.byte $FF
GhostHouse_P2Tri:
GhostHouse_P2TriLoop:
	.byte Transpose, $0E
	.byte $F0
	.word GhostHouse_P2Seq
	.byte $F0
	.word GhostHouse_P2Seq2
	.byte Transpose, $0C
	.byte $F0
	.word GhostHouse_P2Seq
	.byte $F0
	.word GhostHouse_P2Seq2
	.byte Transpose, $0A
	.byte $F0
	.word GhostHouse_P2Seq
	.byte $F0
	.word GhostHouse_P2Seq2
	.byte $F4
	.word GhostHouse_P2TriLoop
	.byte $FF
GhostHouse_P2Seq:
	.byte DutySet, $00
	.byte PitchSet
	.byte $62
	.byte VolSet, $02
	.byte NLen+20
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
	.byte $F1
	.byte $FF
GhostHouse_P2Seq2:
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte $D0
	.byte C2
	.byte $A8
	.byte $15
	.byte $10
	.byte $11
	.byte $D0
	.byte $15
	.byte NLen+20
	.byte NRest
	.byte NRest
	.byte $A8
	.byte $10
	.byte $15
	.byte $1C
	.byte $D0
	.byte C2
	.byte $17
	.byte NLen+20
	.byte NRest
	.byte NRest
	.byte $F1
	.byte $FF
GhostHouse_End:
	.byte $FF
GhostHouse_Footer:
	.byte NRest
	.word GhostHouse_P1
	.byte $01
	.word GhostHouse_P2Tri
	.byte $02
	.word GhostHouse_P2Tri
	.byte $03
	.word GhostHouse_End
	.byte $04
	.word GhostHouse_End
	.byte $FF