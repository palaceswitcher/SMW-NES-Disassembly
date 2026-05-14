.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl6_99D7
tbl6_99D7:
	.word tbl6_99DD
	.word tbl6_99E4
	.word tbl6_99EB
tbl6_99DD:
	.byte $02
	.byte $02
	.byte $97
	.byte $0D, $0E
	.byte $11, $12
tbl6_99E4:
	.byte $02
	.byte $02
	.byte $97
	.byte $0F, $10
	.byte $13, $14
tbl6_99EB:
	.byte $01
	.byte $01
	.byte $97
	.byte $FF
