.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

	LDX $A4 ; unlogged code start
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra6_8436
	CMP #$FF
	BEQ bra6_8436
	JMP objRemoveObject
bra6_8436:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra6_8478
	LDA objYDistHi,X
	BPL bra6_8467
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc6_8478
bra6_8467:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra6_8478:
loc6_8478:
	LDA freezeFlag
	BEQ bra6_847E
	RTS
bra6_847E:
	LDA objVar,X
	BPL bra6_8489
	LDA #$00
	STA objVar,X
	RTS
bra6_8489:
	LDX $A4
	LDA objFrameCount
	AND #$03
	BNE bra6_849D
	INC objVar,X
	LDA objVar,X
	AND #$1F
	STA objVar,X
bra6_849D:
	LDA objFrameCount
	AND #$01
	BNE bra6_84A7
	JSR jmp_54_BBC3
bra6_84A7:
	JSR objCollStompOrHurt
	JSR jmp_54_BF74
	RTS
