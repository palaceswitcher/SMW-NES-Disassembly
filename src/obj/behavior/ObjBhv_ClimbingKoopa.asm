.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x4E
obj0x4E:
	LDX $A4
	LDA objVar,X
	BMI bra5_8AA9
	JMP loc5_8B21
bra5_8AA9:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_8AC5
	CMP #$FF
	BEQ bra5_8AC5
	JMP objRemoveObject
bra5_8AC5:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8B07
	LDA objYDistHi,X
	BPL bra5_8AF6
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8B07
bra5_8AF6:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8B07:
loc5_8B07:
	LDA freezeFlag
	BEQ bra5_8B0D
	RTS
bra5_8B0D:
	LDA objVar,X
	CMP #$80
	BNE bra5_8B1D
	JSR objFacePlayer
	LDA #$11
	STA enemyAnimFrame,X
	RTS
bra5_8B1D:
	JSR sub_54_B4FC
	RTS
loc5_8B21:
	JSR sub5_8C27
	LDA objSlot,X
	CMP #OBJ_CLIMBINGKOOPA_VERTICAL
	BCS bra5_8B83
	LDA objFlags,X
	AND #$40
	BNE bra5_8B59
	LDA #$18
	STA $36
	LDA #$18
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8B48
	LDA objFlags,X
	ORA #$40
	STA objFlags,X
	RTS
bra5_8B48:
	LDA objXLo,X
	CLC
	ADC #$01
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	JMP loc5_8B7D
bra5_8B59:
	LDA #$F8
	STA $36
	LDA #$18
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8B6F
	LDA objFlags,X
	AND #$BF
	STA objFlags,X
	RTS
bra5_8B6F:
	LDA objXLo,X
	SEC
	SBC #$01
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
loc5_8B7D:
	STA objXHi,X
	JMP loc5_8C17
bra5_8B83:
	LDA objFlags,X
	AND #$80
	BNE bra5_8BD2
	LDA #$08
	STA $36
	LDA #$28
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8BA0
	LDA objFlags,X
	ORA #$80
	STA objFlags,X
	RTS
bra5_8BA0:
	LDA #$01
	BMI bra5_8BBD
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra5_8BB1
	CMP #$F0
	BCC bra5_8BCF
bra5_8BB1:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc5_8BCF
bra5_8BBD:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra5_8BCF
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra5_8BCF:
loc5_8BCF:
	JMP loc5_8C17
bra5_8BD2:
	LDA #$08
	STA $36
	LDA #$00
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8BE8
	LDA objFlags,X
	AND #$7F
	STA objFlags,X
	RTS
bra5_8BE8:
	LDA #$FF
	BMI bra5_8C05
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra5_8BF9
	CMP #$F0
	BCC bra5_8C17
bra5_8BF9:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc5_8C17
bra5_8C05:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra5_8C17
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra5_8C17:
loc5_8C17:
	LDA objFrameCount
	AND #$07
	BNE bra5_8C26_RTS
	LDA enemyAnimFrame,X
	EOR #$40
	STA enemyAnimFrame,X
bra5_8C26_RTS:
	RTS
sub5_8C27:
	LDA #$06
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
	BEQ bra5_8C49
	CMP #$FF
	BEQ bra5_8C49
	JMP objRemoveObject
bra5_8C49:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8C8B
	LDA objYDistHi,X
	BPL bra5_8C7A
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8C8B
bra5_8C7A:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8C8B:
loc5_8C8B:
	LDA freezeFlag
	BEQ bra5_8C91
	RTS ; unlogged
bra5_8C91:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8CA5,Y
	STA $32
	LDA tbl5_8CA5+1,Y
	STA $33
	JMP ($32)
tbl5_8CA5:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr10_8CAF
	.word objFlipKill
ptr10_8CAF:
	JSR objCapeHitCheck
	JSR objCollStompOrHurt
	JSR objKillOnSpinJump
	LDA #SFX_ENEMYHIT2
	STA sndSfx
	LDA #$01
	JSR rewardPoints
	LDX $A4
	LDA #$81
	STA objVar,X
	LDA playerState
	CMP #$03
	BEQ bra5_8CDE
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
bra5_8CDE:
	PLA
	PLA
	RTS
