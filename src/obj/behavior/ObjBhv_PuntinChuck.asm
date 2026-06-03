.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xD0
obj0xD0:
	LDX $A4
	LDA objVar,X
	BMI bra4_8B90
	JMP loc4_8BF7
bra4_8B90:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8BAC
	CMP #$FF ; unlogged
	BEQ bra4_8BAC ; unlogged
	JMP objRemoveObject ; unlogged
bra4_8BAC:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8BEE ; unlogged
	LDA objYDistHi,X ; unlogged
	BPL bra4_8BDD ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8BEE ; unlogged
bra4_8BDD:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_8BEE:
loc4_8BEE:
	LDA freezeFlag
	BEQ bra4_8BF4
	RTS ; unlogged
bra4_8BF4:
	JMP objFacePlayer
loc4_8BF7:
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
	BEQ bra4_8C19
	CMP #$FF
	BEQ bra4_8C19
	JMP objRemoveObject
bra4_8C19:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8C5B
	LDA objYDistHi,X ; unlogged
	BPL bra4_8C4A ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8C5B ; unlogged
bra4_8C4A:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_8C5B:
loc4_8C5B:
	LDA freezeFlag
	BEQ bra4_8C61
	RTS ; unlogged
bra4_8C61:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8C75,Y
	STA $32
	LDA tbl4_8C75+1,Y
	STA $33
	JMP ($32)
tbl4_8C75:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_8C7F
	.word objFlipKill
.export ptr9_8C7F
ptr9_8C7F:
	JSR sub4_8CB1
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
sub4_8CB1:
	LDA objVar,X
	BNE bra4_8CCC
	INC objVar,X
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
bra4_8CCC:
	LDY #$0E
	LDA objFlags,X
	AND #$20
	BEQ bra4_8CD7
	LDY #$00
bra4_8CD7:
	STY $25
	LDA objFrameCount
	AND $25
	BNE bra4_8CF1
	LDA #$85
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8CF1:
	LDA objFlags,X
	AND #$20
	BNE bra4_8D58_RTS
	LDA objVar,X
	CMP #$02
	BNE bra4_8D58_RTS
	INC objVar,X
	LDY objCount
	INC objCount
	LDA objFlags,X
	AND #$40
	BNE bra4_8D21
	LDA objXLo,X
	CLC
	ADC #$10
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	JMP loc4_8D2D
bra4_8D21:
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
loc4_8D2D:
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
	ORA #$B2
	STA objSlot,Y
bra4_8D58_RTS:
	RTS
