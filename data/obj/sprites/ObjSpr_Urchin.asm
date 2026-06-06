.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_Urchin
sprPtrs_Urchin:
	.word sprMap_Urchin_Open
	.word sprMap_Urchin_Close
sprMap_Urchin_Open:
	.byte $04 ; Tile Width
	.byte $04 ; Tile Height
	.byte $A8 ; 1K CHR Bank
	.byte $09, $0A, $0B, $0C
	.byte $0D, $0E, $0F, $10
	.byte $13, $14, $15, $16
	.byte $19, $1A, $1B, $1C
sprMap_Urchin_Close:
	.byte $04
	.byte $04
	.byte $A8
	.byte $09, $0A, $0B, $0C
	.byte $0D, $11, $12, $10
	.byte $13, $17, $18, $16
	.byte $19, $1A, $1B, $1C
