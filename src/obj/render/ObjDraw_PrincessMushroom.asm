.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8349
ptr6_8349:
	LDA #$00
	ASL
	TAX
	LDA sprTblPeachMushroom,X
	STA $32
	LDA sprTblPeachMushroom+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
