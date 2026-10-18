.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl9_8DD6
tbl9_8DD6:
	.word vPodoboo1
	.word vPodoboo2
	.word vPodoboo3
	.word vPodoboo4
vPodoboo1:
	.byte $02
	.byte $02
	.byte $AD
	.byte $2A
	.byte $2B
	.byte $2E
	.byte $2F
vPodoboo2:
	.byte $02
	.byte $02
	.byte $AD
	.byte $2C
	.byte $2D
	.byte $30
	.byte $31
vPodoboo3:
	.byte $02
	.byte $02
	.byte $AD
	.byte $2E
	.byte $2F
	.byte $2A
	.byte $2B
vPodoboo4:
	.byte $02
	.byte $02
	.byte $AD
	.byte $30
	.byte $31
	.byte $2C
	.byte $2D
