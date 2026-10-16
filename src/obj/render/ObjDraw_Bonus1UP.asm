.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9BED
ptr6_9BED:
	LDA #$04
	ASL
	TAX
	LDA tbl5_997F,X
	STA $32
	LDA tbl5_997F+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$20
	STA $05F0
	STA $06E1
	JSR sub_52_ADAF
	LDA #$00
	STA $06E1
	RTS
