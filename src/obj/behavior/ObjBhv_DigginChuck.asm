.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xD2
obj0xD2:
	LDX $A4
	LDA objVar,X
	BMI bra4_8E47
	JMP loc4_8EE3
bra4_8E47:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8E63
	CMP #$FF
	BEQ bra4_8E63
	JMP objRemoveObject ; unlogged
bra4_8E63:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8EA5
	LDA objYDistHi,X ; unlogged
	BPL bra4_8E94 ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8EA5 ; unlogged
bra4_8E94:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_8EA5:
loc4_8EA5:
	LDA freezeFlag
	BEQ bra4_8EAB
	RTS ; unlogged
bra4_8EAB:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	LDA objFrameCount
	AND #$00
	BNE bra4_8ED6
	LDA #$85
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8ED6:
	LDA objFlags,X
	AND #$20
	BNE bra4_8EE2_RTS
	LDA #$00
	STA objVar,X
bra4_8EE2_RTS:
	RTS
loc4_8EE3:
	LDA #$07
	STA $25
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8F05
	CMP #$FF
	BEQ bra4_8F05
	JMP objRemoveObject
bra4_8F05:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8F47
	LDA objYDistHi,X ; unlogged
	BPL bra4_8F36 ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8F47 ; unlogged
bra4_8F36:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_8F47:
loc4_8F47:
	LDA freezeFlag
	BEQ bra4_8F4D
	RTS ; unlogged
bra4_8F4D:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8F61,Y
	STA $32
	LDA tbl4_8F61+1,Y
	STA $33
	JMP ($32)
tbl4_8F61:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_8F6B
	.word objFlipKill
.export ptr9_8F6B
ptr9_8F6B:
	JSR sub4_8F9D
	JSR objCapeHitCheck
	JSR objCollStompOrHurt
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDA objSlot,X
	AND #$01
	ORA #$C4
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub4_8F9D:
	LDA objFrameCount
	AND #$0E
	BNE bra4_9019_RTS
	INC objVar,X
	LDA objVar,X
	CMP #$18
	BCC bra4_8FBA
	CMP #$1F
	BCC bra4_9019_RTS
	LDA #$00
	STA objVar,X
	JMP loc4_9019_RTS
bra4_8FBA:
	AND #$07
	CMP #$03
	BNE bra4_9019_RTS
	INC objVar,X
	LDY objCount
	INC objCount
	LDA objFlags,X
	AND #$40
	BNE bra4_8FE2
	LDA objXLo,X
	CLC
	ADC #$10
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	JMP loc4_8FEE
bra4_8FE2:
	LDA objXLo,X ; unlogged
	STA objXLo,Y ; unlogged
	LDA objXHi,X ; unlogged
	STA objXHi,Y ; unlogged
loc4_8FEE:
	LDA objYLo,X
	CLC
	ADC #$0C
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA objFlags,X
	AND #$40
	STA objFlags,Y
	LDA #$06
	STA objVar,Y
	STA objState,Y
	LDA objSlot,X
	AND #$01
	ORA #$B4
	STA objSlot,Y
bra4_9019_RTS:
loc4_9019_RTS:
	RTS
