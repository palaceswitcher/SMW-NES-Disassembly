.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x86
obj0x86:
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
	BEQ bra6_85A8
	CMP #$FF
	BEQ bra6_85A8
	JMP objRemoveObject
bra6_85A8:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra6_85EA
	LDA objYDistHi,X
	BPL bra6_85D9
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc6_85EA
bra6_85D9:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra6_85EA:
loc6_85EA:
	LDA freezeFlag
	BEQ bra6_85F0
	RTS
bra6_85F0:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_8604,Y
	STA $32
	LDA tbl6_8604+1,Y
	STA $33
	JMP ($32)
tbl6_8604:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr6_860C
.export ptr6_860C
ptr6_860C:
	JSR sub6_8616
	JSR objCollStompOrHurt
	JSR jmp_54_BF74
	RTS
sub6_8616:
	LDX $A4
	LDA objVar,X
	STA playerScores ; Likely a leftover debugging function
	AND #$0F
	ASL
	TAY
	LDA tbl6_862F,Y
	STA $32
	LDA tbl6_862F+1,Y
	STA $33
	JMP ($32)
tbl6_862F:
	.word ptr6_87DC
	.word ptr6_8637
	.word ptr6_87DC
	.word ptr6_8682
.export ptr6_8637
ptr6_8637:
	LDA #$FF
	BMI bra6_8652
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	CMP #$F0 ; unlogged
	BCC bra6_8671 ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,X ; unlogged
	INC objYHi,X ; unlogged
	JMP loc6_8671 ; unlogged
bra6_8652:
	CLC
	ADC objYLo,X
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	LDA objYLo,X
	CMP #$F0
	BCC bra6_8671
	LDA objYLo,X
	SEC
	SBC #$10
	STA objYLo,X
bra6_8671:
loc6_8671:
	JSR sub_54_BB73
	BEQ bra6_8681_RTS
	LDA objYLo,X
	ORA #$0F
	STA objYLo,X
	INC objVar,X
bra6_8681_RTS:
	RTS
.export ptr6_8682
ptr6_8682:
	LDA #$01
	BMI bra6_869D
	CLC
	ADC objYLo,X
	STA objYLo,X
	CMP #$F0
	BCC bra6_86BC
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc6_86BC
bra6_869D:
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	LDA objYHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYHi,X ; unlogged
	LDA objYLo,X ; unlogged
	CMP #$F0 ; unlogged
	BCC bra6_86BC ; unlogged
	LDA objYLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYLo,X ; unlogged
bra6_86BC:
loc6_86BC:
	JSR sub_54_BB59
	BEQ bra6_86CE_RTS
	LDA objYLo,X
	AND #$F0
	STA objYLo,X
	LDA #$80
	STA objVar,X
bra6_86CE_RTS:
	RTS
