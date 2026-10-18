.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl9_8A8A
tbl9_8A8A:
	.word spinyWalk1
	.word spinyWalk2
spinyWalk1:
	.byte $02
	.byte $02
	.byte $A6
	.byte $14, $15
	.byte $16, $17
spinyWalk2:
	.byte $02
	.byte $02
	.byte $A6
	.byte $14, $15
	.byte $18, $19
; Unused ball sprites --->
	.byte $02
	.byte $02
	.byte $A6
	.byte $1A, $1B
	.byte $1E, $1F
;-----
	.byte $02
	.byte $02
	.byte $A6
	.byte $1C, $1D
	.byte $20, $21
; <---
