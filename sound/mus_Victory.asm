Victory_P1:
	.byte SongSpeed, $01
	.byte Transpose, 5
	.byte DutySet, $38
	.byte PitchSet, $00
	.byte VolSet, $28
	.byte SegCall
	.word Victory_Sweep
	.byte Transpose, $00
	.byte DutySet, $3D
	.byte PitchSet, $00
	.byte VolSet, $3B
	.byte SegCall
	.word Overworld_P1Sub3
	.byte $FF
Victory_P2:
	.byte Transpose, 0
	.byte DutySet, $38
	.byte PitchSet, $00
	.byte VolSet, $28
	.byte SegCall
	.word Victory_Sweep
	.byte Transpose, $0C
	.byte DutySet, $3D
	.byte PitchSet, $7A
	.byte VolSet, $3E
	.byte NLen+11
	.byte F3
	.byte NLen+16
	.byte NRest
	.byte NLen+11
	.byte F3
	.byte NLen+16
	.byte NRest
	.byte NLen+6
	.byte D3
	.byte NLen+7
	.byte NRest
	.byte NLen+18
	.byte F3
	.byte NLen+9
	.byte NRest
	.byte NLen+7
	.byte D3
	.byte NRest
	.byte NLen+11
	.byte F3
	.byte NLen+2
	.byte NRest
	.byte NLen+7
	.byte D3
	.byte NRest
	.byte NLen+6
	.byte C3
	.byte NLen+7
	.byte NRest
	.byte NLen+44
	.byte F3
	.byte NLen+10
	.byte NRest
	.byte NLen+7
	.byte D3
	.byte NRest
	.byte NLen+11
	.byte C4
	.byte NLen+2
	.byte NRest
	.byte NLen+7
	.byte D4
	.byte NRest
	.byte NLen+6
	.byte C4
	.byte NLen+7
	.byte NRest
	.byte D4
	.byte NRest
	.byte NLen+11
	.byte C4
	.byte NLen+9
	.byte NRest
	.byte NLen+4
	.byte C3
	.byte NLen+3
	.byte NRest
	.byte NLen+4
	.byte A#3
	.byte NLen+2
	.byte NRest
	.byte NLen+5
	.byte A3
	.byte NLen+2
	.byte NRest
	.byte NLen+11
	.byte G3
	.byte NLen+3
	.byte NRest
	.byte NLen+45
	.byte F3
	.byte NLen+36
	.byte NRest
	.byte NLen+11
	.byte F4
	.byte NLen+16
	.byte NRest
	.byte $FF
Victory_Sweep:
	.byte NLen+1
	.byte C#3
	.byte F#3
	.byte B3
	.byte E4
	.byte A4
	.byte D5
	.byte G5
	.byte NLen+2
	.byte C6
	.byte B5
	.byte A#5
	.byte A5
	.byte G#5
	.byte G5
	.byte F#5
	.byte F5
	.byte E5
	.byte D#5
	.byte D5
	.byte C#5
	.byte C5
	.byte B4
	.byte A#4
	.byte A4
	.byte G#4
	.byte G4
	.byte F#4
	.byte F4
	.byte E4
	.byte D#4
	.byte D4
	.byte NLen+1
	.byte C#4
	.byte SegEnd
Victory_Tri:
	.byte Transpose, $0C
	.byte DutySet, $3D
	.byte PitchSet, $7A
	.byte VolSet, $3E
	.byte NLen+54
	.byte NRest
	.byte NLen+11
	.byte A3
	.byte NLen+16
	.byte NRest
	.byte NLen+11
	.byte A3
	.byte NLen+16
	.byte NRest
	.byte NLen+6
	.byte F3
	.byte NLen+7
	.byte NRest
	.byte NLen+18
	.byte A3
	.byte NLen+9
	.byte NRest
	.byte NLen+7
	.byte F3
	.byte NRest
	.byte NLen+11
	.byte A3
	.byte NLen+2
	.byte NRest
	.byte NLen+7
	.byte F3
	.byte NRest
	.byte NLen+6
	.byte F3
	.byte NLen+7
	.byte NRest
	.byte NLen+44
	.byte A3
	.byte NLen+10
	.byte NRest
	.byte NLen+7
	.byte F3
	.byte NRest
	.byte NLen+11
	.byte E4
	.byte NLen+2
	.byte NRest
	.byte NLen+7
	.byte F4
	.byte NRest
	.byte NLen+6
	.byte E4
	.byte NLen+7
	.byte NRest
	.byte F4
	.byte NRest
	.byte NLen+11
	.byte E4
	.byte NLen+9
	.byte NRest
	.byte NLen+4
	.byte E3
	.byte NLen+3
	.byte NRest
	.byte NLen+4
	.byte D4
	.byte NLen+2
	.byte NRest
	.byte NLen+5
	.byte C4
	.byte NLen+2
	.byte NRest
	.byte NLen+11
	.byte A#3
	.byte NLen+3
	.byte NRest
	.byte NLen+45
	.byte A3
	.byte NLen+36
	.byte NRest
	.byte NLen+11
	.byte A4
	.byte NLen+16
	.byte NRest
	.byte $FF
Victory_DPCM:
	.byte NLen+54
	.byte NRest
	.byte SongLoop,8
	.byte SegCall
	.word Overworld_DPCMFMajor
	.byte SongLoopEnd
	.byte NLen+108
	.byte C5Minor7LongDown
	.byte SegCall
	.word Overworld_DPCMFMajor
	.byte SegCall
	.word Overworld_DPCMFMajor
	.byte NLen+27
	.byte FMajorDown
	.byte FMajorDown
	.byte $FF
Victory_End:
	.byte $FF
Victory_Footer:
	.byte NRest
	.word Victory_P1
	.byte $01
	.word Victory_P2
	.byte $02
	.word Victory_Tri
	.byte $03
	.word Victory_End
	.byte $04
	.word Victory_DPCM
	.byte $FF