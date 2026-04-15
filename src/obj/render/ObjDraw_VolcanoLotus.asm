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
; Animation starting frame for each motion vector
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
