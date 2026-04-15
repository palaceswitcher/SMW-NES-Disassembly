.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x7C
obj0x7C:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_9F15
	CMP #$FF
	BEQ bra7_9F15
	JMP objRemoveObject
bra7_9F15:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9F57
	LDA objYDistHi,X
	BPL bra7_9F46
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9F57
bra7_9F46:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9F57:
loc7_9F57:
	LDA freezeFlag
	BEQ bra7_9F5D
	RTS
bra7_9F5D:
	LDA objVar,X
	BPL bra7_9F78
	LDA $058C,X
	CMP #$02
	BEQ bra7_9F78
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$0F
	STA objXLo,X
	RTS
bra7_9F78:
	LDA $058C,X
	CMP #$02
	BEQ bra7_9F8D
	LDA objXDistHi,X
	BPL bra7_9F8C_RTS
bra7_9F84:
	INC $E0
	LDX curPlayer
	INC playerLives,X
bra7_9F8C_RTS:
	RTS
bra7_9F8D:
	LDA objXDistHi,X
	BPL bra7_9F84
	RTS

; Useless padding
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
