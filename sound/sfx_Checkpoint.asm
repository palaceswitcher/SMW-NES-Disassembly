Checkpoint_P1:
	.byte SongSpeed, 1
	.byte Transpose, 18
	.byte DutySet, $38
	.byte PitchSet, $3F
	.byte SongSweep, $9B
	.byte VolSet, $11
	.byte NLen+4
	.byte C4
	.byte SongSweep, $A4
	.byte NLen+24
	.byte B5
	.byte $FF
Checkpoint_Footer:
	.byte $80
	.word Checkpoint_P1
	.byte $FF