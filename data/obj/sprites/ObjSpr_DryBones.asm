.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl9_99CA
tbl9_99CA:
	.word dryBones1
	.word dryBones2
	.word dryBones3
dryBones1:
	.byte $03
	.byte $04
	.byte $AC
	.byte $11
	.byte $12
	.byte $FF
	.byte $15
	.byte $17
	.byte $FF
	.byte $1F
	.byte $20
	.byte $21
	.byte $28
	.byte $29
	.byte $2A
dryBones2:
	.byte $03
	.byte $04
	.byte $AC
	.byte $13
	.byte $14
	.byte $FF
	.byte $18
	.byte $19
	.byte $FF
	.byte $1F
	.byte $22
	.byte $23
	.byte $28
	.byte $2B
	.byte $2C
dryBones3:
	.byte $03
	.byte $04
	.byte $AC
	.byte $13
	.byte $14
	.byte $FF
	.byte $18
	.byte $1A
	.byte $1B
	.byte $FF
	.byte $24
	.byte $23
	.byte $FF
	.byte $2D
	.byte $2C
