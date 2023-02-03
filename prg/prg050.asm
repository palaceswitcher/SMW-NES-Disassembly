;disassembled by BZK 6502 Disassembler
obj_h88:
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
	JMP loc3_A6B5
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
	LDA $062B
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
	JMP loc3_A6B5
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
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr6_8124
	.word ptr_AD88
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
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	LDA #$10
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$10
	STA PlayerXSpeed
	LDA #$01
	JSR sub3_BCD4
	LDA #sfxEnemyHit2
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
	LDA NinjiMappings,X
	STA $32
	LDA NinjiMappings+1,X
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
NinjiMappings:
	.word NinjiStand
	.word NinjiJump
NinjiStand:
	.byte $02 ;Tile Width
	.byte $02 ;Tile Height
	.byte $A6 ;1K CHR Bank
	.byte $22, $23
	.byte $24, $25
NinjiJump:
	.byte $02 ;Tile Width
	.byte $02 ;Tile Height
	.byte $A6 ;1K CHR Bank
	.byte $26, $27
	.byte $28, $29
obj_h84:
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
	JMP loc3_A6B5
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
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr6_8250
	.word ptr_AD88
ptr6_8250:
	JSR sub6_825A
	JSR jmp_54_BEBC
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
	.word ptr6_827A
	.word ptr6_82A8
	.word ptr6_82EA
	.word ptr6_834C
	.word ptr6_8366
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
	LDA #sfxThud
	STA SFXRegister
bra6_8348:
	INC ObjectVariables,X
bra6_834B_RTS:
	RTS
ptr6_834C:
	LDA $062B
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
	LDA ThwompMappings,X
	STA $32
	LDA ThwompMappings+1,X
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
ThwompMappings:
	.word ThwompIdle
	.word ThwompStare
	.word ThwompAngry
	.word ThwompAngry
	.word ThwompAngry
ThwompIdle:
	.byte $03 ;Tile Width
	.byte $04 ;Tile Height
	.byte $AB ;1K CHR Bank
	.byte $21, $22, $23
	.byte $24, $25, $26
	.byte $2C, $2D, $2E
	.byte $35, $36, $37
ThwompStare:
	.byte $03 ;Tile Width
	.byte $04 ;Tile Height
	.byte $AB ;1K CHR Bank
	.byte $21, $22, $23
	.byte $2A, $2B, $26
	.byte $32, $33, $34
	.byte $35, $36, $37
ThwompAngry:
	.byte $03 ;Tile Width
	.byte $04 ;Tile Height
	.byte $AB ;1K CHR Bank
	.byte $21, $22, $23
	.byte $27, $28, $29
	.byte $2F, $30, $31
	.byte $35, $36, $37
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
	JMP loc3_A6B5
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
	LDA $062B
	AND #$03
	BNE bra6_849D
	INC ObjectVariables,X
	LDA ObjectVariables,X
	AND #$1F
	STA ObjectVariables,X
bra6_849D:
	LDA $062B
	AND #$01
	BNE bra6_84A7
	JSR jmp_54_BBC3
bra6_84A7:
	JSR jmp_54_BEBC
	JSR jmp_54_BF74
	RTS
obj_h90:
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
	JMP loc3_A6B5
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
	LDA $062B
	AND #$01
	BNE bra6_8533
	INC ObjectVariables,X
	LDA ObjectVariables,X
	AND #$1F
	STA ObjectVariables,X
bra6_8533:
	LDA $062B
	AND #$01
	BNE bra6_853D
	JSR jmp_54_BBC3
bra6_853D:
	JSR jmp_54_BEBC
	JSR jmp_54_BF74
	RTS
ptr7_8544:
	LDY #$00
	LDX $A4
	LDA $062B
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
	.word Unknown1 ;Unused (Fuzzy)
	.word Unknown2 ;Unused (Fuzzy)
Unknown1:
	.byte $03
	.byte $02
	.byte $A4
	.byte $01
	.byte $02
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $0D
Unknown2:
	.byte $03
	.byte $02
	.byte $A4
	.byte $03
	.byte $04
	.byte $FF
	.byte $0E
	.byte $0C
	.byte $0F
obj_h86:
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
	JMP loc3_A6B5
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
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr6_860C
ptr6_860C:
	JSR sub6_8616
	JSR jmp_54_BEBC
	JSR jmp_54_BF74
	RTS
sub6_8616:
	LDX $A4
	LDA ObjectVariables,X
	STA P1Score
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
obj_h92:
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
	JMP loc3_A6B5
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
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr6_8755
ptr6_8755:
	JSR sub6_875F
	JSR jmp_54_BEBC
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
	.word ptr6_87DC
	.word ptr6_8780
	.word ptr6_87DC
	.word ptr6_87AD
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
	LDA $062B
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
	LDA $062B
	AND #$10
	BEQ bra6_880A
	INY
bra6_880A:
	TYA
	ASL
	TAX
	LDA UrchinMappings,X
	STA $32
	LDA UrchinMappings+1,X
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
UrchinMappings:
	.word UrchinOpen
	.word UrchinClose
UrchinOpen:
	.byte $04 ;Tile Width
	.byte $04 ;Tile Height
	.byte $A8 ;1K CHR Bank
	.byte $09, $0A, $0B, $0C
	.byte $0D, $0E, $0F, $10
	.byte $13, $14, $15, $16
	.byte $19, $1A, $1B, $1C
UrchinClose:
	.byte $04 ;Tile Width
	.byte $04 ;Tile Height
	.byte $A8 ;1K CHR Bank
	.byte $09, $0A, $0B, $0C
	.byte $0D, $11, $12, $10
	.byte $13, $17, $18, $16
	.byte $19, $1A, $1B, $1C
	.byte $00 ;unlogged data start
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $00
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
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01 ;unlogged data end
tbl6_88D9:
	.word ofs_88E5
	.word ofs_88DF ;unlogged data start
	.word ofs_88E2
ofs_88DF:
	.byte $03
	.byte $00
	.byte $80
ofs_88E2:
	.byte $00
	.byte $01
	.byte $80
ofs_88E5:
	.byte $00
	.byte $00	
	.byte $00 ;unlogged data end
	.byte $00
	.byte $00
	.byte $FA
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $03
	.byte $00
	.byte $04
	.byte $00
	.byte $06
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00 ;unlogged
	.byte $00
	.byte $F8
	.byte $00
	.byte $FA
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $03
	.byte $00
	.byte $04
	.byte $00
	.byte $06
	.byte $00
	.byte $08
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00 ;unlogged
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $F9
	.byte $00
	.byte $FB
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $03
	.byte $00
	.byte $05
	.byte $00
	.byte $07
	.byte $00
	.byte $08
	.byte $00
	.byte $08
	.byte $00
	.byte $00 ;unlogged
	.byte $00
	.byte $F6
	.byte $00
	.byte $F7
	.byte $00
	.byte $F8
	.byte $00
	.byte $F9
	.byte $00
	.byte $FA
	.byte $00
	.byte $FB
	.byte $00
	.byte $FE
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $05
	.byte $00
	.byte $06
	.byte $00
	.byte $07
	.byte $00
	.byte $08
	.byte $00
	.byte $09
	.byte $00
	.byte $0A
	.byte $80
obj_h70:
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
	.word ptr6_899D
	.word ptr6_89AD
	.word ptr6_89C4
	.word ptr6_89F7
	.word ptr6_8A0C
	.word ptr6_8A63
	.word ptr6_8A98
	.word ptr6_8ADB
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
	LDA $062B
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
	LDA #$0F
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
	LDA #musVictory
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
	LDA $062B
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
	JMP loc3_A6B5 ;unlogged
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
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr6_8C52
	.word ptr_AD88
ptr6_8C52:
	LDA ObjectAction,X
	CMP #$04
	BCS bra6_8CA1_RTS
	JSR jmp_54_BEBC
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
	LDA #sfxFeather
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
	.word ofs_90CF
	.word ofs_90ED
	.word ofs_90FC
	.word ofs_9129
	.word ofs_9135
	.word ofs_9159 ;unlogged
	.word ofs_9168 ;unlogged
	.word ofs_9177 ;unlogged
	.word ofs_90DE ;unlogged
	.word ofs_910B
	.word ofs_911A
	.word ofs_9141
	.word ofs_914D
	.word ofs_9186 ;unlogged
	.word ofs_9195 ;unlogged
	.word ofs_91A4 ;unlogged
	.word ofs_91B3
	.word ofs_91C6
	.word ofs_91E2
	.word ofs_91F5
	.word ofs_9211
	.word ofs_9224
	.word ofs_9237
	.word ofs_9246
	.word ofs_925D
	.word ofs_9274
	.word ofs_928B
	.word ofs_92A2
	.word ofs_92B9
	.word ofs_8F4A
	.word ofs_8F5D
	.word ofs_8F70
	.word ofs_8F83
	.word ofs_8F96
	.word ofs_8FA9
	.word ofs_8FBC
	.word ofs_8FCF ;unlogged
	.word ofs_8FE2
	.word ofs_8FF5
	.word ofs_9008
	.word ofs_901B
	.word ofs_9032
	.word ofs_9049
	.word ofs_9058
	.word ofs_9067
	.word ofs_9076
	.word ofs_90CF ;unlogged
	.word ofs_90CF ;unlogged
	.word ofs_90CF ;unlogged
	.word ofs_90CF ;unlogged
	.word ofs_9089
	.word ofs_909C
	.word ofs_90AF
	.word ofs_90B6
	.word ofs_90BD
	.word ofs_90C4
	.word ofs_90CB
tbl6_8DB7:
	.word WendyLook1
	.word WendyLook2
	.word WendyStare
	.word WendySideLook
	.word WendyMouthOpen
	.word WendyWeirdFace1
	.word WendyWeirdFace2
	.word ofs_8E6A
	.word ofs_8E7D
	.word ofs_8E90
	.word ofs_8EA3
	.word ofs_8EB6
	.word ofs_8ECD
	.word ofs_8EE4
	.word ofs_8F02
	.word ofs_8F02
	.word ofs_8F11
	.word ofs_8F37 ;unlogged
	.word ofs_8F37 ;unlogged
	.word ofs_8F37 ;unlogged
	.word ofs_8F37 ;unlogged
	.word ofs_8F24
	.word ofs_8F37
WendyLook1:
	.byte $04 ;Tile Width
	.byte $04 ;Tile Height
	.byte $B8 ;1K CHR Bank
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $0F, $10, $FF
	.byte $22, $26, $27, $25
	.byte $32, $36, $37, $35
WendyLook2:
	.byte $04 ;Tile Width
	.byte $04 ;Tile Height
	.byte $B8 ;1K CHR Bank
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $0D, $0E, $FF
	.byte $22, $23, $24, $25
	.byte $32, $33, $34, $35
WendyStare:
	.byte $04 ;Tile Width
	.byte $04 ;Tile Height
	.byte $B8 ;1K CHR Bank
	.byte $01, $02, $03, $FF
	.byte $04, $05, $06, $FF
	.byte $11, $12, $13, $FF
	.byte $FF, $28, $29, $FF
WendySideLook:
	.byte $04 ;Tile Width
	.byte $04 ;Tile Height
	.byte $B8 ;1K CHR Bank
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $07, $08, $FF
	.byte $14, $15, $16, $FF
	.byte $FF, $28, $29, $FF
WendyMouthOpen:
	.byte $04 ;Tile Width
	.byte $04 ;Tile Height
	.byte $B8 ;1K CHR Bank
	.byte $FF, $FF, $FF, $FF
	.byte $09, $0A, $FF, $FF
	.byte $17, $18, $19, $FF
	.byte $FF, $28, $29, $FF
WendyWeirdFace1:
	.byte $04 ;Tile Width
	.byte $04 ;Tile Height
	.byte $B9 ;1K CHR Bank
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $42, $43, $FF
	.byte $4E, $4F, $50, $51
	.byte $5C, $5D, $5E, $5F
WendyWeirdFace2:
	.byte $04 ;Tile Width
	.byte $04 ;Tile Height
	.byte $B9 ;1K CHR Bank
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $44, $45, $FF
	.byte $4E, $52, $53, $51
	.byte $5C, $60, $61, $5F
ofs_8E6A:
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $FF
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $FF
	.byte $30
	.byte $31
	.byte $FF
ofs_8E7D:
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $6A
	.byte $6B
	.byte $6C
	.byte $6D
	.byte $75
	.byte $76
	.byte $77
	.byte $FF
ofs_8E90:
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $66
	.byte $67
	.byte $68
	.byte $69
	.byte $5C
	.byte $72
	.byte $73
	.byte $74
ofs_8EA3:
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $FF
	.byte $64
	.byte $65
	.byte $FF
	.byte $6E
	.byte $6F
	.byte $70
	.byte $71
ofs_8EB6:
	.byte $04
	.byte $05
	.byte $B9
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $66
	.byte $67
	.byte $68
	.byte $69
	.byte $5C
	.byte $72
	.byte $73
	.byte $74
	.byte $FF
	.byte $78
	.byte $79
	.byte $FF
	.byte $7A
	.byte $7B
	.byte $7C
	.byte $7D
ofs_8ECD:
	.byte $04
	.byte $05
	.byte $B9
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $FF
	.byte $64
	.byte $65
	.byte $FF
	.byte $6E
	.byte $6F
	.byte $70
	.byte $71
	.byte $FF
	.byte $78
	.byte $79
	.byte $FF
	.byte $7A
	.byte $7B
	.byte $7C
	.byte $7D
ofs_8EE4:
	.byte $04 ;wendy dummy mappings
	.byte $03
	.byte $B9
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $4A
	.byte $4B
	.byte $4C
	.byte $4D
	.byte $58
	.byte $59
	.byte $5A
	.byte $5B
	.byte $04 ;unused dummy frame
	.byte $03
	.byte $B8
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $38
	.byte $39
	.byte $3A
	.byte $3B
	.byte $3C
	.byte $3D
	.byte $3E
	.byte $3F
ofs_8F02:
	.byte $04
	.byte $03
	.byte $B9
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $46
	.byte $47
	.byte $48
	.byte $49
	.byte $54
	.byte $55
	.byte $56
	.byte $57
ofs_8F11:
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $FF
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $FF
	.byte $2A
	.byte $2B
	.byte $FF
ofs_8F24:
	.byte $04
	.byte $04
	.byte $BA
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $88
	.byte $89
	.byte $8A
	.byte $8B
ofs_8F37:
	.byte $04
	.byte $04
	.byte $BA
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $84
	.byte $85
	.byte $86
	.byte $87
	.byte $FF
	.byte $8C
	.byte $8D
	.byte $FF
ofs_8F4A:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $03
	.byte $04
	.byte $FF
	.byte $0E
	.byte $0F
	.byte $10
	.byte $11
	.byte $1D
	.byte $1E
	.byte $1F
	.byte $20
ofs_8F5D:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $05
	.byte $06
	.byte $FF
	.byte $0E
	.byte $12
	.byte $13
	.byte $11
	.byte $1D
	.byte $21
	.byte $22
	.byte $20
ofs_8F70:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $01
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $07
	.byte $08
	.byte $FF
	.byte $14
	.byte $15
	.byte $16
	.byte $FF
	.byte $FF
	.byte $23
	.byte $24
	.byte $FF
ofs_8F83:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $02
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $09
	.byte $0A
	.byte $FF
	.byte $17
	.byte $18
	.byte $19
	.byte $FF
	.byte $FF
	.byte $25
	.byte $24
	.byte $FF
ofs_8F96:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $0D
	.byte $FF
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $FF
	.byte $FF
	.byte $25
	.byte $24
	.byte $FF
ofs_8FA9:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $26
	.byte $27
	.byte $FF
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $35
	.byte $36
	.byte $37
	.byte $38
ofs_8FBC:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $28
	.byte $29
	.byte $FF
	.byte $2B
	.byte $2F
	.byte $30
	.byte $2E
	.byte $35
	.byte $39
	.byte $3A
	.byte $38
ofs_8FCF:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $28
	.byte $2A
	.byte $FF
	.byte $31
	.byte $32
	.byte $33
	.byte $34
	.byte $FF
	.byte $3B
	.byte $3C
	.byte $FF
ofs_8FE2:
	.byte $04
	.byte $04
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $48
	.byte $49
	.byte $4A
	.byte $4B
	.byte $FF
	.byte $54
	.byte $55
	.byte $FF
ofs_8FF5:
	.byte $04
	.byte $04
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $42
	.byte $43
	.byte $44
	.byte $45
	.byte $4C
	.byte $4D
	.byte $4E
	.byte $4F
ofs_9008:
	.byte $04
	.byte $04
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $FF
	.byte $46
	.byte $47
	.byte $FF
	.byte $50
	.byte $51
	.byte $52
	.byte $53
ofs_901B:
	.byte $04
	.byte $05
	.byte $B5
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $42
	.byte $43
	.byte $44
	.byte $45
	.byte $4C
	.byte $4D
	.byte $4E
	.byte $4F
	.byte $56
	.byte $57
	.byte $58
	.byte $59
	.byte $5A
	.byte $5B
	.byte $5C
	.byte $5D
ofs_9032:
	.byte $04
	.byte $05
	.byte $B5
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $FF
	.byte $46
	.byte $47
	.byte $FF
	.byte $50
	.byte $51
	.byte $52
	.byte $53
	.byte $56
	.byte $57
	.byte $58
	.byte $59
	.byte $5A
	.byte $5B
	.byte $5C
	.byte $5D
ofs_9049:
	.byte $04
	.byte $03
	.byte $B5
	.byte $FF
	.byte $5E
	.byte $5F
	.byte $FF
	.byte $64
	.byte $65
	.byte $66
	.byte $67
	.byte $73
	.byte $74
	.byte $75
	.byte $76
ofs_9058:
	.byte $04
	.byte $03
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $68
	.byte $69
	.byte $6A
	.byte $FF
	.byte $77
	.byte $78
	.byte $79
	.byte $FF
ofs_9067:
	.byte $04
	.byte $03
	.byte $B5
	.byte $FF
	.byte $60
	.byte $61
	.byte $FF
	.byte $6B
	.byte $6C
	.byte $6D
	.byte $6E
	.byte $7A
	.byte $7B
	.byte $7C
	.byte $7D
ofs_9076:
	.byte $04
	.byte $04
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $6F
	.byte $70
	.byte $71
	.byte $72
	.byte $FF
	.byte $7E
	.byte $7F
	.byte $FF
ofs_9089:
	.byte $04
	.byte $04
	.byte $B7
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $BF
	.byte $C0
	.byte $C1
	.byte $C2
	.byte $FF
	.byte $C7
	.byte $C8
	.byte $FF
ofs_909C:
	.byte $04
	.byte $04
	.byte $B7
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C3
	.byte $C4
	.byte $C5
	.byte $C6
	.byte $C9
	.byte $CA
	.byte $CB
	.byte $CC
ofs_90AF:
	.byte $02 ;diagonal podoboo mappings
	.byte $02
	.byte $A7
	.byte $2B
	.byte $2C
	.byte $36
	.byte $37
ofs_90B6:
	.byte $02
	.byte $02
	.byte $A7
	.byte $2D
	.byte $2E
	.byte $38
	.byte $39
ofs_90BD:
	.byte $02
	.byte $02
	.byte $A7
	.byte $36
	.byte $37
	.byte $2B
	.byte $2C
ofs_90C4:
	.byte $02
	.byte $02
	.byte $A7
	.byte $38
	.byte $39
	.byte $2D
	.byte $2E
ofs_90CB:
	.byte $01
	.byte $01
	.byte $A7
	.byte $FF
ofs_90CF:
	.byte $03 ;morton mappings (7 unused frames)
	.byte $04
	.byte $B0
	.byte $01
	.byte $FF
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $18
	.byte $19
	.byte $1A
	.byte $28
	.byte $29
	.byte $2A
ofs_90DE:
	.byte $03
	.byte $04
	.byte $B0
	.byte $28
	.byte $29
	.byte $2A
	.byte $18
	.byte $19
	.byte $1A
	.byte $09
	.byte $0A
	.byte $0B
	.byte $01
	.byte $FF
	.byte $FF
ofs_90ED:
	.byte $03
	.byte $04
	.byte $B0
	.byte $01
	.byte $FF
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $18
	.byte $19
	.byte $1A
	.byte $2B
	.byte $2C
	.byte $2D
ofs_90FC:
	.byte $03
	.byte $04
	.byte $B0
	.byte $01
	.byte $FF
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $18
	.byte $19
	.byte $1A
	.byte $2E
	.byte $2F
	.byte $30
ofs_910B:
	.byte $03
	.byte $04
	.byte $B0
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $18
	.byte $19
	.byte $1A
	.byte $09
	.byte $0A
	.byte $0B
	.byte $01
	.byte $FF
	.byte $FF
ofs_911A:
	.byte $03
	.byte $04
	.byte $B0
	.byte $2E
	.byte $2F
	.byte $30
	.byte $18
	.byte $19
	.byte $1A
	.byte $09
	.byte $0A
	.byte $0B
	.byte $01
	.byte $FF
	.byte $FF
ofs_9129:
	.byte $03
	.byte $03
	.byte $B0
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $31
	.byte $32
	.byte $33
ofs_9135:
	.byte $03
	.byte $03
	.byte $B0
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $1E
	.byte $1C
	.byte $1D
	.byte $34
	.byte $32
	.byte $33
ofs_9141:
	.byte $03
	.byte $03
	.byte $B0
	.byte $31
	.byte $32
	.byte $33
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $0C
	.byte $0D
	.byte $0E
ofs_914D:
	.byte $03
	.byte $03
	.byte $B0
	.byte $34
	.byte $32
	.byte $33
	.byte $1E
	.byte $1C
	.byte $1D
	.byte $0C
	.byte $0D
	.byte $0E
ofs_9159:
	.byte $03
	.byte $04
	.byte $B0
	.byte $FF
	.byte $02
	.byte $03
	.byte $0F
	.byte $10
	.byte $11
	.byte $1F
	.byte $20
	.byte $21
	.byte $35
	.byte $36
	.byte $37
ofs_9168:
	.byte $03
	.byte $04
	.byte $B0
	.byte $04
	.byte $05
	.byte $06
	.byte $12
	.byte $13
	.byte $14
	.byte $22
	.byte $23
	.byte $24
	.byte $38
	.byte $39
	.byte $3A
ofs_9177:
	.byte $03
	.byte $04
	.byte $B0
	.byte $07
	.byte $08
	.byte $FF
	.byte $15
	.byte $16
	.byte $17
	.byte $25
	.byte $26
	.byte $27
	.byte $3B
	.byte $3C
	.byte $3D
ofs_9186:
	.byte $03
	.byte $04
	.byte $B0
	.byte $35
	.byte $36
	.byte $37
	.byte $1F
	.byte $20
	.byte $21
	.byte $0F
	.byte $10
	.byte $11
	.byte $FF
	.byte $02
	.byte $03
ofs_9195:
	.byte $03
	.byte $04
	.byte $B0
	.byte $38
	.byte $39
	.byte $3A
	.byte $22
	.byte $23
	.byte $24
	.byte $12
	.byte $13
	.byte $14
	.byte $04
	.byte $05
	.byte $06
ofs_91A4:
	.byte $03
	.byte $04
	.byte $B0
	.byte $3B
	.byte $3C
	.byte $3D
	.byte $25
	.byte $26
	.byte $27
	.byte $15
	.byte $16
	.byte $17
	.byte $07
	.byte $08
	.byte $FF
ofs_91B3:
	.byte $04
	.byte $04
	.byte $B1
	.byte $45
	.byte $46
	.byte $47
	.byte $48
	.byte $55
	.byte $56
	.byte $57
	.byte $58
	.byte $67
	.byte $68
	.byte $69
	.byte $6A
	.byte $FF
	.byte $76
	.byte $77
	.byte $FF
ofs_91C6:
	.byte $05
	.byte $05
	.byte $B1
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $FF
	.byte $49
	.byte $4A
	.byte $4B
	.byte $4C
	.byte $FF
	.byte $59
	.byte $5A
	.byte $5B
	.byte $5C
	.byte $5D
	.byte $6B
	.byte $6C
	.byte $6D
	.byte $6E
	.byte $FF
	.byte $FF
	.byte $79
	.byte $78
	.byte $FF
	.byte $FF
ofs_91E2:
	.byte $04
	.byte $04
	.byte $B1
	.byte $4D
	.byte $4E
	.byte $4F
	.byte $50
	.byte $5E
	.byte $5F
	.byte $60
	.byte $61
	.byte $6F
	.byte $70
	.byte $71
	.byte $72
	.byte $FF
	.byte $7A
	.byte $7B
	.byte $7C
ofs_91F5:
	.byte $05
	.byte $05
	.byte $B1
	.byte $FF
	.byte $42
	.byte $43
	.byte $44
	.byte $FF
	.byte $51
	.byte $52
	.byte $53
	.byte $54
	.byte $FF
	.byte $62
	.byte $63
	.byte $64
	.byte $65
	.byte $66
	.byte $FF
	.byte $73
	.byte $74
	.byte $75
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $7D
	.byte $FF
	.byte $FF
ofs_9211:
	.byte $04
	.byte $04
	.byte $B2
	.byte $FF
	.byte $80
	.byte $81
	.byte $FF
	.byte $86
	.byte $87
	.byte $88
	.byte $89
	.byte $96
	.byte $97
	.byte $98
	.byte $99
	.byte $A6
	.byte $A7
	.byte $A8
	.byte $A9
ofs_9224:
	.byte $04
	.byte $04
	.byte $B2
	.byte $FF
	.byte $82
	.byte $83
	.byte $FF
	.byte $8A
	.byte $8B
	.byte $8C
	.byte $8D
	.byte $9A
	.byte $9B
	.byte $9C
	.byte $9D
	.byte $AA
	.byte $AB
	.byte $AC
	.byte $AD
ofs_9237:
	.byte $03
	.byte $04
	.byte $B2
	.byte $84
	.byte $85
	.byte $FF
	.byte $8E
	.byte $8F
	.byte $90
	.byte $9E
	.byte $9F
	.byte $A0
	.byte $AE
	.byte $AF
	.byte $B0
ofs_9246:
	.byte $05
	.byte $04
	.byte $B2
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $91
	.byte $92
	.byte $93
	.byte $94
	.byte $95
	.byte $A1
	.byte $A2
	.byte $A3
	.byte $A4
	.byte $A5
	.byte $B1
	.byte $B2
	.byte $B3
	.byte $B4
	.byte $B5
ofs_925D:
	.byte $05
	.byte $04
	.byte $B2
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $B6
	.byte $B7
	.byte $B8
	.byte $B9
	.byte $BA
	.byte $BB
	.byte $BC
	.byte $BD
	.byte $BE
	.byte $BF
ofs_9274:
	.byte $05
	.byte $04
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C2
	.byte $C3
	.byte $FF
ofs_928B:
	.byte $05
	.byte $04
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C6
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $CB
	.byte $CC
	.byte $FF
ofs_92A2:
	.byte $05
	.byte $04
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C7
	.byte $C8
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $CD
	.byte $CE
	.byte $FF
ofs_92B9:
	.byte $05
	.byte $04
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C9
	.byte $CA
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $CF
	.byte $D0
	.byte $FF
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
	JMP loc3_A6B5
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
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr6_9358
	.word ptr_AD88
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
obj_h72:
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
	LDX tbl6_95DE,Y
	LDA tbl6_95F5,X
	LDX $A4
	STA ObjectXPos+1,X
	LDA #$0D
	STA ObjectXScreen+1,X
	LDX tbl6_95DE,Y
	LDA tbl6_95FC,X
	LDX $A4
	STA ObjectYPos+1,X
	LDA #$01
	STA ObjectYScreen+1,X
	LDA #$73
	STA ObjectSlot+1,X
	LDA #$2C
	STA EnemyAnimFrame+1,X
	LDX tbl6_95DF,Y
	LDA tbl6_95F5,X
	LDX $A4
	STA ObjectXPos+2,X
	LDA #$0D
	STA ObjectXScreen+2,X
	LDX tbl6_95DF,Y
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
	.word ptr6_94AB
	.word ptr6_94E9
	.word ptr6_9529
	.word ptr6_955B
	.word ptr6_958A
	.word ptr6_9603
	.word ptr6_9632
ptr6_94AB:
	LDA $062B
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
	LDA $062B
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
	LDA $062B
	AND #$08
	BNE bra6_9522
	INY
bra6_9522:
	LDA tbl6_95CD,Y
bra6_9525:
	STA EnemyAnimFrame,X
	RTS
ptr6_9529:
	LDA $062B
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
	LDA $062B
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
	LDA $062B
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
	.byte $25
	.byte $26
	.byte $27
	.byte $26
tbl6_95C9:
	.byte $2A
	.byte $2B
	.byte $2A
	.byte $2B
tbl6_95CD:
	.byte $20
tbl6_95CE:
	.byte $21
	.byte $20
	.byte $1F
	.byte $20
	.byte $1F
	.byte $1D
	.byte $1E
	.byte $22
	.byte $23
	.byte $22
	.byte $24
	.byte $27
	.byte $2D
	.byte $32
	.byte $33
tbl6_95DD:
	.byte $02
tbl6_95DE:
	.byte $04
tbl6_95DF:
	.byte $06
	.byte $01
	.byte $03
	.byte $04
	.byte $06
	.byte $01
	.byte $03
	.byte $00
	.byte $02
	.byte $04
	.byte $05
	.byte $00
	.byte $02
	.byte $04
	.byte $01
	.byte $06
	.byte $06
	.byte $01
	.byte $03
	.byte $02
	.byte $04
	.byte $06
tbl6_95F5:
	.byte $10
	.byte $30
	.byte $50
	.byte $70
	.byte $90
	.byte $B0
	.byte $D0
tbl6_95FC:
	.byte $68
	.byte $78
	.byte $78
	.byte $68
	.byte $58
	.byte $68
	.byte $78
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
	LDA $062B
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
	LDA $062B
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
	JMP loc3_A6B5 ;unlogged
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
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr6_96F8
	.word ptr_AD88
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
	JSR jmp_54_BEBC
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
	LDA #sfxFeather
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
obj_h64:
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
	JMP loc3_A6B5 ;unlogged
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
	LDA $062B
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
	.byte $DD
tbl6_99D8:
	.byte $99
	.byte $E4
	.byte $99
	.byte $EB
	.byte $99
	.byte $02
	.byte $02
	.byte $97
	.byte $0D
	.byte $0E
	.byte $11
	.byte $12
	.byte $02
	.byte $02
	.byte $97
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $01
	.byte $01
	.byte $97
	.byte $FF
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
obj_h6C:
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
	JMP loc3_A6B5
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
	.word ptr6_9A87
	.word ptr6_9ADF
	.word ptr6_9B7B
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
	JMP loc3_A6B5
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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
tbl6_9DAD:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
tbl6_9EAD:
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
