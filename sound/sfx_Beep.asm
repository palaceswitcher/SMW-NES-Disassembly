Beep_P1:
	.byte SongSpeed, 1
	.byte Transpose, $00
	.byte DutySet, $38
	.byte PitchSet, $05
	.byte VolSet, $41
	.byte NLen+1
	.byte E6
	.byte F6
	.byte F#6
	.byte NLen+2
	.byte G6
	.byte $FF
Beep_Footer:
	.byte $80
	.word Beep_P1
	.byte $FF