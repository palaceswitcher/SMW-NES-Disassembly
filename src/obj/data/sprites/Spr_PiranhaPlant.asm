.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl8_887F
tbl8_887F:
	.word sprPiranhaJump1
	.word sprPiranhaJump2
	.word sprPiranhaJump3
	.word sprPiranhaJump4
sprPiranhaJump1:
	.byte $02
	.byte $03
	.byte $97
	.byte $0D
	.byte $0E
	.byte $11
	.byte $12
	.byte $15
	.byte $16
sprPiranhaJump2:
	.byte $02
	.byte $03
	.byte $97
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $17
	.byte $18
sprPiranhaJump3:
	.byte $02
	.byte $03
	.byte $97
	.byte $0D
	.byte $0E
	.byte $11
	.byte $12
	.byte $19
	.byte $1A
sprPiranhaJump4:
	.byte $02
	.byte $03
	.byte $97
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $19
	.byte $1B
