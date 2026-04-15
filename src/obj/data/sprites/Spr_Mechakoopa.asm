.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl8_9395
tbl8_9395:
	.word sprMechakoopa1
	.word sprMechakoopa2
	.word sprMechakoopa3
	.word sprMechakoopa2
sprMechakoopa1:
	.byte $04
	.byte $03
	.byte $AE
	.byte $01
	.byte $02
	.byte $03
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
	.byte $14
	.byte $15
	.byte $16
	.byte $17
sprMechakoopa2:
	.byte $04
	.byte $03
	.byte $AE
	.byte $04
	.byte $05
	.byte $06
	.byte $FF
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
	.byte $18
	.byte $19
	.byte $1A
	.byte $1B
sprMechakoopa3:
	.byte $04
	.byte $03
	.byte $AE
	.byte $01
	.byte $07
	.byte $08
	.byte $FF
	.byte $09
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $1C
	.byte $1D
	.byte $1E
