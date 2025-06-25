Checkpoint_P1:
	sndspeed 1
	transpose 18
	duty $38
	pitch $39
	volenv $40
	notelen 3
	.byte F7-18, D#7-18, C#7-18, B6-18, A#6-18, G#6-18, F#6-18
	.byte F6-18, D#6-18, C#6-18, B5-18, A#5-18, G#5-18, F#5-18
	.byte $FF
Checkpoint_Footer:
	sfxsq1 Checkpoint_P1
	.byte $FF