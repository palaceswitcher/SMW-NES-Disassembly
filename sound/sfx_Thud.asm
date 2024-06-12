Thud_P1:
	.byte SongSpeed, $01
	.byte Transpose
	.byte NRest
	.byte DutySet, $34
	.byte PitchSet
	.byte $39
	.byte VolSet, $41
	.byte $9C
	.byte $15
	.byte $FF
Thud_Footer:
	.byte $80
	.word Thud_P1
	.byte $FF