.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl9_8F59
tbl9_8F59:
	.word tbl9_8F61
	.word tbl9_8F68
	.word tbl9_8F6F
	.word tbl9_8F76
tbl9_8F61:
	.byte $02
	.byte $02
	.byte $A7
	.byte $2B, $2C
	.byte $36, $37
tbl9_8F68:
	.byte $02
	.byte $02
	.byte $A7
	.byte $2D, $2E
	.byte $38, $39
tbl9_8F6F:
	.byte $02
	.byte $02
	.byte $A7
	.byte $36, $37
	.byte $2B, $2C
tbl9_8F76:
	.byte $02
	.byte $02
	.byte $A7
	.byte $38, $39
	.byte $2D, $2E
