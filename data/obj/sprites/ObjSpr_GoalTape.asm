.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; This is pointed to in Spr_GlobalObjects.asm
.export sprMap_GoalTape
sprMap_GoalTape:
	.byte $03
	.byte $01
	.byte $A6
	.byte $37, $36, $36
	.byte $36 ; Excess byte, can be removed
