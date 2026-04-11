.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xF0
obj0xF0:
	LDX $A4
	objDistCalc bra8_9A1C

bra8_9A1C:
	LDA objYHi,X
	CMP playerYHiDup
	BNE bra8_9A77_RTS
	LDY #$00
	LDA objSlot,X
	CMP #$F2
	BNE bra8_9A6D
	LDA objVar,X
	BPL bra8_9A66
	LDA #$00
	STA objVar,X
	LDA #$03
	BMI bra8_9A53
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra8_9A47
	CMP #$F0
	BCC bra8_9A66_RTS
bra8_9A47:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,X ; unlogged
	INC objYHi,X ; unlogged
	JMP loc8_9A66_RTS ; unlogged
bra8_9A53:
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	BCS bra8_9A66_RTS ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYLo,X ; unlogged
	DEC objYHi,X ; unlogged
bra8_9A66_RTS:
loc8_9A66_RTS:
	RTS
bra8_9A66:
	LDA objYDistHi,X
	BPL bra8_9A72
	BMI bra8_9A74
bra8_9A6D:
	LDA objYDistHi,X
	BPL bra8_9A74
bra8_9A72:
	LDY #$20
bra8_9A74:
	STY $06E0
bra8_9A77_RTS:
	RTS
