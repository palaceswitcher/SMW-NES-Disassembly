Checkpoint_P1:
	.byte SongSpeed, 1
	.byte Transpose, 18
	.byte DutySet, $38
	.byte PitchSet, $39
	.byte VolSet, $40
	.byte NLen+3
	.byte B5, A5, G5, F5, E5, D5, C5
	.byte B4, A4, G4, F4, E4, D4, C4
	.byte $FF
Checkpoint_Footer:
	.byte $80
	.word Checkpoint_P1
	.byte $FF