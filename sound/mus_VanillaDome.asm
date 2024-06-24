VanillaDome_P1Tri:
	.byte SongSpeed, 1
	.byte DutySet, $12
	.byte PitchSet, $00
	.byte VolSet, $11
	.byte Transpose, $05
	.byte SegCall
	.word VanillaDome_P1TriSub
	.byte Transpose, $08
	.byte SegCall
	.word VanillaDome_P1TriSub
VanillaDome_P1TriLoop:
	.byte SongLoop, 2
	.byte Transpose, $05
	.byte SegCall
	.word VanillaDome_P1TriSub
	.byte Transpose, $08
	.byte SegCall
	.word VanillaDome_P1TriSub
	.byte SongLoopEnd
	.byte Transpose, $0B
	.byte SegCall
	.word VanillaDome_P1TriSub
	.byte Transpose, $04
	.byte SegCall
	.word VanillaDome_P1TriSub
	.byte $F4
	.word VanillaDome_P1TriLoop
	.byte $FF
VanillaDome_P1TriSub:
	.byte NLen+20
	.byte A1
	.byte NRest
	.byte NRest
	.byte NLen+5
	.byte A1
	.byte NRest
	.byte A1
	.byte NRest
	.byte NLen+80
	.byte NRest
	.byte SegEnd
VanillaDome_P2:
	.byte DutySet, $07
	.byte PitchSet, $39
	.byte VolSet, $11
	.byte NLen+80
	.byte NRest
	.byte NRest
	.byte NRest
	.byte NRest
VanillaDome_P2Loop:
	.byte SongLoop, 2
	.byte Transpose, $1d
	.byte SegCall
	.word VanillaDome_P2Sub
	.byte NLen+5
	.byte G3
	.byte NLen+35
	.byte G4
	.byte Transpose, $1c
	.byte SegCall
	.word VanillaDome_P2Sub
	.byte NLen+5
	.byte G3
	.byte NLen+35
	.byte G4
	.byte SongLoopEnd
	.byte Transpose, $1b
	.byte SegCall
	.word VanillaDome_P2Sub
	.byte NLen+40
	.byte NRest
	.byte Transpose, $1a
	.byte SegCall
	.word VanillaDome_P2Sub
	.byte NLen+40
	.byte NRest
	.byte $F4
	.word VanillaDome_P2Loop
	.byte $FF
VanillaDome_P2Sub:
	.byte NLen+5
	.byte G3
	.byte C#3
	.byte G2
	.byte C#2
	.byte G2
	.byte C#3
	.byte NLen+80
	.byte G3
	.byte NLen+10
	.byte NRest
	.byte SegEnd
VanillaDome_Noise:
	.byte Transpose, $00
	.byte DutySet, $00
	.byte PitchSet, $00
	.byte VolSet, $53
VanillaDome_NoiseLoop:
	.byte NLen+10
	.byte $20
	.byte $F4
	.word VanillaDome_NoiseLoop
	.byte $FF
VanillaDome_DPCM:
	.byte Transpose, $00
	.byte SegCall
	.word VanillaDome_DPCMSub
VanillaDome_DPCMLoop:
	.byte SegCall
	.word VanillaDome_DPCMSub
	.byte SegCall
	.word VanillaDome_DPCMSub
	.byte NLen+40
	.byte KickDrum
	.byte NLen+30
	.byte PowerSnare
	.byte NLen+20
	.byte KickDrum
	.byte KickDrum
	.byte NLen+10
	.byte KickDrum
	.byte NLen+30
	.byte PowerSnare
	.byte NLen+10
	.byte KickDrum
	.byte NLen+40
	.byte KickDrum
	.byte NLen+30
	.byte PowerSnare
	.byte NLen+20
	.byte KickDrum
	.byte NLen+2
	.byte PowerSnare
	.byte NLen+8
	.byte PowerSnare
	.byte NLen+10
	.byte KickDrum
	.byte KickDrum
	.byte NLen+2
	.byte PowerSnare
	.byte NLen+8
	.byte PowerSnare
	.byte NLen+10
	.byte KickDrum
	.byte NLen+2
	.byte PowerSnare
	.byte NLen+8
	.byte PowerSnare
	.byte NLen+2
	.byte PowerSnare
	.byte NLen+8
	.byte PowerSnare
	.byte $F4
	.word VanillaDome_DPCMLoop
	.byte $FF
VanillaDome_DPCMSub:
	.byte NLen+40
	.byte KickDrum
	.byte NLen+30
	.byte PowerSnare
	.byte NLen+20
	.byte KickDrum
	.byte KickDrum
	.byte NLen+10
	.byte KickDrum
	.byte NLen+30
	.byte PowerSnare
	.byte NLen+10
	.byte KickDrum
	.byte NLen+40
	.byte KickDrum
	.byte NLen+30
	.byte PowerSnare
	.byte NLen+20
	.byte KickDrum
	.byte NLen+10
	.byte KickDrum
	.byte KickDrum
	.byte KickDrum
	.byte NLen+30
	.byte PowerSnare
	.byte NLen+10
	.byte KickDrum
	.byte SegEnd
VanillaDome_Footer:
	.byte NRest
	.word VanillaDome_P1Tri
	.byte $01
	.word VanillaDome_P2
	.byte $02
	.word VanillaDome_P1Tri
	.byte $03
	.word VanillaDome_Noise
	.byte $04
	.word VanillaDome_DPCM
	.byte $FF