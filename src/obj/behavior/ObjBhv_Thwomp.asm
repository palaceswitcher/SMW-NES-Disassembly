.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x84
obj0x84:
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
	BEQ bra6_81EA
	CMP #$FF
	BEQ bra6_81EA
	JMP objRemoveObject
bra6_81EA:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra6_822C
	LDA objYDistHi,X
	BPL bra6_821B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc6_822C
bra6_821B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra6_822C:
loc6_822C:
	LDA freezeFlag
	BEQ bra6_8232
	RTS
bra6_8232:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_8246,Y
	STA $32
	LDA tbl6_8246+1,Y
	STA $33
	JMP ($32)
tbl6_8246:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr6_8250
	.word objFlipKill
.export ptr6_8250
ptr6_8250:
	JSR sub6_825A
	JSR objCollStompOrHurt
	JSR jmp_54_BF74
	RTS
sub6_825A:
	LDX $A4
	LDA objVar,X
	AND #$0F
	ASL
	TAY
	LDA tbl6_8270,Y
	STA $32
	LDA tbl6_8270+1,Y
	STA $33
	JMP ($32)
tbl6_8270:
	.word ptr6_827A
	.word ptr6_82A8
	.word ptr6_82EA
	.word ptr6_834C
	.word ptr6_8366
.export ptr6_827A
ptr6_827A:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	LDA objXDistLo,X
	TAY
	LDA objXDistHi,X
	BEQ bra6_82A0
	CMP #$FF
	BNE bra6_82A7_RTS
	CPY #$B8
	BCC bra6_82A7_RTS
	BCS bra6_82A4
bra6_82A0:
	CPY #$30
	BCS bra6_82A7_RTS
bra6_82A4:
	INC objVar,X
bra6_82A7_RTS:
	RTS
.export ptr6_82A8
ptr6_82A8:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	LDA objXDistHi,X
	BEQ bra6_82C6
	CMP #$FF
	BEQ bra6_82D4
	BNE bra6_82E0 ; unlogged
bra6_82C6:
	LDA objXDistLo,X
	SEC
	SBC #$18
	BCC bra6_82E6
	CMP #$20
	BCC bra6_82E5_RTS
	BCS bra6_82E0
bra6_82D4:
	LDA objXDistLo,X
	CLC
	ADC #$30
	BCS bra6_82E6
	CMP #$E0
	BCS bra6_82E5_RTS
bra6_82E0:
	LDA #$80
	STA objVar,X
bra6_82E5_RTS:
	RTS
bra6_82E6:
	INC objVar,X
	RTS
.export ptr6_82EA
ptr6_82EA:
	LDA #$08
	BMI bra6_8305
	CLC
	ADC objYLo,X
	STA objYLo,X
	CMP #$F0
	BCC bra6_8324
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc6_8324
bra6_8305:
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	LDA objYHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYHi,X ; unlogged
	LDA objYLo,X ; unlogged
	CMP #$F0 ; unlogged
	BCC bra6_8324 ; unlogged
	LDA objYLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYLo,X ; unlogged
bra6_8324:
loc6_8324:
	JSR sub_54_BB59
	BEQ bra6_834B_RTS
	LDA objYLo,X
	AND #$F0
	STA objYLo,X
	LDA worldNumber
	CMP #$05
	BNE bra6_833F
	LDA objYHi,X
	CMP playerYHiDup
	BNE bra6_8348
bra6_833F:
	LDA #$01
	STA screenShake
	LDA #SFX_THUD
	STA sndSfx
bra6_8348:
	INC objVar,X
bra6_834B_RTS:
	RTS
.export ptr6_834C
ptr6_834C:
	LDA objFrameCount
	AND #$1E
	BNE bra6_8365_RTS
	LDA objVar,X
	CLC
	ADC #$10
	STA objVar,X
	AND #$F0
	CMP #$C0
	BCC bra6_8365_RTS
	INC objVar,X
bra6_8365_RTS:
	RTS
.export ptr6_8366
ptr6_8366:
	LDA #$FC
	BMI bra6_8381
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	CMP #$F0 ; unlogged
	BCC bra6_83A0 ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,X ; unlogged
	INC objYHi,X ; unlogged
	JMP loc6_83A0 ; unlogged
bra6_8381:
	CLC
	ADC objYLo,X
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	LDA objYLo,X
	CMP #$F0
	BCC bra6_83A0
	LDA objYLo,X
	SEC
	SBC #$10
	STA objYLo,X
bra6_83A0:
loc6_83A0:
	JSR sub_54_BB73
	BEQ bra6_83B2_RTS
	LDA objYLo,X
	ORA #$0F
	STA objYLo,X
	LDA #$80
	STA objVar,X
bra6_83B2_RTS:
	RTS
