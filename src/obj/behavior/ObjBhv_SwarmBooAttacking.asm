.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xDC
obj0xDC:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_9806
	CMP #$FF
	BEQ bra4_9806
	JMP objRemoveObject
bra4_9806:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_9848
	LDA objYDistHi,X
	BPL bra4_9837
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_9848
bra4_9837:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_9848:
loc4_9848:
	LDA freezeFlag
	BEQ bra4_984E
	RTS ; unlogged
bra4_984E:
	JSR sub4_9857
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_9857:
	LDA objFrameCount
	AND #$02
	BNE bra4_986F
	LDA #$8A
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR getSpeedData
bra4_986F:
	LDA objFlags,X
	AND #$20
	BNE bra4_9896
	LDA frameCount
	AND #$1F
	BNE bra4_9895_RTS
	LDA objYDistHi,X
	BPL bra4_9888
	LDA objYDistLo,X
	CMP #$D0
	BCC bra4_9895_RTS
bra4_9888:
	LDA objFlags,X
	ORA #$20
	STA objFlags,X
	LDA #$10
	STA objVar,X
bra4_9895_RTS:
	RTS
bra4_9896:
	LDA frameCount
	AND #$0F
	BNE bra4_98B6_RTS
	LDA objYDistHi,X
	BPL bra4_98B6_RTS
	LDA objYDistLo,X
	CMP #$9B
	BCS bra4_98B6_RTS
	LDA objSlot,X
	SEC
	SBC #$02
	STA objSlot,X
	LDA #$80
	STA objVar,X
bra4_98B6_RTS:
	RTS
