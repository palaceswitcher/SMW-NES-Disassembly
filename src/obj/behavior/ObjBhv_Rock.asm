.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xB2
obj0xB2:
	LDX $A4
	LDA objFrameCount
	AND #$02
	BNE bra4_905A
	LDA #$87
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_905A:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_9076
	CMP #$FF
	BEQ bra4_9076
	JMP objRemoveObject
bra4_9076:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_90B8
	LDA objYDistHi,X
	BPL bra4_90A7
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_90B8
bra4_90A7:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_90B8:
loc4_90B8:
	LDA freezeFlag
	BEQ bra4_90BE
	RTS ; unlogged
bra4_90BE:
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
