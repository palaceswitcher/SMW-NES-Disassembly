.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x6C
obj0x6C:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra6_9A1E
	CMP #$FF
	BEQ bra6_9A1E
	JMP objRemoveObject
bra6_9A1E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra6_9A60
	LDA objYDistHi,X
	BPL bra6_9A4F
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc6_9A60
bra6_9A4F:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra6_9A60:
loc6_9A60:
	LDA $06DF
	BEQ bra6_9A6C
	LDA #$02
	STA objState,X
	BNE bra6_9A6F
bra6_9A6C:
	JSR jmp_54_BD3D
bra6_9A6F:
	LDA objState,X
	ASL
	TAY
	LDA tbl6_9A81,Y
	STA $32
	LDA tbl6_9A81+1,Y
	STA $33
	JMP ($32)
tbl6_9A81:
	.word ptr6_9A87
	.word ptr6_9ADF
	.word ptr6_9B7B
ptr6_9A87:
	LDA #$FF
	BMI bra6_9AA4
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	BCS bra6_9A98 ; unlogged
	CMP #$F0 ; unlogged
	BCC bra6_9AB6 ; unlogged
bra6_9A98:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,X ; unlogged
	INC objYHi,X ; unlogged
	JMP bra6_9AB6 ; unlogged
bra6_9AA4:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra6_9AB6
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYLo,X ; unlogged
	DEC objYHi,X ; unlogged
bra6_9AB6:
	LDA #$01
	STA freezeFlag
	LDY #$00
	LDA frameCount
	AND #$08
	BNE bra6_9AC4
	INY
bra6_9AC4:
	TYA
	STA enemyAnimFrame,X
	INC objStateTimer,X
	LDA objStateTimer,X
	CMP #$10
	BCC bra6_9ADE_RTS
	LDA objYLo,X
	CLC
	ADC #$12
	STA $06DE
	INC objState,X
bra6_9ADE_RTS:
	RTS

ptr6_9ADF:
	LDA #$FF
	BMI bra6_9AFC
	CLC ; unlogged start
	ADC objYLo,X
	STA objYLo,X
	BCS bra6_9AF0
	CMP #$F0
	BCC bra6_9B0E
bra6_9AF0:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP bra6_9B0E ; unlogged end
bra6_9AFC:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra6_9B0E
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra6_9B0E:
	LDA #$08
	STA $36
	LDA #$10
	JSR sub3_B7A2
	BEQ bra6_9B28
	LDA #$00
	STA freezeFlag
	INC objState,X
	LDA objYLo,X
	STA $06DF
	RTS
bra6_9B28:
	LDY #$00
	LDA frameCount
	AND #$08
	BNE bra6_9B31
	INY
bra6_9B31:
	TYA
	STA enemyAnimFrame,X
	LDA objXLo,X
	STA $65
	LDA objXHi,X
	STA pTilePosXHi
	LDA objYLo,X
	STA $67
	LDA objYHi,X
	STA $66
	LDA $67
	CLC
	ADC #$04
	STA $67
	BCS bra6_9B56
	CMP #$F0
	BCC bra6_9B5D
bra6_9B56:
	CLC
	ADC #$10
	STA $67
	INC $66
bra6_9B5D:
	LDA $67
	AND #$0F
	BNE bra6_9B7A_RTS
	LDY #$05
	LDA worldNumber
	CMP #$01
	BNE bra6_9B75
	LDA levelNumber
	CMP #$02
	BNE bra6_9B75
	LDY #$01
bra6_9B75:
	STY $96
	JSR sub6_9C4F
bra6_9B7A_RTS:
	RTS

ptr6_9B7B:
	LDA #$02
	STA enemyAnimFrame,X
	LDA playerYoshiState
	BNE bra6_9BD6_RTS
	LDA playerHoldFlag
	BNE bra6_9BD6_RTS
	LDA objXDistHi,X
	BPL bra6_9B99
	LDA #$10
	CLC
	ADC objXDistLo,X
	BCS bra6_9BA0
	BCC bra6_9BD7
bra6_9B99:
	LDA objXDistLo,X
	CMP #$00
	BCS bra6_9BD7
bra6_9BA0:
	LDA playerYHiDup
	BEQ bra6_9BAD
	LDA playerYLoDup
	CMP $06DE
	BCS bra6_9BD7
	BCC bra6_9BB4
bra6_9BAD:
	LDA playerYLoDup
	CMP $06DF
	BCC bra6_9BD7
bra6_9BB4:
	LDA $1E
	CMP #$0D
	BEQ bra6_9BD6_RTS
	CMP #$0E
	BEQ bra6_9BD6_RTS
	LDA btnHeld
	AND #$08
	BEQ bra6_9BD6_RTS
	LDA #$00
	STA playerYSpd
	STA playerXSpd
	LDA #$03
	STA playerState
	STA $06DC
	LDA #$0D
	STA playerAction
bra6_9BD6_RTS:
	RTS
bra6_9BD7:
	LDA $1E
	CMP #$0D
	BEQ bra6_9BE1
	CMP #$0E
	BNE bra6_9BE9_RTS
bra6_9BE1:
	LDA #$00
	STA playerState
	LDA #$0A
	STA playerAction
bra6_9BE9_RTS:
	RTS
