.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x6A
obj0x6A:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_84E1
	CMP #$FF
	BEQ bra7_84E1
	JMP objRemoveObject
bra7_84E1:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc7_8523
	LDA objYDistHi,X
	BPL bra7_8512
	LDA objYDistLo,X
	CLC ; logged as data
	ADC #$10 ; logged as data
	STA objYDistLo,X ; logged as data
	LDA objYDistHi,X ; logged as data
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8523
bra7_8512:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc7_8523:
	LDA freezeFlag
	BEQ bra7_8529
	RTS
bra7_8529:
	JSR jmp_54_BD3D
