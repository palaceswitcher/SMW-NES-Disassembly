.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl9_90C8
tbl9_90C8:
	.word eerie1
	.word eerie2
eerie1:
	.byte $02
	.byte $03
	.byte $AB
	.byte $0B
	.byte $0C
	.byte $13
	.byte $14
	.byte $1A
	.byte $1B
eerie2:
	.byte $02
	.byte $03
	.byte $AB
	.byte $0D
	.byte $0E
	.byte $15
	.byte $16
	.byte $1A
	.byte $1C
