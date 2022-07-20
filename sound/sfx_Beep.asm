Beep_P1:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte $09
	.byte DutySet
	.byte $38
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $41
	.byte $82
	.byte $45
	.byte B5
	.byte $FF
Beep_Footer:
	.byte $80
	.word Beep_P1
	.byte $FF