;disassembled by BZK 6502 Disassembler
Obj_h88:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra6_800A
	JMP loc6_809C
bra6_800A:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra6_8026
	CMP #$FF
	BEQ bra6_8026
	JMP Obj_RemoveObject
bra6_8026:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8068
	LDA ObjYScreenDistance,X
	BPL bra6_8057
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_8068
bra6_8057:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra6_8068:
loc6_8068:
	LDA FreezeFlag
	BEQ bra6_806E
	RTS ;unlogged
bra6_806E:
	LDA ObjectVariables,X
	CMP #$81
	BCS bra6_8078
	JMP jmp_54_B5BB
bra6_8078:
	CMP #$88
	BCS bra6_807F
	JMP sub_54_B4FC
bra6_807F:
	LDA ObjFrameCounter
	AND #$1E
	BNE bra6_809C
	INC ObjectVariables,X
	LDA ObjectVariables,X
	AND #$0F
	CMP #$0E
	BCC bra6_809C
	LDA ObjectVariables,X
	AND #$70
	ORA #$01
	STA ObjectVariables,X
bra6_809C:
loc6_809C:
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
	BEQ bra6_80BE
	CMP #$FF
	BEQ bra6_80BE
	JMP Obj_RemoveObject
bra6_80BE:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8100
	LDA ObjYScreenDistance,X
	BPL bra6_80EF
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_8100
bra6_80EF:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra6_8100:
loc6_8100:
	LDA FreezeFlag
	BEQ bra6_8106
	RTS ;unlogged
bra6_8106:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_811A,Y
	STA $32
	LDA tbl6_811A+1,Y
	STA $33
	JMP ($32)
tbl6_811A:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr6_8124
	dw ptr_AD88
ptr6_8124:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra6_8151
	AND #$0F
	BNE bra6_8139
	LDA ObjectVariables,X
	ORA #$88
	STA ObjectVariables,X
	BNE bra6_8151
bra6_8139:
	LDA FrameCount
	AND #$04
	BEQ bra6_8140
	RTS
bra6_8140:
	LDA #$00
	ASL
	TAY
	LDA tbl6_88D9,Y
	STA $32
	LDA tbl6_88D9+1,Y
	STA $33
	JSR sub3_B485
bra6_8151:
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	LDA #$10
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$10
	STA PlayerXSpeed
	LDA #$01
	JSR RewardPoints
	LDA #sfx_EnemyHit2
	STA SFXRegister
	LDX $A4
	LDA #$81
	STA ObjectVariables,X
	RTS
ptr6_817B:
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA ObjectVariables,X
	BMI bra6_8196
	AND #$0F
	BEQ bra6_8196
	CMP #$09
	BCS bra6_8196
	LDY #$01
bra6_8196:
	TYA
	ASL
	TAX
	LDA SprPtrs_Ninji,X
	STA $32
	LDA SprPtrs_Ninji+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_81B0
	LDY #$C0
bra6_81B0:
	STY $36
	JSR jmp_54_A118
	RTS
SprPtrs_Ninji:
	dw SprMap_Ninji_Idle
	dw SprMap_Ninji_Jump
SprMap_Ninji_Idle:
	db $02 ;Tile Width
	db $02 ;Tile Height
	db $A6 ;1K CHR Bank
	db $22, $23
	db $24, $25
SprMap_Ninji_Jump:
	db $02 ;Tile Width
	db $02 ;Tile Height
	db $A6 ;1K CHR Bank
	db $26, $27
	db $28, $29
Obj_h84:
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
	BEQ bra6_81EA
	CMP #$FF
	BEQ bra6_81EA
	JMP Obj_RemoveObject
bra6_81EA:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_822C
	LDA ObjYScreenDistance,X
	BPL bra6_821B
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_822C
bra6_821B:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra6_822C:
loc6_822C:
	LDA FreezeFlag
	BEQ bra6_8232
	RTS
bra6_8232:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_8246,Y
	STA $32
	LDA tbl6_8246+1,Y
	STA $33
	JMP ($32)
tbl6_8246:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr6_8250
	dw ptr_AD88
ptr6_8250:
	JSR sub6_825A
	JSR Obj_PlayerHitCheck
	JSR jmp_54_BF74
	RTS
sub6_825A:
	LDX $A4
	LDA ObjectVariables,X
	AND #$0F
	ASL
	TAY
	LDA tbl6_8270,Y
	STA $32
	LDA tbl6_8270+1,Y
	STA $33
	JMP ($32)
tbl6_8270:
	dw ptr6_827A
	dw ptr6_82A8
	dw ptr6_82EA
	dw ptr6_834C
	dw ptr6_8366
ptr6_827A:
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	LDA ObjectXDistance,X
	TAY
	LDA ObjXScreenDistance,X
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
	INC ObjectVariables,X
bra6_82A7_RTS:
	RTS
ptr6_82A8
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	LDA ObjXScreenDistance,X
	BEQ bra6_82C6
	CMP #$FF
	BEQ bra6_82D4
	BNE bra6_82E0 ;unlogged
bra6_82C6:
	LDA ObjectXDistance,X
	SEC
	SBC #$18
	BCC bra6_82E6
	CMP #$20
	BCC bra6_82E5_RTS
	BCS bra6_82E0
bra6_82D4:
	LDA ObjectXDistance,X
	CLC
	ADC #$30
	BCS bra6_82E6
	CMP #$E0
	BCS bra6_82E5_RTS
bra6_82E0:
	LDA #$80
	STA ObjectVariables,X
bra6_82E5_RTS:
	RTS
bra6_82E6:
	INC ObjectVariables,X
	RTS
ptr6_82EA:
	LDA #$08
	BMI bra6_8305
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	CMP #$F0
	BCC bra6_8324
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc6_8324
bra6_8305:
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	LDA ObjectYScreen,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjectYScreen,X ;unlogged
	LDA ObjectYPos,X ;unlogged
	CMP #$F0 ;unlogged
	BCC bra6_8324 ;unlogged
	LDA ObjectYPos,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
bra6_8324:
loc6_8324:
	JSR sub_54_BB59
	BEQ bra6_834B_RTS
	LDA ObjectYPos,X
	AND #$F0
	STA ObjectYPos,X
	LDA WorldNumber
	CMP #$05
	BNE bra6_833F
	LDA ObjectYScreen,X
	CMP PlayerYScreenDup
	BNE bra6_8348
bra6_833F:
	LDA #$01
	STA ScreenShake
	LDA #sfx_Thud
	STA SFXRegister
bra6_8348:
	INC ObjectVariables,X
bra6_834B_RTS:
	RTS
ptr6_834C:
	LDA ObjFrameCounter
	AND #$1E
	BNE bra6_8365_RTS
	LDA ObjectVariables,X
	CLC
	ADC #$10
	STA ObjectVariables,X
	AND #$F0
	CMP #$C0
	BCC bra6_8365_RTS
	INC ObjectVariables,X
bra6_8365_RTS:
	RTS
ptr6_8366:
	LDA #$FC
	BMI bra6_8381
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	CMP #$F0 ;unlogged
	BCC bra6_83A0 ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	INC ObjectYScreen,X ;unlogged
	JMP loc6_83A0 ;unlogged
bra6_8381:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	LDA ObjectYPos,X
	CMP #$F0
	BCC bra6_83A0
	LDA ObjectYPos,X
	SEC
	SBC #$10
	STA ObjectYPos,X
bra6_83A0:
loc6_83A0:
	JSR sub_54_BB73
	BEQ bra6_83B2_RTS
	LDA ObjectYPos,X
	ORA #$0F
	STA ObjectYPos,X
	LDA #$80
	STA ObjectVariables,X
bra6_83B2_RTS:
	RTS
ptr6_83B3:
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDA ObjectVariables,X
	AND #$0F
	ASL
	TAX
	LDA SprPtrs_Thwomp,X
	STA $32
	LDA SprPtrs_Thwomp+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_83DB
	LDY #$C0
bra6_83DB:
	STY $36
	JSR jmp_54_A118
	RTS
SprPtrs_Thwomp:
	dw SprMap_Thwomp_Idle
	dw SprMap_Thwomp_Glance
	dw SprMap_Thwomp_Attack
	dw SprMap_Thwomp_Attack
	dw SprMap_Thwomp_Attack
SprMap_Thwomp_Idle:
	db $03 ;Tile Width
	db $04 ;Tile Height
	db $AB ;1K CHR Bank
	db $21, $22, $23
	db $24, $25, $26
	db $2C, $2D, $2E
	db $35, $36, $37
SprMap_Thwomp_Glance:
	db $03
	db $04
	db $AB
	db $21, $22, $23
	db $2A, $2B, $26
	db $32, $33, $34
	db $35, $36, $37
SprMap_Thwomp_Attack:
	db $03
	db $04
	db $AB
	db $21, $22, $23
	db $27, $28, $29
	db $2F, $30, $31
	db $35, $36, $37
	LDX $A4 ;unlogged code start
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra6_8436
	CMP #$FF
	BEQ bra6_8436
	JMP Obj_RemoveObject
bra6_8436:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8478
	LDA ObjYScreenDistance,X
	BPL bra6_8467
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_8478
bra6_8467:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra6_8478:
loc6_8478:
	LDA FreezeFlag
	BEQ bra6_847E
	RTS
bra6_847E:
	LDA ObjectVariables,X
	BPL bra6_8489
	LDA #$00
	STA ObjectVariables,X
	RTS
bra6_8489:
	LDX $A4
	LDA ObjFrameCounter
	AND #$03
	BNE bra6_849D
	INC ObjectVariables,X
	LDA ObjectVariables,X
	AND #$1F
	STA ObjectVariables,X
bra6_849D:
	LDA ObjFrameCounter
	AND #$01
	BNE bra6_84A7
	JSR jmp_54_BBC3
bra6_84A7:
	JSR Obj_PlayerHitCheck
	JSR jmp_54_BF74
	RTS
Obj_h90:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra6_84CC
	CMP #$FF
	BEQ bra6_84CC
	JMP Obj_RemoveObject
bra6_84CC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_850E
	LDA ObjYScreenDistance,X
	BPL bra6_84FD
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_850E
bra6_84FD:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra6_850E:
loc6_850E:
	LDA FreezeFlag
	BEQ bra6_8514
	RTS
bra6_8514:
	LDA ObjectVariables,X
	BPL bra6_851F
	LDA #$00
	STA ObjectVariables,X
	RTS
bra6_851F:
	LDX $A4
	LDA ObjFrameCounter
	AND #$01
	BNE bra6_8533
	INC ObjectVariables,X
	LDA ObjectVariables,X
	AND #$1F
	STA ObjectVariables,X
bra6_8533:
	LDA ObjFrameCounter
	AND #$01
	BNE bra6_853D
	JSR jmp_54_BBC3
bra6_853D:
	JSR Obj_PlayerHitCheck
	JSR jmp_54_BF74
	RTS
ptr7_8544:
	LDY #$00
	LDX $A4
	LDA ObjFrameCounter
	AND #$10
	BEQ bra6_8550
	INY
bra6_8550:
	TYA
	ASL
	TAX
	LDA tbl6_8570,X
	STA $32
	LDA tbl6_8570+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_856A
	LDY #$C0
bra6_856A:
	STY $36
	JSR jmp_54_A118
	RTS ;unlogged code end
tbl6_8570:
	dw Unknown1 ;Unused (Fuzzy)
	dw Unknown2 ;Unused (Fuzzy)
Unknown1:
	db $03
	db $02
	db $A4
	db $01
	db $02
	db $FF
	db $0B
	db $0C
	db $0D
Unknown2:
	db $03
	db $02
	db $A4
	db $03
	db $04
	db $FF
	db $0E
	db $0C
	db $0F
Obj_h86:
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
	BEQ bra6_85A8
	CMP #$FF
	BEQ bra6_85A8
	JMP Obj_RemoveObject
bra6_85A8:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_85EA
	LDA ObjYScreenDistance,X
	BPL bra6_85D9
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_85EA
bra6_85D9:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra6_85EA:
loc6_85EA:
	LDA FreezeFlag
	BEQ bra6_85F0
	RTS
bra6_85F0:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_8604,Y
	STA $32
	LDA tbl6_8604+1,Y
	STA $33
	JMP ($32)
tbl6_8604:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr6_860C
ptr6_860C:
	JSR sub6_8616
	JSR Obj_PlayerHitCheck
	JSR jmp_54_BF74
	RTS
sub6_8616:
	LDX $A4
	LDA ObjectVariables,X
	STA P1Score ;Likely a leftover debugging function
	AND #$0F
	ASL
	TAY
	LDA tbl6_862F,Y
	STA $32
	LDA tbl6_862F+1,Y
	STA $33
	JMP ($32)
tbl6_862F:
	dw ptr6_87DC
	dw ptr6_8637
	dw ptr6_87DC
	dw ptr6_8682
ptr6_8637:
	LDA #$FF
	BMI bra6_8652
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	CMP #$F0 ;unlogged
	BCC bra6_8671 ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	INC ObjectYScreen,X ;unlogged
	JMP loc6_8671 ;unlogged
bra6_8652:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	LDA ObjectYPos,X
	CMP #$F0
	BCC bra6_8671
	LDA ObjectYPos,X
	SEC
	SBC #$10
	STA ObjectYPos,X
bra6_8671:
loc6_8671:
	JSR sub_54_BB73
	BEQ bra6_8681_RTS
	LDA ObjectYPos,X
	ORA #$0F
	STA ObjectYPos,X
	INC ObjectVariables,X
bra6_8681_RTS:
	RTS
ptr6_8682:
	LDA #$01
	BMI bra6_869D
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	CMP #$F0
	BCC bra6_86BC
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc6_86BC
bra6_869D:
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	LDA ObjectYScreen,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjectYScreen,X ;unlogged
	LDA ObjectYPos,X ;unlogged
	CMP #$F0 ;unlogged
	BCC bra6_86BC ;unlogged
	LDA ObjectYPos,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
bra6_86BC:
loc6_86BC:
	JSR sub_54_BB59
	BEQ bra6_86CE_RTS
	LDA ObjectYPos,X
	AND #$F0
	STA ObjectYPos,X
	LDA #$80
	STA ObjectVariables,X
bra6_86CE_RTS:
	RTS
Obj_h92:
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
	BEQ bra6_86F1
	CMP #$FF
	BEQ bra6_86F1
	JMP Obj_RemoveObject
bra6_86F1:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8733
	LDA ObjYScreenDistance,X
	BPL bra6_8722
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_8733
bra6_8722:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra6_8733:
loc6_8733:
	LDA FreezeFlag
	BEQ bra6_8739
	RTS
bra6_8739:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_874D,Y
	STA $32
	LDA tbl6_874D+1,Y
	STA $33
	JMP ($32)
tbl6_874D:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr6_8755
ptr6_8755:
	JSR sub6_875F
	JSR Obj_PlayerHitCheck
	JSR jmp_54_BF74 ;unlogged
	RTS ;unlogged
sub6_875F:
	LDX $A4
	LDA ObjectVariables,X
	STA P1Score
	AND #$0F
	ASL
	TAY
	LDA tbl6_8778,Y
	STA $32
	LDA tbl6_8778+1,Y
	STA $33
	JMP ($32)
tbl6_8778:
	dw ptr6_87DC
	dw ptr6_8780
	dw ptr6_87DC
	dw ptr6_87AD
ptr6_8780:
	LDA #$FF
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra6_8794
	LDA ObjectXScreen,X ;unlogged
	ADC #$00 ;unlogged
	BPL bra6_8799 ;unlogged
bra6_8794:
	LDA ObjectXScreen,X
	SBC #$00
bra6_8799:
	STA ObjectXScreen,X
	JSR sub_54_BBA8
	BEQ bra6_87AC_RTS
	LDA ObjectXPos,X
	ORA #$0F
	STA ObjectXPos,X
	INC ObjectVariables,X
bra6_87AC_RTS:
	RTS
ptr6_87AD:
	LDA #$01
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra6_87C1
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra6_87C6
bra6_87C1:
	LDA ObjectXScreen,X ;unlogged
	SBC #$00 ;unlogged
bra6_87C6:
	STA ObjectXScreen,X
	JSR sub_54_BB8E
	BEQ bra6_87DB_RTS
	LDA ObjectXPos,X
	AND #$F0
	STA ObjectXPos,X
	LDA #$80
	STA ObjectVariables,X
bra6_87DB_RTS:
	RTS
ptr6_87DC:
	LDA ObjFrameCounter
	AND #$0E
	BNE bra6_87FD_RTS
	LDA ObjectVariables,X
	CLC
	ADC #$10
	STA ObjectVariables,X
	AND #$F0
	CMP #$C0
	BCC bra6_87FD_RTS
	INC ObjectVariables,X
	LDA ObjectVariables,X
	AND #$8F
	STA ObjectVariables,X
bra6_87FD_RTS:
	RTS
ptr6_87FE:
	LDY #$00
	LDX $A4
	LDA ObjFrameCounter
	AND #$10
	BEQ bra6_880A
	INY
bra6_880A:
	TYA
	ASL
	TAX
	LDA SprPtrs_Urchin,X
	STA $32
	LDA SprPtrs_Urchin+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_8824
	LDY #$C0
bra6_8824:
	STY $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
SprPtrs_Urchin:
	dw SprMap_Urchin_Open
	dw SprMap_Urchin_Close
SprMap_Urchin_Open:
	db $04 ;Tile Width
	db $04 ;Tile Height
	db $A8 ;1K CHR Bank
	db $09, $0A, $0B, $0C
	db $0D, $0E, $0F, $10
	db $13, $14, $15, $16
	db $19, $1A, $1B, $1C
SprMap_Urchin_Close:
	db $04
	db $04
	db $A8
	db $09, $0A, $0B, $0C
	db $0D, $11, $12, $10
	db $13, $17, $18, $16
	db $19, $1A, $1B, $1C
	db $00 ;unlogged data start
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $01
	db $01
	db $00
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
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01 ;unlogged data end
tbl6_88D9:
	dw ofs_88E5
	dw ofs_88DF ;unlogged data start
	dw ofs_88E2
ofs_88DF:
	db $03
	db $00
	db $80
ofs_88E2:
	db $00
	db $01
	db $80
ofs_88E5:
	db $00
	db $00	
	db $00 ;unlogged data end
	db $00
	db $00
	db $FA
	db $00
	db $FC
	db $00
	db $FD
	db $00
	db $FE
	db $00
	db $FF
	db $00
	db $00
	db $00
	db $01
	db $00
	db $02
	db $00
	db $03
	db $00
	db $04
	db $00
	db $06
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00 ;unlogged
	db $00
	db $F8
	db $00
	db $FA
	db $00
	db $FC
	db $00
	db $FD
	db $00
	db $FE
	db $00
	db $FF
	db $00
	db $00
	db $00
	db $01
	db $00
	db $02
	db $00
	db $03
	db $00
	db $04
	db $00
	db $06
	db $00
	db $08
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00 ;unlogged
	db $00
	db $F8
	db $00
	db $F8
	db $00
	db $F9
	db $00
	db $FB
	db $00
	db $FD
	db $00
	db $FE
	db $00
	db $FF
	db $00
	db $00
	db $00
	db $01
	db $00
	db $02
	db $00
	db $03
	db $00
	db $05
	db $00
	db $07
	db $00
	db $08
	db $00
	db $08
	db $00
	db $00 ;unlogged
	db $00
	db $F6
	db $00
	db $F7
	db $00
	db $F8
	db $00
	db $F9
	db $00
	db $FA
	db $00
	db $FB
	db $00
	db $FE
	db $00
	db $00
	db $00
	db $02
	db $00
	db $05
	db $00
	db $06
	db $00
	db $07
	db $00
	db $08
	db $00
	db $09
	db $00
	db $0A
	db $80
Obj_h70:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra6_8971
	JSR jmp_54_B5BB
	RTS
bra6_8971:
	JSR sub6_8BCA
	LDX $A4
	LDA ObjectAction,X
	ASL
	TAY
	LDA tbl6_8988,Y
	STA $32
	LDA tbl6_8988+1,Y
	STA $33
	JMP ($32)
tbl6_8988:
	dw ptr6_899D
	dw ptr6_89AD
	dw ptr6_89C4
	dw ptr6_89F7
	dw ptr6_8A0C
	dw ptr6_8A63
	dw ptr6_8A98
	dw ptr6_8ADB
ptr6_899D:
	LDA EnemyAnimFrame,X
	AND #$40
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	BNE bra6_89AA
	JMP loc6_8B8F
bra6_89AA:
	JMP loc6_8B6D
ptr6_89AD:
	LDA EnemyAnimFrame,X
	AND #$C0
	ORA #$40
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	BNE bra6_89C1
	JMP loc6_8B44
bra6_89C1:
	JMP loc6_8B20
ptr6_89C4:
	LDA EnemyAnimFrame,X
	AND #$C0
	ORA #$80
	STA EnemyAnimFrame,X
	LDA ObjectXDistance,X
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
	STA ObjectAction,X
	LDA #$00
	STA ObjActionTimer,X
	RTS
bra6_89EA:
	LDA ObjectState,X
	AND #$40
	BNE bra6_89F4
	JMP loc6_8B6D
bra6_89F4:
	JMP loc6_8B8F
ptr6_89F7:
	LDA EnemyAnimFrame,X
	AND #$80
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	BNE bra6_8A09
	JMP loc6_8B20
bra6_8A09:
	JMP loc6_8B44
ptr6_8A0C:
	LDY ObjActionTimer,X
	LDA tbl6_8A53,Y
	STA EnemyAnimFrame,X
	LDA ObjFrameCounter
	AND #$01
	BNE bra6_8A52_RTS
	LDA ObjActionTimer,X
	LSR
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	LDA ObjActionTimer,X
	CMP #$0F
	BCS bra6_8A31
	INC ObjActionTimer,X
bra6_8A31:
	JSR sub3_B077
	BEQ bra6_8A52_RTS
	LDA #$01
	STA ScreenShake
	STA FreezeFlag
	LDA #sfx_Thud
	STA SFXRegister
	LDA ObjectYPos,X
	AND #$F8
	STA ObjectYPos,X
	LDA #$00
	STA ObjActionTimer,X
	INC ObjectAction,X
bra6_8A52_RTS:
	RTS
tbl6_8A53:
	db $50
	db $50
	db $50
	db $50
	db $51
	db $51
	db $51
	db $51
	db $52
	db $52
	db $52
	db $52
	db $53
	db $53
	db $53
	db $55
ptr6_8A63:
	INC ObjActionTimer,X
	LDA ObjActionTimer,X
	CMP #$10
	BCC bra6_8A97_RTS
	CMP #$18
	BCS bra6_8A8C
	CMP #$14
	BNE bra6_8A97_RTS
	LDA #$00
	LDY ObjXScreenDistance,X
	BMI bra6_8A7E
	LDA #$40
bra6_8A7E:
	STA ObjectState,X
	LDA ObjectState,X
	AND #$40
	ORA #$16
	STA EnemyAnimFrame,X
	RTS
bra6_8A8C:
	LDA #$00
	STA FreezeFlag
	STA ObjectAction,X
	STA ObjActionTimer,X
bra6_8A97_RTS:
	RTS
ptr6_8A98:
	LDA #$02
	CMP ObjectVariables,X
	BCS bra6_8AAF
	LDA #$07
	STA ObjectAction,X
	LDA #$00
	STA ObjActionTimer,X
	LDA #$18
	STA EnemyAnimFrame,X
	RTS
bra6_8AAF:
	INC ObjActionTimer,X
	LDA ObjActionTimer,X
	CMP #$18
	BCS bra6_8ABD
	LDA #PlayerAnimationFrame
	BNE bra6_8AC3
bra6_8ABD:
	CMP #$20
	BCS bra6_8AC7
	LDA #$14
bra6_8AC3:
	STA EnemyAnimFrame,X
	RTS
bra6_8AC7:
	CMP #$28
	BCC bra6_8ADA_RTS
	LDA #$15
	STA EnemyAnimFrame,X
	LDA #$05
	STA ObjectAction,X
	LDA #$00
	STA ObjActionTimer,X
bra6_8ADA_RTS:
	RTS
ptr6_8ADB:
	LDA ObjActionTimer,X
	CMP #$30
	BCC bra6_8B13
	BNE bra6_8AEA
	LDA #$10
	STA SFXRegister
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
	STA EnemyAnimFrame,X
bra6_8B13:
	INC ObjActionTimer,X
	RTS
bra6_8B17:
	LDA #mus_Victory
	STA MusicRegister
	LDA #$09
	STA Event
	RTS
loc6_8B20:
	LDA ObjectYPos,X
	CMP #$20
	BCS bra6_8B2D
	LDA #$02
	STA ObjectAction,X
	RTS
bra6_8B2D:
	DEC ObjectYPos,X
	LDA ObjectVariables,X
	CMP #$02
	BNE bra6_8B3A
	DEC ObjectYPos,X
bra6_8B3A:
	LDY #$03
	LDA EnemyAnimFrame,X
	AND #$40
	JMP loc6_8B67
loc6_8B44:
	LDA ObjectYPos,X
	CMP #$80
	BCC bra6_8B51
	LDA #$00
	STA ObjectAction,X
	RTS
bra6_8B51:
	INC ObjectYPos,X
	LDA ObjectVariables,X
	CMP #$02
	BNE bra6_8B5E
	INC ObjectYPos,X
bra6_8B5E:
	LDY #$0B
	LDA EnemyAnimFrame,X
	AND #$C0
	ORA #$80
loc6_8B67:
	STA EnemyAnimFrame,X
	JMP loc6_8BBA
loc6_8B6D:
	LDA ObjectXPos,X
	CMP #$20
	BCS bra6_8B7A
	LDA #$01
	STA ObjectAction,X
	RTS
bra6_8B7A:
	DEC ObjectXPos,X
	LDA ObjectVariables,X
	CMP #$02
	BNE bra6_8B87
	DEC ObjectXPos,X
bra6_8B87:
	LDA EnemyAnimFrame,X
	ORA #$40
	JMP loc6_8BAE
loc6_8B8F:
	LDA ObjectXPos,X
	CMP #$C8
	BCC bra6_8B9C
	LDA #$03
	STA ObjectAction,X
	RTS
bra6_8B9C:
	INC ObjectXPos,X
	LDA ObjectVariables,X
	CMP #$02
	BNE bra6_8BA9
	INC ObjectXPos,X
bra6_8BA9:
	LDA EnemyAnimFrame,X
	AND #$80
loc6_8BAE:
	STA EnemyAnimFrame,X
	LDY #$01
	LDA ObjectAction,X
	BEQ bra6_8BBA
	LDY #$09
bra6_8BBA:
loc6_8BBA:
	LDA ObjFrameCounter
	AND #$04
	BEQ bra6_8BC2
	INY
bra6_8BC2:
	TYA
	ORA EnemyAnimFrame,X
	STA EnemyAnimFrame,X
	RTS
sub6_8BCA:
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
	BEQ bra6_8BEC
	CMP #$FF
	BEQ bra6_8BEC
	JMP Obj_RemoveObject ;unlogged
bra6_8BEC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8C2E
	LDA ObjYScreenDistance,X ;unlogged
	BPL bra6_8C1D ;unlogged
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc6_8C2E ;unlogged
bra6_8C1D:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra6_8C2E:
loc6_8C2E:
	LDA FreezeFlag
	BEQ bra6_8C34
	RTS
bra6_8C34:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_8C48,Y
	STA $32
	LDA tbl6_8C48+1,Y
	STA $33
	JMP ($32)
tbl6_8C48:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr6_8C52
	dw ptr_AD88
ptr6_8C52:
	LDA ObjectAction,X
	CMP #$04
	BCS bra6_8CA1_RTS
	JSR Obj_PlayerHitCheck
	LDA InvincibilityTimer
	CMP #$F7
	BCS bra6_8CA1_RTS
	LDA ObjectAction,X
	BEQ bra6_8C86
	CMP #$01
	BNE bra6_8C78
	LDA #$30
	STA PlayerXSpeed
	LDA PlayerMovement
	AND #$BE
	ORA #$04
	BNE bra6_8C9B
bra6_8C78:
	CMP #$03
	BNE bra6_8C86
	LDA #$30
	STA PlayerXSpeed
	LDA PlayerMovement
	ORA #$45
	BNE bra6_8C9B
bra6_8C86:
	LDA #sfx_Feather
	STA SFXRegister
	LDA #$06
	STA ObjectAction,X
	LDA #$00
	STA ObjActionTimer,X
	INC ObjectVariables,X
	LDA PlayerMovement
	ORA #$04
bra6_8C9B:
	STA PlayerMovement
	LDA #$30
	STA PlayerYSpeed
bra6_8CA1_RTS:
	RTS
ptr6_8CA2:
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA $32
	LDA tbl6_8D45+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_8CC2
	LDY #$C0 ;unlogged
bra6_8CC2:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA WorldNumber
	CMP #$04
	BEQ bra6_8CD7
	JSR jmp_54_A118
	RTS
bra6_8CD7:
	JSR sub_52_A2A8
	RTS
ptr6_8CDB:
	LDA WorldNumber
	CMP #$02
	BNE bra6_8D12
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA $32
	LDA tbl6_8D45+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_8D02
	LDY #$C0
bra6_8D02:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	ORA #$60
	STA $05F0
	JSR jmp_54_A118
	RTS
bra6_8D12:
	LDX $A4
	LDA EnemyAnimFrame,X
	SEC
	SBC #$1D
	AND #$3F
	ASL
	TAX
	LDA tbl6_8DB7,X
	STA $32
	LDA tbl6_8DB7+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_8D35
	LDY #$C0
bra6_8D35:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	ORA #$60
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl6_8D45:
	dw ofs_90CF
	dw ofs_90ED
	dw ofs_90FC
	dw ofs_9129
	dw ofs_9135
	dw ofs_9159 ;unlogged
	dw ofs_9168 ;unlogged
	dw ofs_9177 ;unlogged
	dw ofs_90DE ;unlogged
	dw ofs_910B
	dw ofs_911A
	dw ofs_9141
	dw ofs_914D
	dw ofs_9186 ;unlogged
	dw ofs_9195 ;unlogged
	dw ofs_91A4 ;unlogged
	dw ofs_91B3
	dw ofs_91C6
	dw ofs_91E2
	dw ofs_91F5
	dw ofs_9211
	dw ofs_9224
	dw ofs_9237
	dw ofs_9246
	dw ofs_925D
	dw ofs_9274
	dw ofs_928B
	dw ofs_92A2
	dw ofs_92B9
	dw ofs_8F4A
	dw ofs_8F5D
	dw ofs_8F70
	dw ofs_8F83
	dw ofs_8F96
	dw ofs_8FA9
	dw ofs_8FBC
	dw ofs_8FCF ;unlogged
	dw ofs_8FE2
	dw ofs_8FF5
	dw ofs_9008
	dw ofs_901B
	dw ofs_9032
	dw ofs_9049
	dw ofs_9058
	dw ofs_9067
	dw ofs_9076
	dw ofs_90CF ;unlogged
	dw ofs_90CF ;unlogged
	dw ofs_90CF ;unlogged
	dw ofs_90CF ;unlogged
	dw ofs_9089
	dw ofs_909C
	dw ofs_90AF
	dw ofs_90B6
	dw ofs_90BD
	dw ofs_90C4
	dw ofs_90CB
tbl6_8DB7:
	dw WendyLook1
	dw WendyLook2
	dw WendyStare
	dw WendySideLook
	dw WendyMouthOpen
	dw WendyWeirdFace1
	dw WendyWeirdFace2
	dw ofs_8E6A
	dw ofs_8E7D
	dw ofs_8E90
	dw ofs_8EA3
	dw ofs_8EB6
	dw ofs_8ECD
	dw ofs_8EE4
	dw ofs_8F02
	dw ofs_8F02
	dw ofs_8F11
	dw ofs_8F37 ;unlogged
	dw ofs_8F37 ;unlogged
	dw ofs_8F37 ;unlogged
	dw ofs_8F37 ;unlogged
	dw ofs_8F24
	dw ofs_8F37
WendyLook1:
	db $04 ;Tile Width
	db $04 ;Tile Height
	db $B8 ;1K CHR Bank
	db $FF, $FF, $FF, $FF
	db $FF, $0F, $10, $FF
	db $22, $26, $27, $25
	db $32, $36, $37, $35
WendyLook2:
	db $04
	db $04
	db $B8
	db $FF, $FF, $FF, $FF
	db $FF, $0D, $0E, $FF
	db $22, $23, $24, $25
	db $32, $33, $34, $35
WendyStare:
	db $04
	db $04
	db $B8
	db $01, $02, $03, $FF
	db $04, $05, $06, $FF
	db $11, $12, $13, $FF
	db $FF, $28, $29, $FF
WendySideLook:
	db $04
	db $04
	db $B8
	db $FF, $FF, $FF, $FF
	db $FF, $07, $08, $FF
	db $14, $15, $16, $FF
	db $FF, $28, $29, $FF
WendyMouthOpen:
	db $04
	db $04
	db $B8
	db $FF, $FF, $FF, $FF
	db $09, $0A, $FF, $FF
	db $17, $18, $19, $FF
	db $FF, $28, $29, $FF
WendyWeirdFace1:
	db $04
	db $04
	db $B9
	db $FF, $FF, $FF, $FF
	db $FF, $42, $43, $FF
	db $4E, $4F, $50, $51
	db $5C, $5D, $5E, $5F
WendyWeirdFace2:
	db $04
	db $04
	db $B9
	db $FF, $FF, $FF, $FF
	db $FF, $44, $45, $FF
	db $4E, $52, $53, $51
	db $5C, $60, $61, $5F
ofs_8E6A:
	db $04
	db $04
	db $B8
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $0B
	db $0C
	db $FF
	db $1A
	db $1B
	db $1C
	db $1D
	db $FF
	db $30
	db $31
	db $FF
ofs_8E7D:
	db $04
	db $04
	db $B9
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $6A
	db $6B
	db $6C
	db $6D
	db $75
	db $76
	db $77
	db $FF
ofs_8E90:
	db $04
	db $04
	db $B9
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $62
	db $63
	db $FF
	db $66
	db $67
	db $68
	db $69
	db $5C
	db $72
	db $73
	db $74
ofs_8EA3:
	db $04
	db $04
	db $B9
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $62
	db $63
	db $FF
	db $FF
	db $64
	db $65
	db $FF
	db $6E
	db $6F
	db $70
	db $71
ofs_8EB6:
	db $04
	db $05
	db $B9
	db $FF
	db $62
	db $63
	db $FF
	db $66
	db $67
	db $68
	db $69
	db $5C
	db $72
	db $73
	db $74
	db $FF
	db $78
	db $79
	db $FF
	db $7A
	db $7B
	db $7C
	db $7D
ofs_8ECD:
	db $04
	db $05
	db $B9
	db $FF
	db $62
	db $63
	db $FF
	db $FF
	db $64
	db $65
	db $FF
	db $6E
	db $6F
	db $70
	db $71
	db $FF
	db $78
	db $79
	db $FF
	db $7A
	db $7B
	db $7C
	db $7D
ofs_8EE4:
	db $04 ;wendy dummy mappings
	db $03
	db $B9
	db $FF, $FF, $FF, $FF
	db $4A, $4B, $4C, $4D
	db $58, $59, $5A, $5B
;Unused Wendy dummy frame
	db $04
	db $03
	db $B8
	db $FF, $FF, $FF, $FF
	db $38, $39, $3A, $3B
	db $3C, $3D, $3E, $3F
ofs_8F02:
	db $04
	db $03
	db $B9
	db $FF, $40, $41, $FF
	db $46, $47, $48, $49
	db $54, $55, $56, $57
ofs_8F11:
	db $04
	db $04
	db $B8
	db $FF, $FF, $FF, $FF
	db $FF, $0B, $0C, $FF
	db $1A, $1B, $1C, $1D
	db $FF, $2A, $2B, $FF
ofs_8F24:
	db $04
	db $04
	db $BA
	db $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF
	db $80, $81, $82, $83
	db $88, $89, $8A, $8B
ofs_8F37:
	db $04
	db $04
	db $BA
	db $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF
	db $84, $85, $86, $87
	db $FF, $8C, $8D, $FF
ofs_8F4A:
	db $04
	db $04
	db $B4
	db $FF, $FF, $FF, $FF
	db $FF, $03, $04, $FF
	db $0E, $0F, $10, $11
	db $1D, $1E, $1F, $20
ofs_8F5D:
	db $04
	db $04
	db $B4
	db $FF, $FF, $FF, $FF
	db $FF, $05, $06, $FF
	db $0E, $12, $13, $11
	db $1D, $21, $22, $20
ofs_8F70:
	db $04
	db $04
	db $B4
	db $FF
	db $01
	db $FF
	db $FF
	db $FF
	db $07
	db $08
	db $FF
	db $14
	db $15
	db $16
	db $FF
	db $FF
	db $23
	db $24
	db $FF
ofs_8F83:
	db $04
	db $04
	db $B4
	db $FF
	db $02
	db $FF
	db $FF
	db $FF
	db $09
	db $0A
	db $FF
	db $17
	db $18
	db $19
	db $FF
	db $FF
	db $25
	db $24
	db $FF
ofs_8F96:
	db $04
	db $04
	db $B4
	db $FF
	db $FF
	db $FF
	db $FF
	db $0B
	db $0C
	db $0D
	db $FF
	db $1A
	db $1B
	db $1C
	db $FF
	db $FF
	db $25
	db $24
	db $FF
ofs_8FA9:
	db $04
	db $04
	db $B4
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $26
	db $27
	db $FF
	db $2B
	db $2C
	db $2D
	db $2E
	db $35
	db $36
	db $37
	db $38
ofs_8FBC:
	db $04
	db $04
	db $B4
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $28
	db $29
	db $FF
	db $2B
	db $2F
	db $30
	db $2E
	db $35
	db $39
	db $3A
	db $38
ofs_8FCF:
	db $04
	db $04
	db $B4
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $28
	db $2A
	db $FF
	db $31
	db $32
	db $33
	db $34
	db $FF
	db $3B
	db $3C
	db $FF
ofs_8FE2:
	db $04
	db $04
	db $B5
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $48
	db $49
	db $4A
	db $4B
	db $FF
	db $54
	db $55
	db $FF
ofs_8FF5:
	db $04
	db $04
	db $B5
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $40
	db $41
	db $FF
	db $42
	db $43
	db $44
	db $45
	db $4C
	db $4D
	db $4E
	db $4F
ofs_9008:
	db $04
	db $04
	db $B5
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $40
	db $41
	db $FF
	db $FF
	db $46
	db $47
	db $FF
	db $50
	db $51
	db $52
	db $53
ofs_901B:
	db $04
	db $05
	db $B5
	db $FF
	db $40
	db $41
	db $FF
	db $42
	db $43
	db $44
	db $45
	db $4C
	db $4D
	db $4E
	db $4F
	db $56
	db $57
	db $58
	db $59
	db $5A
	db $5B
	db $5C
	db $5D
ofs_9032:
	db $04
	db $05
	db $B5
	db $FF
	db $40
	db $41
	db $FF
	db $FF
	db $46
	db $47
	db $FF
	db $50
	db $51
	db $52
	db $53
	db $56
	db $57
	db $58
	db $59
	db $5A
	db $5B
	db $5C
	db $5D
ofs_9049:
	db $04
	db $03
	db $B5
	db $FF
	db $5E
	db $5F
	db $FF
	db $64
	db $65
	db $66
	db $67
	db $73
	db $74
	db $75
	db $76
ofs_9058:
	db $04
	db $03
	db $B5
	db $FF
	db $FF
	db $FF
	db $FF
	db $68
	db $69
	db $6A
	db $FF
	db $77
	db $78
	db $79
	db $FF
ofs_9067:
	db $04
	db $03
	db $B5
	db $FF
	db $60
	db $61
	db $FF
	db $6B
	db $6C
	db $6D
	db $6E
	db $7A
	db $7B
	db $7C
	db $7D
ofs_9076:
	db $04
	db $04
	db $B5
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $62
	db $63
	db $FF
	db $6F
	db $70
	db $71
	db $72
	db $FF
	db $7E
	db $7F
	db $FF
ofs_9089:
	db $04
	db $04
	db $B7
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $BF
	db $C0
	db $C1
	db $C2
	db $FF
	db $C7
	db $C8
	db $FF
ofs_909C:
	db $04
	db $04
	db $B7
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $C3
	db $C4
	db $C5
	db $C6
	db $C9
	db $CA
	db $CB
	db $CC
ofs_90AF:
	db $02 ;diagonal podoboo mappings
	db $02
	db $A7
	db $2B
	db $2C
	db $36
	db $37
ofs_90B6:
	db $02
	db $02
	db $A7
	db $2D
	db $2E
	db $38
	db $39
ofs_90BD:
	db $02
	db $02
	db $A7
	db $36
	db $37
	db $2B
	db $2C
ofs_90C4:
	db $02
	db $02
	db $A7
	db $38
	db $39
	db $2D
	db $2E
ofs_90CB:
	db $01
	db $01
	db $A7
	db $FF
ofs_90CF:
	db $03 ;morton mappings (7 unused frames)
	db $04
	db $B0
	db $01
	db $FF
	db $FF
	db $09
	db $0A
	db $0B
	db $18
	db $19
	db $1A
	db $28
	db $29
	db $2A
ofs_90DE:
	db $03
	db $04
	db $B0
	db $28
	db $29
	db $2A
	db $18
	db $19
	db $1A
	db $09
	db $0A
	db $0B
	db $01
	db $FF
	db $FF
ofs_90ED:
	db $03
	db $04
	db $B0
	db $01
	db $FF
	db $FF
	db $09
	db $0A
	db $0B
	db $18
	db $19
	db $1A
	db $2B
	db $2C
	db $2D
ofs_90FC:
	db $03
	db $04
	db $B0
	db $01
	db $FF
	db $FF
	db $09
	db $0A
	db $0B
	db $18
	db $19
	db $1A
	db $2E
	db $2F
	db $30
ofs_910B:
	db $03
	db $04
	db $B0
	db $2B
	db $2C
	db $2D
	db $18
	db $19
	db $1A
	db $09
	db $0A
	db $0B
	db $01
	db $FF
	db $FF
ofs_911A:
	db $03
	db $04
	db $B0
	db $2E
	db $2F
	db $30
	db $18
	db $19
	db $1A
	db $09
	db $0A
	db $0B
	db $01
	db $FF
	db $FF
ofs_9129:
	db $03
	db $03
	db $B0
	db $0C
	db $0D
	db $0E
	db $1B
	db $1C
	db $1D
	db $31
	db $32
	db $33
ofs_9135:
	db $03
	db $03
	db $B0
	db $0C
	db $0D
	db $0E
	db $1E
	db $1C
	db $1D
	db $34
	db $32
	db $33
ofs_9141:
	db $03
	db $03
	db $B0
	db $31
	db $32
	db $33
	db $1B
	db $1C
	db $1D
	db $0C
	db $0D
	db $0E
ofs_914D:
	db $03
	db $03
	db $B0
	db $34
	db $32
	db $33
	db $1E
	db $1C
	db $1D
	db $0C
	db $0D
	db $0E
ofs_9159:
	db $03
	db $04
	db $B0
	db $FF
	db $02
	db $03
	db $0F
	db $10
	db $11
	db $1F
	db $20
	db $21
	db $35
	db $36
	db $37
ofs_9168:
	db $03
	db $04
	db $B0
	db $04
	db $05
	db $06
	db $12
	db $13
	db $14
	db $22
	db $23
	db $24
	db $38
	db $39
	db $3A
ofs_9177:
	db $03
	db $04
	db $B0
	db $07
	db $08
	db $FF
	db $15
	db $16
	db $17
	db $25
	db $26
	db $27
	db $3B
	db $3C
	db $3D
ofs_9186:
	db $03
	db $04
	db $B0
	db $35
	db $36
	db $37
	db $1F
	db $20
	db $21
	db $0F
	db $10
	db $11
	db $FF
	db $02
	db $03
ofs_9195:
	db $03
	db $04
	db $B0
	db $38
	db $39
	db $3A
	db $22
	db $23
	db $24
	db $12
	db $13
	db $14
	db $04
	db $05
	db $06
ofs_91A4:
	db $03
	db $04
	db $B0
	db $3B
	db $3C
	db $3D
	db $25
	db $26
	db $27
	db $15
	db $16
	db $17
	db $07
	db $08
	db $FF
ofs_91B3:
	db $04
	db $04
	db $B1
	db $45
	db $46
	db $47
	db $48
	db $55
	db $56
	db $57
	db $58
	db $67
	db $68
	db $69
	db $6A
	db $FF
	db $76
	db $77
	db $FF
ofs_91C6:
	db $05
	db $05
	db $B1
	db $FF
	db $40
	db $41
	db $FF
	db $FF
	db $49
	db $4A
	db $4B
	db $4C
	db $FF
	db $59
	db $5A
	db $5B
	db $5C
	db $5D
	db $6B
	db $6C
	db $6D
	db $6E
	db $FF
	db $FF
	db $79
	db $78
	db $FF
	db $FF
ofs_91E2:
	db $04
	db $04
	db $B1
	db $4D
	db $4E
	db $4F
	db $50
	db $5E
	db $5F
	db $60
	db $61
	db $6F
	db $70
	db $71
	db $72
	db $FF
	db $7A
	db $7B
	db $7C
ofs_91F5:
	db $05
	db $05
	db $B1
	db $FF
	db $42
	db $43
	db $44
	db $FF
	db $51
	db $52
	db $53
	db $54
	db $FF
	db $62
	db $63
	db $64
	db $65
	db $66
	db $FF
	db $73
	db $74
	db $75
	db $FF
	db $FF
	db $FF
	db $7D
	db $FF
	db $FF
ofs_9211:
	db $04
	db $04
	db $B2
	db $FF
	db $80
	db $81
	db $FF
	db $86
	db $87
	db $88
	db $89
	db $96
	db $97
	db $98
	db $99
	db $A6
	db $A7
	db $A8
	db $A9
ofs_9224:
	db $04
	db $04
	db $B2
	db $FF
	db $82
	db $83
	db $FF
	db $8A
	db $8B
	db $8C
	db $8D
	db $9A
	db $9B
	db $9C
	db $9D
	db $AA
	db $AB
	db $AC
	db $AD
ofs_9237:
	db $03
	db $04
	db $B2
	db $84
	db $85
	db $FF
	db $8E
	db $8F
	db $90
	db $9E
	db $9F
	db $A0
	db $AE
	db $AF
	db $B0
ofs_9246:
	db $05
	db $04
	db $B2
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $91
	db $92
	db $93
	db $94
	db $95
	db $A1
	db $A2
	db $A3
	db $A4
	db $A5
	db $B1
	db $B2
	db $B3
	db $B4
	db $B5
ofs_925D:
	db $05
	db $04
	db $B2
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $B6
	db $B7
	db $B8
	db $B9
	db $BA
	db $BB
	db $BC
	db $BD
	db $BE
	db $BF
ofs_9274:
	db $05
	db $04
	db $B3
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $C0
	db $C1
	db $FF
	db $FF
	db $FF
	db $C2
	db $C3
	db $FF
ofs_928B:
	db $05
	db $04
	db $B3
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $C5
	db $C6
	db $FF
	db $FF
	db $FF
	db $CB
	db $CC
	db $FF
ofs_92A2:
	db $05
	db $04
	db $B3
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $C7
	db $C8
	db $FF
	db $FF
	db $FF
	db $CD
	db $CE
	db $FF
ofs_92B9:
	db $05
	db $04
	db $B3
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $C9
	db $CA
	db $FF
	db $FF
	db $FF
	db $CF
	db $D0
	db $FF
sub6_92D0:
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
	BEQ bra6_92F2
	CMP #$FF
	BEQ bra6_92F2
	JMP Obj_RemoveObject
bra6_92F2:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_9334
	LDA ObjYScreenDistance,X
	BPL bra6_9323
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_9334
bra6_9323:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra6_9334:
loc6_9334:
	LDA FreezeFlag
	BEQ bra6_933A
	RTS ;unlogged
bra6_933A:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_934E,Y
	STA $32
	LDA tbl6_934E+1,Y
	STA $33
	JMP ($32)
tbl6_934E:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr6_9358
	dw ptr_AD88
ptr6_9358:
	LDA ReznorsDefeated
	BNE bra6_9363_RTS
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
bra6_9363_RTS:
	RTS
ptr6_9364:
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA $32
	LDA tbl6_8D45+1,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr6_9389:
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA $32
	LDA tbl6_8D45+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_93A9
	LDY #$C0
bra6_93A9:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
Obj_h72:
	LDX $A4
	JSR sub6_9BEA
	LDA ObjectSlot,X
	CMP #$72
	BNE bra6_93C8
	LDA ObjectVariables,X
	BMI bra6_93CB
bra6_93C8:
	JMP loc6_9488
bra6_93CB:
	LDA ObjectVariables,X
	AND #$7F
	STA ObjectVariables,X
bra6_93D3:
	JSR jmp_54_B785
	AND #$07
	ASL
	CMP $0668
	BEQ bra6_93D3
	STA $0668
	TAY
	LDA tbl6_95CD,Y
	STA EnemyAnimFrame,X
bra6_93E8:
	JSR jmp_54_B785
	AND #$07
	STA $32
	ASL
	CLC
	ADC $32
	CMP $0667
	BEQ bra6_93E8
	STA $0667
	TAY
	LDX tbl6_95DD,Y
	LDA tbl6_95F5,X
	LDX $A4
	STA ObjectXPos,X
	LDX tbl6_95DD,Y
	LDA tbl6_95FC,X
	LDX $A4
	STA ObjectYPos,X
	LDX tbl6_95DD+1,Y
	LDA tbl6_95F5,X
	LDX $A4
	STA ObjectXPos+1,X
	LDA #$0D
	STA ObjectXScreen+1,X
	LDX tbl6_95DD+1,Y
	LDA tbl6_95FC,X
	LDX $A4
	STA ObjectYPos+1,X
	LDA #$01
	STA ObjectYScreen+1,X
	LDA #$73
	STA ObjectSlot+1,X
	LDA #$2C
	STA EnemyAnimFrame+1,X
	LDX tbl6_95DD+2,Y
	LDA tbl6_95F5,X
	LDX $A4
	STA ObjectXPos+2,X
	LDA #$0D
	STA ObjectXScreen+2,X
	LDX tbl6_95DD+2,Y
	LDA tbl6_95FC,X
	LDX $A4
	STA ObjectYPos+2,X
	LDA #$01
	STA ObjectYScreen+2,X
	LDA #$75
	STA ObjectSlot+2,X
	LDA #$2C
	STA EnemyAnimFrame+2,X
	LDA #$00
	STA ObjectState,X
	STA ObjectState+1,X
	STA ObjectState+2,X
	STA ObjectAction,X
	STA ObjectAction+1,X
	STA ObjectAction+2,X
	STA ObjActionTimer,X
	STA $0642,X
	STA $0643,X
	INC ObjectCount
	INC ObjectCount
	RTS
loc6_9488:
	JSR sub6_9670
	LDA ObjectAction,X
	ASL
	TAY
	LDA tbl6_949D,Y
	STA $32
	LDA tbl6_949D+1,Y
	STA $33
	JMP ($32)
tbl6_949D:
	dw ptr6_94AB
	dw ptr6_94E9
	dw ptr6_9529
	dw ptr6_955B
	dw ptr6_958A
	dw ptr6_9603
	dw ptr6_9632
ptr6_94AB:
	LDA ObjFrameCounter
	AND #$03
	BNE bra6_94C1_RTS
	LDA ObjActionTimer,X
	CMP #$18
	BCC bra6_94C2
	LDA #$00
	STA ObjActionTimer,X
	INC ObjectAction,X
bra6_94C1_RTS:
	RTS
bra6_94C2:
	INC ObjActionTimer,X
	LDA ObjectSlot,X
	CMP #$72
	BEQ bra6_94E5
	SEC
	SBC #$72
	LSR
	CLC
	ADC $0667
	TAY
	INY
	LDA tbl6_95DD,Y
	TAY
	LDA tbl6_95FC,Y
	SEC
	SBC #$10
	CMP ObjectYPos,X
	BCS bra6_94C1_RTS
bra6_94E5:
	DEC ObjectYPos,X
	RTS
ptr6_94E9:
	LDA ObjFrameCounter
	AND #$03
	BNE bra6_94FF_RTS
	LDA ObjActionTimer,X
	CMP #$18
	BCC bra6_9500
	LDA #$00
	STA ObjActionTimer,X
	INC ObjectAction,X
bra6_94FF_RTS:
	RTS
bra6_9500:
	INC ObjActionTimer,X
	LDA ObjectSlot,X
	CMP #$72
	BEQ bra6_950E
	LDA #$2C
	BNE bra6_9525
bra6_950E:
	LDY $0668
	CPY #$06
	BCS bra6_951A
	LDA tbl6_95CE,Y
	BNE bra6_9525
bra6_951A:
	LDA ObjFrameCounter
	AND #$08
	BNE bra6_9522
	INY
bra6_9522:
	LDA tbl6_95CD,Y
bra6_9525:
	STA EnemyAnimFrame,X
	RTS
ptr6_9529:
	LDA ObjFrameCounter
	AND #$03
	BNE bra6_953F_RTS
	LDA ObjActionTimer,X
	CMP #$1C
	BCC bra6_9540
	LDA #$00
	STA ObjActionTimer,X
	INC ObjectAction,X
bra6_953F_RTS:
	RTS
bra6_9540:
	INC ObjActionTimer,X
	INC ObjectYPos,X
	LDA ObjectSlot,X
	CMP #$72
	BEQ bra6_9551
	LDA #$2C
	BNE bra6_9557
bra6_9551:
	LDY $0668
	LDA tbl6_95CD,Y
bra6_9557:
	STA EnemyAnimFrame,X
	RTS
ptr6_955B:
	LDA ObjFrameCounter
	AND #$03
	BNE bra6_9585_RTS
	LDA ObjActionTimer,X
	CMP #$18
	BCC bra6_9586
	LDA #$00
	STA ObjActionTimer,X
	STA ObjectAction,X
	LDA ObjectVariables,X
	ORA #$80
	STA ObjectVariables,X
	LDA ObjectSlot,X
	CMP #$72
	BEQ bra6_9585_RTS
	LDA #$00
	STA ObjectSlot,X
bra6_9585_RTS:
	RTS
bra6_9586:
	INC ObjActionTimer,X
	RTS
ptr6_958A:
	LDA ObjActionTimer,X
	CMP #$30
	BCC bra6_95A6
	LDA #$00
	STA ObjActionTimer,X
	LDY #$02
	LDA ObjectSlot,X
	CMP #$72
	BNE bra6_95A1
	LDY #$06
bra6_95A1:
	TYA
	STA ObjectAction,X
	RTS
bra6_95A6:
	INC ObjActionTimer,X
	LDA ObjFrameCounter
	AND #$18
	LSR
	LSR
	LSR
	TAY
	LDA ObjectSlot,X
	CMP #$72
	BNE bra6_95BE
	LDA tbl6_95C5,Y
	BNE bra6_95C1
bra6_95BE:
	LDA tbl6_95C9,Y
bra6_95C1:
	STA EnemyAnimFrame,X
	RTS
tbl6_95C5:
	db $25
	db $26
	db $27
	db $26
tbl6_95C9:
	db $2A
	db $2B
	db $2A
	db $2B
tbl6_95CD:
	db $20
tbl6_95CE:
	db $21
	db $20
	db $1F
	db $20
	db $1F
	db $1D
	db $1E
	db $22
	db $23
	db $22
	db $24
	db $27
	db $2D
	db $32
	db $33
tbl6_95DD:
	db $02
	db $04
	db $06
	db $01
	db $03
	db $04
	db $06
	db $01
	db $03
	db $00
	db $02
	db $04
	db $05
	db $00
	db $02
	db $04
	db $01
	db $06
	db $06
	db $01
	db $03
	db $02
	db $04
	db $06
tbl6_95F5:
	db $10
	db $30
	db $50
	db $70
	db $90
	db $B0
	db $D0
tbl6_95FC:
	db $68
	db $78
	db $78
	db $68
	db $58
	db $68
	db $78
ptr6_9603:
	LDA ObjectYPos,X
	CMP #$E0
	BCS bra6_9611
	LDA ObjActionTimer,X
	CMP #$50
	BCC bra6_961A
bra6_9611:
	LDA #$23
	STA MusicRegister
	LDA #$09
	STA Event
	RTS
bra6_961A:
	LDY #$28
	LDA ObjFrameCounter
	AND #$04
	BNE bra6_9624
	INY
bra6_9624:
	TYA
	STA EnemyAnimFrame,X
	INC ObjActionTimer,X
	INC ObjectYPos,X
	INC ObjectYPos,X
	RTS
ptr6_9632:
	LDA ObjFrameCounter
	AND #$03
	BNE bra6_964A_RTS
	LDA ObjActionTimer,X
	CMP #$1C
	BCC bra6_964B
	LDA #$00
	STA ObjActionTimer,X
	LDA #$03
	STA ObjectAction,X
bra6_964A_RTS:
	RTS
bra6_964B:
	INC ObjActionTimer,X
	LDY $0667
	LDA tbl6_95DD,Y
	TAY
	LDA tbl6_95FC,Y
	CLC
	ADC #$04
	CMP ObjectYPos,X
	BCC bra6_9666
	INC ObjectYPos,X
	INC ObjectYPos,X
bra6_9666:
	LDY $0668
	LDA tbl6_95CD,Y
	STA EnemyAnimFrame,X
	RTS
sub6_9670:
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
	BEQ bra6_9692
	CMP #$FF
	BEQ bra6_9692
	JMP Obj_RemoveObject ;unlogged
bra6_9692:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_96D4
	LDA ObjYScreenDistance,X ;unlogged
	BPL bra6_96C3 ;unlogged
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc6_96D4 ;unlogged
bra6_96C3:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra6_96D4:
loc6_96D4:
	LDA FreezeFlag
	BEQ bra6_96DA
	RTS ;unlogged
bra6_96DA:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_96EE,Y
	STA $32
	LDA tbl6_96EE+1,Y
	STA $33
	JMP ($32)
tbl6_96EE:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr6_96F8
	dw ptr_AD88
ptr6_96F8:
	LDA ObjectAction,X
	CMP #$02
	BCC bra6_9700
bra6_96FF_RTS:
	RTS
bra6_9700:
	LDA PlayerXPosDup
	CMP #$28
	BCC bra6_9732
	CMP #$38
	BCC bra6_96FF_RTS
	CMP #$48
	BCC bra6_9732
	CMP #$58
	BCC bra6_96FF_RTS
	CMP #$68
	BCC bra6_9732
	CMP #$78
	BCC bra6_96FF_RTS
	CMP #$88
	BCC bra6_9732
	CMP #$98
	BCC bra6_96FF_RTS
	CMP #$A8
	BCC bra6_9732
	CMP #$B8
	BCC bra6_96FF_RTS
	CMP #$C8
	BCC bra6_9732
	CMP #$D8
	BCC bra6_96FF_RTS
bra6_9732:
	LDA ObjectSlot,X
	SEC
	SBC #$72
	BNE bra6_9740
	LDY $0667
	JMP loc6_9747
bra6_9740:
	LSR
	CLC
	ADC $0667
	TAY
	INY
loc6_9747:
	LDA tbl6_95DD,Y
	TAY
	LDA tbl6_95FC,Y
	SEC
	SBC #$0C
	CMP ObjectYPos,X
	BCC bra6_97A3_RTS
	JSR Obj_PlayerHitCheck
	LDA PlayerMovement
	AND #$04
	BNE bra6_9763
	LDA PlayerYSpeed
	BNE bra6_9767
bra6_9763:
	JSR jmp_54_BF74
	RTS
bra6_9767:
	LDA InvincibilityTimer
	CMP #$F7
	BCS bra6_97A3_RTS ;If the invincibility timer is above this, stop
	LDA #$30
	STA PlayerYSpeed ;Give player vertical height when hitting them
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Make player move upwards
	LDA #$04
	STA PlayerAction ;Make player jump off
	LDA #sfx_Feather
	STA SFXRegister ;Play feather/hit sound
	LDY #$04 ;Load "hit" action into Y register
	LDA ObjectSlot,X
	CMP #$72
	BNE bra6_979A
	INC ObjectVariables,X ;Add to hit count
	LDA ObjectVariables,X
	AND #%01111111 ;Mask out bit 7
	CMP #$03
	BCC bra6_979A ;If Lemmy/Wendy hasn't been hit 3 times, branch
	LDY #$05 ;If they have, load "defeat" action into Y register
	STY ReznorsDefeated ;Also store here (why??)
bra6_979A:
	TYA
	STA ObjectAction,X ;Trigger loaded action
	LDA #$00
	STA ObjActionTimer,X ;Clear action timer
bra6_97A3_RTS:
	RTS
Obj_h64:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra6_97AE
	JMP loc6_9831
bra6_97AE:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X ;Subtract the object's X position by the player's to get its distance from it
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X ;Calculate object's horizontal screen distance from the player
	STA $28
	BEQ bra6_97CA
	CMP #$FF
	BEQ bra6_97CA
	JMP Obj_RemoveObject ;unlogged
bra6_97CA:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X ;Subtract the object's Y position by the player's to get its distance from them
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X ;Do the same for the object's Y screen
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_980C ;If the player and the object are on the same vertical screen, branch
	LDA ObjYScreenDistance,X
	BPL bra6_97FB ;Branch if the vertical screen difference is lower than 80h
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X ;Add to the object's distance
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X ;Add (nothing?) to the object's distance
	JMP loc6_980C
bra6_97FB:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X ;Subtract from the object's distance
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X ;Subtract (nothing?) from the object's distance
bra6_980C:
loc6_980C:
	LDA FreezeFlag
	BEQ bra6_9812 ;Branch if the game currently isn't frozen
	RTS
bra6_9812:
	LDA ObjectSlot,X
	CMP #$71
	BNE bra6_981E ;If a diagonal podoboo isn't in the object slot, branch
	LDA #$A7
	STA SpriteBank2 ;Swap 1K CHR bank into second bank slot
bra6_981E:
	LDA #$00
	STA ObjectVariables,X ;Clear any variables for the object
	LDY #$80 ;Load down-right direction
	LDA ObjXScreenDistance,X
	BMI bra6_982C ;Branch if the player is a screen or more ahead of it
	LDY #$C0 ;If the player isn't, load down-left direction
bra6_982C:
	TYA
	STA ObjectAction,X ;Store loaded direction
	RTS
loc6_9831:
	JSR sub6_92D0
	JSR sub6_9981
	BEQ bra6_9845
	CMP #$02
	BEQ bra6_9845
	LDA ObjectAction,X
	EOR #$40
	STA ObjectAction,X ;Horizontally flip the podoboo
bra6_9845:
	JSR sub6_9997
	BEQ bra6_9856
	CMP #$02
	BEQ bra6_9856
	LDA ObjectAction,X
	EOR #$80
	STA ObjectAction,X ;Vertically flip the podoboo
bra6_9856:
	LDA ObjectAction,X
	AND #$40 ;Get the horizontal direction of the podoboo
	BEQ bra6_9860 ;If it's facing right, branch
	JMP loc6_98EB ;If it's facing left, jump
bra6_9860:
	LDA #$01 ;Load speed value of 1
	PHA ;Store the value in the stack
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X ;Add that speed value to the object's X position	
	PLA ;Load the previously stored speed value
	BMI bra6_9874 ;Branch if it's over 80h/negative
	LDA ObjectXScreen,X
	ADC #$00 ;Add (nothing?) to it's X screen value
	BPL bra6_9879 ;Branch if it's less than 80h/positive
bra6_9874:
	LDA ObjectXScreen,X
	SBC #$00 ;Subtract (nothing?) from it's X screen value
bra6_9879:
	STA ObjectXScreen,X
	LDA ObjectAction,X
	AND #$80 ;Get the vertical diagonal of the podoboo
	BNE bra6_98B7 ;If facing up, branch
	LDA #$FF
	BMI bra6_98A0 ;If facing down, load speed value of -1 and branch
	CLC ;unused
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_9894
	CMP #$F0
	BCC bra6_98B2
bra6_9894: ;unused
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP bra6_98B2
bra6_98A0:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X ;Add loaded speed value to it's Y position
	BCS bra6_98B2
	SEC
	SBC #$10
	STA ObjectYPos,X ;Move the podoboo down 16 units
	DEC ObjectYScreen,X ;Move it to the lower horizontal screen
bra6_98B2:
	LDY #$34 ;Load animation frame 34h
	JMP loc6_9972 ;Jump
bra6_98B7:
	LDA #$01
	BMI bra6_98D4
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_98C8
	CMP #$F0
	BCC bra6_98E6
bra6_98C8:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc6_98E6
bra6_98D4:
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	BCS bra6_98E6 ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	DEC ObjectYScreen,X ;unlogged
bra6_98E6:
loc6_98E6:
	LDY #$B6
	JMP loc6_9972
loc6_98EB:
	LDA #$FF
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra6_98FF
	LDA ObjectXScreen,X ;unlogged
	ADC #$00 ;unlogged
	BPL bra6_9904 ;unlogged
bra6_98FF:
	LDA ObjectXScreen,X
	SBC #$00
bra6_9904:
	STA ObjectXScreen,X
	LDA ObjectAction,X
	AND #$80
	BNE bra6_9941
	LDA #$FF
	BMI bra6_992B
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	BCS bra6_991F ;unlogged
	CMP #$F0 ;unlogged
	BCC bra6_993D ;unlogged
bra6_991F:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	INC ObjectYScreen,X ;unlogged
	JMP bra6_993D ;unlogged
bra6_992B:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_993D
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra6_993D:
	LDY #$74
	BNE bra6_9972
bra6_9941:
	LDA #$01
	BMI bra6_995E
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_9952
	CMP #$F0
	BCC bra6_9970
bra6_9952:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc6_9970
bra6_995E:
	CLC ;unlogged routine
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_9970
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra6_9970:
loc6_9970:
	LDY #$F6
bra6_9972:
loc6_9972:
	LDA ObjFrameCounter
	AND #$04 ;Set frequency to 4 frames using a bitmask
	BEQ bra6_997A ;If the bits are masked out, use the 1st sprite and branch
	INY ;Otherwise, continue and go to the 2nd podoboo sprite
bra6_997A:
	TYA
	STA EnemyAnimFrame,X ;Store loaded podoboo sprite
	JMP loc6_9BEA ;Jump
sub6_9981:
	STY $2B
	LDA ObjectAction,X
	AND #$40
	BEQ bra6_998E
	LDA #$00
	BEQ bra6_9990
bra6_998E:
	LDA #$10
bra6_9990:
	STA $36
	LDA #$08
	JMP loc3_B08D
sub6_9997:
	STY $2B
	LDA #$08
	STA $36
	LDA ObjectAction,X
	AND #$80
	BEQ bra6_99A6
	LDA #$10
bra6_99A6:
	JMP loc3_B08D
ptr6_99A9:
	JSR sub6_99EF
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_99D7,X
	STA $32
	LDA tbl6_99D8,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_99CC
	LDY #$C0
bra6_99CC:
	STY $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl6_99D7:
	db $DD
tbl6_99D8:
	db $99
	db $E4
	db $99
	db $EB
	db $99
	db $02
	db $02
	db $97
	db $0D
	db $0E
	db $11
	db $12
	db $02
	db $02
	db $97
	db $0F
	db $10
	db $13
	db $14
	db $01
	db $01
	db $97
	db $FF
sub6_99EF:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra6_99FF_RTS
	LDA #$02
	STA $2D
	JSR sub2_A5D0
	PLA
	PLA
bra6_99FF_RTS:
	RTS
Obj_h6C:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra6_9A1E
	CMP #$FF
	BEQ bra6_9A1E
	JMP Obj_RemoveObject
bra6_9A1E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_9A60
	LDA ObjYScreenDistance,X
	BPL bra6_9A4F
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_9A60
bra6_9A4F:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra6_9A60:
loc6_9A60:
	LDA $06DF
	BEQ bra6_9A6C
	LDA #$02
	STA ObjectAction,X
	BNE bra6_9A6F
bra6_9A6C:
	JSR jmp_54_BD3D
bra6_9A6F:
	LDA ObjectAction,X
	ASL
	TAY
	LDA tbl6_9A81,Y
	STA $32
	LDA tbl6_9A81+1,Y
	STA $33
	JMP ($32)
tbl6_9A81:
	dw ptr6_9A87
	dw ptr6_9ADF
	dw ptr6_9B7B
ptr6_9A87:
	LDA #$FF
	BMI bra6_9AA4
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	BCS bra6_9A98 ;unlogged
	CMP #$F0 ;unlogged
	BCC bra6_9AB6 ;unlogged
bra6_9A98:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	INC ObjectYScreen,X ;unlogged
	JMP bra6_9AB6 ;unlogged
bra6_9AA4:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_9AB6
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	DEC ObjectYScreen,X ;unlogged
bra6_9AB6:
	LDA #$01
	STA FreezeFlag
	LDY #$00
	LDA FrameCount
	AND #$08
	BNE bra6_9AC4
	INY
bra6_9AC4:
	TYA
	STA EnemyAnimFrame,X
	INC ObjActionTimer,X
	LDA ObjActionTimer,X
	CMP #$10
	BCC bra6_9ADE_RTS
	LDA ObjectYPos,X
	CLC
	ADC #$12
	STA $06DE
	INC ObjectAction,X
bra6_9ADE_RTS:
	RTS
ptr6_9ADF:
	LDA #$FF
	BMI bra6_9AFC
	CLC ;unlogged start
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_9AF0
	CMP #$F0
	BCC bra6_9B0E
bra6_9AF0:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP bra6_9B0E ;unlogged end
bra6_9AFC:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_9B0E
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra6_9B0E:
	LDA #$08
	STA $36
	LDA #$10
	JSR sub3_B7A2
	BEQ bra6_9B28
	LDA #$00
	STA FreezeFlag
	INC ObjectAction,X
	LDA ObjectYPos,X
	STA $06DF
	RTS
bra6_9B28:
	LDY #$00
	LDA FrameCount
	AND #$08
	BNE bra6_9B31
	INY
bra6_9B31:
	TYA
	STA EnemyAnimFrame,X
	LDA ObjectXPos,X
	STA $65
	LDA ObjectXScreen,X
	STA PlayerColXScreen
	LDA ObjectYPos,X
	STA $67
	LDA ObjectYScreen,X
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
	LDA WorldNumber
	CMP #$01
	BNE bra6_9B75
	LDA LevelNumber
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
	STA EnemyAnimFrame,X
	LDA Player1YoshiStatus
	BNE bra6_9BD6_RTS
	LDA PlayerHoldFlag
	BNE bra6_9BD6_RTS
	LDA ObjXScreenDistance,X
	BPL bra6_9B99
	LDA #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra6_9BA0
	BCC bra6_9BD7
bra6_9B99:
	LDA ObjectXDistance,X
	CMP #$00
	BCS bra6_9BD7
bra6_9BA0:
	LDA PlayerYScreenDup
	BEQ bra6_9BAD
	LDA PlayerYPosDup
	CMP $06DE
	BCS bra6_9BD7
	BCC bra6_9BB4
bra6_9BAD:
	LDA PlayerYPosDup
	CMP $06DF
	BCC bra6_9BD7
bra6_9BB4:
	LDA $1E
	CMP #$0D
	BEQ bra6_9BD6_RTS
	CMP #$0E
	BEQ bra6_9BD6_RTS
	LDA ButtonsHeld
	AND #$08
	BEQ bra6_9BD6_RTS
	LDA #$00
	STA PlayerYSpeed
	STA PlayerXSpeed
	LDA #$03
	STA PlayerState
	STA $06DC
	LDA #$0D
	STA PlayerAction
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
	STA PlayerState
	LDA #$0A
	STA PlayerAction
bra6_9BE9_RTS:
	RTS
sub6_9BEA:
loc6_9BEA:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra6_9C06
	CMP #$FF
	BEQ bra6_9C06
	JMP Obj_RemoveObject
bra6_9C06:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_9C48
	LDA ObjYScreenDistance,X
	BPL bra6_9C37
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc6_9C48
bra6_9C37:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra6_9C48:
loc6_9C48:
	LDA FreezeFlag
	BEQ bra6_9C4E_RTS
	RTS ;unlogged
bra6_9C4E_RTS:
	RTS
sub6_9C4F:
	LDA $5B
	STA $25
	LDA $65
	SEC
	SBC $52
	STA $28
	LDA $67
	SEC
	SBC $54
	TAX
	LDA $66
	CMP $53
	BEQ bra6_9C6C
	LDA $5B
	EOR #$02
	STA $25
bra6_9C6C:
	STX $2B
	LDA $02
	CLC
	ADC $28
	AND #$F0
	STA $28
	LDA $03
	CLC
	ADC $2B
	AND #$F0
	STA $2B
	LDX $28
	LDY $2B
	LDA tbl6_9CAD,X
	ORA tbl6_9DAD,Y
	LDX $03FE
	STA $03E6,X
	LDA tbl6_9EAD,Y
	LDY $25
	BEQ bra6_9C99
	ORA #$08
bra6_9C99:
	STA $03E5,X
	LDA PlayerBackColl
	STA $03E4,X
	INX
	INX
	INX
	STX $03FE
	LDA #$00
	STA $03E4,X
	RTS
tbl6_9CAD:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $06
	db $06
	db $06
	db $06
	db $06
	db $06
	db $06
	db $06
	db $07
	db $07
	db $07
	db $07
	db $07
	db $07
	db $07
	db $07
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $0A
	db $0A
	db $0A
	db $0A
	db $0A
	db $0A
	db $0A
	db $0A
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $13
	db $13
	db $13
	db $13
	db $13
	db $13
	db $13
	db $13
	db $14
	db $14
	db $14
	db $14
	db $14
	db $14
	db $14
	db $14
	db $15
	db $15
	db $15
	db $15
	db $15
	db $15
	db $15
	db $15
	db $16
	db $16
	db $16
	db $16
	db $16
	db $16
	db $16
	db $16
	db $17
	db $17
	db $17
	db $17
	db $17
	db $17
	db $17
	db $17
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $19
	db $19
	db $19
	db $19
	db $19
	db $19
	db $19
	db $19
	db $1A
	db $1A
	db $1A
	db $1A
	db $1A
	db $1A
	db $1A
	db $1A
	db $1B
	db $1B
	db $1B
	db $1B
	db $1B
	db $1B
	db $1B
	db $1B
	db $1C
	db $1C
	db $1C
	db $1C
	db $1C
	db $1C
	db $1C
	db $1C
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1E
	db $1E
	db $1E
	db $1E
	db $1E
	db $1E
	db $1E
	db $1E
	db $1F
	db $1F
	db $1F
	db $1F
	db $1F
	db $1F
	db $1F
	db $1F
tbl6_9DAD:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $60
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $80
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $C0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
	db $E0
tbl6_9EAD:
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $22
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
