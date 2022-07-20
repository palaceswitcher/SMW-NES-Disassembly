Thud_P1:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte NRest
	.byte DutySet
	.byte E4
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $41
	.byte $9C
	.byte $15
	.byte $FF
Thud_Footer:
	.byte $80
	.word Thud_P1
	.byte $FF