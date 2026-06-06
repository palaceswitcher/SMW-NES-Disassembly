.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblBlurp
sprTblBlurp:
	.word sprBlurp1
	.word sprBlurp2
	.word sprBlurp3
	.word sprBlurp4
sprBlurp1:
	.byte $02
	.byte $02
	.byte $A6
	.byte $03
	.byte $04
	.byte $0D
	.byte $0E
sprBlurp2:
	.byte $02
	.byte $02
	.byte $A6
	.byte $05
	.byte $06
	.byte $0F
	.byte $0E
sprBlurp3:
	.byte $02
	.byte $02
	.byte $A6
	.byte $0D
	.byte $0E
	.byte $03
	.byte $04
sprBlurp4:
	.byte $02
	.byte $02
	.byte $A6
	.byte $0F
	.byte $0E
	.byte $05
	.byte $06
