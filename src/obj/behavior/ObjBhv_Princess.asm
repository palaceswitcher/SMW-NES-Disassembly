.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xB6
obj0xB6:
	LDX $A4
	objDistCalc bra_97CA

bra_97CA:
	LDA objState,X
	ASL
	TAY
	LDA tbl_97DC,Y
	STA $32
	LDA tbl_97DC+1,Y
	STA $33
	JMP ($32)
.export tbl_97DC
tbl_97DC:
	.word ptr7_97E2
	.word ptr7_9811
	.word ptr7_9840
.export ptr7_97E2
ptr7_97E2:
	LDA objFrameCount
	AND #$03
	BNE bra_97F6_RTS
	LDA objVar,X
	CMP #$28
	BCC bra_97F7
	INC objState,X
	INC bowserState
bra_97F6_RTS:
	RTS
bra_97F7:
	INC objVar,X
	LDA #$20
	STA $06E1
	LDA objYLo,X
	SEC
	SBC #$01
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	RTS
.export ptr7_9811
ptr7_9811:
	LDY #$00
	LDA objYLo,X
	CMP #$A0
	BCS bra_983C
	CMP #$90
	BCC bra_9820
	LDY #$20
bra_9820:
	STY $06E1
	LDA objFrameCount
	AND #$03
	BNE bra_983B_RTS
	LDA objYLo,X
	CLC
	ADC #$01
	STA objYLo,X
	LDA objYHi,X
	ADC #$00
	STA objYHi,X
bra_983B_RTS:
	RTS
bra_983C:
	INC objState,X
	RTS
.export ptr7_9840
ptr7_9840:
	LDA #$09
	STA gameState
	LDA objXDistHi,X
	BPL bra_9852
	LDA objXDistLo,X
	CMP #$E8
	BCC bra_9859
	BCS bra_9862
bra_9852:
	LDA objXDistLo,X
	CMP #$01
	BCC bra_9862
bra_9859:
	LDA #$10
	STA playerXSpd
	LDA #$01
	STA playerAction
	RTS
bra_9862:
	LDA #$00
	STA playerXSpd
	STA playerAction
	RTS
