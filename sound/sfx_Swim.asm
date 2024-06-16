Swim_DMC:
	.byte SongSpeed, 1
	.byte NLen+18
	.byte SFXSwim
	.byte $FF
Swim_Footer:
	.byte $84
	.word Swim_DMC
	.byte $FF