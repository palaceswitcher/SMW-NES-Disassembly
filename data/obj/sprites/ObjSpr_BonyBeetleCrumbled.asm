.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl9_93EC
tbl9_93EC:
	.word StunbonyBeetle1
	.word StunbonyBeetle2
StunbonyBeetle1:
	.byte $03
	.byte $02
	.byte $AD
	.byte $FF
	.byte $FF
	.byte $11
	.byte $15
	.byte $16
	.byte $17
StunbonyBeetle2:
	.byte $03
	.byte $02
	.byte $AD
	.byte $12
	.byte $13
	.byte $14
	.byte $18
	.byte $19
	.byte $1A
