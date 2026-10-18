.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_BulletBill
sprPtrs_BulletBill:
	.word sprMap_BulletBill
sprMap_BulletBill:
	.byte $02 ; Tile Width
	.byte $02 ; Tile Height
	.byte $A6 ; 1K CHR Bank
	.byte $2A, $2B
	.byte $2C, $2D
