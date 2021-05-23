;disassembled by BZK 6502 Disassembler
	LDX $A4
	LDA ObjectVariables,X
	BMI bra6_800A
	JMP loc6_809C
bra6_800A:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_8026
	CMP #$FF
	BEQ bra6_8026
	JMP $A6B5
bra6_8026:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8068
	LDA $05DC,X
	BPL bra6_8057
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_8068
bra6_8057:
	LDA $05C8,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA $05C8,X	;unlogged
	LDA $05DC,X	;unlogged
	SBC #$00	;unlogged
	STA $05DC,X	;unlogged
bra6_8068:
loc6_8068:
	LDA FreezeFlag
	BEQ bra6_806E
	RTS	;unlogged
bra6_806E:
	LDA ObjectVariables,X
	CMP #$81
	BCS bra6_8078
	JMP $B5BB
bra6_8078:
	CMP #$88
	BCS bra6_807F
	JMP $B4FC
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
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_80BE
	CMP #$FF
	BEQ bra6_80BE
	JMP $A6B5
bra6_80BE:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8100
	LDA $05DC,X
	BPL bra6_80EF
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_8100
bra6_80EF:
	LDA $05C8,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA $05C8,X	;unlogged
	LDA $05DC,X	;unlogged
	SBC #$00	;unlogged
	STA $05DC,X	;unlogged
bra6_8100:
loc6_8100:
	LDA FreezeFlag
	BEQ bra6_8106
	RTS	;unlogged
bra6_8106:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_811A,Y
	STA Data0
	LDA tbl6_811B,Y
	STA Data0+1
	JMP (Data0)
tbl6_811A:
	.byte $BB
tbl6_811B:
	.byte $A7
	.byte $7B	;unlogged
	.byte $AA	;unlogged
	.byte $29	;unlogged
	.byte $AB	;unlogged
	.byte $24
	.byte $81
	.byte $88
	.byte $AD
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
	STA Data0
	LDA tbl6_88DA,Y
	STA Data0+1
	JSR $B485
bra6_8151:
	JSR $A6D4
	JSR $BEBC
	JSR $A74D
	LDA #$10
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$10
	STA PlayerXSpeed
	LDA #$01
	JSR $BCD4
	LDA #sfxEnemyHit2
	STA SFXRegister
	LDX $A4
	LDA #$81
	STA ObjectVariables,X
	RTS
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
	LDA tbl6_81B6,X
	STA Data0
	LDA tbl6_81B7,X
	STA Data0+1
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_81B0
	LDY #$C0
bra6_81B0:
	STY $36
	JSR $A118
	RTS
tbl6_81B6:
	.byte $BA
tbl6_81B7:
	.byte $81
	.byte $C1
	.byte $81
	.byte $02	;ninji mappings
	.byte $02
	.byte $A6
	.byte $22
	.byte $23
	.byte $24
	.byte $25
	.byte $02
	.byte $02
	.byte $A6
	.byte $26
	.byte $27
	.byte $28
	.byte $29
	LDA #$07
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_81EA
	CMP #$FF
	BEQ bra6_81EA
	JMP $A6B5
bra6_81EA:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_822C
	LDA $05DC,X
	BPL bra6_821B
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_822C
bra6_821B:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra6_822C:
loc6_822C:
	LDA FreezeFlag
	BEQ bra6_8232
	.byte $60
bra6_8232:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_8246,Y
	STA Data0
	LDA tbl6_8247,Y
	STA Data0+1
	JMP (Data0)
tbl6_8246:
	.byte $BB
tbl6_8247:
	.byte $A7
	.byte $7B	;unlogged
	.byte $AA	;unlogged
	.byte $29	;unlogged
	.byte $AB	;unlogged
	.byte $50
	.byte $82
	.byte $88	;unlogged
	.byte $AD	;unlogged
	JSR sub6_825A
	JSR $BEBC
	JSR $BF74
	RTS
sub6_825A:
	LDX $A4
	LDA ObjectVariables,X
	AND #$0F
	ASL
	TAY
	LDA tbl6_8270,Y
	STA Data0
	LDA tbl6_8271,Y
	STA Data0+1
	JMP (Data0)
tbl6_8270:
	.byte $7A
tbl6_8271:
	.byte $82
	.byte $A8
	.byte $82
	.byte $EA
	.byte $82
	.byte $4C
	.byte $83
	.byte $66
	.byte $83
	LDA $05B4,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	LDA $05A0,X
	TAY
	LDA $05B4,X
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
	LDA $05B4,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	LDA $05B4,X
	BEQ bra6_82C6
	CMP #$FF
	BEQ bra6_82D4
	BNE bra6_82E0	;unlogged
bra6_82C6:
	LDA $05A0,X
	SEC
	SBC #$18
	BCC bra6_82E6
	CMP #$20
	BCC bra6_82E5_RTS
	BCS bra6_82E0
bra6_82D4:
	LDA $05A0,X
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
	CLC	;unlogged
	ADC ObjectYPos,X	;unlogged
	STA ObjectYPos,X	;unlogged
	LDA ObjectYScreen,X	;unlogged
	SBC #$00	;unlogged
	STA ObjectYScreen,X	;unlogged
	LDA ObjectYPos,X	;unlogged
	CMP #$F0	;unlogged
	BCC bra6_8324	;unlogged
	LDA ObjectYPos,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYPos,X	;unlogged
bra6_8324:
loc6_8324:
	JSR $BB59
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
	LDA #$FC
	BMI bra6_8381
	CLC	;unlogged
	ADC ObjectYPos,X	;unlogged
	STA ObjectYPos,X	;unlogged
	CMP #$F0	;unlogged
	BCC bra6_83A0	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,X	;unlogged
	INC ObjectYScreen,X	;unlogged
	JMP loc6_83A0	;unlogged
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
	JSR $BB73
	BEQ bra6_83B2_RTS
	LDA ObjectYPos,X
	ORA #$0F
	STA ObjectYPos,X
	LDA #$80
	STA ObjectVariables,X
bra6_83B2_RTS:
	RTS
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDA ObjectVariables,X
	AND #$0F
	ASL
	TAX
	LDA tbl6_83E1,X
	STA Data0
	LDA tbl6_83E2,X
	STA Data0+1
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_83DB
	LDY #$C0
bra6_83DB:
	STY $36
	JSR $A118
	RTS
tbl6_83E1:
	.byte $EB
tbl6_83E2:
	.byte $83
	.byte $FA
	.byte $83
	.byte $09
	.byte $84
	.byte $09
	.byte $84
	.byte $09
	.byte $84
	.byte $03	;thwomp mappings
	.byte $04
	.byte $AB
	.byte $21
	.byte $22
	.byte $23
	.byte $24
	.byte $25
	.byte $26
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $35
	.byte $36
	.byte $37
	.byte $03
	.byte $04
	.byte $AB
	.byte $21
	.byte $22
	.byte $23
	.byte $2A
	.byte $2B
	.byte $26
	.byte $32
	.byte $33
	.byte $34
	.byte $35
	.byte $36
	.byte $37
	.byte $03
	.byte $04
	.byte $AB
	.byte $21
	.byte $22
	.byte $23
	.byte $27
	.byte $28
	.byte $29
	.byte $2F
	.byte $30
	.byte $31
	.byte $35
	.byte $36
	.byte $37
	LDX $A4	;unlogged code start
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_8436
	CMP #$FF
	BEQ bra6_8436
	JMP $A6B5
bra6_8436:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8478
	LDA $05DC,X
	BPL bra6_8467
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_8478
bra6_8467:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
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
	JSR $BBC3
bra6_84A7:
	JSR $BEBC
	JSR $BF74
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_84CC
	CMP #$FF
	BEQ bra6_84CC
	JMP $A6B5
bra6_84CC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_850E
	LDA $05DC,X
	BPL bra6_84FD
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_850E
bra6_84FD:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
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
	JSR $BBC3
bra6_853D:
	JSR $BEBC
	JSR $BF74
	RTS
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
	STA Data0
	LDA tbl6_8571,X
	STA Data0+1
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_856A
	LDY #$C0
bra6_856A:
	STY $36
	JSR $A118
	RTS	;unlogged code end
tbl6_8570:
	.byte $74
tbl6_8571:
	.byte $85
	.byte $7D
	.byte $85
	.byte $03
	.byte $02
	.byte $A4
	.byte $01
	.byte $02
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $0D
	.byte $03
	.byte $02
	.byte $A4
	.byte $03
	.byte $04
	.byte $FF
	.byte $0E
	.byte $0C
	.byte $0F
	LDA #$07
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_85A8
	CMP #$FF
	BEQ bra6_85A8
	JMP $A6B5
bra6_85A8:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_85EA
	LDA $05DC,X
	BPL bra6_85D9
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_85EA
bra6_85D9:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra6_85EA:
loc6_85EA:
	LDA FreezeFlag
	BEQ bra6_85F0
	.byte $60
bra6_85F0:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_8604,Y
	STA Data0
	LDA tbl6_8605,Y
	STA Data0+1
	JMP (Data0)
tbl6_8604:
	.byte $BB
tbl6_8605:
	.byte $A7
	.byte $7B	;unlogged
	.byte $AA	;unlogged
	.byte $29	;unlogged
	.byte $AB	;unlogged
	.byte $0C
	.byte $86
	JSR sub6_8616
	JSR $BEBC
	JSR $BF74
	RTS
sub6_8616:
	LDX $A4
	LDA ObjectVariables,X
	STA P1Score
	AND #$0F
	ASL
	TAY
	LDA tbl6_862F,Y
	STA Data0
	LDA tbl6_8630,Y
	STA Data0+1
	JMP (Data0)
tbl6_862F:
	.byte $DC
tbl6_8630:
	.byte $87
	.byte $37
	.byte $86
	.byte $DC
	.byte $87
	.byte $82
	.byte $86
	LDA #$FF
	BMI bra6_8652
	CLC	;unlogged
	ADC ObjectYPos,X	;unlogged
	STA ObjectYPos,X	;unlogged
	CMP #$F0	;unlogged
	BCC bra6_8671	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,X	;unlogged
	INC ObjectYScreen,X	;unlogged
	JMP loc6_8671	;unlogged
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
	JSR $BB73
	BEQ bra6_8681_RTS
	LDA ObjectYPos,X
	ORA #$0F
	STA ObjectYPos,X
	INC ObjectVariables,X
bra6_8681_RTS:
	RTS
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
	CLC	;unlogged
	ADC ObjectYPos,X	;unlogged
	STA ObjectYPos,X	;unlogged
	LDA ObjectYScreen,X	;unlogged
	SBC #$00	;unlogged
	STA ObjectYScreen,X	;unlogged
	LDA ObjectYPos,X	;unlogged
	CMP #$F0	;unlogged
	BCC bra6_86BC	;unlogged
	LDA ObjectYPos,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYPos,X	;unlogged
bra6_86BC:
loc6_86BC:
	JSR $BB59
	BEQ bra6_86CE_RTS
	LDA ObjectYPos,X
	AND #$F0
	STA ObjectYPos,X
	LDA #$80
	STA ObjectVariables,X
bra6_86CE_RTS:
	RTS
	LDA #$07
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_86F1
	CMP #$FF
	BEQ bra6_86F1
	JMP $A6B5
bra6_86F1:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8733
	LDA $05DC,X
	BPL bra6_8722
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_8733
bra6_8722:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
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
	STA Data0
	LDA tbl6_874E,Y
	STA Data0+1
	JMP (Data0)
tbl6_874D:
	.byte $BB
tbl6_874E:
	.byte $A7
	.byte $7B	;unlogged
	.byte $AA	;unlogged
	.byte $29	;unlogged
	.byte $AB	;unlogged
	.byte $55
	.byte $87
	JSR sub6_875F
	JSR $BEBC
	JSR $BF74	;unlogged
	RTS	;unlogged
sub6_875F:
	LDX $A4
	LDA ObjectVariables,X
	STA P1Score
	AND #$0F
	ASL
	TAY
	LDA tbl6_8778,Y
	STA Data0
	LDA tbl6_8779,Y
	STA Data0+1
	JMP (Data0)
tbl6_8778:
	.byte $DC
tbl6_8779:
	.byte $87
	.byte $80
	.byte $87
	.byte $DC
	.byte $87
	.byte $AD
	.byte $87
	LDA #$FF
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra6_8794
	LDA ObjectXScreen,X	;unlogged
	ADC #$00	;unlogged
	BPL bra6_8799	;unlogged
bra6_8794:
	LDA ObjectXScreen,X
	SBC #$00
bra6_8799:
	STA ObjectXScreen,X
	JSR $BBA8
	BEQ bra6_87AC_RTS
	LDA ObjectXPos,X
	ORA #$0F
	STA ObjectXPos,X
	INC ObjectVariables,X
bra6_87AC_RTS:
	RTS
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
	LDA ObjectXScreen,X	;unlogged
	SBC #$00	;unlogged
bra6_87C6:
	STA ObjectXScreen,X
	JSR $BB8E
	BEQ bra6_87DB_RTS
	LDA ObjectXPos,X
	AND #$F0
	STA ObjectXPos,X
	LDA #$80
	STA ObjectVariables,X
bra6_87DB_RTS:
	RTS
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
	LDA tbl6_882F,X
	STA Data0
	LDA tbl6_8830,X
	STA Data0+1
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
	JSR $A118
	RTS
tbl6_882F:
	.byte $33
tbl6_8830:
	.byte $88
	.byte $46
	.byte $88
	.byte $04	;urchin mappings
	.byte $04
	.byte $A8
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $15
	.byte $16
	.byte $19
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $04
	.byte $04
	.byte $A8
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
	.byte $0D
	.byte $11
	.byte $12
	.byte $10
	.byte $13
	.byte $17
	.byte $18
	.byte $16
	.byte $19
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $00	;unlogged data start
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
	.byte $01	;unlogged data end
tbl6_88D9:
	.byte $E5
tbl6_88DA:
	.byte $88
	.byte $DF	;unlogged data start
	.byte $88
	.byte $E2
	.byte $88
	.byte $03
	.byte $00
	.byte $80
	.byte $00
	.byte $01
	.byte $80
	.byte $00
	.byte $00	;unlogged data end
	.byte $00
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
	.byte $00	;unlogged
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
	.byte $00	;unlogged
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
	.byte $00	;unlogged
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
	LDX $A4
	LDA ObjectVariables,X
	BPL bra6_8971
	JSR $B5BB
	RTS
bra6_8971:
	JSR sub6_8BCA
	LDX $A4
	LDA GuidedObjStatus,X
	ASL
	TAY
	LDA tbl6_8988,Y
	STA Data0
	LDA tbl6_8989,Y
	STA Data0+1
	JMP (Data0)
tbl6_8988:
	.byte $98
tbl6_8989:
	.byte $89
	.byte $AD
	.byte $89
	.byte $C4
	.byte $89
	.byte $F7
	.byte $89
	.byte $0C
	.byte $8A
	.byte $63
	.byte $8A
	.byte $98
	.byte $8A
	.byte $DB
	.byte $8A
	LDA EnemyAnimFrame,X
	AND #$40
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	BNE bra6_89AA
	JMP loc6_8B8F
bra6_89AA:
	JMP loc6_8B6D
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
	LDA EnemyAnimFrame,X
	AND #$C0
	ORA #$80
	STA EnemyAnimFrame,X
	LDA $05A0,X
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
	STA GuidedObjStatus,X
	LDA #$00
	STA $0641,X
	RTS
bra6_89EA:
	LDA ObjectState,X
	AND #$40
	BNE bra6_89F4
	JMP loc6_8B6D
bra6_89F4:
	JMP loc6_8B8F
	LDA EnemyAnimFrame,X
	AND #$80
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	BNE bra6_8A09
	JMP loc6_8B20
bra6_8A09:
	JMP loc6_8B44
	LDY $0641,X
	LDA tbl6_8A53,Y
	STA EnemyAnimFrame,X
	LDA $062B
	AND #$01
	BNE bra6_8A52_RTS
	LDA $0641,X
	LSR
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	LDA $0641,X
	CMP #$0F
	BCS bra6_8A31
	INC $0641,X
bra6_8A31:
	JSR $B077
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
	STA $0641,X
	INC GuidedObjStatus,X
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
	INC $0641,X
	LDA $0641,X
	CMP #$10
	BCC bra6_8A97_RTS
	CMP #$18
	BCS bra6_8A8C
	CMP #$14
	BNE bra6_8A97_RTS
	LDA #$00
	LDY $05B4,X
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
	STA GuidedObjStatus,X
	STA $0641,X
bra6_8A97_RTS:
	RTS
	LDA #$02
	CMP ObjectVariables,X
	BCS bra6_8AAF
	LDA #$07
	STA GuidedObjStatus,X
	LDA #$00
	STA $0641,X
	LDA #$18
	STA EnemyAnimFrame,X
	RTS
bra6_8AAF:
	INC $0641,X
	LDA $0641,X
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
	STA GuidedObjStatus,X
	LDA #$00
	STA $0641,X
bra6_8ADA_RTS:
	RTS
	LDA $0641,X
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
	INC $0641,X
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
	STA GuidedObjStatus,X
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
	STA GuidedObjStatus,X
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
	STA GuidedObjStatus,X
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
	STA GuidedObjStatus,X
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
	LDA GuidedObjStatus,X
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
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_8BEC
	CMP #$FF
	BEQ bra6_8BEC
	JMP $A6B5	;unlogged
bra6_8BEC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_8C2E
	LDA $05DC,X	;unlogged
	BPL bra6_8C1D	;unlogged
	LDA $05C8,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA $05C8,X	;unlogged
	LDA $05DC,X	;unlogged
	ADC #$00	;unlogged
	STA $05DC,X	;unlogged
	JMP loc6_8C2E	;unlogged
bra6_8C1D:
	LDA $05C8,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA $05C8,X	;unlogged
	LDA $05DC,X	;unlogged
	SBC #$00	;unlogged
	STA $05DC,X	;unlogged
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
	STA Data0
	LDA tbl6_8C49,Y
	STA Data0+1
	JMP (Data0)
tbl6_8C48:
	.byte $BB
tbl6_8C49:
	.byte $A7
	.byte $7B	;unlogged
	.byte $AA	;unlogged
	.byte $29	;unlogged
	.byte $AB	;unlogged
	.byte $52
	.byte $8C
	.byte $88	;unlogged
	.byte $AD	;unlogged
	LDA GuidedObjStatus,X
	CMP #$04
	BCS bra6_8CA1_RTS
	JSR $BEBC
	LDA InvincibilityTimer
	CMP #$F7
	BCS bra6_8CA1_RTS
	LDA GuidedObjStatus,X
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
	STA GuidedObjStatus,X
	LDA #$00
	STA $0641,X
	INC ObjectVariables,X
	LDA PlayerMovement
	ORA #$04
bra6_8C9B:
	STA PlayerMovement
	LDA #$30
	STA PlayerYSpeed
bra6_8CA1_RTS:
	RTS
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA Data0
	LDA tbl6_8D46,X
	STA Data0+1
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra6_8CC2
	LDY #$C0	;unlogged
bra6_8CC2:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA WorldNumber
	CMP #$04
	BEQ bra6_8CD7
	JSR $A118
	RTS
bra6_8CD7:
	JSR $A2A8
	RTS
	LDA WorldNumber
	CMP #$02
	BNE bra6_8D12
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA Data0
	LDA tbl6_8D46,X
	STA Data0+1
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
	JSR $A118
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
	STA Data0
	LDA tbl6_8DB8,X
	STA Data0+1
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
	JSR $A118
	RTS
tbl6_8D45:
	.byte $CF
tbl6_8D46:
	.byte $90
	.byte $ED
	.byte $90
	.byte $FC
	.byte $90
	.byte $29
	.byte $91
	.byte $35
	.byte $91
	.byte $59	;unlogged
	.byte $91	;unlogged
	.byte $68	;unlogged
	.byte $91	;unlogged
	.byte $77	;unlogged
	.byte $91	;unlogged
	.byte $DE	;unlogged
	.byte $90	;unlogged
	.byte $0B
	.byte $91
	.byte $1A
	.byte $91
	.byte $41
	.byte $91
	.byte $4D
	.byte $91
	.byte $86	;unlogged
	.byte $91	;unlogged
	.byte $95	;unlogged
	.byte $91	;unlogged
	.byte $A4	;unlogged
	.byte $91	;unlogged
	.byte $B3
	.byte $91
	.byte $C6
	.byte $91
	.byte $E2
	.byte $91
	.byte $F5
	.byte $91
	.byte $11
	.byte $92
	.byte $24
	.byte $92
	.byte $37
	.byte $92
	.byte $46
	.byte $92
	.byte $5D
	.byte $92
	.byte $74
	.byte $92
	.byte $8B
	.byte $92
	.byte $A2
	.byte $92
	.byte $B9
	.byte $92
	.byte $4A
	.byte $8F
	.byte $5D
	.byte $8F
	.byte $70
	.byte $8F
	.byte $83
	.byte $8F
	.byte $96
	.byte $8F
	.byte $A9
	.byte $8F
	.byte $BC
	.byte $8F
	.byte $CF	;unlogged
	.byte $8F	;unlogged
	.byte $E2
	.byte $8F
	.byte $F5
	.byte $8F
	.byte $08
	.byte $90
	.byte $1B
	.byte $90
	.byte $32
	.byte $90
	.byte $49
	.byte $90
	.byte $58
	.byte $90
	.byte $67
	.byte $90
	.byte $76
	.byte $90
	.byte $CF	;unlogged
	.byte $90	;unlogged
	.byte $CF	;unlogged
	.byte $90	;unlogged
	.byte $CF	;unlogged
	.byte $90	;unlogged
	.byte $CF	;unlogged
	.byte $90	;unlogged
	.byte $89
	.byte $90
	.byte $9C
	.byte $90
	.byte $AF
	.byte $90
	.byte $B6
	.byte $90
	.byte $BD
	.byte $90
	.byte $C4
	.byte $90
	.byte $CB
	.byte $90
tbl6_8DB7:
	.byte $E5
tbl6_8DB8:
	.byte $8D
	.byte $F8
	.byte $8D
	.byte $0B
	.byte $8E
	.byte $1E
	.byte $8E
	.byte $31
	.byte $8E
	.byte $44
	.byte $8E
	.byte $57
	.byte $8E
	.byte $6A
	.byte $8E
	.byte $7D
	.byte $8E
	.byte $90
	.byte $8E
	.byte $A3
	.byte $8E
	.byte $B6
	.byte $8E
	.byte $CD
	.byte $8E
	.byte $E4
	.byte $8E
	.byte $02
	.byte $8F
	.byte $02
	.byte $8F
	.byte $11
	.byte $8F
	.byte $37	;unlogged
	.byte $8F	;unlogged
	.byte $37	;unlogged
	.byte $8F	;unlogged
	.byte $37	;unlogged
	.byte $8F	;unlogged
	.byte $37	;unlogged
	.byte $8F	;unlogged
	.byte $24
	.byte $8F
	.byte $37
	.byte $8F
	.byte $04	;wendy mappings
	.byte $04
	.byte $B8
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $0F
	.byte $10
	.byte $FF
	.byte $22
	.byte $26
	.byte $27
	.byte $25
	.byte $32
	.byte $36
	.byte $37
	.byte $35
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $0D
	.byte $0E
	.byte $FF
	.byte $22
	.byte $23
	.byte $24
	.byte $25
	.byte $32
	.byte $33
	.byte $34
	.byte $35
	.byte $04
	.byte $04
	.byte $B8
	.byte $01
	.byte $02
	.byte $03
	.byte $FF
	.byte $04
	.byte $05
	.byte $06
	.byte $FF
	.byte $11
	.byte $12
	.byte $13
	.byte $FF
	.byte $FF
	.byte $28
	.byte $29
	.byte $FF
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF
	.byte $FF
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
	.byte $28
	.byte $29
	.byte $FF
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $09
	.byte $0A
	.byte $FF
	.byte $FF
	.byte $17
	.byte $18
	.byte $19
	.byte $FF
	.byte $FF
	.byte $28
	.byte $29
	.byte $FF
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $42
	.byte $43
	.byte $FF
	.byte $4E
	.byte $4F
	.byte $50
	.byte $51
	.byte $5C
	.byte $5D
	.byte $5E
	.byte $5F
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $44
	.byte $45
	.byte $FF
	.byte $4E
	.byte $52
	.byte $53
	.byte $51
	.byte $5C
	.byte $60
	.byte $61
	.byte $5F
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
	.byte $04	;wendy dummy mappings
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
	.byte $04	;unused dummy frame
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
	.byte $02	;diagonal podoboo mappings
	.byte $02
	.byte $A7
	.byte $2B
	.byte $2C
	.byte $36
	.byte $37
	.byte $02
	.byte $02
	.byte $A7
	.byte $2D
	.byte $2E
	.byte $38
	.byte $39
	.byte $02
	.byte $02
	.byte $A7
	.byte $36
	.byte $37
	.byte $2B
	.byte $2C
	.byte $02
	.byte $02
	.byte $A7
	.byte $38
	.byte $39
	.byte $2D
	.byte $2E
	.byte $01
	.byte $01
	.byte $A7
	.byte $FF
	.byte $03	;morton mappings (7 unused frames)
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
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_92F2
	CMP #$FF
	BEQ bra6_92F2
	JMP $A6B5
bra6_92F2:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_9334
	LDA $05DC,X
	BPL bra6_9323
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_9334
bra6_9323:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra6_9334:
loc6_9334:
	LDA FreezeFlag
	BEQ bra6_933A
	RTS	;unlogged
bra6_933A:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_934E,Y
	STA Data0
	LDA tbl6_934F,Y
	STA Data0+1
	JMP (Data0)
tbl6_934E:
	.byte $BB
tbl6_934F:
	.byte $A7
	.byte $7B	;unlogged
	.byte $AA	;unlogged
	.byte $29	;unlogged
	.byte $AB	;unlogged
	.byte $58
	.byte $93
	.byte $88	;unlogged
	.byte $AD	;unlogged
	LDA ReznorsDefeated
	BNE bra6_9363_RTS
	JSR $BC3E
	JSR $BF74
bra6_9363_RTS:
	RTS
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA Data0
	LDA tbl6_8D46,X
	STA Data0+1
	LDA #$40
	STA $36
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR $A118
	RTS
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA Data0
	LDA tbl6_8D46,X
	STA Data0+1
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
	JSR $A118
	RTS
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
	JSR $B785
	AND #$07
	ASL
	CMP $0668
	BEQ bra6_93D3
	STA $0668
	TAY
	LDA tbl6_95CD,Y
	STA EnemyAnimFrame,X
bra6_93E8:
	JSR $B785
	AND #$07
	STA Data0
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
	STA GuidedObjStatus,X
	STA GuidedObjStatus+1,X
	STA GuidedObjStatus+2,X
	STA $0641,X
	STA $0642,X
	STA $0643,X
	INC ObjectCount
	INC ObjectCount
	RTS
loc6_9488:
	JSR sub6_9670
	LDA GuidedObjStatus,X
	ASL
	TAY
	LDA tbl6_949D,Y
	STA Data0
	LDA tbl6_949E,Y
	STA Data0+1
	JMP (Data0)
tbl6_949D:
	.byte $AB
tbl6_949E:
	.byte $94
	.byte $E9
	.byte $94
	.byte $29
	.byte $95
	.byte $5B
	.byte $95
	.byte $8A
	.byte $95
	.byte $03
	.byte $96
	.byte $32
	.byte $96
	LDA $062B
	AND #$03
	BNE bra6_94C1_RTS
	LDA $0641,X
	CMP #$18
	BCC bra6_94C2
	LDA #$00
	STA $0641,X
	INC GuidedObjStatus,X
bra6_94C1_RTS:
	RTS
bra6_94C2:
	INC $0641,X
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
	LDA $062B
	AND #$03
	BNE bra6_94FF_RTS
	LDA $0641,X
	CMP #$18
	BCC bra6_9500
	LDA #$00
	STA $0641,X
	INC GuidedObjStatus,X
bra6_94FF_RTS:
	RTS
bra6_9500:
	INC $0641,X
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
	LDA $062B
	AND #$03
	BNE bra6_953F_RTS
	LDA $0641,X
	CMP #$1C
	BCC bra6_9540
	LDA #$00
	STA $0641,X
	INC GuidedObjStatus,X
bra6_953F_RTS:
	RTS
bra6_9540:
	INC $0641,X
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
	LDA $062B
	AND #$03
	BNE bra6_9585_RTS
	LDA $0641,X
	CMP #$18
	BCC bra6_9586
	LDA #$00
	STA $0641,X
	STA GuidedObjStatus,X
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
	INC $0641,X
	RTS
	LDA $0641,X
	CMP #$30
	BCC bra6_95A6
	LDA #$00
	STA $0641,X
	LDY #$02
	LDA ObjectSlot,X
	CMP #$72
	BNE bra6_95A1
	LDY #$06
bra6_95A1:
	TYA
	STA GuidedObjStatus,X
	RTS
bra6_95A6:
	INC $0641,X
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
	LDA ObjectYPos,X
	CMP #$E0
	BCS bra6_9611
	LDA $0641,X
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
	INC $0641,X
	INC ObjectYPos,X
	INC ObjectYPos,X
	RTS
	LDA $062B
	AND #$03
	BNE bra6_964A_RTS
	LDA $0641,X
	CMP #$1C
	BCC bra6_964B
	LDA #$00
	STA $0641,X
	LDA #$03
	STA GuidedObjStatus,X
bra6_964A_RTS:
	RTS
bra6_964B:
	INC $0641,X
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
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_9692
	CMP #$FF
	BEQ bra6_9692
	JMP $A6B5	;unlogged
bra6_9692:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_96D4
	LDA $05DC,X	;unlogged
	BPL bra6_96C3	;unlogged
	LDA $05C8,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA $05C8,X	;unlogged
	LDA $05DC,X	;unlogged
	ADC #$00	;unlogged
	STA $05DC,X	;unlogged
	JMP loc6_96D4	;unlogged
bra6_96C3:
	LDA $05C8,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA $05C8,X	;unlogged
	LDA $05DC,X	;unlogged
	SBC #$00	;unlogged
	STA $05DC,X	;unlogged
bra6_96D4:
loc6_96D4:
	LDA FreezeFlag
	BEQ bra6_96DA
	RTS	;unlogged
bra6_96DA:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_96EE,Y
	STA Data0
	LDA tbl6_96EF,Y
	STA Data0+1
	JMP (Data0)
tbl6_96EE:
	.byte $BB
tbl6_96EF:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $F8
	.byte $96
	.byte $88
	.byte $AD
	LDA GuidedObjStatus,X
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
	JSR $BEBC
	LDA PlayerMovement
	AND #$04
	BNE bra6_9763
	LDA PlayerYSpeed
	BNE bra6_9767
bra6_9763:
	.byte $20
	.byte $74
	.byte $BF
	.byte $60
bra6_9767:
	LDA InvincibilityTimer
	CMP #$F7
	BCS bra6_97A3_RTS
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA PlayerAction
	LDA #$0E
	STA SFXRegister
	LDY #$04
	LDA ObjectSlot,X
	CMP #$72
	BNE bra6_979A
	INC ObjectVariables,X
	LDA ObjectVariables,X
	AND #$7F
	CMP #$03
	BCC bra6_979A
	LDY #$05
	STY ReznorsDefeated
bra6_979A:
	TYA
	STA GuidedObjStatus,X
	LDA #$00
	STA $0641,X
bra6_97A3_RTS:
	RTS
	LDX $A4
	LDA ObjectVariables,X
	BMI bra6_97AE
	JMP loc6_9831
bra6_97AE:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_97CA
	CMP #$FF
	BEQ bra6_97CA
	JMP $A6B5	;unlogged
bra6_97CA:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_980C
	LDA $05DC,X
	BPL bra6_97FB
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_980C
bra6_97FB:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra6_980C:
loc6_980C:
	LDA FreezeFlag
	BEQ bra6_9812
	.byte $60
bra6_9812:
	LDA ObjectSlot,X
	CMP #$71
	BNE bra6_981E
	LDA #$A7
	STA $03C8
bra6_981E:
	LDA #$00
	STA ObjectVariables,X
	LDY #$80
	LDA $05B4,X
	BMI bra6_982C
	LDY #$C0
bra6_982C:
	TYA
	STA GuidedObjStatus,X
	RTS
loc6_9831:
	JSR sub6_92D0
	JSR sub6_9981
	BEQ bra6_9845
	CMP #$02
	BEQ bra6_9845
	LDA GuidedObjStatus,X
	EOR #$40
	STA GuidedObjStatus,X
bra6_9845:
	JSR sub6_9997
	BEQ bra6_9856
	CMP #$02
	BEQ bra6_9856
	LDA GuidedObjStatus,X
	EOR #$80
	STA GuidedObjStatus,X
bra6_9856:
	LDA GuidedObjStatus,X
	AND #$40
	BEQ bra6_9860
	JMP loc6_98EB
bra6_9860:
	LDA #$01
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra6_9874
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra6_9879
bra6_9874:
	LDA ObjectXScreen,X	;unlogged
	SBC #$00	;unlogged
bra6_9879:
	STA ObjectXScreen,X
	LDA GuidedObjStatus,X
	AND #$80
	BNE bra6_98B7
	LDA #$FF
	BMI bra6_98A0
	CLC	;unlogged
	ADC ObjectYPos,X	;unlogged
	STA ObjectYPos,X	;unlogged
	BCS bra6_9894	;unlogged
	CMP #$F0	;unlogged
	BCC bra6_98B2	;unlogged
bra6_9894:
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,X	;unlogged
	INC ObjectYScreen,X	;unlogged
	JMP $98B2	;unlogged
bra6_98A0:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_98B2
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra6_98B2:
	LDY #$34
	JMP loc6_9972
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
	CLC	;unlogged
	ADC ObjectYPos,X	;unlogged
	STA ObjectYPos,X	;unlogged
	BCS bra6_98E6	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYPos,X	;unlogged
	DEC ObjectYScreen,X	;unlogged
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
	LDA ObjectXScreen,X	;unlogged
	ADC #$00	;unlogged
	BPL bra6_9904	;unlogged
bra6_98FF:
	LDA ObjectXScreen,X
	SBC #$00
bra6_9904:
	STA ObjectXScreen,X
	LDA GuidedObjStatus,X
	AND #$80
	BNE bra6_9941
	LDA #$FF
	BMI bra6_992B
	CLC	;unlogged
	ADC ObjectYPos,X	;unlogged
	STA ObjectYPos,X	;unlogged
	BCS bra6_991F	;unlogged
	CMP #$F0	;unlogged
	BCC bra6_993D	;unlogged
bra6_991F:
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,X	;unlogged
	INC ObjectYScreen,X	;unlogged
	JMP $993D	;unlogged
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
	CLC	;unlogged routine
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
	AND #$04
	BEQ bra6_997A
	INY
bra6_997A:
	TYA
	STA EnemyAnimFrame,X
	JMP loc6_9BEA
sub6_9981:
	STY $2B
	LDA GuidedObjStatus,X
	AND #$40
	BEQ bra6_998E
	LDA #$00
	BEQ bra6_9990
bra6_998E:
	LDA #$10
bra6_9990:
	STA $36
	LDA #$08
	JMP $B08D
sub6_9997:
	STY $2B
	LDA #$08
	STA $36
	LDA GuidedObjStatus,X
	AND #$80
	BEQ bra6_99A6
	LDA #$10
bra6_99A6:
	JMP $B08D
	JSR sub6_99EF
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_99D7,X
	STA Data0
	LDA tbl6_99D8,X
	STA Data0+1
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
	JSR $A118
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
	JSR $A5D0
	PLA
	PLA
bra6_99FF_RTS:
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_9A1E
	CMP #$FF
	BEQ bra6_9A1E
	JMP $A6B5
bra6_9A1E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_9A60
	LDA $05DC,X
	BPL bra6_9A4F
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_9A60
bra6_9A4F:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra6_9A60:
loc6_9A60:
	LDA $06DF
	BEQ bra6_9A6C
	LDA #$02
	STA GuidedObjStatus,X
	BNE bra6_9A6F
bra6_9A6C:
	JSR $BD3D
bra6_9A6F:
	LDA GuidedObjStatus,X
	ASL
	TAY
	LDA tbl6_9A81,Y
	STA Data0
	LDA tbl6_9A82,Y
	STA Data0+1
	JMP (Data0)
tbl6_9A81:
	.byte $87
tbl6_9A82:
	.byte $9A
	.byte $DF
	.byte $9A
	.byte $7B
	.byte $9B
	LDA #$FF
	BMI bra6_9AA4
	CLC	;unlogged
	ADC ObjectYPos,X	;unlogged
	STA ObjectYPos,X	;unlogged
	BCS bra6_9A98	;unlogged
	CMP #$F0	;unlogged
	BCC bra6_9AB6	;unlogged
bra6_9A98:
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,X	;unlogged
	INC ObjectYScreen,X	;unlogged
	JMP $9AB6	;unlogged
bra6_9AA4:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra6_9AB6
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYPos,X	;unlogged
	DEC ObjectYScreen,X	;unlogged
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
	INC $0641,X
	LDA $0641,X
	CMP #$10
	BCC bra6_9ADE_RTS
	LDA ObjectYPos,X
	CLC
	ADC #$12
	STA $06DE
	INC GuidedObjStatus,X
bra6_9ADE_RTS:
	RTS
	LDA #$FF
	BMI bra6_9AFC
	CLC	;unlogged start
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
	JMP $9B0E	;unlogged end
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
	JSR $B7A2
	BEQ bra6_9B28
	LDA #$00
	STA FreezeFlag
	INC GuidedObjStatus,X
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
	STA PlayerWallColPos
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
	LDA #$02
	STA EnemyAnimFrame,X
	LDA Player1YoshiStatus
	BNE bra6_9BD6_RTS
	LDA PlayerHoldFlag
	BNE bra6_9BD6_RTS
	LDA $05B4,X
	BPL bra6_9B99
	LDA #$10
	CLC
	ADC $05A0,X
	BCS bra6_9BA0
	BCC bra6_9BD7
bra6_9B99:
	LDA $05A0,X
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
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra6_9C06
	CMP #$FF
	BEQ bra6_9C06
	JMP $A6B5
bra6_9C06:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra6_9C48
	LDA $05DC,X
	BPL bra6_9C37
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc6_9C48
bra6_9C37:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra6_9C48:
loc6_9C48:
	LDA FreezeFlag
	BEQ bra6_9C4E_RTS
	RTS	;unlogged
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
	LDA PlayerBehindColl
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
