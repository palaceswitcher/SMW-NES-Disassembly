Powerdown_P1Noise:
	.byte SongSpeed, 1
	.byte Transpose, $0
	.byte DutySet, $00
	.byte PitchSet, $05
	.byte SongSweep, $B1
	.byte VolSet, $11
	.byte NLen+2
	.byte SongLoop, 3
	.byte A3
	.byte D3
	.byte A3
	.byte D3
	.byte G2
	.byte C2
	.byte F1
	.byte SongLoopEnd
	.byte $FF
Powerdown_Footer:
	.byte $80
	.word Powerdown_P1Noise
	.byte $FF