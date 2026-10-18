.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl9_92C3
tbl9_92C3:
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
.export tbl9_92D0
tbl9_92D0:
	.word bonyBeetle1
	.word bonyBeetle2
	.word bonyBeetle3
	.word bonyBeetle4
bonyBeetle1:
	.byte $02
	.byte $02
	.byte $AD
	.byte $01
	.byte $02
	.byte $09
	.byte $0A
bonyBeetle2:
	.byte $02
	.byte $02
	.byte $AD
	.byte $03
	.byte $04
	.byte $0B
	.byte $0C
bonyBeetle3:
	.byte $02
	.byte $02
	.byte $AD
	.byte $07
	.byte $08
	.byte $0F
	.byte $10
bonyBeetle4:
	.byte $02
	.byte $02
	.byte $AD
	.byte $05
	.byte $06
	.byte $0D
	.byte $0E
