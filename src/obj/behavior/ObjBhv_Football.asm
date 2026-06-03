.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xB0
obj0xB0:
	LDX $A4
	JSR sub4_8DEC
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8D9E
	CMP #$FF
	BEQ bra4_8D9E
	JMP objRemoveObject
bra4_8D9E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8DE0
	LDA objYDistHi,X
	BPL bra4_8DCF
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_8DE0
bra4_8DCF:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_8DE0:
loc4_8DE0:
	LDA freezeFlag
	BEQ bra4_8DE6
	RTS ; unlogged
bra4_8DE6:
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_8DEC:
	LDA objFlags,X
	AND #$20
	BNE bra4_8E0B
	LDA objVar,X
	BNE bra4_8E0B
	LDA objFrameCount
	ADC objXDistLo+1,X
	LSR
	ADC objYDistLo,X
	AND #$03
	TAY
	LDA tbl4_8E24,Y
	STA objVar,X
bra4_8E0B:
	LDA objFrameCount
	AND #$02
	BNE bra4_8E23_RTS
	LDA #$86
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8E23_RTS:
	RTS
tbl4_8E24:
	.byte $0E
	.byte $31
	.byte $31
	.byte $20
