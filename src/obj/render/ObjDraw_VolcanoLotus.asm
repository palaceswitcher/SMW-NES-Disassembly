.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8CDE
ptr6_8CDE:
	LDX $A4
	LDA objVar,X
	TAY
	LDA tbl8_8D0B,Y
	ASL
	TAX
	LDA tbl8_8D2B,X
	STA $32
	LDA tbl8_8D2B+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8D00
	LDY #$C0
bra8_8D00:
	STY $36
	LDA #$00
	STA objAttrs
	JSR jmp_54_A118
	RTS
tbl8_8D0B:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
