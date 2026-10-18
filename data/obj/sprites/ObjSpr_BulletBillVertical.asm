.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_VBulletBill
sprPtrs_VBulletBill:
	.word sprMap_VBulletBill1
	.word sprMap_VBulletBill2
sprMap_VBulletBill1:
	.byte $02 ; Tile Width
	.byte $02 ; Tile Height
	.byte $A6 ; 1K CHR Bank
	.byte $2E, $2F
	.byte $30, $31
sprMap_VBulletBill2:
	.byte $02 ; Tile Width
	.byte $02 ; Tile Height
	.byte $A6 ; 1K CHR Bank
	.byte $30, $31
	.byte $2E, $2F
