.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xE4
obj0xE4:
	LDX $A4
	objDistCalc bra_854E

bra_854E:
	LDA objState,X
	CMP #$02
	BEQ bra_8558
	JSR sub_8592
bra_8558:
	LDX $A4
	LDA objState,X
	ASL
	TAY
	LDA tbl_856C,Y
	STA $32
	LDA tbl_856C+1,Y
	STA $33
	JMP ($32)
.export tbl_856C
tbl_856C:
	.word ptr7_8572
	.word ptr7_86B5
	.word ptr7_857C
.export ptr7_8572
ptr7_8572:
	JSR sub_86E9
	INC enemyAnimFrame,X
	INC enemyAnimFrame,X
	RTS
.export ptr7_857C
ptr7_857C:
	LDA #$04
	STA enemyAnimFrame,X
	LDA objFlags,X
	CMP #$10
	BCC bra_858E
	LDA #$00
	STA objSlot,X
	RTS
bra_858E:
	INC objFlags,X
	RTS

sub_8592:
	LDA #$06
	STA $25
	LDX $A4
	objDistCalc bra_85FC

bra_85FC:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl_8610,Y
	STA $32
	LDA tbl_8610+1,Y
	STA $33
	JMP ($32)
.export tbl_8610
tbl_8610:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr7_861A
	.word objFlipKill
.export ptr7_861A
ptr7_861A:
	JSR objCapeHitCheck
	JSR objCollStompOrHurt
	JSR objKillOnSpinJump
	JSR objStompRebound
	LDA #$00
	STA objFlags,X
	STA objVar,X
	LDA #$02
	STA objState,X
	RTS

; Dino Rhino
.export obj0xE2
obj0xE2:
	LDX $A4
	objDistCalc bra_869A

bra_869A:
	JSR sub_879B
	LDX $A4
	LDA objState,X
	ASL
	TAY
	LDA tbl_86B1,Y
	STA $32
	LDA tbl_86B1+1,Y
	STA $33
	JMP ($32)
.export tbl_86B1
tbl_86B1:
	.word sub_86E9
	.word ptr7_86B5

.export ptr7_86B5
ptr7_86B5:
	LDY #$00
	LDA objSlot,X
	CMP #OBJ_DINOTORCH
	BCC bra_86C0
	LDY #$02
bra_86C0:
	STY $25
	LDA objFlags,X
	AND #$C0
	ORA $25
	STA enemyAnimFrame,X
	JSR sub3_B077
	BEQ bra_86DD
	LDA objVar,X
	AND #$80
	STA objVar,X
	DEC objState,X
	RTS

bra_86DD:
	LDA frameCount
	AND #$01
	BNE bra_86E8_RTS
	LDA #$12
	JSR getMovementData
bra_86E8_RTS:
	RTS

.export sub_86E9
sub_86E9:
	JSR sub3_B057
	BEQ bra_874F
	LDA objVar,X
	AND #$80
	STA objVar,X
	INC objState,X
	LDA #$E0
	BMI bra_8716
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_870A
	CMP #$F0
	BCC loc_8728

bra_870A:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc_8728

bra_8716:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS loc_8728
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X

loc_8728:
	LDY #$08
	LDA objFlags,X
	AND #$40
	BNE bra_8733
	LDY #$F8
bra_8733:
	TYA
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra_8746
	LDA objXHi,X
	ADC #$00
	BPL bra_874B
bra_8746:
	LDA objXHi,X
	SBC #$00
bra_874B:
	STA objXHi,X
	RTS
bra_874F:
	LDY #$13
	LDA objSlot,X
	CMP #OBJ_DINOTORCH
	BCC bra_8759
	INY
bra_8759:
	STY $25
	LDA frameCount
	AND #$01
	BNE bra_8766
	LDA $25
	JSR getMovementData
bra_8766:
	LDY #$00
	LDA objFrameCount
	AND #$08
	BNE bra_8770
	INY
bra_8770:
	STY $25
	LDA $15
	BNE bra_8790
	LDA invincibilityTimer
	BNE bra_8790
	LDA objFlags,X
	AND #$BF
	STA objFlags,X
	LDA objXDistHi,X
	BMI bra_8790
	LDA objFlags,X
	ORA #$40
	STA objFlags,X
bra_8790:
	LDA objFlags,X
	AND #$C0
	ORA $25
	STA enemyAnimFrame,X
	RTS

.export sub_879B
sub_879B:
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
	BEQ bra_87BD
	CMP #$FF
	BEQ bra_87BD
	JMP objRemoveObject
bra_87BD:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_87FF
	LDA objYDistHi,X
	BPL bra_87EE
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_87FF
bra_87EE:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_87FF:
loc_87FF:
	LDA freezeFlag
	BEQ bra_8805
	RTS
bra_8805:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl_8819,Y
	STA $32
	LDA tbl_8819+1,Y
	STA $33
	JMP ($32)
.export tbl_8819
tbl_8819:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr7_8823
	.word objFlipKill
.export ptr7_8823
ptr7_8823:
	JSR objCollStompOrHurt
	JSR objKillOnSpinJump
	LDA #$10
	BMI bra_8846
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_883A
	CMP #$F0
	BCC bra_8858
bra_883A:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc_8858
bra_8846:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8858
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra_8858:
loc_8858:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8874
	CMP #$FF
	BEQ bra_8874
	JMP objRemoveObject
bra_8874:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_88B6
	LDA objYDistHi,X
	BPL bra_88A5
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_88B6
bra_88A5:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_88B6:
loc_88B6:
	LDA freezeFlag
	BEQ bra_88BC
	RTS
bra_88BC:
	INC objSlot,X
	INC objSlot,X
	LDA #$00
	STA objFlags,X
	STA objVar,X
	STA objState,X
	JSR objStompRebound
	RTS
