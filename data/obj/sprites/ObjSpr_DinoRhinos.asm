.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl_84A3
tbl_84A3:
	.word dinoRhino1
	.word dinoRhino2
	.word dinoTorch1
	.word dinoTorch2
	.word dinoTorchFlat
dinoRhino1:
	.byte $04
	.byte $04
	.byte $D0
	.byte $0D, $0E, $0F, $FF
	.byte $13, $14, $15, $16
	.byte $1B, $1C, $1D, $1E
	.byte $23, $24, $25, $26
dinoRhino2:
	.byte $04
	.byte $04
	.byte $D0
	.byte $10, $11, $12, $FF
	.byte $17, $18, $19, $1A
	.byte $1F, $20, $21, $22
	.byte $27, $28, $29, $2A
dinoTorch1:
	.byte $02
	.byte $02
	.byte $D0
	.byte $02, $03
	.byte $07, $08
dinoTorch2:
	.byte $02
	.byte $02
	.byte $D0
	.byte $02, $04
	.byte $09, $0A
dinoTorchFlat:
	.byte $02
	.byte $02
	.byte $D0
	.byte $05, $06
	.byte $0B, $0C

