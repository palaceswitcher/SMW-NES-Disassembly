.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x92
obj0x92:
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
	BEQ bra6_86F1
	CMP #$FF
	BEQ bra6_86F1
	JMP objRemoveObject
bra6_86F1:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra6_8733
	LDA objYDistHi,X
	BPL bra6_8722
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc6_8733
bra6_8722:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra6_8733:
loc6_8733:
	LDA freezeFlag
	BEQ bra6_8739
	RTS
bra6_8739:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_874D,Y
	STA $32
	LDA tbl6_874D+1,Y
	STA $33
	JMP ($32)
tbl6_874D:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr6_8755
.export ptr6_8755
ptr6_8755:
	JSR sub6_875F
	JSR objCollStompOrHurt
	JSR jmp_54_BF74 ; unlogged
	RTS ; unlogged
sub6_875F:
	LDX $A4
	LDA objVar,X
	STA playerScores
	AND #$0F
	ASL
	TAY
	LDA tbl6_8778,Y
	STA $32
	LDA tbl6_8778+1,Y
	STA $33
	JMP ($32)
tbl6_8778:
	.word ptr6_87DC
	.word ptr6_8780
	.word ptr6_87DC
	.word ptr6_87AD
.export ptr6_8780
ptr6_8780:
	LDA #$FF
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra6_8794
	LDA objXHi,X ; unlogged
	ADC #$00 ; unlogged
	BPL bra6_8799 ; unlogged
bra6_8794:
	LDA objXHi,X
	SBC #$00
bra6_8799:
	STA objXHi,X
	JSR sub_54_BBA8
	BEQ bra6_87AC_RTS
	LDA objXLo,X
	ORA #$0F
	STA objXLo,X
	INC objVar,X
bra6_87AC_RTS:
	RTS
.export ptr6_87AD
ptr6_87AD:
	LDA #$01
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra6_87C1
	LDA objXHi,X
	ADC #$00
	BPL bra6_87C6
bra6_87C1:
	LDA objXHi,X ; unlogged
	SBC #$00 ; unlogged
bra6_87C6:
	STA objXHi,X
	JSR sub_54_BB8E
	BEQ bra6_87DB_RTS
	LDA objXLo,X
	AND #$F0
	STA objXLo,X
	LDA #$80
	STA objVar,X
bra6_87DB_RTS:
	RTS
.export ptr6_87DC
ptr6_87DC:
	LDA objFrameCount
	AND #$0E
	BNE bra6_87FD_RTS
	LDA objVar,X
	CLC
	ADC #$10
	STA objVar,X
	AND #$F0
	CMP #$C0
	BCC bra6_87FD_RTS
	INC objVar,X
	LDA objVar,X
	AND #$8F
	STA objVar,X
bra6_87FD_RTS:
	RTS
