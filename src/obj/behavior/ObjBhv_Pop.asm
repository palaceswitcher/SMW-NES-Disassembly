.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x0F
obj0x0F:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_94D6
	CMP #$FF
	BEQ bra7_94D6
	JMP objRemoveObject
bra7_94D6:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9518
	LDA objYDistHi,X
	BPL bra7_9507
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9518
bra7_9507:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9518:
loc7_9518:
	LDA freezeFlag
	BEQ bra7_951E
	RTS
bra7_951E:
	LDA objFlags,X
	BNE bra7_9527
	LDY #$0F
	STY sndSfx
bra7_9527:
	CMP #$10
	BCC bra7_9534
	LDA #$00
	STA objSlot,X
	STA objFlags,X
	RTS
bra7_9534:
	INC objFlags,X
	RTS
