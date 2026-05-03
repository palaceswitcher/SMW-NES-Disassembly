.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xD5
obj0xD5:
	LDX $A4
	LDA #$02
	STA enemyAnimFrame,X
	LDA $06E3
	BMI bra_8BD8
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8BCC
	CMP #$F0
	BCC loc_8BEA
bra_8BCC:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc_8BEA
bra_8BD8:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS loc_8BEA
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
loc_8BEA:
	LDA $06E2
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra_8BFF
	LDA objXHi,X
	ADC #$00
	BPL bra_8C04
bra_8BFF:
	LDA objXHi,X
	SBC #$00
bra_8C04:
	STA objXHi,X
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8C23
	CMP #$FF
	BEQ bra_8C23
	JMP objRemoveObject
bra_8C23:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc_8C65
	LDA objYDistHi,X
	BPL bra_8C54
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_8C65
bra_8C54:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc_8C65:
	LDA freezeFlag
	BEQ bra_8C6B
	RTS
bra_8C6B:
	LDX $A4
	JSR sub_82EA
	JSR jmp_54_BF74
	LDA #SFX_ENEMYHIT3
	STA sndSfx
	RTS
