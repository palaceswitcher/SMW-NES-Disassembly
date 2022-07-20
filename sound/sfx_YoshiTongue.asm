YoshiTongue_P1:
	.byte $F5
	.byte $01
	.byte Transpose
	.byte $09
	.byte DutySet
	.byte $12
	.byte PitchSet
	.byte NRest
	.byte VolSet
	.byte $13
	.byte $88
	.byte NRest
	.byte $84
	.byte $3A
	.byte DutySet
	.byte $38
	.byte PitchSet
	.byte $39
	.byte VolSet
	.byte $41
	.byte $90
	.byte $45
	.byte $FF
YoshiTongue_Footer:
	.byte $80
	.word YoshiTongue_P1
	.byte $FF