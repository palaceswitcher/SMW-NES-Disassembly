.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl8_8D2B
tbl8_8D2B:
	.word ofs_8D31
	.word ofs_8D3C
	.word ofs_8D47
ofs_8D31:
	.byte $04
	.byte $02
	.byte $97
	.byte $FF
	.byte $05
	.byte $06
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
ofs_8D3C:
	.byte $04
	.byte $02
	.byte $97
	.byte $FF
	.byte $03
	.byte $04
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
ofs_8D47:
	.byte $04
	.byte $02
	.byte $97
	.byte $FF
	.byte $01
	.byte $02
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
