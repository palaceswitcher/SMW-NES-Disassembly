.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x08
obj0x08:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8EFA
	CMP #$FF
	BEQ bra7_8EFA
	JMP objRemoveObject
bra7_8EFA:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8F3C
	LDA objYDistHi,X
	BPL bra7_8F2B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8F3C
bra7_8F2B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8F3C:
loc7_8F3C:
	LDA freezeFlag
	BEQ bra7_8F42
	RTS
bra7_8F42:
	JSR sub7_9538
	LDA #$10
	JSR objObjectHitCheck
	LDA #$00
	STA objSlot,X
	RTS
