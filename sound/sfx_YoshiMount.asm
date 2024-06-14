YoshiMount_DPCM:
	.byte SongSpeed, 1
	.byte NLen+14
	.byte SFXYoshi1
	.byte NLen+11
	.byte SFXYoshi2
	.byte $FF
YoshiMount_Footer:
	.byte $84
	.word YoshiMount_DPCM
	.byte $FF