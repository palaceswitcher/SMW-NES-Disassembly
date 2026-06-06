.include "macros.asm"
.include "constants.asm"

Checkpoint_P1:
	sndspeed 1
	transpose 18
	duty $38
	pitch $39
	volenv $40
	notelen 3
	.byte F7-18, Ds7-18, Cs7-18, B6-18, As6-18, Gs6-18, Fs6-18
	.byte F6-18, Ds6-18, Cs6-18, B5-18, As5-18, Gs5-18, Fs5-18
	.byte $FF
Checkpoint_Footer:
	sfxsq1 Checkpoint_P1
	.byte $FF