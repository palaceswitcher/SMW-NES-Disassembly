; disassembled with BZK 6502 Disassembler
ptr7_8000:
	LDA playerYHi
	BNE bra_8005
	RTS
bra_8005:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA sprTblWoodenSpike,X
	STA $32
	LDA sprTblWoodenSpike+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8025
	LDY #$C0
bra_8025:
	STY $36
	LDA #$20
	STA $05F0
	STA $06E1
	JSR jmp_52_A118
	LDA #$00
	STA $06E1
	RTS
sprTblWoodenSpike:
	.word sprWoodenSpikeUp
	.word sprWoodenSpikeDown
sprWoodenSpikeUp:
	.byte $02
	.byte $08
	.byte $CF
	.byte $CC, $CD
	.byte $CE, $CF
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C4, $C5
	.byte $C6, $C7
sprWoodenSpikeDown:
	.byte $02
	.byte $08
	.byte $CF
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C4, $C5
	.byte $C6, $C7
	.byte $C8, $C9
	.byte $CA, $CB
obj0xD4:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8080
	CMP #$FF
	BEQ bra_8080
	JMP objRemoveObject
bra_8080:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc_80C2
	LDA objYDistHi,X
	BPL bra_80B1
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_80C2
bra_80B1:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc_80C2:
	LDA freezeFlag
	BEQ bra_80C8
	RTS
bra_80C8:
	LDY #$46
	LDA objState,X
	BEQ bra_80D0
	INY
bra_80D0:
	STY $32
	LDA frameCount
	AND #$01
	BNE bra_80DD
	LDA $32
	JSR parseMovementData
bra_80DD:
	JSR sub_82EA
	JSR jmp_54_BF74
	RTS
obj0xE0:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8102
	CMP #$FF
	BEQ bra_8102
	JMP objRemoveObject
bra_8102:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc_8144
	LDA objYDistHi,X
	BPL bra_8133
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_8144
bra_8133:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc_8144:
	LDA freezeFlag
	BEQ bra_814A
	RTS
bra_814A:
	LDA objVar,X
	BMI bra_8152
	JMP loc_82A7
bra_8152:
	LDY objCount
	INC objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	STA objXLo+1,Y
	LDA objXHi,X
	STA objXHi,Y
	STA objXHi+1,Y
	LDA objYLo,X
	STA objYLo,Y
	STA objYLo+1,Y
	LDA objYHi,X
	STA objYHi,Y
	STA objYHi+1,Y
	LDA objYLo,Y
	SEC
	SBC #$90
	STA objYLo,Y
	BCS bra_8196
	SEC
	SBC #$10
	STA objYLo,Y
	LDA objYHi,Y
	SEC
	SBC #$01
	STA objYHi,Y
bra_8196:
	LDA objXLo+1,Y
	CLC
	ADC #$04
	STA objXLo+1,Y
	LDA objXHi+1,Y
	ADC #$00
	STA objXHi+1,Y
	LDA #$80
	STA objVar,Y
	LDA #$00
	STA objVar,X
	STA $0579,Y
	STA objFlags,Y
	STA objFlags+1,Y
	STA objState+1,Y
	LDA objSlot,X
	AND #$01
	CLC
	ADC #$F8
	STA objSlot,Y
	LDA #$D6
	STA objSlot+1,Y
	RTS
obj0xF4:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_81EC
	CMP #$FF
	BEQ bra_81EC
	JMP objRemoveObject
bra_81EC:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc_822E
	LDA objYDistHi,X
	BPL bra_821D
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_822E
bra_821D:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc_822E:
	LDA freezeFlag
	BEQ bra_8234
	RTS
bra_8234:
	LDA objVar,X
	BPL loc_82A7
	LDA #$00
	STA objVar,X
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #$00
	STA objState,Y
	STA objFlags,Y
	STA objVar,Y
	LDA #$D6
	STA objSlot,Y
	LDA objXLo,Y
	CLC
	ADC #$04
	STA objXLo,Y
	LDA objXHi,Y
	ADC #$00
	STA objXHi,Y
	LDA #$00
	STA objState,Y
	LDA objSlot,X
	CMP #$F8
	BCC bra_82A6_RTS
	LDA #$01
	STA objState,Y
	LDA objYLo,Y
	CLC
	ADC #$38
	STA objYLo,Y
	BCC bra_82A6_RTS
	CLC
	ADC #$10
	STA objYLo,Y
	LDA objYHi,Y
	CLC
	ADC #$01
	STA objYHi,Y
bra_82A6_RTS:
	RTS
loc_82A7:
	JSR sub_82C9
	LDY #$00
	LDA objSlot,X
	CMP #$F8
	BCC bra_82B4
	INY
bra_82B4:
	TYA
	STA enemyAnimFrame,X
	CLC
	ADC #$46
	STA $32
	LDA frameCount
	AND #$01
	BNE bra_82C8_RTS
	LDA $32
	JSR parseMovementData
bra_82C8_RTS:
	RTS
sub_82C9:
	JSR sub_82EA
	LDA playerMoveFlags
	AND #$01
	BNE bra_82DF
	LDA objXDistHi,X
	BMI loc_82E9_RTS
	LDA #$01
	STA playerXMovementLocked
	JMP loc_82E9_RTS
bra_82DF:
	LDA objXDistHi,X
	BPL loc_82E9_RTS
	LDA #$01
	STA playerXMovementLocked
loc_82E9_RTS:
	RTS
sub_82EA:
	LDY objSlot,X
	LDA objectXHitBoxSizes,Y
	STA $36
	LDA objectYHitBoxSizes,Y
	STA $38
	LDY #$10
	LDA playerPowerup
	BEQ bra_8300
	LDY #$18
bra_8300:
	LDA playerAction
	CMP #$07
	BNE bra_8308
	LDY #$08
bra_8308:
	STY $32
	LDA objXDistHi,X
	BPL bra_831C
	LDA #$05
	CLC
	ADC $36
	CLC
	ADC objXDistLo,X
	BCS bra_8323
	BCC bra_8343
bra_831C:
	LDA objXDistLo,X
	CMP #$05
	BCS bra_8343
bra_8323:
	LDA objYDistHi,X
	BEQ bra_8339
	CMP #$FF
	BNE bra_8343
	LDA $32
	CLC
	ADC $38
	CLC
	ADC objYDistLo,X
	BCS bra_8340
	BCC bra_8343
bra_8339:
	LDA objYDistLo,X
	CMP #$00
	BCS bra_8343
bra_8340:
	CLC
	BCC bra_8344
bra_8343:
	SEC
bra_8344:
	BCC bra_8348_RTS
	PLA
	PLA
bra_8348_RTS:
	RTS
ptr6_8349:
	LDA #$00
	ASL
	TAX
	LDA sprTblPeachMushroom,X
	STA $32
	LDA sprTblPeachMushroom+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
sprTblPeachMushroom:
	.word sprPeachMushroom
sprPeachMushroom:
	.byte $02
	.byte $02
	.byte $90
	.byte $01, $02
	.byte $0B, $0C
obj0xBD:
	LDX $A4
	LDA objVar,X
	BPL bra_83F3
	AND #$7F
	CMP #$10
	BCC bra_8380
	LDA #$00
	STA objVar,X
	RTS
bra_8380:
	INC objVar,X
	LDA frameCount
	AND #$01
	BNE bra_838E
	LDA #$4C
	JSR getMovementData
bra_838E:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_83AA
	CMP #$FF
	BEQ bra_83AA
	JMP objRemoveObject
bra_83AA:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_83EC
	LDA objYDistHi,X
	BPL bra_83DB
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_83EC
bra_83DB:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_83EC:
loc_83EC:
	LDA freezeFlag
	BEQ bra_83F2_RTS
	RTS
bra_83F2_RTS:
	RTS
bra_83F3:
	LDA frameCount
	AND #$00
	BNE bra_83FE
	LDA #$0B
	JSR getMovementData
bra_83FE:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_841A
	CMP #$FF
	BEQ bra_841A
	JMP objRemoveObject
bra_841A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc_845C
	LDA objYDistHi,X
	BPL bra_844B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_845C
bra_844B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X

loc_845C:
	LDA freezeFlag
	BEQ bra_8462
	RTS
bra_8462:
	LDX $A4
	JSR sub_82EA
	JSR jmp_54_AE3D
	LDA #$00
	STA objSlot,Y
	LDA #$03
	JSR rewardPoints
	RTS
ptr6_8475:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_84A3,X
	STA $32
	LDA tbl_84A3+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8495
	LDY #$C0
bra_8495:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl_84A3:
	.word dinoRhino1
	.word dinoRhino2
	.word dinoTorch1
	.word dinoTorch2
	.word dinoTorchFlat
dinoRhino1:
	.byte $04
	.byte $04
	.byte $D0
	.byte $0D, $0E, $0F, $FF
	.byte $13, $14, $15, $16
	.byte $1B, $1C, $1D, $1E
	.byte $23, $24, $25, $26
dinoRhino2:
	.byte $04
	.byte $04
	.byte $D0
	.byte $10, $11, $12, $FF
	.byte $17, $18, $19, $1A
	.byte $1F, $20, $21, $22
	.byte $27, $28, $29, $2A
dinoTorch1:
	.byte $02
	.byte $02
	.byte $D0
	.byte $02, $03
	.byte $07, $08
dinoTorch2:
	.byte $02
	.byte $02
	.byte $D0
	.byte $02, $04
	.byte $09, $0A
dinoTorchFlat:
	.byte $02
	.byte $02
	.byte $D0
	.byte $05, $06
	.byte $0B, $0C

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
tbl_856C:
	.word ptr7_8572
	.word ptr7_86B5
	.word ptr7_857C
ptr7_8572:
	JSR sub_86E9
	INC enemyAnimFrame,X
	INC enemyAnimFrame,X
	RTS
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
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_85B4
	CMP #$FF
	BEQ bra_85B4
	JMP objRemoveObject
bra_85B4:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_85F6
	LDA objYDistHi,X
	BPL bra_85E5
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_85F6
bra_85E5:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_85F6:
loc_85F6:
	LDA freezeFlag
	BEQ bra_85FC
	RTS
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
tbl_8610:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr7_861A
	.word objFlipKill
ptr7_861A:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	JSR objStompRebound
	LDA #$00
	STA objFlags,X
	STA objVar,X
	LDA #$02
	STA objState,X
	RTS

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
tbl_86B1:
	.word sub_86E9
	.word ptr7_86B5

ptr7_86B5:
	LDY #$00
	LDA objSlot,X
	CMP #$E6
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
	CMP #$E6
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
tbl_8819:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr7_8823
	.word objFlipKill
ptr7_8823:
	JSR objPlayerHitCheck
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
ptr6_88D1:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8938,X
	STA $32
	LDA tbl_8938+1,X
	STA $33
	LDA #$C0
	STA $36
	LDA #$00
	STA $05F0
	STA $06E1
	JSR sub2_A2CA
	LDA #$20
	STA $06E1
	RTS
ptr6_88F9:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8938,X
	STA $32
	LDA tbl_8938+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8919
	LDY #$C0
bra_8919:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA enemyAnimFrame,X
	CMP #$55
	BCS bra_892F
	LDA #$00
	STA $06E1
bra_892F:
	JSR jmp_54_A118
	LDA #$20
	STA $06E1
	RTS
tbl_8938:
	.word ofs_896A
	.word ofs_8973
	.word ofs_897C
	.word ofs_8985
	.word ofs_898E
	.word ofs_8992
	.word ofs_89B9
	.word ofs_89E0
	.word ofs_8A07
	.word ofs_8A2E
	.word ofs_8A55
	.word ofs_8A7C
	.word ofs_8AA2
	.word ofs_8AC8
	.word ofs_8AD4
	.word ofs_8AE0
	.word ofs_8AEC
	.word ofs_8AF8
	.word ofs_8B0F
	.word ofs_8B26
	.word ofs_8B3D
	.word ofs_8B54
	.word ofs_8B6B
	.word ofs_8B7E
	.word ofs_8B8D
ofs_896A:
	.byte $06
	.byte $01
	.byte $E0
	.byte $FF
	.byte $FF
	.byte $30
	.byte $31
	.byte $FF
	.byte $FF
ofs_8973:
	.byte $06
	.byte $01
	.byte $E0
	.byte $FF
	.byte $32
	.byte $33
	.byte $34
	.byte $35
	.byte $FF
ofs_897C:
	.byte $06
	.byte $01
	.byte $E0
	.byte $36
	.byte $37
	.byte $38
	.byte $39
	.byte $3A
	.byte $3B
ofs_8985:
	.byte $06
	.byte $01
	.byte $E0
	.byte $FF
	.byte $3C
	.byte $3D
	.byte $3E
	.byte $3F
	.byte $FF
ofs_898E:
	.byte $01
	.byte $01
	.byte $E0
	.byte $FF
ofs_8992:
	.byte $06
	.byte $06
	.byte $E0
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $FF
	.byte $FF
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $09
	.byte $FF
	.byte $0F
	.byte $10
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $18
	.byte $19
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $FF
	.byte $FF
ofs_89B9:
	.byte $06
	.byte $06
	.byte $E0
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $FF
	.byte $FF
	.byte $0A
	.byte $0B
	.byte $07
	.byte $08
	.byte $09
	.byte $FF
	.byte $0F
	.byte $10
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $18
	.byte $19
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $FF
	.byte $FF
ofs_89E0:
	.byte $06
	.byte $06
	.byte $E0
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $FF
	.byte $FF
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $08
	.byte $09
	.byte $FF
	.byte $15
	.byte $16
	.byte $17
	.byte $12
	.byte $13
	.byte $14
	.byte $1E
	.byte $1F
	.byte $20
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $FF
	.byte $FF
ofs_8A07:
	.byte $06
	.byte $06
	.byte $E3
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $ED
	.byte $EE
	.byte $EF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C6
	.byte $C7
	.byte $C8
	.byte $C9
	.byte $CA
	.byte $D3
	.byte $D4
	.byte $D5
	.byte $D6
	.byte $D7
	.byte $D8
	.byte $E0
	.byte $E1
	.byte $E2
	.byte $D9
	.byte $FF
	.byte $FF
ofs_8A2E:
	.byte $06
	.byte $06
	.byte $E0
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $FF
	.byte $21
	.byte $22
	.byte $23
	.byte $24
	.byte $25
	.byte $26
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $FF
	.byte $FF
ofs_8A55:
	.byte $06
	.byte $06
	.byte $E0
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $21
	.byte $27
	.byte $28
	.byte $29
	.byte $2A
	.byte $FF
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $FF
	.byte $FF
ofs_8A7C:
	.byte $07
	.byte $05
	.byte $E1
	.byte $FF
	.byte $40
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $36
	.byte $41
	.byte $42
	.byte $43
	.byte $44
	.byte $45
	.byte $46
	.byte $47
	.byte $48
	.byte $49
	.byte $4A
	.byte $4B
	.byte $4C
	.byte $4D
	.byte $FF
	.byte $57
	.byte $58
	.byte $59
	.byte $5A
	.byte $5B
	.byte $40
	.byte $FF
	.byte $65
	.byte $66
	.byte $67
	.byte $68
	.byte $69
	.byte $FF
ofs_8AA2:
	.byte $07
	.byte $05
	.byte $E1
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $40
	.byte $FF
	.byte $36
	.byte $41
	.byte $42
	.byte $43
	.byte $44
	.byte $45
	.byte $46
	.byte $47
	.byte $48
	.byte $4E
	.byte $4F
	.byte $50
	.byte $4C
	.byte $4D
	.byte $40
	.byte $57
	.byte $5C
	.byte $5D
	.byte $56
	.byte $5B
	.byte $FF
	.byte $FF
	.byte $65
	.byte $6A
	.byte $6B
	.byte $64
	.byte $69
	.byte $FF
ofs_8AC8:
	.byte $03
	.byte $03
	.byte $E3
	.byte $C2
	.byte $C3
	.byte $C4
	.byte $D0
	.byte $D1
	.byte $D2
	.byte $DD
	.byte $DE
	.byte $DF
ofs_8AD4:
	.byte $03
	.byte $03
	.byte $E1
	.byte $51
	.byte $52
	.byte $53
	.byte $5E
	.byte $5F
	.byte $60
	.byte $FF
	.byte $6C
	.byte $6D
ofs_8AE0:
	.byte $03
	.byte $03
	.byte $E1
	.byte $54
	.byte $55
	.byte $FF
	.byte $61
	.byte $62
	.byte $63
	.byte $FF
	.byte $6E
	.byte $6F
ofs_8AEC:
	.byte $03
	.byte $03
	.byte $E3
	.byte $C5
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C5
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C5
ofs_8AF8:
	.byte $04
	.byte $05
	.byte $E2
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $84
	.byte $85
	.byte $86
	.byte $87
	.byte $FF
	.byte $88
	.byte $89
	.byte $8A
	.byte $FF
	.byte $94
	.byte $95
	.byte $96
	.byte $FF
	.byte $A0
	.byte $A1
	.byte $A2
ofs_8B0F:
	.byte $04
	.byte $05
	.byte $E2
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $84
	.byte $85
	.byte $86
	.byte $87
	.byte $FF
	.byte $8B
	.byte $8C
	.byte $8D
	.byte $FF
	.byte $97
	.byte $98
	.byte $99
	.byte $FF
	.byte $A3
	.byte $A4
	.byte $A5
ofs_8B26:
	.byte $04
	.byte $05
	.byte $E2
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $84
	.byte $85
	.byte $86
	.byte $87
	.byte $FF
	.byte $8E
	.byte $8F
	.byte $90
	.byte $FF
	.byte $9A
	.byte $9B
	.byte $9C
	.byte $FF
	.byte $A6
	.byte $A7
	.byte $A8
ofs_8B3D:
	.byte $04
	.byte $05
	.byte $E2
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $84
	.byte $85
	.byte $86
	.byte $87
	.byte $FF
	.byte $91
	.byte $92
	.byte $93
	.byte $FF
	.byte $9D
	.byte $9E
	.byte $9F
	.byte $FF
	.byte $A9
	.byte $AA
	.byte $AB
ofs_8B54:
	.byte $04
	.byte $05
	.byte $E2
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $88
	.byte $89
	.byte $8A
	.byte $FF
	.byte $94
	.byte $95
	.byte $96
	.byte $FF
	.byte $A0
	.byte $A1
	.byte $A2
ofs_8B6B:
	.byte $04
	.byte $04
	.byte $E2
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $88
	.byte $89
	.byte $8A
	.byte $FF
	.byte $94
	.byte $95
	.byte $96
ofs_8B7E:
	.byte $04
	.byte $03
	.byte $E2
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $88
	.byte $89
	.byte $8A
ofs_8B8D:
	.byte $07
	.byte $05
	.byte $E1
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $36
	.byte $41
	.byte $42
	.byte $43
	.byte $44
	.byte $45
	.byte $46
	.byte $47
	.byte $48
	.byte $4E
	.byte $4F
	.byte $50
	.byte $4C
	.byte $4D
	.byte $FF
	.byte $57
	.byte $5C
	.byte $5D
	.byte $56
	.byte $5B
	.byte $FF
	.byte $FF
	.byte $65
	.byte $6A
	.byte $6B
	.byte $64
	.byte $69
	.byte $FF
obj0xD5:
	LDX $A4
	LDA #$02
	STA enemyAnimFrame,X
	LDA $06E3
	BMI bra_8BD8
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8BCC
	CMP #$F0
	BCC loc_8BEA
bra_8BCC:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc_8BEA
bra_8BD8:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS loc_8BEA
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
loc_8BEA:
	LDA $06E2
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra_8BFF
	LDA objXHi,X
	ADC #$00
	BPL bra_8C04
bra_8BFF:
	LDA objXHi,X
	SBC #$00
bra_8C04:
	STA objXHi,X
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8C23
	CMP #$FF
	BEQ bra_8C23
	JMP objRemoveObject
bra_8C23:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc_8C65
	LDA objYDistHi,X
	BPL bra_8C54
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_8C65
bra_8C54:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc_8C65:
	LDA freezeFlag
	BEQ bra_8C6B
	RTS
bra_8C6B:
	LDX $A4
	JSR sub_82EA
	JSR jmp_54_BF74
	LDA #SFX_ENEMYHIT3
	STA sndSfx
	RTS
obj0xDE:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8C96
	CMP #$FF
	BEQ bra_8C96
	JMP objRemoveObject
bra_8C96:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_8CD8
	LDA objYDistHi,X
	BPL bra_8CC7
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_8CD8
bra_8CC7:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_8CD8:
loc_8CD8:
	LDA freezeFlag
	BEQ bra_8CDE
	RTS
bra_8CDE:
	LDA objVar,X
	BMI bra_8CE6
	JMP loc_8D69
bra_8CE6:
	LDA #$00
	STA bowserHitCount
	STA $06E2
	STA $06E3
	STA objVar,X
	LDY objCount
	INC objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	SEC
	SBC #$70
	STA objYLo,Y
	LDA objYHi,X
	SBC #$00
	STA objYHi,Y
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo+1,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi+1,Y
	LDA objYLo,X
	SEC
	SBC #$48
	STA objYLo+1,Y
	LDA objYHi,X
	SBC #$00
	STA objYHi+1,Y
	LDA objFlags,X
	STA objFlags,Y
	STA objFlags+1,Y
	LDA #$00
	STA objVar,Y
	STA $0579,Y
	STA objState,Y
	STA $0641,Y
	STA $05F6
	STA bowserState
	LDA #$E1
	STA objSlot,Y
	LDA #$D7
	STA objSlot+1,Y
	LDA #$E0
	STA $03C9
	STA $03CA
	RTS
loc_8D69:
	LDX $A4
	JSR sub_8E1A
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8D8A
	CMP #$FF
	BEQ bra_8D8A
	JMP objRemoveObject
bra_8D8A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_8DCC
	LDA objYDistHi,X
	BPL bra_8DBB
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_8DCC
bra_8DBB:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_8DCC:
loc_8DCC:
	LDA freezeFlag
	BEQ bra_8DD2
	RTS
bra_8DD2:
	LDX $A4
	LDA objFrameCount
	AND #$0C
	LSR
	LSR
	STA enemyAnimFrame,X
	LDA $06E7
	BEQ bra_8DF5
	STA clownCarFace
	INC clownCarFace
	JSR sub_82EA
	JSR jmp_54_BF74
	LDA #$02
	STA enemyAnimFrame,X
	RTS
bra_8DF5:
	LDA objFrameCount
	AND #$E0
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_8E12,Y
	STA clownCarFace
	JSR sub_82EA
	JSR jmp_54_BF74
	LDA #$02
	STA enemyAnimFrame,X
	RTS
tbl_8E12:
	.byte $00 ; Clown car blink cycle
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
sub_8E1A:
	LDA $06E3
	BMI bra_8E38
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8E2C
	CMP #$F0
	BCC bra_8E4A
bra_8E2C:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc_8E4A
bra_8E38:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8E4A
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra_8E4A:
loc_8E4A:
	LDA $03
	SEC
	SBC $06E3
	STA $03
	LDA $06E2
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra_8E67
	LDA objXHi,X
	ADC #$00
	BPL bra_8E6C
bra_8E67:
	LDA objXHi,X
	SBC #$00
bra_8E6C:
	STA objXHi,X
	LDA $02
	SEC
	SBC $06E2
	STA $02
	RTS
sub_8E78:
	LDA $06E3
	BMI bra_8E96
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8E8A
	CMP #$F0
	BCC bra_8EA8
bra_8E8A:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc_8EA8
bra_8E96:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8EA8
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra_8EA8:
loc_8EA8:
	LDA $06E2
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra_8EBD
	LDA objXHi,X
	ADC #$00
	BPL bra_8EC2
bra_8EBD:
	LDA objXHi,X
	SBC #$00
bra_8EC2:
	STA objXHi,X
	LDA #$00
	STA $06E2
	STA $06E3
	RTS
ptr6_8ECE:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8EFC,X
	STA $32
	LDA tbl_8EFC+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8EEE
	LDY #$C0
bra_8EEE:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl_8EFC:
	.word ofs_8F00
	.word ofs_8F17
ofs_8F00:
	.byte $04
	.byte $05
	.byte $E3
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $CB
	.byte $CC
	.byte $CD
	.byte $FF
	.byte $DA
	.byte $DB
	.byte $DC
	.byte $E3
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $FF
	.byte $E9
	.byte $EA
	.byte $FF
ofs_8F17:
	.byte $04
	.byte $05
	.byte $E3
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $CE
	.byte $CF
	.byte $CD
	.byte $FF
	.byte $DA
	.byte $DB
	.byte $DC
	.byte $E3
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $FF
	.byte $E9
	.byte $EA
	.byte $FF
ptr6_8F2E:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8F66,X
	STA $32
	LDA tbl_8F66+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8F4E
	LDY #$C0
bra_8F4E:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA #$00
	STA $06E1
	JSR jmp_54_A118
	LDA #$20
	STA $06E1
	RTS
tbl_8F66:
	.word ofs_8F76
	.word ofs_8F82
	.word ofs_8F8E
	.word ofs_8F9A
	.word ofs_8FA6
	.word ofs_8FB2
	.word ofs_8FBE
	.word ofs_8FCA
ofs_8F76:
	.byte $03
	.byte $03
	.byte $E3
	.byte $C2
	.byte $C3
	.byte $C4
	.byte $D0
	.byte $D1
	.byte $D2
	.byte $DD
	.byte $DE
	.byte $DF
ofs_8F82:
	.byte $03
	.byte $03
	.byte $E1
	.byte $51
	.byte $52
	.byte $53
	.byte $5E
	.byte $5F
	.byte $60
	.byte $FF
	.byte $6C
	.byte $6D
ofs_8F8E:
	.byte $03
	.byte $03
	.byte $E1
	.byte $54
	.byte $55
	.byte $FF
	.byte $61
	.byte $62
	.byte $63
	.byte $FF
	.byte $6E
	.byte $6F
ofs_8F9A:
	.byte $03
	.byte $03
	.byte $E3
	.byte $C5
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C5
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C5
ofs_8FA6:
	.byte $03
	.byte $03
	.byte $E3
	.byte $DD
	.byte $DE
	.byte $DF
	.byte $D0
	.byte $D1
	.byte $D2
	.byte $C2
	.byte $C3
	.byte $C4
ofs_8FB2:
	.byte $03
	.byte $03
	.byte $E1
	.byte $FF
	.byte $6C
	.byte $6D
	.byte $5E
	.byte $5F
	.byte $60
	.byte $51
	.byte $52
	.byte $53
ofs_8FBE:
	.byte $03
	.byte $03
	.byte $E1
	.byte $FF
	.byte $6E
	.byte $6F
	.byte $61
	.byte $62
	.byte $63
	.byte $54
	.byte $55
	.byte $FF
ofs_8FCA:
	.byte $03
	.byte $03
	.byte $E3
	.byte $FF
	.byte $C5
	.byte $C5
	.byte $C5
	.byte $C5
	.byte $FF
	.byte $C5
	.byte $FF
	.byte $FF
obj0xBA:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8FF4
	CMP #$FF
	BEQ bra_8FF4
	JMP objRemoveObject
bra_8FF4:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_9036
	LDA objYDistHi,X
	BPL bra_9025
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_9036
bra_9025:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_9036:
loc_9036:
	LDA freezeFlag
	BEQ bra_903C
	RTS
bra_903C:
	LDA objState,X
	CLC
	ADC #$50
	STA $25
	LDA frameCount
	AND #$00
	BNE bra_904F
	LDA $25
	JSR parseMovementData
bra_904F:
	LDX $A4
	LDA objVar,X
	CMP #$0C
	BCC bra_907C_RTS
	LDA objFrameCount
	AND #$07
	BNE bra_907C_RTS
	LDA enemyAnimFrame,X
	AND #$03
	CMP #$03
	BCS bra_906C
	INC enemyAnimFrame,X
	RTS
bra_906C:
	LDA objState,X
	BNE bra_9074
	INC bowserState
bra_9074:
	LDA #$00
	STA objSlot,X
	STA $05F6
bra_907C_RTS:
	RTS
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_909B
	CMP #$FF
	BEQ bra_909B
	JMP objRemoveObject
bra_909B:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_90DD
	LDA objYDistHi,X
	BPL bra_90CC
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_90DD
bra_90CC:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_90DD:
loc_90DD:
	LDA freezeFlag
	BEQ bra_90E3_RTS
	RTS
bra_90E3_RTS:
	RTS
obj0xDF:
	LDX $A4
	JSR sub_8E78
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_9105
	CMP #$FF
	BEQ bra_9105
	JMP objRemoveObject
bra_9105:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_9147
	LDA objYDistHi,X
	BPL bra_9136
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_9147
bra_9136:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_9147:
loc_9147:
	LDA freezeFlag
	BEQ bra_914D
	RTS
bra_914D:
	JSR sub_9159
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	RTS
sub_9159:
	LDX $A4
	LDA bowserState
	ASL
	TAY
	LDA tbl_916D,Y
	STA $32
	LDA tbl_916D+1,Y
	STA $33
	JMP ($32)
tbl_916D:
	.word ptr7_91DA
	.word ptr7_91F7
	.word ptr7_9238
	.word ptr7_9271
	.word ptr7_92B0
	.word ptr7_9336
	.word ptr7_9372
	.word ptr7_9271
	.word ptr7_93B9
	.word ptr7_93C9
	.word ptr7_93D9
	.word ptr7_91DA
	.word ptr7_93FD
	.word ptr7_94C7
	.word ptr7_94F6
	.word ptr7_9271
	.word ptr7_92B0
	.word ptr7_94C7
	.word ptr7_955F
	.word ptr7_9271
	.word ptr7_93B9
	.word ptr7_93C9
	.word ptr7_93D9
	.word ptr7_91DA
	.word ptr7_93FD
	.word ptr7_94C7
	.word ptr7_956A
	.word ptr7_9271
	.word ptr7_92B0
	.word ptr7_94C7
	.word ptr7_95D8
	.word ptr7_95E3
	.word ptr7_95E3
	.word ptr7_970C
	.word ptr7_93B9
	.word ptr7_9763
sub_91B5:
	LDA objFlags,X
	AND #$1F
	CMP #$04
	BNE bra_91D9_RTS
	LDA #$06
	STA bowserState
	LDA #$00
	STA $05F6
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	LDA objXLo,X
	SEC
	SBC #$04
	STA objXLo,X
bra_91D9_RTS:
	RTS
ptr7_91DA:
	LDA #$01
	STA $06E3
	LDA #$04
	STA enemyAnimFrame,X
	INC $05F6
	LDA $05F6
	CMP #$70
	BCC bra_91F6_RTS
	LDA #$00
	STA $05F6
	INC bowserState
bra_91F6_RTS:
	RTS
ptr7_91F7:
	LDA objFrameCount
	AND #$07
	BNE bra_921C_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_921D
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_921C_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_921C_RTS:
	RTS
bra_921D:
	LDA #$00
	STA $05F6
	INC bowserState
	LDA #$37
	STA yoshiXLo
	LDA #$38
	STA yoshiXHi
	RTS
tbl_9230:
	.byte $04
	.byte $0A
	.byte $09
	.byte $08
	.byte $07
	.byte $06
	.byte $05
	.byte $FF
ptr7_9238:
	JSR sub_91B5
	LDA yoshiXLo
	ASL
	TAY
	JSR jmp_54_B896
	LDA objFrameCount
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_9260_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_9260_RTS:
	RTS
tbl_9261:
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $07
	.byte $06
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
ptr7_9271:
	LDA objFrameCount
	AND #$07
	BNE bra_9296_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_92A8,Y
	CMP #$FF
	BEQ bra_9297
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_9296_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_9296_RTS:
	RTS
bra_9297:
	LDA #$00
	STA $05F6
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	INC bowserState
	RTS
tbl_92A8:
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $09
	.byte $0A
	.byte $04
	.byte $FF
ptr7_92B0:
	INC $05F6
	LDA $05F6
	CMP #$01
	BNE bra_9329
	LDY #$FF
bra_92BC:
	INY
	LDA objSlot,Y
	CMP #$3A
	BCC bra_92C8
	CMP #$42
	BCC bra_92F8
bra_92C8:
	CPY objCount
	BCC bra_92BC
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #$00
	STA objFlags,Y
	STA objVar,Y
	LDA #$01
	STA objState,Y
	LDA #$3A
	STA objSlot,Y
bra_92F8:
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #$40
	STA objFlags,Y
	LDA #$00
	STA objVar,Y
	LDA #$01
	STA objState,Y
	LDA #$3A
	STA objSlot,Y
	RTS
bra_9329:
	CMP #$30
	BCC bra_9335_RTS
	LDA #$00
	STA $05F6
	INC bowserState
bra_9335_RTS:
	RTS
ptr7_9336:
	LDA objFrameCount
	AND #$07
	BNE bra_935B_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_935C
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_935B_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_935B_RTS:
	RTS
bra_935C:
	LDA #$00
	STA $05F6
	LDA #$02
	STA bowserState
	LDA yoshiXHi
	EOR #$01
	STA yoshiXHi
	STA yoshiXLo
	RTS
ptr7_9372:
	INC $05F6
	LDA $05F6
	CMP #$70
	BNE bra_939B
	LDA #$00
	STA $05F6
	INC bowserHitCount
	LDY bowserHitCount
	LDA tbl_93AF,Y
	STA bowserState
	CMP #$1F
	BEQ bra_939A_RTS
	LDA objXLo,X
	CLC
	ADC #$04
	STA objXLo,X
bra_939A_RTS:
	RTS
bra_939B:
	LDY #$0B
	LDA objFrameCount
	AND #$10
	BNE bra_93A5
	INY
bra_93A5:
	TYA
	STA enemyAnimFrame,X
	LDA #$02
	STA clownCarFace
	RTS
tbl_93AF:
	.byte $00 ; phase if no hits
	.byte $02 ; phase after 1 or 2 hits
	.byte $02
	.byte $07 ; phase after 3 hits
	.byte $0E ; phase after 4 or 5 hits 
	.byte $0E
	.byte $13 ; phase after 6 hits
	.byte $1A ; phase after 7 or 8 hits
	.byte $1A
	.byte $1F
ptr7_93B9:
	LDA #$FF
	STA $06E3
	LDA objYLo,X
	CMP #$90
	BNE bra_93C8_RTS
	INC bowserState
bra_93C8_RTS:
	RTS
ptr7_93C9:
	LDA #$01
	STA $06E2
	LDA objXLo,X
	CMP #$C0
	BNE bra_93D8_RTS
	INC bowserState
bra_93D8_RTS:
	RTS
ptr7_93D9:
	INC bowserState
	LDA #$00
	STA $05F6
obj0xB8:
	STA objState,X
	STA $0641,X
	STA objVar,X
	STA objFlags,X
	STA $06E2
	STA $06E3
	LDA objYLo,X
	CLC
	ADC #$18
	STA objYLo,X
	RTS
ptr7_93FD:
	INC $05F6
	LDA $05F6
	CMP #$08
	BCS bra_9410
	DEC objYLo,X
	LDA #$57
	STA enemyAnimFrame,X
	RTS
bra_9410:
	CMP #$10
	BCS bra_941D
	DEC objYLo,X
	LDA #$56
	STA enemyAnimFrame,X
	RTS
bra_941D:
	CMP #$18
	BCS bra_942A
	DEC objYLo,X
	LDA #$55
	STA enemyAnimFrame,X
	RTS
bra_942A:
	CMP #$70
	BNE bra_9464
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$18
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA #$BF
	STA objSlot,Y
	LDA #$00
	STA objState,Y
	LDA #$80
	STA objVar,Y
	LDA #$40
	STA objFlags,Y
	RTS
bra_9464:
	CMP #$D0
	BCS bra_9477
	LDA objFrameCount
	AND #$18
	LSR
	LSR
	LSR
	CLC
	ADC #$51
	STA enemyAnimFrame,X
	RTS
bra_9477:
	CMP #$D8
	BCS bra_9484
	INC objYLo,X
	LDA #$55
	STA enemyAnimFrame,X
	RTS
bra_9484:
	CMP #$E0
	BCS bra_9491
	INC objYLo,X
	LDA #$56
	STA enemyAnimFrame,X
	RTS
bra_9491:
	CMP #$E8
	BCS bra_949E
	INC objYLo,X
	LDA #$57
	STA enemyAnimFrame,X
	RTS
bra_949E:
	INC bowserState
	LDA #$04
	STA enemyAnimFrame,X
	LDA #$00
	STA $05F6
	STA objState,X
	STA $0641,X
	STA objVar,X
	STA objFlags,X
	STA $06E2
	STA $06E3
	LDA objYLo,X
	SEC
	SBC #$19
	STA objYLo,X
	RTS
ptr7_94C7:
	LDA objFrameCount
	AND #$07
	BNE bra_94EC_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_94ED
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_94EC_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_94EC_RTS:
	RTS
bra_94ED:
	LDA #$00
	STA $05F6
	INC bowserState
	RTS
ptr7_94F6:
	JSR sub_91B5
	JSR sub3_B057
	BEQ bra_9506
	LDA objFlags,X
	EOR #$40
	STA objFlags,X
bra_9506:
	LDA frameCount
	AND #$01
	BNE bra_9511
	LDA #$4D
	JSR jmp_54_B11D
bra_9511:
	LDA objFrameCount
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	STA $25
	LDA enemyAnimFrame,X
	AND #$BF
	ORA $25
	STA enemyAnimFrame,X
	LDA objXLo,X
	CMP #$40
	BCC bra_955E_RTS
	CMP #$50
	BCC bra_9545
	CMP #$A0
	BCC bra_955E_RTS
	CMP #$B0
	BCS bra_955E_RTS
bra_9545:
	INC $05F6
	LDA $05F6
	CMP #$50
	BCC bra_955E_RTS
	JSR updateRng
	AND #$03
	BNE bra_955E_RTS
	INC bowserState
	LDA #$00
	STA $05F6
bra_955E_RTS:
	RTS
ptr7_955F:
	LDA #$0E
	STA bowserState
	LDA #$00
	STA $05F6
	RTS
ptr7_956A:
	JSR sub_91B5
	JSR sub3_B057
	BEQ bra_957A
	LDA objFlags,X
	EOR #$40
	STA objFlags,X
bra_957A:
	LDA frameCount
	AND #$01
	BNE bra_9585
	LDA #$4E
	JSR jmp_54_B11D
bra_9585:
	LDA objFrameCount
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	STA $25
	LDA enemyAnimFrame,X
	AND #$BF
	ORA $25
	STA enemyAnimFrame,X
	LDA #$03
	STA clownCarFace
	LDA objXLo,X
	CMP #$40
	BCC bra_95D7_RTS
	CMP #$50
	BCC bra_95BE
	CMP #$A0
	BCC bra_95D7_RTS
	CMP #$B0
	BCS bra_95D7_RTS
bra_95BE:
	INC $05F6
	LDA $05F6
	CMP #$50
	BCC bra_95D7_RTS
	JSR updateRng
	AND #$03
	BNE bra_95D7_RTS
	INC bowserState
	LDA #$00
	STA $05F6
bra_95D7_RTS:
	RTS
ptr7_95D8:
	LDA #$1A
	STA bowserState
	LDA #$00
	STA $05F6
	RTS
ptr7_95E3:
	LDA #$02
	STA clownCarFace
	LDA $05F6
	BNE bra_9612
	INC $05F6
	LDA #$18
	STA enemyAnimFrame,X
	LDY #$FF
bra_95F7:
	INY
	LDA objSlot,Y
	CMP #$3A
	BCC bra_960D
	CMP #$42
	BCS bra_960D
	LDA #playerXLoDup
	STA objSlot,Y
	LDA #$00
	STA objFlags,Y
bra_960D:
	CPY objCount
	BCC bra_95F7
	RTS
bra_9612:
	CMP #$01
	BEQ bra_9619
	JMP loc_970B_RTS
bra_9619:
	LDA #$10
	STA sndSfx
	INC $05F6
	LDY objCount
	INC objCount
	INC objCount
	INC objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$30
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA #$00
	STA objVar,Y
	LDA #$BC
	STA objSlot,Y
	LDA #$C4
	STA enemyAnimFrame,Y
	LDA #$00
	STA objState,Y
	STA objFlags,Y
	LDA objXLo,X
	STA objXLo+1,Y
	LDA objXHi,X
	STA objXHi+1,Y
	LDA objYLo,X
	CLC
	ADC #$48
	STA objYLo+1,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi+1,Y
	LDA #$00
	STA $0579,Y
	LDA #$BC
	STA objSlot+1,Y
	LDA #$40
	STA enemyAnimFrame+1,Y
	LDA #$01
	STA objState+1,Y
	LDA #$00
	STA objFlags+1,Y
	LDA objXLo,X
	CLC
	ADC #$20
	STA objXLo+2,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi+2,Y
	LDA objYLo,X
	CLC
	ADC #$30
	STA objYLo+2,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi+2,Y
	LDA #$00
	STA $057A,Y
	LDA #$BC
	STA objSlot+2,Y
	LDA #$84
	STA enemyAnimFrame+2,Y
	LDA #$02
	STA objState+2,Y
	LDA #$00
	STA objFlags+2,Y
	LDA objXLo,X
	CLC
	ADC #$20
	STA objXLo+3,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi+3,Y
	LDA objYLo,X
	CLC
	ADC #$48
	STA objYLo+3,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi+3,Y
	LDA #$00
	STA $057B,Y
	LDA #$BC
	STA objSlot+3,Y
	LDA #$00
	STA $0658,Y
	LDA #$03
	STA objState+3,Y
	LDA #$00
	STA objFlags+3,Y
	RTS
loc_970B_RTS:
	RTS
ptr7_970C:
	LDA $05F6
	BNE bra_9762_RTS
	INC $05F6
	LDY objCount
	INC objCount
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$28
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA #$B8
	STA objSlot,Y
	LDA #$00
	STA objFlags,Y
	STA objVar,Y
	STA objState,Y
	STA enemyAnimFrame,Y
	LDA #$01
	STA $06E6
	LDY #$41
	LDA objXDistHi,X
	BMI bra_975B
	LDY #$00
bra_975B:
	STY playerMoveFlags
	LDA #MUS_ENDING
	STA sndMusic
	RTS
bra_9762_RTS:
	RTS
ptr7_9763:
	RTS
obj0xB6:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_9782
	CMP #$FF
	BEQ bra_9782
	JMP objRemoveObject
bra_9782:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_97C4
	LDA objYDistHi,X
	BPL bra_97B3
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_97C4
bra_97B3:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_97C4:
loc_97C4:
	LDA freezeFlag
	BEQ bra_97CA
	RTS
bra_97CA:
	LDA objState,X
	ASL
	TAY
	LDA tbl_97DC,Y
	STA $32
	LDA tbl_97DC+1,Y
	STA $33
	JMP ($32)
tbl_97DC:
	.word ptr7_97E2
	.word ptr7_9811
	.word ptr7_9840
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
	.byte $34
	.byte $B0
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $BE
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $08
	.byte $45
	.byte $49
	.byte $52
	.byte $10
	.byte $52
	.byte $52
	.byte $52
	.byte $54
	.byte $FF
	.byte $04
	.byte $06
	.byte $4F
	.byte $51
	.byte $53
	.byte $10
	.byte $11
	.byte $14
	.byte $18
	.byte $1A
	.byte $1C
	.byte $5C
	.byte $5E
	.byte $60
	.byte $02
	.byte $27
	.byte $28
	.byte $2C
	.byte $2E
	.byte $30
	.byte $34
	.byte $37
	.byte $3B
	.byte $3F
	.byte $43
	.byte $47
	.byte $4B
	.byte $FF
	.byte $9A
	.byte $FF
	.byte $9F
	.byte $A8
	.byte $A8
	.byte $71
	.byte $75
	.byte $A8
	.byte $FF
	.byte $89
	.byte $8A
	.byte $89
	.byte $8F
	.byte $91
	.byte $95
	.byte $97
	.byte $FF
	.byte $91
	.byte $A8
	.byte $A8
	.byte $6D
	.byte $66
	.byte $77
	.byte $7B
	.byte $A8
	.byte $FF
	.byte $FF
	.byte $A1
	.byte $A3
	.byte $91
	.byte $2A
	.byte $2E
	.byte $2E
	.byte $AD
	.byte $FF
	.byte $A8
	.byte $66
	.byte $66
	.byte $66
	.byte $7C
	.byte $88
	.byte $A8
	.byte $A8
	.byte $FF
	.byte $AA
	.byte $C9
	.byte $B0
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $68
	.byte $66
	.byte $66
	.byte $66
	.byte $82
	.byte $7C
	.byte $A8
	.byte $32
	.byte $AD
	.byte $AB
	.byte $AB
	.byte $AB
	.byte $B0
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $B6
	.byte $FF
	.byte $BC
	.byte $BF
	.byte $B5
	.byte $91
	.byte $B5
	.byte $32
	.byte $B2
	.byte $AD
	.byte $32
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $BF
	.byte $BA
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $4F
	.byte $47
	.byte $4B
	.byte $53
	.byte $0A
	.byte $53
	.byte $53
	.byte $53
	.byte $10
	.byte $FF
	.byte $4D
	.byte $4E
	.byte $09
	.byte $0B
	.byte $0D
	.byte $0E
	.byte $56
	.byte $13
	.byte $17
	.byte $59
	.byte $5B
	.byte $1F
	.byte $21
	.byte $23
	.byte $01
	.byte $25
	.byte $63
	.byte $2B
	.byte $2F
	.byte $2F
	.byte $33
	.byte $38
	.byte $3A
	.byte $3E
	.byte $42
	.byte $46
	.byte $4A
	.byte $FF
	.byte $91
	.byte $9C
	.byte $9E
	.byte $A8
	.byte $A8
	.byte $6F
	.byte $73
	.byte $79
	.byte $FF
	.byte $8B
	.byte $8B
	.byte $8E
	.byte $90
	.byte $93
	.byte $91
	.byte $91
	.byte $99
	.byte $91
	.byte $A8
	.byte $A8
	.byte $6B
	.byte $66
	.byte $66
	.byte $7C
	.byte $7D
	.byte $FF
	.byte $FF
	.byte $A8
	.byte $A8
	.byte $A6
	.byte $B0
	.byte $2D
	.byte $2F
	.byte $31
	.byte $FF
	.byte $A8
	.byte $69
	.byte $66
	.byte $66
	.byte $7F
	.byte $7C
	.byte $A8
	.byte $A9
	.byte $FF
	.byte $AB
	.byte $AE
	.byte $AF
	.byte $AD
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $65
	.byte $66
	.byte $66
	.byte $66
	.byte $81
	.byte $84
	.byte $85
	.byte $B1
	.byte $35
	.byte $AF
	.byte $AC
	.byte $AD
	.byte $AC
	.byte $AC
	.byte $FF
	.byte $FF
	.byte $B5
	.byte $B8
	.byte $B5
	.byte $B5
	.byte $C1
	.byte $C3
	.byte $C5
	.byte $B0
	.byte $35
	.byte $35
	.byte $B0
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $09
	.byte $46
	.byte $4A
	.byte $0D
	.byte $0F
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $FF
	.byte $64
	.byte $07
	.byte $50
	.byte $0C
	.byte $0D
	.byte $0F
	.byte $12
	.byte $15
	.byte $58
	.byte $5A
	.byte $1D
	.byte $5D
	.byte $22
	.byte $24
	.byte $03
	.byte $26
	.byte $29
	.byte $2D
	.byte $2F
	.byte $31
	.byte $35
	.byte $38
	.byte $3C
	.byte $40
	.byte $44
	.byte $48
	.byte $4C
	.byte $FF
	.byte $91
	.byte $9D
	.byte $9F
	.byte $A8
	.byte $6E
	.byte $70
	.byte $76
	.byte $7A
	.byte $FF
	.byte $8B
	.byte $8C
	.byte $8B
	.byte $91
	.byte $91
	.byte $91
	.byte $98
	.byte $FF
	.byte $91
	.byte $A8
	.byte $A8
	.byte $6C
	.byte $66
	.byte $78
	.byte $7C
	.byte $A8
	.byte $FF
	.byte $FF
	.byte $A8
	.byte $A7
	.byte $A5
	.byte $2B
	.byte $2F
	.byte $2F
	.byte $AE
	.byte $FF
	.byte $A8
	.byte $66
	.byte $66
	.byte $66
	.byte $7C
	.byte $87
	.byte $A8
	.byte $A8
	.byte $FF
	.byte $C8
	.byte $AF
	.byte $B1
	.byte $AB
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $66
	.byte $66
	.byte $66
	.byte $66
	.byte $83
	.byte $84
	.byte $A8
	.byte $33
	.byte $AE
	.byte $AF
	.byte $AB
	.byte $AB
	.byte $B0
	.byte $B0
	.byte $FF
	.byte $FF
	.byte $B6
	.byte $B9
	.byte $BD
	.byte $B5
	.byte $B5
	.byte $91
	.byte $B5
	.byte $33
	.byte $AD
	.byte $AD
	.byte $33
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $B5
	.byte $FF
	.byte $C6
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $50
	.byte $48
	.byte $4C
	.byte $0D
	.byte $0B
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0F
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $AA
	.byte $AA
	.byte $AA
	.byte $AA
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $78
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
