Pause_P2:
	.byte SongSpeed, 1
	.byte Transpose, 24
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $7E
	.byte NLen+6
	.byte E3
	.byte C3
	.byte E3
	.byte NLen+16
	.byte C3
	.byte $FF
Pause_Footer:
	.byte $81
	.word Pause_P2
	.byte $FF