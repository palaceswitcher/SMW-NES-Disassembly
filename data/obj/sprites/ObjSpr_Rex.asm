.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblRex
sprTblRex:
	.word sprRexWalk1
	.word sprRexWalk2
	.word sprRexFlattened ; Unused
	.word sprRexSquishedWalk1
	.word sprRexSquishedWalk2
sprRexWalk1:
	.byte $03
	.byte $04
	.byte $95
	.byte $21, $22, $FF
	.byte $25, $26, $FF
	.byte $29, $2A, $2B
	.byte $33, $34, $35
sprRexWalk2:
	.byte $03
	.byte $04
	.byte $95
	.byte $23, $24, $FF
	.byte $27, $28, $FF
	.byte $2C, $2D, $2E
	.byte $36, $37, $38
sprRexFlattened:
	.byte $02
	.byte $01
	.byte $95
	.byte $39, $3A
sprRexSquishedWalk1:
	.byte $02
	.byte $02
	.byte $95
	.byte $2F, $30
	.byte $3B, $3C
sprRexSquishedWalk2:
	.byte $02
	.byte $02
	.byte $95
	.byte $31, $32
	.byte $3D, $3E
