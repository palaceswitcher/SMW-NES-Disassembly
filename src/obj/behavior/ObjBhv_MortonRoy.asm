.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x70
obj0x70:
	LDX $A4
	LDA objVar,X
	BPL bra6_8971
	JSR objFacePlayer
	RTS
bra6_8971:
	JSR sub6_8BCA
	LDX $A4
	LDA objState,X
	ASL
	TAY
	LDA tbl6_8988,Y
	STA $32
	LDA tbl6_8988+1,Y
	STA $33
	JMP ($32)
tbl6_8988:
	.word ptr6_899D
	.word ptr6_89AD
	.word ptr6_89C4
	.word ptr6_89F7
	.word ptr6_8A0C
	.word ptr6_8A63
	.word ptr6_8A98
	.word ptr6_8ADB
.export ptr6_899D
ptr6_899D:
	LDA enemyAnimFrame,X
	AND #$40
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	BNE bra6_89AA
	JMP loc6_8B8F
bra6_89AA:
	JMP loc6_8B6D
.export ptr6_89AD
ptr6_89AD:
	LDA enemyAnimFrame,X
	AND #$C0
	ORA #$40
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	BNE bra6_89C1
	JMP loc6_8B44
bra6_89C1:
	JMP loc6_8B20
.export ptr6_89C4
ptr6_89C4:
	LDA enemyAnimFrame,X
	AND #$C0
	ORA #$80
	STA enemyAnimFrame,X
	LDA objXDistLo,X
	BPL bra6_89DB
	EOR #$FF
	CMP #$1C
	BCS bra6_89EA
	BCC bra6_89DF
bra6_89DB:
	CMP #$04
	BCS bra6_89EA
bra6_89DF:
	LDA #$04
	STA objState,X
	LDA #$00
	STA objStateTimer,X
	RTS
bra6_89EA:
	LDA objFlags,X
	AND #$40
	BNE bra6_89F4
	JMP loc6_8B6D
bra6_89F4:
	JMP loc6_8B8F
.export ptr6_89F7
ptr6_89F7:
	LDA enemyAnimFrame,X
	AND #$80
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	BNE bra6_8A09
	JMP loc6_8B20
bra6_8A09:
	JMP loc6_8B44
.export ptr6_8A0C
ptr6_8A0C:
	LDY objStateTimer,X
	LDA tbl6_8A53,Y
	STA enemyAnimFrame,X
	LDA objFrameCount
	AND #$01
	BNE bra6_8A52_RTS
	LDA objStateTimer,X
	LSR
	CLC
	ADC objYLo,X
	STA objYLo,X
	LDA objStateTimer,X
	CMP #$0F
	BCS bra6_8A31
	INC objStateTimer,X
bra6_8A31:
	JSR sub3_B077
	BEQ bra6_8A52_RTS
	LDA #$01
	STA screenShake
	STA freezeFlag
	LDA #SFX_THUD
	STA sndSfx
	LDA objYLo,X
	AND #$F8
	STA objYLo,X
	LDA #$00
	STA objStateTimer,X
	INC objState,X
bra6_8A52_RTS:
	RTS
tbl6_8A53:
	.byte $50
	.byte $50
	.byte $50
	.byte $50
	.byte $51
	.byte $51
	.byte $51
	.byte $51
	.byte $52
	.byte $52
	.byte $52
	.byte $52
	.byte $53
	.byte $53
	.byte $53
	.byte $55
.export ptr6_8A63
ptr6_8A63:
	INC objStateTimer,X
	LDA objStateTimer,X
	CMP #$10
	BCC bra6_8A97_RTS
	CMP #$18
	BCS bra6_8A8C
	CMP #$14
	BNE bra6_8A97_RTS
	LDA #$00
	LDY objXDistHi,X
	BMI bra6_8A7E
	LDA #$40
bra6_8A7E:
	STA objFlags,X
	LDA objFlags,X
	AND #$40
	ORA #$16
	STA enemyAnimFrame,X
	RTS
bra6_8A8C:
	LDA #$00
	STA freezeFlag
	STA objState,X
	STA objStateTimer,X
bra6_8A97_RTS:
	RTS
.export ptr6_8A98
ptr6_8A98:
	LDA #$02
	CMP objVar,X
	BCS bra6_8AAF
	LDA #$07
	STA objState,X
	LDA #$00
	STA objStateTimer,X
	LDA #$18
	STA enemyAnimFrame,X
	RTS
bra6_8AAF:
	INC objStateTimer,X
	LDA objStateTimer,X
	CMP #$18
	BCS bra6_8ABD
	LDA #playerAnimFrame
	BNE bra6_8AC3
bra6_8ABD:
	CMP #$20
	BCS bra6_8AC7
	LDA #$14
bra6_8AC3:
	STA enemyAnimFrame,X
	RTS
bra6_8AC7:
	CMP #$28
	BCC bra6_8ADA_RTS
	LDA #$15
	STA enemyAnimFrame,X
	LDA #$05
	STA objState,X
	LDA #$00
	STA objStateTimer,X
bra6_8ADA_RTS:
	RTS
.export ptr6_8ADB
ptr6_8ADB:
	LDA objStateTimer,X
	CMP #$30
	BCC bra6_8B13
	BNE bra6_8AEA
	LDA #$10
	STA sndSfx
	BNE bra6_8B13
bra6_8AEA:
	CMP #$38
	BCS bra6_8AF2
	LDA #$19
	BNE bra6_8B10
bra6_8AF2:
	CMP #$40
	BCS bra6_8AFA
	LDA #$1A
	BNE bra6_8B10
bra6_8AFA:
	CMP #$48
	BCS bra6_8B02
	LDA #$1B
	BNE bra6_8B10
bra6_8B02:
	CMP #$50
	BCS bra6_8B0A
	LDA #$1C
	BNE bra6_8B10
bra6_8B0A:
	CMP #$58
	BCS bra6_8B17
	LDA #$38
bra6_8B10:
	STA enemyAnimFrame,X
bra6_8B13:
	INC objStateTimer,X
	RTS
bra6_8B17:
	LDA #MUS_VICTORY
	STA sndMusic
	LDA #$09
	STA gameState
	RTS
loc6_8B20:
	LDA objYLo,X
	CMP #$20
	BCS bra6_8B2D
	LDA #$02
	STA objState,X
	RTS
bra6_8B2D:
	DEC objYLo,X
	LDA objVar,X
	CMP #$02
	BNE bra6_8B3A
	DEC objYLo,X
bra6_8B3A:
	LDY #$03
	LDA enemyAnimFrame,X
	AND #$40
	JMP loc6_8B67
loc6_8B44:
	LDA objYLo,X
	CMP #$80
	BCC bra6_8B51
	LDA #$00
	STA objState,X
	RTS
bra6_8B51:
	INC objYLo,X
	LDA objVar,X
	CMP #$02
	BNE bra6_8B5E
	INC objYLo,X
bra6_8B5E:
	LDY #$0B
	LDA enemyAnimFrame,X
	AND #$C0
	ORA #$80
loc6_8B67:
	STA enemyAnimFrame,X
	JMP loc6_8BBA
loc6_8B6D:
	LDA objXLo,X
	CMP #$20
	BCS bra6_8B7A
	LDA #$01
	STA objState,X
	RTS
bra6_8B7A:
	DEC objXLo,X
	LDA objVar,X
	CMP #$02
	BNE bra6_8B87
	DEC objXLo,X
bra6_8B87:
	LDA enemyAnimFrame,X
	ORA #$40
	JMP loc6_8BAE
loc6_8B8F:
	LDA objXLo,X
	CMP #$C8
	BCC bra6_8B9C
	LDA #$03
	STA objState,X
	RTS
bra6_8B9C:
	INC objXLo,X
	LDA objVar,X
	CMP #$02
	BNE bra6_8BA9
	INC objXLo,X
bra6_8BA9:
	LDA enemyAnimFrame,X
	AND #$80
loc6_8BAE:
	STA enemyAnimFrame,X
	LDY #$01
	LDA objState,X
	BEQ bra6_8BBA
	LDY #$09
bra6_8BBA:
loc6_8BBA:
	LDA objFrameCount
	AND #$04
	BEQ bra6_8BC2
	INY
bra6_8BC2:
	TYA
	ORA enemyAnimFrame,X
	STA enemyAnimFrame,X
	RTS
sub6_8BCA:
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
	BEQ bra6_8BEC
	CMP #$FF
	BEQ bra6_8BEC
	JMP objRemoveObject ; unlogged
bra6_8BEC:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra6_8C2E
	LDA objYDistHi,X ; unlogged
	BPL bra6_8C1D ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc6_8C2E ; unlogged
bra6_8C1D:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra6_8C2E:
loc6_8C2E:
	LDA freezeFlag
	BEQ bra6_8C34
	RTS
bra6_8C34:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_8C48,Y
	STA $32
	LDA tbl6_8C48+1,Y
	STA $33
	JMP ($32)
tbl6_8C48:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr6_8C52
	.word objFlipKill
.export ptr6_8C52
ptr6_8C52:
	LDA objState,X
	CMP #$04
	BCS bra6_8CA1_RTS
	JSR objCollStompOrHurt
	LDA invincibilityTimer
	CMP #$F7
	BCS bra6_8CA1_RTS
	LDA objState,X
	BEQ bra6_8C86
	CMP #$01
	BNE bra6_8C78
	LDA #$30
	STA playerXSpd
	LDA playerMoveFlags
	AND #$BE
	ORA #$04
	BNE bra6_8C9B
bra6_8C78:
	CMP #$03
	BNE bra6_8C86
	LDA #$30
	STA playerXSpd
	LDA playerMoveFlags
	ORA #$45
	BNE bra6_8C9B
bra6_8C86:
	LDA #SFX_FEATHER
	STA sndSfx
	LDA #$06
	STA objState,X
	LDA #$00
	STA objStateTimer,X
	INC objVar,X
	LDA playerMoveFlags
	ORA #$04
bra6_8C9B:
	STA playerMoveFlags
	LDA #$30
	STA playerYSpd
bra6_8CA1_RTS:
	RTS
