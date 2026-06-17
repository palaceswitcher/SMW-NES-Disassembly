.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; Reznor rendering
.export ptr6_8000
ptr6_8000:
	LDA objFrameCount
	AND #$01
	BEQ bra5_8008
	RTS

; For tile guided objects (including spike tops) and other platforms
.export bra5_8008
bra5_8008:
	LDX $A4
	LDA enemyAnimFrame,X
	BNE bra5_8010
	RTS
bra5_8010:
	AND #%00111111
	ASL
	TAX
	LDA tbl5_805E,X
	STA $32
	LDA tbl5_805E+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra5_802B
	LDY #$C0
bra5_802B:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
