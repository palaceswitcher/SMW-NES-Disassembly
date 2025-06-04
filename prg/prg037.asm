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
	LDA SprPtrs_WoodenSpike,X
	STA $32
	LDA SprPtrs_WoodenSpike+1,X
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
SprPtrs_WoodenSpike:
	dw SprMap_WoodenSpikeUp
	dw SprMap_WoodenSpikeDown
SprMap_WoodenSpikeUp:
	db $02
	db $08
	db $CF
	db $CC, $CD
	db $CE, $CF
	db $C4, $C5
	db $C6, $C7
	db $C4, $C5
	db $C6, $C7
	db $C4, $C5
	db $C6, $C7
SprMap_WoodenSpikeDown:
	db $02
	db $08
	db $CF
	db $C4, $C5
	db $C6, $C7
	db $C4, $C5
	db $C6, $C7
	db $C4, $C5
	db $C6, $C7
	db $C8, $C9
	db $CA, $CB
Obj_hD4:
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
	JMP Obj_RemoveObject
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
	LDA objAction,X
	BEQ bra_80D0
	INY
bra_80D0:
	STY $32
	LDA frameCount
	AND #$01
	BNE bra_80DD
	LDA $32
	JSR jmp_54_B470
bra_80DD:
	JSR sub_82EA
	JSR jmp_54_BF74
	RTS
Obj_hE0:
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
	JMP Obj_RemoveObject
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
	STA objState,Y
	STA objState+1,Y
	STA objAction+1,Y
	LDA objSlot,X
	AND #$01
	CLC
	ADC #$F8
	STA objSlot,Y
	LDA #$D6
	STA objSlot+1,Y
	RTS
Obj_hF4:
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
	JMP Obj_RemoveObject
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
	STA objAction,Y
	STA objState,Y
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
	STA objAction,Y
	LDA objSlot,X
	CMP #$F8
	BCC bra_82A6_RTS
	LDA #$01
	STA objAction,Y
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
	JSR jmp_54_B470
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
	STA $06EF
	JMP loc_82E9_RTS
bra_82DF:
	LDA objXDistHi,X
	BPL loc_82E9_RTS
	LDA #$01
	STA $06EF
loc_82E9_RTS:
	RTS
sub_82EA:
	LDY objSlot,X
	LDA ObjectXHitBoxSizes,Y
	STA $36
	LDA ObjectYHitBoxSizes,Y
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
	LDA SprPtrs_PeachMushroom,X
	STA $32
	LDA SprPtrs_PeachMushroom+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
SprPtrs_PeachMushroom:
	dw SprMap_PeachMushroom
SprMap_PeachMushroom:
	db $02
	db $02
	db $90
	db $01, $02
	db $0B, $0C
Obj_hBD:
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
	JSR GetMovementData
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
	JMP Obj_RemoveObject
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
	JSR GetMovementData
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
	JMP Obj_RemoveObject
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
	BEQ bra_845C
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
bra_845C:
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
	JSR RewardPoints
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
	dw DinoRhino1
	dw DinoRhino2
	dw DinoTorch1
	dw DinoTorch2
	dw DinoTorchFlat
DinoRhino1:
	db $04
	db $04
	db $D0
	db $0D, $0E, $0F, $FF
	db $13, $14, $15, $16
	db $1B, $1C, $1D, $1E
	db $23, $24, $25, $26
DinoRhino2:
	db $04
	db $04
	db $D0
	db $10, $11, $12, $FF
	db $17, $18, $19, $1A
	db $1F, $20, $21, $22
	db $27, $28, $29, $2A
DinoTorch1:
	db $02
	db $02
	db $D0
	db $02, $03
	db $07, $08
DinoTorch2:
	db $02
	db $02
	db $D0
	db $02, $04
	db $09, $0A
DinoTorchFlat:
	db $02
	db $02
	db $D0
	db $05, $06
	db $0B, $0C

Obj_hE4:
	LDX $A4
	Obj_DistCalc bra_854E

bra_854E:
	LDA objAction,X
	CMP #$02
	BEQ bra_8558
	JSR sub_8592
bra_8558:
	LDX $A4
	LDA objAction,X
	ASL
	TAY
	LDA tbl_856C,Y
	STA $32
	LDA tbl_856C+1,Y
	STA $33
	JMP ($32)
tbl_856C:
	dw ptr7_8572
	dw ptr7_86B5
	dw ptr7_857C
ptr7_8572:
	JSR sub_86E9
	INC enemyAnimFrame,X
	INC enemyAnimFrame,X
	RTS
ptr7_857C:
	LDA #$04
	STA enemyAnimFrame,X
	LDA objState,X
	CMP #$10
	BCC bra_858E
	LDA #$00
	STA objSlot,X
	RTS
bra_858E:
	INC objState,X
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
	JMP Obj_RemoveObject
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
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl_8610,Y
	STA $32
	LDA tbl_8610+1,Y
	STA $33
	JMP ($32)
tbl_8610:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr7_861A
	dw Obj_FlipKill
ptr7_861A:
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	JSR Obj_StompRebound
	LDA #$00
	STA objState,X
	STA objVar,X
	LDA #$02
	STA objAction,X
	RTS

Obj_hE2:
	LDX $A4
	Obj_DistCalc bra_869A

bra_869A:
	JSR sub_879B
	LDX $A4
	LDA objAction,X
	ASL
	TAY
	LDA tbl_86B1,Y
	STA $32
	LDA tbl_86B1+1,Y
	STA $33
	JMP ($32)
tbl_86B1:
	dw sub_86E9
	dw ptr7_86B5

ptr7_86B5:
	LDY #$00
	LDA objSlot,X
	CMP #$E6
	BCC bra_86C0
	LDY #$02
bra_86C0:
	STY $25
	LDA objState,X
	AND #$C0
	ORA $25
	STA enemyAnimFrame,X
	JSR sub3_B077
	BEQ bra_86DD
	LDA objVar,X
	AND #$80
	STA objVar,X
	DEC objAction,X
	RTS

bra_86DD:
	LDA frameCount
	AND #$01
	BNE bra_86E8_RTS
	LDA #$12
	JSR GetMovementData
bra_86E8_RTS:
	RTS

sub_86E9:
	JSR sub3_B057
	BEQ bra_874F
	LDA objVar,X
	AND #$80
	STA objVar,X
	INC objAction,X
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
	LDA objState,X
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
	JSR GetMovementData
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
	LDA objState,X
	AND #$BF
	STA objState,X
	LDA objXDistHi,X
	BMI bra_8790
	LDA objState,X
	ORA #$40
	STA objState,X
bra_8790:
	LDA objState,X
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
	JMP Obj_RemoveObject
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
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl_8819,Y
	STA $32
	LDA tbl_8819+1,Y
	STA $33
	JMP ($32)
tbl_8819:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr7_8823
	dw Obj_FlipKill
ptr7_8823:
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
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
	JMP Obj_RemoveObject
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
	STA objState,X
	STA objVar,X
	STA objAction,X
	JSR Obj_StompRebound
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
	dw ofs_896A
	dw ofs_8973
	dw ofs_897C
	dw ofs_8985
	dw ofs_898E
	dw ofs_8992
	dw ofs_89B9
	dw ofs_89E0
	dw ofs_8A07
	dw ofs_8A2E
	dw ofs_8A55
	dw ofs_8A7C
	dw ofs_8AA2
	dw ofs_8AC8
	dw ofs_8AD4
	dw ofs_8AE0
	dw ofs_8AEC
	dw ofs_8AF8
	dw ofs_8B0F
	dw ofs_8B26
	dw ofs_8B3D
	dw ofs_8B54
	dw ofs_8B6B
	dw ofs_8B7E
	dw ofs_8B8D
ofs_896A:
	db $06
	db $01
	db $E0
	db $FF
	db $FF
	db $30
	db $31
	db $FF
	db $FF
ofs_8973:
	db $06
	db $01
	db $E0
	db $FF
	db $32
	db $33
	db $34
	db $35
	db $FF
ofs_897C:
	db $06
	db $01
	db $E0
	db $36
	db $37
	db $38
	db $39
	db $3A
	db $3B
ofs_8985:
	db $06
	db $01
	db $E0
	db $FF
	db $3C
	db $3D
	db $3E
	db $3F
	db $FF
ofs_898E:
	db $01
	db $01
	db $E0
	db $FF
ofs_8992:
	db $06
	db $06
	db $E0
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $01
	db $02
	db $03
	db $04
	db $FF
	db $FF
	db $05
	db $06
	db $07
	db $08
	db $09
	db $FF
	db $0F
	db $10
	db $11
	db $12
	db $13
	db $14
	db $18
	db $19
	db $1A
	db $1B
	db $1C
	db $1D
	db $2B
	db $2C
	db $2D
	db $2E
	db $FF
	db $FF
ofs_89B9:
	db $06
	db $06
	db $E0
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $01
	db $02
	db $03
	db $04
	db $FF
	db $FF
	db $0A
	db $0B
	db $07
	db $08
	db $09
	db $FF
	db $0F
	db $10
	db $11
	db $12
	db $13
	db $14
	db $18
	db $19
	db $1A
	db $1B
	db $1C
	db $1D
	db $2B
	db $2C
	db $2D
	db $2E
	db $FF
	db $FF
ofs_89E0:
	db $06
	db $06
	db $E0
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $01
	db $02
	db $03
	db $04
	db $FF
	db $FF
	db $0C
	db $0D
	db $0E
	db $08
	db $09
	db $FF
	db $15
	db $16
	db $17
	db $12
	db $13
	db $14
	db $1E
	db $1F
	db $20
	db $1B
	db $1C
	db $1D
	db $2B
	db $2C
	db $2D
	db $2E
	db $FF
	db $FF
ofs_8A07:
	db $06
	db $06
	db $E3
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $ED
	db $EE
	db $EF
	db $FF
	db $FF
	db $FF
	db $C6
	db $C7
	db $C8
	db $C9
	db $CA
	db $D3
	db $D4
	db $D5
	db $D6
	db $D7
	db $D8
	db $E0
	db $E1
	db $E2
	db $D9
	db $FF
	db $FF
ofs_8A2E:
	db $06
	db $06
	db $E0
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $01
	db $02
	db $03
	db $04
	db $FF
	db $21
	db $22
	db $23
	db $24
	db $25
	db $26
	db $2B
	db $2C
	db $2D
	db $2E
	db $FF
	db $FF
ofs_8A55:
	db $06
	db $06
	db $E0
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $21
	db $27
	db $28
	db $29
	db $2A
	db $FF
	db $2B
	db $2C
	db $2D
	db $2E
	db $FF
	db $FF
ofs_8A7C:
	db $07
	db $05
	db $E1
	db $FF
	db $40
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $36
	db $41
	db $42
	db $43
	db $44
	db $45
	db $46
	db $47
	db $48
	db $49
	db $4A
	db $4B
	db $4C
	db $4D
	db $FF
	db $57
	db $58
	db $59
	db $5A
	db $5B
	db $40
	db $FF
	db $65
	db $66
	db $67
	db $68
	db $69
	db $FF
ofs_8AA2:
	db $07
	db $05
	db $E1
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $40
	db $FF
	db $36
	db $41
	db $42
	db $43
	db $44
	db $45
	db $46
	db $47
	db $48
	db $4E
	db $4F
	db $50
	db $4C
	db $4D
	db $40
	db $57
	db $5C
	db $5D
	db $56
	db $5B
	db $FF
	db $FF
	db $65
	db $6A
	db $6B
	db $64
	db $69
	db $FF
ofs_8AC8:
	db $03
	db $03
	db $E3
	db $C2
	db $C3
	db $C4
	db $D0
	db $D1
	db $D2
	db $DD
	db $DE
	db $DF
ofs_8AD4:
	db $03
	db $03
	db $E1
	db $51
	db $52
	db $53
	db $5E
	db $5F
	db $60
	db $FF
	db $6C
	db $6D
ofs_8AE0:
	db $03
	db $03
	db $E1
	db $54
	db $55
	db $FF
	db $61
	db $62
	db $63
	db $FF
	db $6E
	db $6F
ofs_8AEC:
	db $03
	db $03
	db $E3
	db $C5
	db $FF
	db $FF
	db $C5
	db $C5
	db $FF
	db $FF
	db $C5
	db $C5
ofs_8AF8:
	db $04
	db $05
	db $E2
	db $80
	db $81
	db $82
	db $83
	db $84
	db $85
	db $86
	db $87
	db $FF
	db $88
	db $89
	db $8A
	db $FF
	db $94
	db $95
	db $96
	db $FF
	db $A0
	db $A1
	db $A2
ofs_8B0F:
	db $04
	db $05
	db $E2
	db $80
	db $81
	db $82
	db $83
	db $84
	db $85
	db $86
	db $87
	db $FF
	db $8B
	db $8C
	db $8D
	db $FF
	db $97
	db $98
	db $99
	db $FF
	db $A3
	db $A4
	db $A5
ofs_8B26:
	db $04
	db $05
	db $E2
	db $80
	db $81
	db $82
	db $83
	db $84
	db $85
	db $86
	db $87
	db $FF
	db $8E
	db $8F
	db $90
	db $FF
	db $9A
	db $9B
	db $9C
	db $FF
	db $A6
	db $A7
	db $A8
ofs_8B3D:
	db $04
	db $05
	db $E2
	db $80
	db $81
	db $82
	db $83
	db $84
	db $85
	db $86
	db $87
	db $FF
	db $91
	db $92
	db $93
	db $FF
	db $9D
	db $9E
	db $9F
	db $FF
	db $A9
	db $AA
	db $AB
ofs_8B54:
	db $04
	db $05
	db $E2
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $88
	db $89
	db $8A
	db $FF
	db $94
	db $95
	db $96
	db $FF
	db $A0
	db $A1
	db $A2
ofs_8B6B:
	db $04
	db $04
	db $E2
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $88
	db $89
	db $8A
	db $FF
	db $94
	db $95
	db $96
ofs_8B7E:
	db $04
	db $03
	db $E2
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $88
	db $89
	db $8A
ofs_8B8D:
	db $07
	db $05
	db $E1
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $36
	db $41
	db $42
	db $43
	db $44
	db $45
	db $46
	db $47
	db $48
	db $4E
	db $4F
	db $50
	db $4C
	db $4D
	db $FF
	db $57
	db $5C
	db $5D
	db $56
	db $5B
	db $FF
	db $FF
	db $65
	db $6A
	db $6B
	db $64
	db $69
	db $FF
Obj_hD5:
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
	JMP Obj_RemoveObject
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
Obj_hDE:
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
	JMP Obj_RemoveObject
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
	LDA objState,X
	STA objState,Y
	STA objState+1,Y
	LDA #$00
	STA objVar,Y
	STA $0579,Y
	STA objAction,Y
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
	JMP Obj_RemoveObject
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
	db $00 ; Clown car blink cycle
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $01
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
	dw ofs_8F00
	dw ofs_8F17
ofs_8F00:
	db $04
	db $05
	db $E3
	db $FF
	db $C0
	db $C1
	db $FF
	db $FF
	db $CB
	db $CC
	db $CD
	db $FF
	db $DA
	db $DB
	db $DC
	db $E3
	db $E4
	db $E5
	db $E6
	db $FF
	db $E9
	db $EA
	db $FF
ofs_8F17:
	db $04
	db $05
	db $E3
	db $FF
	db $C0
	db $C1
	db $FF
	db $FF
	db $CE
	db $CF
	db $CD
	db $FF
	db $DA
	db $DB
	db $DC
	db $E3
	db $E4
	db $E5
	db $E6
	db $FF
	db $E9
	db $EA
	db $FF
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
	dw ofs_8F76
	dw ofs_8F82
	dw ofs_8F8E
	dw ofs_8F9A
	dw ofs_8FA6
	dw ofs_8FB2
	dw ofs_8FBE
	dw ofs_8FCA
ofs_8F76:
	db $03
	db $03
	db $E3
	db $C2
	db $C3
	db $C4
	db $D0
	db $D1
	db $D2
	db $DD
	db $DE
	db $DF
ofs_8F82:
	db $03
	db $03
	db $E1
	db $51
	db $52
	db $53
	db $5E
	db $5F
	db $60
	db $FF
	db $6C
	db $6D
ofs_8F8E:
	db $03
	db $03
	db $E1
	db $54
	db $55
	db $FF
	db $61
	db $62
	db $63
	db $FF
	db $6E
	db $6F
ofs_8F9A:
	db $03
	db $03
	db $E3
	db $C5
	db $FF
	db $FF
	db $C5
	db $C5
	db $FF
	db $FF
	db $C5
	db $C5
ofs_8FA6:
	db $03
	db $03
	db $E3
	db $DD
	db $DE
	db $DF
	db $D0
	db $D1
	db $D2
	db $C2
	db $C3
	db $C4
ofs_8FB2:
	db $03
	db $03
	db $E1
	db $FF
	db $6C
	db $6D
	db $5E
	db $5F
	db $60
	db $51
	db $52
	db $53
ofs_8FBE:
	db $03
	db $03
	db $E1
	db $FF
	db $6E
	db $6F
	db $61
	db $62
	db $63
	db $54
	db $55
	db $FF
ofs_8FCA:
	db $03
	db $03
	db $E3
	db $FF
	db $C5
	db $C5
	db $C5
	db $C5
	db $FF
	db $C5
	db $FF
	db $FF
Obj_hBA:
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
	JMP Obj_RemoveObject
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
	LDA objAction,X
	CLC
	ADC #$50
	STA $25
	LDA frameCount
	AND #$00
	BNE bra_904F
	LDA $25
	JSR jmp_54_B470
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
	LDA objAction,X
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
	JMP Obj_RemoveObject
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
Obj_hDF:
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
	JMP Obj_RemoveObject
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
	LDA objState,X
	AND #$40
	STA objState,X
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
	dw ptr7_91DA
	dw ptr7_91F7
	dw ptr7_9238
	dw ptr7_9271
	dw ptr7_92B0
	dw ptr7_9336
	dw ptr7_9372
	dw ptr7_9271
	dw ptr7_93B9
	dw ptr7_93C9
	dw ptr7_93D9
	dw ptr7_91DA
	dw ptr7_93FD
	dw ptr7_94C7
	dw ptr7_94F6
	dw ptr7_9271
	dw ptr7_92B0
	dw ptr7_94C7
	dw ptr7_955F
	dw ptr7_9271
	dw ptr7_93B9
	dw ptr7_93C9
	dw ptr7_93D9
	dw ptr7_91DA
	dw ptr7_93FD
	dw ptr7_94C7
	dw ptr7_956A
	dw ptr7_9271
	dw ptr7_92B0
	dw ptr7_94C7
	dw ptr7_95D8
	dw ptr7_95E3
	dw ptr7_95E3
	dw ptr7_970C
	dw ptr7_93B9
	dw ptr7_9763
sub_91B5:
	LDA objState,X
	AND #$1F
	CMP #$04
	BNE bra_91D9_RTS
	LDA #$06
	STA bowserState
	LDA #$00
	STA $05F6
	LDA objState,X
	AND #$40
	STA objState,X
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
	db $04
	db $0A
	db $09
	db $08
	db $07
	db $06
	db $05
	db $FF
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
	db $05
	db $05
	db $05
	db $05
	db $06
	db $07
	db $06
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
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
	LDA objState,X
	AND #$40
	STA objState,X
	INC bowserState
	RTS
tbl_92A8:
	db $05
	db $06
	db $07
	db $08
	db $09
	db $0A
	db $04
	db $FF
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
	STA objState,Y
	STA objVar,Y
	LDA #$01
	STA objAction,Y
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
	STA objState,Y
	LDA #$00
	STA objVar,Y
	LDA #$01
	STA objAction,Y
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
	db $00 ; phase if no hits
	db $02 ; phase after 1 or 2 hits
	db $02
	db $07 ; phase after 3 hits
	db $0E ; phase after 4 or 5 hits 
	db $0E
	db $13 ; phase after 6 hits
	db $1A ; phase after 7 or 8 hits
	db $1A
	db $1F
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
Obj_hB8:
	STA objAction,X
	STA $0641,X
	STA objVar,X
	STA objState,X
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
	STA objAction,Y
	LDA #$80
	STA objVar,Y
	LDA #$40
	STA objState,Y
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
	STA objAction,X
	STA $0641,X
	STA objVar,X
	STA objState,X
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
	LDA objState,X
	EOR #$40
	STA objState,X
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
	LDA objState,X
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
	JSR jmp_54_B785
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
	LDA objState,X
	EOR #$40
	STA objState,X
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
	LDA objState,X
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
	JSR jmp_54_B785
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
	STA objState,Y
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
	STA objAction,Y
	STA objState,Y
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
	STA objAction+1,Y
	LDA #$00
	STA objState+1,Y
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
	STA objAction+2,Y
	LDA #$00
	STA objState+2,Y
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
	STA objAction+3,Y
	LDA #$00
	STA objState+3,Y
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
	STA objState,Y
	STA objVar,Y
	STA objAction,Y
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
Obj_hB6:
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
	JMP Obj_RemoveObject
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
	LDA objAction,X
	ASL
	TAY
	LDA tbl_97DC,Y
	STA $32
	LDA tbl_97DC+1,Y
	STA $33
	JMP ($32)
tbl_97DC:
	dw ptr7_97E2
	dw ptr7_9811
	dw ptr7_9840
ptr7_97E2:
	LDA objFrameCount
	AND #$03
	BNE bra_97F6_RTS
	LDA objVar,X
	CMP #$28
	BCC bra_97F7
	INC objAction,X
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
	INC objAction,X
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
	db $34
	db $B0
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $BE
	db $B5
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $08
	db $45
	db $49
	db $52
	db $10
	db $52
	db $52
	db $52
	db $54
	db $FF
	db $04
	db $06
	db $4F
	db $51
	db $53
	db $10
	db $11
	db $14
	db $18
	db $1A
	db $1C
	db $5C
	db $5E
	db $60
	db $02
	db $27
	db $28
	db $2C
	db $2E
	db $30
	db $34
	db $37
	db $3B
	db $3F
	db $43
	db $47
	db $4B
	db $FF
	db $9A
	db $FF
	db $9F
	db $A8
	db $A8
	db $71
	db $75
	db $A8
	db $FF
	db $89
	db $8A
	db $89
	db $8F
	db $91
	db $95
	db $97
	db $FF
	db $91
	db $A8
	db $A8
	db $6D
	db $66
	db $77
	db $7B
	db $A8
	db $FF
	db $FF
	db $A1
	db $A3
	db $91
	db $2A
	db $2E
	db $2E
	db $AD
	db $FF
	db $A8
	db $66
	db $66
	db $66
	db $7C
	db $88
	db $A8
	db $A8
	db $FF
	db $AA
	db $C9
	db $B0
	db $B4
	db $FF
	db $FF
	db $FF
	db $68
	db $66
	db $66
	db $66
	db $82
	db $7C
	db $A8
	db $32
	db $AD
	db $AB
	db $AB
	db $AB
	db $B0
	db $B3
	db $FF
	db $FF
	db $B6
	db $FF
	db $BC
	db $BF
	db $B5
	db $91
	db $B5
	db $32
	db $B2
	db $AD
	db $32
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $BF
	db $BA
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $4F
	db $47
	db $4B
	db $53
	db $0A
	db $53
	db $53
	db $53
	db $10
	db $FF
	db $4D
	db $4E
	db $09
	db $0B
	db $0D
	db $0E
	db $56
	db $13
	db $17
	db $59
	db $5B
	db $1F
	db $21
	db $23
	db $01
	db $25
	db $63
	db $2B
	db $2F
	db $2F
	db $33
	db $38
	db $3A
	db $3E
	db $42
	db $46
	db $4A
	db $FF
	db $91
	db $9C
	db $9E
	db $A8
	db $A8
	db $6F
	db $73
	db $79
	db $FF
	db $8B
	db $8B
	db $8E
	db $90
	db $93
	db $91
	db $91
	db $99
	db $91
	db $A8
	db $A8
	db $6B
	db $66
	db $66
	db $7C
	db $7D
	db $FF
	db $FF
	db $A8
	db $A8
	db $A6
	db $B0
	db $2D
	db $2F
	db $31
	db $FF
	db $A8
	db $69
	db $66
	db $66
	db $7F
	db $7C
	db $A8
	db $A9
	db $FF
	db $AB
	db $AE
	db $AF
	db $AD
	db $FF
	db $FF
	db $FF
	db $65
	db $66
	db $66
	db $66
	db $81
	db $84
	db $85
	db $B1
	db $35
	db $AF
	db $AC
	db $AD
	db $AC
	db $AC
	db $FF
	db $FF
	db $B5
	db $B8
	db $B5
	db $B5
	db $C1
	db $C3
	db $C5
	db $B0
	db $35
	db $35
	db $B0
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $B5
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $09
	db $46
	db $4A
	db $0D
	db $0F
	db $0D
	db $0D
	db $0D
	db $0E
	db $FF
	db $64
	db $07
	db $50
	db $0C
	db $0D
	db $0F
	db $12
	db $15
	db $58
	db $5A
	db $1D
	db $5D
	db $22
	db $24
	db $03
	db $26
	db $29
	db $2D
	db $2F
	db $31
	db $35
	db $38
	db $3C
	db $40
	db $44
	db $48
	db $4C
	db $FF
	db $91
	db $9D
	db $9F
	db $A8
	db $6E
	db $70
	db $76
	db $7A
	db $FF
	db $8B
	db $8C
	db $8B
	db $91
	db $91
	db $91
	db $98
	db $FF
	db $91
	db $A8
	db $A8
	db $6C
	db $66
	db $78
	db $7C
	db $A8
	db $FF
	db $FF
	db $A8
	db $A7
	db $A5
	db $2B
	db $2F
	db $2F
	db $AE
	db $FF
	db $A8
	db $66
	db $66
	db $66
	db $7C
	db $87
	db $A8
	db $A8
	db $FF
	db $C8
	db $AF
	db $B1
	db $AB
	db $FF
	db $FF
	db $FF
	db $66
	db $66
	db $66
	db $66
	db $83
	db $84
	db $A8
	db $33
	db $AE
	db $AF
	db $AB
	db $AB
	db $B0
	db $B0
	db $FF
	db $FF
	db $B6
	db $B9
	db $BD
	db $B5
	db $B5
	db $91
	db $B5
	db $33
	db $AD
	db $AD
	db $33
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $B5
	db $FF
	db $C6
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $50
	db $48
	db $4C
	db $0D
	db $0B
	db $0D
	db $0D
	db $0D
	db $0F
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $AA
	db $AA
	db $AA
	db $AA
	db $FF
	db $FF
	db $FF
	db $00
	db $00
	db $00
	db $55
	db $55
	db $55
	db $55
	db $55
	db $FF
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $55
	db $55
	db $55
	db $55
	db $55
	db $55
	db $FF
	db $FF
	db $00
	db $00
	db $00
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $55
	db $55
	db $55
	db $55
	db $55
	db $55
	db $55
	db $00
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $55
	db $55
	db $55
	db $55
	db $55
	db $55
	db $55
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $00
	db $00
	db $00
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $01
	db $78
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
