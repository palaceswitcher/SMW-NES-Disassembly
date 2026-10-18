.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl9_9BAA
tbl9_9BAA:
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $40
	.byte $03
	.byte $00
	.byte $03
	.byte $00
	.byte $02
	.byte $C0
	.byte $02
	.byte $80
	.byte $00
	.byte $00
.export tbl9_9BBA
tbl9_9BBA:
	.word bone1
	.word bone2
	.word bone3
	.word bone4
bone1:
	.byte $02
	.byte $02
	.byte $AC
	.byte $FF
	.byte $31
	.byte $39
	.byte $3A
bone2:
	.byte $02
	.byte $02
	.byte $AC
	.byte $FF
	.byte $32
	.byte $FF
	.byte $3B
bone3:
	.byte $02
	.byte $02
	.byte $AC
	.byte $39
	.byte $3A
	.byte $FF
	.byte $31
bone4:
	.byte $02
	.byte $02
	.byte $AC
	.byte $32
	.byte $FF
	.byte $3B
	.byte $FF
