.include "macros.asm"
.include "constants.asm"

Beep_P1:
	sndspeed 1
	transpose $09
	duty $38
	pitch $39
	volenv $41
	notelen 2
	.byte Fs6-9
	.byte Gs6-9
	.byte $FF
Beep_Footer:
	sfxsq1 Beep_P1
	.byte $FF