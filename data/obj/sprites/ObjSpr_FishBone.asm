.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl9_9556
tbl9_9556:
	.word fishBones1
	.word fishBones2
	.word fishBones3
fishBones1:
	.byte $03 ; Tile Width
	.byte $02 ; Tile Height
	.byte $AD
	.byte $1B, $1C, $1D
	.byte $1E, $1F, $20
fishBones2:
	.byte $03
	.byte $02
	.byte $AD
	.byte $1B, $1C, $1D
	.byte $21, $1F, $20
fishBones3:
	.byte $03
	.byte $02
	.byte $AD
	.byte $1B, $1C, $22
	.byte $1E, $1F, $23
