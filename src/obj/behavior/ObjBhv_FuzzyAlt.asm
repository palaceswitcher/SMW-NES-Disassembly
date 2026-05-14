.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x90
obj0x90:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra6_84CC
	CMP #$FF
	BEQ bra6_84CC
	JMP objRemoveObject
bra6_84CC:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra6_850E
	LDA objYDistHi,X
	BPL bra6_84FD
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc6_850E
bra6_84FD:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra6_850E:
loc6_850E:
	LDA freezeFlag
	BEQ bra6_8514
	RTS
bra6_8514:
	LDA objVar,X
	BPL bra6_851F
	LDA #$00
	STA objVar,X
	RTS
bra6_851F:
	LDX $A4
	LDA objFrameCount
	AND #$01
	BNE bra6_8533
	INC objVar,X
	LDA objVar,X
	AND #$1F
	STA objVar,X
bra6_8533:
	LDA objFrameCount
	AND #$01
	BNE bra6_853D
	JSR jmp_54_BBC3
bra6_853D:
	JSR objCollStompOrHurt
	JSR jmp_54_BF74
	RTS
