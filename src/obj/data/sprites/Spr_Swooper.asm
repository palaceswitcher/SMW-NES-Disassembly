.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblSwooper
sprTblSwooper:
	.word sprSwooper1
	.word sprSwooper2
	.word sprSwooper3
sprSwooper1:
	.byte $03
	.byte $02
	.byte $96
	.byte $FF
	.byte $2E
	.byte $2F
	.byte $FF
	.byte $36
	.byte $37
sprSwooper2:
	.byte $03
	.byte $02
	.byte $96
	.byte $FF
	.byte $29
	.byte $2A
	.byte $30
	.byte $31
	.byte $32
sprSwooper3:
	.byte $03
	.byte $02
	.byte $96
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $33
	.byte $34
	.byte $35
