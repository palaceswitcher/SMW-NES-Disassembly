;disassembled with BZK 6502 Disassembler
ptr7_8000:
	LDA PlayerYScreen
	BNE bra_8005
	RTS
bra_8005:
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA SprPtrs_WoodenSpike,X
	STA $32
	LDA SprPtrs_WoodenSpike+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
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
	.word SprMap_WoodenSpikeUp
	.word SprMap_WoodenSpikeDown
SprMap_WoodenSpikeUp:
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
SprMap_WoodenSpikeDown:
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
obj_hD4:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_8080
	CMP #$FF
	BEQ bra_8080
	JMP loc3_A6B5
bra_8080:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_80C2
	LDA ObjYScreenDistance,X
	BPL bra_80B1
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_80C2
bra_80B1:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_80C2:
loc_80C2:
	LDA FreezeFlag
	BEQ bra_80C8
	RTS
bra_80C8:
	LDY #$46
	LDA ObjectAction,X
	BEQ bra_80D0
	INY
bra_80D0:
	STY $32
	LDA FrameCount
	AND #$01
	BNE bra_80DD
	LDA $32
	JSR jmp_54_B470
bra_80DD:
	JSR sub_82EA
	JSR jmp_54_BF74
	RTS
obj_hE0:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_8102
	CMP #$FF
	BEQ bra_8102
	JMP loc3_A6B5
bra_8102:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_8144
	LDA ObjYScreenDistance,X
	BPL bra_8133
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_8144
bra_8133:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_8144:
loc_8144:
	LDA FreezeFlag
	BEQ bra_814A
	RTS
bra_814A:
	LDA ObjectVariables,X
	BMI bra_8152
	JMP loc_82A7
bra_8152:
	LDY ObjectCount
	INC ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	STA ObjectXPos+1,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	STA ObjectXScreen+1,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	STA ObjectYPos+1,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	STA ObjectYScreen+1,Y
	LDA ObjectYPos,Y
	SEC
	SBC #$90
	STA ObjectYPos,Y
	BCS bra_8196
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
	STA ObjectYScreen,Y
bra_8196:
	LDA ObjectXPos+1,Y
	CLC
	ADC #$04
	STA ObjectXPos+1,Y
	LDA ObjectXScreen+1,Y
	ADC #$00
	STA ObjectXScreen+1,Y
	LDA #$80
	STA ObjectVariables,Y
	LDA #$00
	STA ObjectVariables,X
	STA $0579,Y
	STA ObjectState,Y
	STA ObjectState+1,Y
	STA ObjectAction+1,Y
	LDA ObjectSlot,X
	AND #$01
	CLC
	ADC #$F8
	STA ObjectSlot,Y
	LDA #$D6
	STA ObjectSlot+1,Y
	RTS
obj_hF4:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_81EC
	CMP #$FF
	BEQ bra_81EC
	JMP loc3_A6B5
bra_81EC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_822E
	LDA ObjYScreenDistance,X
	BPL bra_821D
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_822E
bra_821D:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_822E:
loc_822E:
	LDA FreezeFlag
	BEQ bra_8234
	RTS
bra_8234:
	LDA ObjectVariables,X
	BPL bra_82A7
	LDA #$00
	STA ObjectVariables,X
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	LDA #$00
	STA ObjectAction,Y
	STA ObjectState,Y
	STA ObjectVariables,Y
	LDA #$D6
	STA ObjectSlot,Y
	LDA ObjectXPos,Y
	CLC
	ADC #$04
	STA ObjectXPos,Y
	LDA ObjectXScreen,Y
	ADC #$00
	STA ObjectXScreen,Y
	LDA #$00
	STA ObjectAction,Y
	LDA ObjectSlot,X
	CMP #$F8
	BCC bra_82A6_RTS
	LDA #$01
	STA ObjectAction,Y
	LDA ObjectYPos,Y
	CLC
	ADC #$38
	STA ObjectYPos,Y
	BCC bra_82A6_RTS
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	STA ObjectYScreen,Y
bra_82A6_RTS:
	RTS
bra_82A7:
loc_82A7:
	JSR sub_82C9
	LDY #$00
	LDA ObjectSlot,X
	CMP #$F8
	BCC bra_82B4
	INY
bra_82B4:
	TYA
	STA EnemyAnimFrame,X
	CLC
	ADC #$46
	STA $32
	LDA FrameCount
	AND #$01
	BNE bra_82C8_RTS
	LDA $32
	JSR jmp_54_B470
bra_82C8_RTS:
	RTS
sub_82C9:
	JSR sub_82EA
	LDA PlayerMovement
	AND #$01
	BNE bra_82DF
	LDA ObjXScreenDistance,X
	BMI bra_82E9_RTS
	LDA #$01
	STA $06EF
	JMP loc_82E9_RTS
bra_82DF:
	LDA ObjXScreenDistance,X
	BPL bra_82E9_RTS
	LDA #$01
	STA $06EF
bra_82E9_RTS:
loc_82E9_RTS:
	RTS
sub_82EA:
	LDY ObjectSlot,X
	LDA $A87B,Y
	STA $36
	LDA $A97B,Y
	STA $38
	LDY #$10
	LDA PlayerPowerup
	BEQ bra_8300
	LDY #$18
bra_8300:
	LDA PlayerAction
	CMP #$07
	BNE bra_8308
	LDY #$08
bra_8308:
	STY $32
	LDA ObjXScreenDistance,X
	BPL bra_831C
	LDA #$05
	CLC
	ADC $36
	CLC
	ADC ObjectXDistance,X
	BCS bra_8323
	BCC bra_8343
bra_831C:
	LDA ObjectXDistance,X
	CMP #$05
	BCS bra_8343
bra_8323:
	LDA ObjYScreenDistance,X
	BEQ bra_8339
	CMP #$FF
	BNE bra_8343
	LDA $32
	CLC
	ADC $38
	CLC
	ADC ObjectYDistance,X
	BCS bra_8340
	BCC bra_8343
bra_8339:
	LDA ObjectYDistance,X
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
	.word SprMap_PeachMushroom
SprMap_PeachMushroom:
	.byte $02
	.byte $02
	.byte $90
	.byte $01, $02
	.byte $0B, $0C
obj_hBD:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra_83F3
	AND #$7F
	CMP #$10
	BCC bra_8380
	LDA #$00
	STA ObjectVariables,X
	RTS
bra_8380:
	INC ObjectVariables,X
	LDA FrameCount
	AND #$01
	BNE bra_838E
	LDA #$4C
	JSR GetMovementData
bra_838E:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_83AA
	CMP #$FF
	BEQ bra_83AA
	JMP loc3_A6B5
bra_83AA:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_83EC
	LDA ObjYScreenDistance,X
	BPL bra_83DB
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_83EC
bra_83DB:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_83EC:
loc_83EC:
	LDA FreezeFlag
	BEQ bra_83F2_RTS
	RTS
bra_83F2_RTS:
	RTS
bra_83F3:
	LDA FrameCount
	AND #$00
	BNE bra_83FE
	LDA #$0B
	JSR GetMovementData
bra_83FE:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_841A
	CMP #$FF
	BEQ bra_841A
	JMP loc3_A6B5
bra_841A:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_845C
	LDA ObjYScreenDistance,X
	BPL bra_844B
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_845C
bra_844B:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_845C:
loc_845C:
	LDA FreezeFlag
	BEQ bra_8462
	RTS
bra_8462:
	LDX $A4
	JSR sub_82EA
	JSR jmp_54_AE3D
	LDA #$00
	STA ObjectSlot,Y
	LDA #$03
	JSR sub3_BCD4
	RTS
ptr6_8475:
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_84A3,X
	STA $32
	LDA tbl_84A3+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra_8495
	LDY #$C0
bra_8495:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl_84A3:
	.word DinoRhino1
	.word DinoRhino2
	.word DinoTorch1
	.word DinoTorch2
	.word DinoTorchFlat
DinoRhino1:
	.byte $04
	.byte $04
	.byte $D0
	.byte $0D, $0E, $0F, $FF
	.byte $13, $14, $15, $16
	.byte $1B, $1C, $1D, $1E
	.byte $23, $24, $25, $26
DinoRhino2:
	.byte $04
	.byte $04
	.byte $D0
	.byte $10, $11, $12, $FF
	.byte $17, $18, $19, $1A
	.byte $1F, $20, $21, $22
	.byte $27, $28, $29, $2A
DinoTorch1:
	.byte $02
	.byte $02
	.byte $D0
	.byte $02, $03
	.byte $07, $08
DinoTorch2:
	.byte $02
	.byte $02
	.byte $D0
	.byte $02, $04
	.byte $09, $0A
DinoTorchFlat:
	.byte $02
	.byte $02
	.byte $D0
	.byte $05, $06
	.byte $0B, $0C
obj_hE4:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_8506
	CMP #$FF
	BEQ bra_8506
	JMP loc3_A6B5
bra_8506:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_8548
	LDA ObjYScreenDistance,X
	BPL bra_8537
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_8548
bra_8537:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_8548:
loc_8548:
	LDA FreezeFlag
	BEQ bra_854E
	RTS
bra_854E:
	LDA ObjectAction,X
	CMP #$02
	BEQ bra_8558
	JSR sub_8592
bra_8558:
	LDX $A4
	LDA ObjectAction,X
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
	INC EnemyAnimFrame,X
	INC EnemyAnimFrame,X
	RTS
ptr7_857C:
	LDA #$04
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	CMP #$10
	BCC bra_858E
	LDA #$00
	STA ObjectSlot,X
	RTS
bra_858E:
	INC ObjectState,X
	RTS
sub_8592:
	LDA #$06
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_85B4
	CMP #$FF
	BEQ bra_85B4
	JMP loc3_A6B5
bra_85B4:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_85F6
	LDA ObjYScreenDistance,X
	BPL bra_85E5
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_85F6
bra_85E5:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_85F6:
loc_85F6:
	LDA FreezeFlag
	BEQ bra_85FC
	RTS
bra_85FC:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl_8610,Y
	STA $32
	LDA tbl_8610+1,Y
	STA $33
	JMP ($32)
tbl_8610:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr7_861A
	.word ptr_AD88
ptr7_861A:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	JSR jmp_54_BCBE
	LDA #$00
	STA ObjectState,X
	STA ObjectVariables,X
	LDA #$02
	STA ObjectAction,X
	RTS
obj_hE2:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_8652
	CMP #$FF
	BEQ bra_8652
	JMP loc3_A6B5
bra_8652:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_8694
	LDA ObjYScreenDistance,X
	BPL bra_8683
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_8694
bra_8683:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_8694:
loc_8694:
	LDA FreezeFlag
	BEQ bra_869A
	RTS
bra_869A:
	JSR sub_879B
	LDX $A4
	LDA ObjectAction,X
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
	LDA ObjectSlot,X
	CMP #$E6
	BCC bra_86C0
	LDY #$02
bra_86C0:
	STY $25
	LDA ObjectState,X
	AND #$C0
	ORA $25
	STA EnemyAnimFrame,X
	JSR sub3_B077
	BEQ bra_86DD
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	DEC ObjectAction,X
	RTS
bra_86DD:
	LDA FrameCount
	AND #$01
	BNE bra_86E8_RTS
	LDA #$12
	JSR GetMovementData
bra_86E8_RTS:
	RTS
sub_86E9:
	JSR sub3_B057
	BEQ bra_874F
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	INC ObjectAction,X
	LDA #$E0
	BMI bra_8716
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_870A
	CMP #$F0
	BCC bra_8728
bra_870A:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc_8728
bra_8716:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_8728
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra_8728:
loc_8728:
	LDY #$08
	LDA ObjectState,X
	AND #$40
	BNE bra_8733
	LDY #$F8
bra_8733:
	TYA
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra_8746
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra_874B
bra_8746:
	LDA ObjectXScreen,X
	SBC #$00
bra_874B:
	STA ObjectXScreen,X
	RTS
bra_874F:
	LDY #$13
	LDA ObjectSlot,X
	CMP #$E6
	BCC bra_8759
	INY
bra_8759:
	STY $25
	LDA FrameCount
	AND #$01
	BNE bra_8766
	LDA $25
	JSR GetMovementData
bra_8766:
	LDY #$00
	LDA $062B
	AND #$08
	BNE bra_8770
	INY
bra_8770:
	STY $25
	LDA $15
	BNE bra_8790
	LDA InvincibilityTimer
	BNE bra_8790
	LDA ObjectState,X
	AND #$BF
	STA ObjectState,X
	LDA ObjXScreenDistance,X
	BMI bra_8790
	LDA ObjectState,X
	ORA #$40
	STA ObjectState,X
bra_8790:
	LDA ObjectState,X
	AND #$C0
	ORA $25
	STA EnemyAnimFrame,X
	RTS
sub_879B:
	LDA #$07
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_87BD
	CMP #$FF
	BEQ bra_87BD
	JMP loc3_A6B5
bra_87BD:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_87FF
	LDA ObjYScreenDistance,X
	BPL bra_87EE
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_87FF
bra_87EE:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_87FF:
loc_87FF:
	LDA FreezeFlag
	BEQ bra_8805
	RTS
bra_8805:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl_8819,Y
	STA $32
	LDA tbl_8819+1,Y
	STA $33
	JMP ($32)
tbl_8819:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr7_8823
	.word ptr_AD88
ptr7_8823:
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	LDA #$10
	BMI bra_8846
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_883A
	CMP #$F0
	BCC bra_8858
bra_883A:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc_8858
bra_8846:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_8858
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra_8858:
loc_8858:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_8874
	CMP #$FF
	BEQ bra_8874
	JMP loc3_A6B5
bra_8874:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_88B6
	LDA ObjYScreenDistance,X
	BPL bra_88A5
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_88B6
bra_88A5:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_88B6:
loc_88B6:
	LDA FreezeFlag
	BEQ bra_88BC
	RTS
bra_88BC:
	INC ObjectSlot,X
	INC ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	STA ObjectVariables,X
	STA ObjectAction,X
	JSR jmp_54_BCBE
	RTS
ptr6_88D1:
	LDX $A4
	LDA EnemyAnimFrame,X
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
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8938,X
	STA $32
	LDA tbl_8938+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra_8919
	LDY #$C0
bra_8919:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA EnemyAnimFrame,X
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
obj_hD5:
	LDX $A4
	LDA #$02
	STA EnemyAnimFrame,X
	LDA $06E3
	BMI bra_8BD8
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_8BCC
	CMP #$F0
	BCC bra_8BEA
bra_8BCC:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc_8BEA
bra_8BD8:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_8BEA
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra_8BEA:
loc_8BEA:
	LDA $06E2
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra_8BFF
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra_8C04
bra_8BFF:
	LDA ObjectXScreen,X
	SBC #$00
bra_8C04:
	STA ObjectXScreen,X
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_8C23
	CMP #$FF
	BEQ bra_8C23
	JMP loc3_A6B5
bra_8C23:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_8C65
	LDA ObjYScreenDistance,X
	BPL bra_8C54
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_8C65
bra_8C54:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_8C65:
loc_8C65:
	LDA FreezeFlag
	BEQ bra_8C6B
	RTS
bra_8C6B:
	LDX $A4
	JSR sub_82EA
	JSR jmp_54_BF74
	LDA #sfxEnemyHit3
	STA SFXRegister
	RTS
obj_hDE:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_8C96
	CMP #$FF
	BEQ bra_8C96
	JMP loc3_A6B5
bra_8C96:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_8CD8
	LDA ObjYScreenDistance,X
	BPL bra_8CC7
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_8CD8
bra_8CC7:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_8CD8:
loc_8CD8:
	LDA FreezeFlag
	BEQ bra_8CDE
	RTS
bra_8CDE:
	LDA ObjectVariables,X
	BMI bra_8CE6
	JMP loc_8D69
bra_8CE6:
	LDA #$00
	STA BowserHits
	STA $06E2
	STA $06E3
	STA ObjectVariables,X
	LDY ObjectCount
	INC ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	SEC
	SBC #$70
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,Y
	LDA ObjectXPos,X
	CLC
	ADC #$08
	STA ObjectXPos+1,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen+1,Y
	LDA ObjectYPos,X
	SEC
	SBC #$48
	STA ObjectYPos+1,Y
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen+1,Y
	LDA ObjectState,X
	STA ObjectState,Y
	STA ObjectState+1,Y
	LDA #$00
	STA ObjectVariables,Y
	STA $0579,Y
	STA ObjectAction,Y
	STA $0641,Y
	STA $05F6
	STA BowserStatus
	LDA #$E1
	STA ObjectSlot,Y
	LDA #$D7
	STA ObjectSlot+1,Y
	LDA #$E0
	STA $03C9
	STA $03CA
	RTS
loc_8D69:
	LDX $A4
	JSR sub_8E1A
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_8D8A
	CMP #$FF
	BEQ bra_8D8A
	JMP loc3_A6B5
bra_8D8A:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_8DCC
	LDA ObjYScreenDistance,X
	BPL bra_8DBB
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_8DCC
bra_8DBB:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_8DCC:
loc_8DCC:
	LDA FreezeFlag
	BEQ bra_8DD2
	RTS
bra_8DD2:
	LDX $A4
	LDA $062B
	AND #$0C
	LSR
	LSR
	STA EnemyAnimFrame,X
	LDA $06E7
	BEQ bra_8DF5
	STA ClownCarFace
	INC ClownCarFace
	JSR sub_82EA
	JSR jmp_54_BF74
	LDA #$02
	STA EnemyAnimFrame,X
	RTS
bra_8DF5:
	LDA $062B
	AND #$E0
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_8E12,Y
	STA ClownCarFace
	JSR sub_82EA
	JSR jmp_54_BF74
	LDA #$02
	STA EnemyAnimFrame,X
	RTS
tbl_8E12:
	.byte $00 ;Clown car blink cycle
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
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_8E2C
	CMP #$F0
	BCC bra_8E4A
bra_8E2C:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc_8E4A
bra_8E38:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_8E4A
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra_8E4A:
loc_8E4A:
	LDA $03
	SEC
	SBC $06E3
	STA $03
	LDA $06E2
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra_8E67
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra_8E6C
bra_8E67:
	LDA ObjectXScreen,X
	SBC #$00
bra_8E6C:
	STA ObjectXScreen,X
	LDA $02
	SEC
	SBC $06E2
	STA $02
	RTS
sub_8E78:
	LDA $06E3
	BMI bra_8E96
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_8E8A
	CMP #$F0
	BCC bra_8EA8
bra_8E8A:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc_8EA8
bra_8E96:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra_8EA8
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra_8EA8:
loc_8EA8:
	LDA $06E2
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra_8EBD
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra_8EC2
bra_8EBD:
	LDA ObjectXScreen,X
	SBC #$00
bra_8EC2:
	STA ObjectXScreen,X
	LDA #$00
	STA $06E2
	STA $06E3
	RTS
ptr6_8ECE:
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8EFC,X
	STA $32
	LDA tbl_8EFC+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra_8EEE
	LDY #$C0
bra_8EEE:
	STY $36
	LDA EnemyAnimFrame,X
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
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8F66,X
	STA $32
	LDA tbl_8F66+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra_8F4E
	LDY #$C0
bra_8F4E:
	STY $36
	LDA EnemyAnimFrame,X
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
obj_hBA:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_8FF4
	CMP #$FF
	BEQ bra_8FF4
	JMP loc3_A6B5
bra_8FF4:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_9036
	LDA ObjYScreenDistance,X
	BPL bra_9025
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_9036
bra_9025:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_9036:
loc_9036:
	LDA FreezeFlag
	BEQ bra_903C
	RTS
bra_903C:
	LDA ObjectAction,X
	CLC
	ADC #$50
	STA $25
	LDA FrameCount
	AND #$00
	BNE bra_904F
	LDA $25
	JSR jmp_54_B470
bra_904F:
	LDX $A4
	LDA ObjectVariables,X
	CMP #$0C
	BCC bra_907C_RTS
	LDA $062B
	AND #$07
	BNE bra_907C_RTS
	LDA EnemyAnimFrame,X
	AND #$03
	CMP #$03
	BCS bra_906C
	INC EnemyAnimFrame,X
	RTS
bra_906C:
	LDA ObjectAction,X
	BNE bra_9074
	INC BowserStatus
bra_9074:
	LDA #$00
	STA ObjectSlot,X
	STA $05F6
bra_907C_RTS:
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_909B
	CMP #$FF
	BEQ bra_909B
	JMP loc3_A6B5
bra_909B:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_90DD
	LDA ObjYScreenDistance,X
	BPL bra_90CC
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_90DD
bra_90CC:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_90DD:
loc_90DD:
	LDA FreezeFlag
	BEQ bra_90E3_RTS
	RTS
bra_90E3_RTS:
	RTS
obj_hDF:
	LDX $A4
	JSR sub_8E78
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_9105
	CMP #$FF
	BEQ bra_9105
	JMP loc3_A6B5
bra_9105:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_9147
	LDA ObjYScreenDistance,X
	BPL bra_9136
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_9147
bra_9136:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_9147:
loc_9147:
	LDA FreezeFlag
	BEQ bra_914D
	RTS
bra_914D:
	JSR sub_9159
	LDA ObjectState,X
	AND #$40
	STA ObjectState,X
	RTS
sub_9159:
	LDX $A4
	LDA BowserStatus
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
	LDA ObjectState,X
	AND #$1F
	CMP #$04
	BNE bra_91D9_RTS
	LDA #$06
	STA BowserStatus
	LDA #$00
	STA $05F6
	LDA ObjectState,X
	AND #$40
	STA ObjectState,X
	LDA ObjectXPos,X
	SEC
	SBC #$04
	STA ObjectXPos,X
bra_91D9_RTS:
	RTS
ptr7_91DA:
	LDA #$01
	STA $06E3
	LDA #$04
	STA EnemyAnimFrame,X
	INC $05F6
	LDA $05F6
	CMP #$70
	BCC bra_91F6_RTS
	LDA #$00
	STA $05F6
	INC BowserStatus
bra_91F6_RTS:
	RTS
ptr7_91F7:
	LDA $062B
	AND #$07
	BNE bra_921C_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_921D
	STA EnemyAnimFrame,X
	LDA ObjXScreenDistance,X
	BMI bra_921C_RTS
	LDA EnemyAnimFrame,X
	ORA #$40
	STA EnemyAnimFrame,X
bra_921C_RTS:
	RTS
bra_921D:
	LDA #$00
	STA $05F6
	INC BowserStatus
	LDA #$37
	STA YoshiXPos
	LDA #$38
	STA YoshiXScreen
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
	LDA YoshiXPos
	ASL
	TAY
	JSR jmp_54_B896
	LDA $062B
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA EnemyAnimFrame,X
	LDA ObjXScreenDistance,X
	BMI bra_9260_RTS
	LDA EnemyAnimFrame,X
	ORA #$40
	STA EnemyAnimFrame,X
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
	LDA $062B
	AND #$07
	BNE bra_9296_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_92A8,Y
	CMP #$FF
	BEQ bra_9297
	STA EnemyAnimFrame,X
	LDA ObjXScreenDistance,X
	BMI bra_9296_RTS
	LDA EnemyAnimFrame,X
	ORA #$40
	STA EnemyAnimFrame,X
bra_9296_RTS:
	RTS
bra_9297:
	LDA #$00
	STA $05F6
	LDA ObjectState,X
	AND #$40
	STA ObjectState,X
	INC BowserStatus
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
	LDA ObjectSlot,Y
	CMP #$3A
	BCC bra_92C8
	CMP #$42
	BCC bra_92F8
bra_92C8:
	CPY ObjectCount
	BCC bra_92BC
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	LDA #$00
	STA ObjectState,Y
	STA ObjectVariables,Y
	LDA #$01
	STA ObjectAction,Y
	LDA #$3A
	STA ObjectSlot,Y
bra_92F8:
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	LDA #$40
	STA ObjectState,Y
	LDA #$00
	STA ObjectVariables,Y
	LDA #$01
	STA ObjectAction,Y
	LDA #$3A
	STA ObjectSlot,Y
	RTS
bra_9329:
	CMP #$30
	BCC bra_9335_RTS
	LDA #$00
	STA $05F6
	INC BowserStatus
bra_9335_RTS:
	RTS
ptr7_9336:
	LDA $062B
	AND #$07
	BNE bra_935B_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_935C
	STA EnemyAnimFrame,X
	LDA ObjXScreenDistance,X
	BMI bra_935B_RTS
	LDA EnemyAnimFrame,X
	ORA #$40
	STA EnemyAnimFrame,X
bra_935B_RTS:
	RTS
bra_935C:
	LDA #$00
	STA $05F6
	LDA #$02
	STA BowserStatus
	LDA YoshiXScreen
	EOR #$01
	STA YoshiXScreen
	STA YoshiXPos
	RTS
ptr7_9372:
	INC $05F6
	LDA $05F6
	CMP #$70
	BNE bra_939B
	LDA #$00
	STA $05F6
	INC BowserHits
	LDY BowserHits
	LDA tbl_93AF,Y
	STA BowserStatus
	CMP #$1F
	BEQ bra_939A_RTS
	LDA ObjectXPos,X
	CLC
	ADC #$04
	STA ObjectXPos,X
bra_939A_RTS:
	RTS
bra_939B:
	LDY #$0B
	LDA $062B
	AND #$10
	BNE bra_93A5
	INY
bra_93A5:
	TYA
	STA EnemyAnimFrame,X
	LDA #$02
	STA ClownCarFace
	RTS
tbl_93AF:
	.byte $00 ;phase if no hits
	.byte $02 ;phase after 1 or 2 hits
	.byte $02
	.byte $07 ;phase after 3 hits
	.byte $0E ;phase after 4 or 5 hits 
	.byte $0E
	.byte $13 ;phase after 6 hits
	.byte $1A ;phase after 7 or 8 hits
	.byte $1A
	.byte $1F
ptr7_93B9:
	LDA #$FF
	STA $06E3
	LDA ObjectYPos,X
	CMP #$90
	BNE bra_93C8_RTS
	INC BowserStatus
bra_93C8_RTS:
	RTS
ptr7_93C9:
	LDA #$01
	STA $06E2
	LDA ObjectXPos,X
	CMP #$C0
	BNE bra_93D8_RTS
	INC BowserStatus
bra_93D8_RTS:
	RTS
ptr7_93D9:
	INC BowserStatus
	LDA #$00
	STA $05F6
obj_hB8:
	STA ObjectAction,X
	STA $0641,X
	STA ObjectVariables,X
	STA ObjectState,X
	STA $06E2
	STA $06E3
	LDA ObjectYPos,X
	CLC
	ADC #$18
	STA ObjectYPos,X
	RTS
ptr7_93FD:
	INC $05F6
	LDA $05F6
	CMP #$08
	BCS bra_9410
	DEC ObjectYPos,X
	LDA #$57
	STA EnemyAnimFrame,X
	RTS
bra_9410:
	CMP #$10
	BCS bra_941D
	DEC ObjectYPos,X
	LDA #$56
	STA EnemyAnimFrame,X
	RTS
bra_941D:
	CMP #$18
	BCS bra_942A
	DEC ObjectYPos,X
	LDA #$55
	STA EnemyAnimFrame,X
	RTS
bra_942A:
	CMP #$70
	BNE bra_9464
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	CLC
	ADC #$18
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,Y
	LDA #$BF
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectAction,Y
	LDA #$80
	STA ObjectVariables,Y
	LDA #$40
	STA ObjectState,Y
	RTS
bra_9464:
	CMP #$D0
	BCS bra_9477
	LDA $062B
	AND #$18
	LSR
	LSR
	LSR
	CLC
	ADC #$51
	STA EnemyAnimFrame,X
	RTS
bra_9477:
	CMP #$D8
	BCS bra_9484
	INC ObjectYPos,X
	LDA #$55
	STA EnemyAnimFrame,X
	RTS
bra_9484:
	CMP #$E0
	BCS bra_9491
	INC ObjectYPos,X
	LDA #$56
	STA EnemyAnimFrame,X
	RTS
bra_9491:
	CMP #$E8
	BCS bra_949E
	INC ObjectYPos,X
	LDA #$57
	STA EnemyAnimFrame,X
	RTS
bra_949E:
	INC BowserStatus
	LDA #$04
	STA EnemyAnimFrame,X
	LDA #$00
	STA $05F6
	STA ObjectAction,X
	STA $0641,X
	STA ObjectVariables,X
	STA ObjectState,X
	STA $06E2
	STA $06E3
	LDA ObjectYPos,X
	SEC
	SBC #$19
	STA ObjectYPos,X
	RTS
ptr7_94C7:
	LDA $062B
	AND #$07
	BNE bra_94EC_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_94ED
	STA EnemyAnimFrame,X
	LDA ObjXScreenDistance,X
	BMI bra_94EC_RTS
	LDA EnemyAnimFrame,X
	ORA #$40
	STA EnemyAnimFrame,X
bra_94EC_RTS:
	RTS
bra_94ED:
	LDA #$00
	STA $05F6
	INC BowserStatus
	RTS
ptr7_94F6:
	JSR sub_91B5
	JSR sub3_B057
	BEQ bra_9506
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra_9506:
	LDA FrameCount
	AND #$01
	BNE bra_9511
	LDA #$4D
	JSR jmp_54_B11D
bra_9511:
	LDA $062B
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	STA $25
	LDA EnemyAnimFrame,X
	AND #$BF
	ORA $25
	STA EnemyAnimFrame,X
	LDA ObjectXPos,X
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
	INC BowserStatus
	LDA #$00
	STA $05F6
bra_955E_RTS:
	RTS
ptr7_955F:
	LDA #$0E
	STA BowserStatus
	LDA #$00
	STA $05F6
	RTS
ptr7_956A:
	JSR sub_91B5
	JSR sub3_B057
	BEQ bra_957A
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra_957A:
	LDA FrameCount
	AND #$01
	BNE bra_9585
	LDA #$4E
	JSR jmp_54_B11D
bra_9585:
	LDA $062B
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	STA $25
	LDA EnemyAnimFrame,X
	AND #$BF
	ORA $25
	STA EnemyAnimFrame,X
	LDA #$03
	STA ClownCarFace
	LDA ObjectXPos,X
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
	INC BowserStatus
	LDA #$00
	STA $05F6
bra_95D7_RTS:
	RTS
ptr7_95D8:
	LDA #$1A
	STA BowserStatus
	LDA #$00
	STA $05F6
	RTS
ptr7_95E3:
	LDA #$02
	STA ClownCarFace
	LDA $05F6
	BNE bra_9612
	INC $05F6
	LDA #$18
	STA EnemyAnimFrame,X
	LDY #$FF
bra_95F7:
	INY
	LDA ObjectSlot,Y
	CMP #$3A
	BCC bra_960D
	CMP #$42
	BCS bra_960D
	LDA #PlayerXPosDup
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectState,Y
bra_960D:
	CPY ObjectCount
	BCC bra_95F7
	RTS
bra_9612:
	CMP #$01
	BEQ bra_9619
	JMP loc_970B_RTS
bra_9619:
	LDA #$10
	STA SFXRegister
	INC $05F6
	LDY ObjectCount
	INC ObjectCount
	INC ObjectCount
	INC ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	CLC
	ADC #$30
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,Y
	LDA #$00
	STA ObjectVariables,Y
	LDA #$BC
	STA ObjectSlot,Y
	LDA #$C4
	STA EnemyAnimFrame,Y
	LDA #$00
	STA ObjectAction,Y
	STA ObjectState,Y
	LDA ObjectXPos,X
	STA ObjectXPos+1,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen+1,Y
	LDA ObjectYPos,X
	CLC
	ADC #$48
	STA ObjectYPos+1,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen+1,Y
	LDA #$00
	STA $0579,Y
	LDA #$BC
	STA ObjectSlot+1,Y
	LDA #$40
	STA EnemyAnimFrame+1,Y
	LDA #$01
	STA ObjectAction+1,Y
	LDA #$00
	STA ObjectState+1,Y
	LDA ObjectXPos,X
	CLC
	ADC #$20
	STA ObjectXPos+2,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen+2,Y
	LDA ObjectYPos,X
	CLC
	ADC #$30
	STA ObjectYPos+2,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen+2,Y
	LDA #$00
	STA $057A,Y
	LDA #$BC
	STA ObjectSlot+2,Y
	LDA #$84
	STA EnemyAnimFrame+2,Y
	LDA #$02
	STA ObjectAction+2,Y
	LDA #$00
	STA ObjectState+2,Y
	LDA ObjectXPos,X
	CLC
	ADC #$20
	STA ObjectXPos+3,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen+3,Y
	LDA ObjectYPos,X
	CLC
	ADC #$48
	STA ObjectYPos+3,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen+3,Y
	LDA #$00
	STA $057B,Y
	LDA #$BC
	STA ObjectSlot+3,Y
	LDA #$00
	STA $0658,Y
	LDA #$03
	STA ObjectAction+3,Y
	LDA #$00
	STA ObjectState+3,Y
	RTS
loc_970B_RTS:
	RTS
ptr7_970C:
	LDA $05F6
	BNE bra_9762_RTS
	INC $05F6
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	CLC
	ADC #$08
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	CLC
	ADC #$28
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,Y
	LDA #$B8
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectState,Y
	STA ObjectVariables,Y
	STA ObjectAction,Y
	STA EnemyAnimFrame,Y
	LDA #$01
	STA $06E6
	LDY #$41
	LDA ObjXScreenDistance,X
	BMI bra_975B
	LDY #$00
bra_975B:
	STY PlayerMovement
	LDA #musEnding
	STA MusicRegister
	RTS
bra_9762_RTS:
	RTS
ptr7_9763:
	RTS
obj_hB6:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra_9782
	CMP #$FF
	BEQ bra_9782
	JMP loc3_A6B5
bra_9782:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra_97C4
	LDA ObjYScreenDistance,X
	BPL bra_97B3
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc_97C4
bra_97B3:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra_97C4:
loc_97C4:
	LDA FreezeFlag
	BEQ bra_97CA
	RTS
bra_97CA:
	LDA ObjectAction,X
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
	LDA $062B
	AND #$03
	BNE bra_97F6_RTS
	LDA ObjectVariables,X
	CMP #$28
	BCC bra_97F7
	INC ObjectAction,X
	INC BowserStatus
bra_97F6_RTS:
	RTS
bra_97F7:
	INC ObjectVariables,X
	LDA #$20
	STA $06E1
	LDA ObjectYPos,X
	SEC
	SBC #$01
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	RTS
ptr7_9811:
	LDY #$00
	LDA ObjectYPos,X
	CMP #$A0
	BCS bra_983C
	CMP #$90
	BCC bra_9820
	LDY #$20
bra_9820:
	STY $06E1
	LDA $062B
	AND #$03
	BNE bra_983B_RTS
	LDA ObjectYPos,X
	CLC
	ADC #$01
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,X
bra_983B_RTS:
	RTS
bra_983C:
	INC ObjectAction,X
	RTS
ptr7_9840:
	LDA #$09
	STA Event
	LDA ObjXScreenDistance,X
	BPL bra_9852
	LDA ObjectXDistance,X
	CMP #$E8
	BCC bra_9859
	BCS bra_9862
bra_9852:
	LDA ObjectXDistance,X
	CMP #$01
	BCC bra_9862
bra_9859:
	LDA #$10
	STA PlayerXSpeed
	LDA #$01
	STA PlayerAction
	RTS
bra_9862:
	LDA #$00
	STA PlayerXSpeed
	STA PlayerAction
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