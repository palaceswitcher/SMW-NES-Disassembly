.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x77
obj0x77:
	LDX $A4
	objDistCalc bra5_83DF

bra5_83DF:
	LDA objVar,X
	BPL bra5_844D ; Skip if reznors are already intialized
	LDA #$00
	STA reznorsDefeated
	STA objVar,X
	LDY objCount
	INC objCount
	INC objCount
	LDA #$18
	STA objVar,Y
	LDA #$40
	STA objStateTimer,Y
	LDA #$0C
	STA objVar+1,Y
	LDA #$80
	STA objStateTimer+1,Y
	LDA objXHi,X
	STA objXHi,Y
	STA objXHi+1,Y
	LDA objYHi,X
	STA objYHi,Y
	STA objYHi+1,Y
	LDA objXLo,X
	CLC
	ADC #39
	STA objXLo,Y
	LDA objXLo,X
	SEC
	SBC #42
	STA objXLo+1,Y
	LDA objYLo,X
	CLC
	ADC #69
	STA objYLo,Y
	STA objYLo+1,Y
	LDA #119
	STA objSlot,Y
	STA objSlot+1,Y
	LDA #$00
	STA objFlags,Y
	STA objFlags+1,Y
	STA objState,Y
	STA objState+1,Y
	RTS
bra5_844D:
	JSR sub5_85C6
	LDA objState,X
	ASL
	TAY
	LDA tbl5_8462,Y
	STA $32
	LDA tbl5_8462+1,Y
	STA $33
	JMP ($32)
tbl5_8462:
	.word ptr10_8470
	.word ptr10_8494
	.word ptr10_84B5
	.word ptr10_84E7
	.word ptr10_851D
	.word ptr10_8553
	.word ptr10_8564
ptr10_8470:
	LDA frameCount
	AND #$07
	BNE bra5_847B
		LDA #$2B
		JSR parseMovementData ; Parse movement data every 8 frames
bra5_847B:
	JSR sub5_8580
	LDA #$68
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BPL bra5_8493_RTS
	LDA #$00
	STA objStateTimer,X
	INC objState,X
	INC objState,X
bra5_8493_RTS:
	RTS
ptr10_8494:
	LDA frameCount
	AND #$07
	BNE bra5_849F
	LDA #$2B
	JSR parseMovementData
bra5_849F:
	JSR sub5_8580
	LDA #$28
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra5_84B4_RTS
	LDA #$00
	STA objStateTimer,X
	INC objState,X
bra5_84B4_RTS:
	RTS
ptr10_84B5:
	LDA frameCount
	AND #$07
	BNE bra5_84C0
	LDA #$2B
	JSR parseMovementData
bra5_84C0:
	LDA #$02
	STA enemyAnimFrame,X
	LDA objStateTimer,X
	CMP #$20
	BCS bra5_84D0
	INC objStateTimer,X
	RTS
bra5_84D0:
	LDA objXDistHi,X
	BMI bra5_84DE
	LDA #$00
	STA objState,X
	STA objStateTimer,X
	RTS
bra5_84DE:
	LDA #$00
	STA objStateTimer,X
	DEC objState,X
	RTS
ptr10_84E7:
	LDA frameCount
	AND #$07
	BNE bra5_84F2
	LDA #$2B
	JSR parseMovementData
bra5_84F2:
	LDA #$41
	STA enemyAnimFrame,X
	INC objStateTimer,X
	LDA objStateTimer,X
	CMP #$20
	BEQ bra5_8514
	CMP #$40
	BCC bra5_8513_RTS
	LDA #$00
	STA objStateTimer,X
	DEC objState,X
	DEC objState,X
	DEC objState,X
bra5_8513_RTS:
	RTS
bra5_8514:
	JSR sub5_8599
	LDA #$40
	STA objFlags,Y
	RTS
ptr10_851D:
	LDA frameCount
	AND #$07
	BNE bra5_8528
	LDA #$2B
	JSR parseMovementData
bra5_8528:
	LDA #$01
	STA enemyAnimFrame,X
	INC objStateTimer,X
	LDA objStateTimer,X
	CMP #$20
	BEQ bra5_854A
	CMP #$40
	BCC bra5_854E_RTS
	LDA #$00
	STA objStateTimer,X
	DEC objState,X
	DEC objState,X
	DEC objState,X
bra5_854E_RTS:
	RTS
bra5_854A:
	JSR sub5_8599
	LDA #$00
	STA objFlags,Y
	RTS
ptr10_8553:
	LDA frameCount
	AND #$07
	BNE bra5_855E
	LDA #$2B
	JSR parseMovementData
bra5_855E:
	LDA #$05
	STA enemyAnimFrame,X
	RTS
ptr10_8564:
	LDA #$06
	STA enemyAnimFrame,X
	LDA reznorsDefeated
	CMP #$03
	BCC bra5_857F_RTS
	LDA objYLo,X
	CMP #$B0
	BCC bra5_857F_RTS
	LDA #$23
	STA sndMusic
	LDA #$09
	STA gameState
bra5_857F_RTS:
	RTS
sub5_8580:
	INC objStateTimer,X
	LDA objStateTimer,X
	CMP #$E0
	BCC bra5_8598_RTS
	LDA #$00
	STA objStateTimer,X
	INC objState,X
	INC objState,X
	INC objState,X
bra5_8598_RTS:
	RTS
sub5_8599:
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #$78
	STA objSlot,Y
	LDA #$00
	STA objVar,Y
	STA objStateTimer,Y
	STA objState,Y
	RTS

sub5_85C6:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra5_8630

bra5_8630:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8644,Y
	STA $32
	LDA tbl5_8644+1,Y
	STA $33
	JMP ($32)
tbl5_8644:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr10_864E
	.word objFlipKill
ptr10_864E:
	LDX $A4
	LDA objState,X
	CMP #$05
	BCS bra5_86BC_RTS
	JSR sub5_86BD
	JSR sub5_86C6
	LDA playerMoveFlags
	AND #$04
	BEQ bra5_86BC_RTS
	LDA #$F7
	STA invincibilityTimer
	LDA playerMoveFlags
	AND #$FB
	STA playerMoveFlags
	LDA #$30
	STA playerYSpd
	LDA #SFX_THUD
	STA sndSfx
	LDA #$05
	STA objState,X
	LDA #$00
	STA objStateTimer,X
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYLo,X
	CLC
	ADC #$20
	STA objYLo,X
	LDA objXHi,X
	STA objXHi,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #OBJ_REZNOR
	STA objSlot,Y
	LDA #$04
	STA objFlags,Y
	LDA #$00
	STA objVar,Y
	LDA #$06
	STA objState,Y
	INC reznorsDefeated
bra5_86BC_RTS:
	RTS
sub5_86BD:
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	PLA
	PLA
	RTS
sub5_86C6:
	LDA objXDistHi,X
	BPL bra5_86D8
	LDA #$08
	CLC
	ADC #$20
	CLC
	ADC objXDistLo,X
	BCS bra5_86DF
	BCC bra5_86FF
bra5_86D8:
	LDA objXDistLo,X
	CMP #$08
	BCS bra5_86FF
bra5_86DF:
	LDA objYDistHi,X
	BEQ bra5_86F5
	CMP #$FF
	BNE bra5_86FF
	LDA #$10
	CLC
	ADC #$28
	CLC
	ADC objYDistLo,X
	BCS bra5_86FC
	BCC bra5_86FF
bra5_86F5:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_86FF
bra5_86FC:
	CLC
	BCC bra5_8700
bra5_86FF:
	SEC
bra5_8700:
	BCC bra5_870C_RTS
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
	PLA
	PLA
bra5_870C_RTS:
	RTS
