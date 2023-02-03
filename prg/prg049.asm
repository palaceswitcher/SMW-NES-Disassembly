;disassembled by BZK 6502 Disassembler
ptr6_8000:
	LDA $062B
	AND #$01
	BEQ bra5_8008
	RTS
bra5_8008:
	LDX $A4
	LDA EnemyAnimFrame,X
	BNE bra5_8010
	RTS
bra5_8010:
	AND #$3F
	ASL
	TAX
	LDA tbl5_805E,X
	STA $32
	LDA tbl5_805E+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra5_802B
	LDY #$C0
bra5_802B:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr6_8039:
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl5_805E,X
	STA $32
	LDA tbl5_805E+1,X
	STA $33
	LDA #$80
	STA $36
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl5_805E:
	.word ofs2_80CE
	.word ofs2_8278
	.word ofs2_828F
	.word ofs2_82A6
	.word ofs2_82AD
	.word ofs2_82B4
	.word ofs2_82BB
	.word ofs2_821B
	.word ofs2_8222
	.word ofs2_8229
	.word ofs2_8230
	.word ofs2_8237
	.word ofs2_823E
	.word ofs2_8245
	.word ofs2_824C
	.word ofs2_8253
	.word ofs2_825A
	.word ofs2_8210
	.word ofs2_81E2
	.word ofs2_81E2
	.word ofs2_81F1
	.word ofs2_81FE
	.word ofs2_8207
	.word ofs2_81D4
	.word ofs2_81DB
	.word ofs2_80D2
	.word ofs2_80DF
	.word ofs2_80EC
	.word ofs2_8120
	.word ofs2_8137
	.word ofs2_814E
	.word ofs2_8165
	.word ofs2_818A
	.word ofs2_81AF
	.word ofs2_80F9
	.word ofs2_8106
	.word ofs2_8113
	.word ofs2_80D2
	.word ofs2_80DF
	.word ofs2_80EC
	.word ofs2_8261
	.word ofs2_80B4
	.word ofs2_80C3
ofs2_80B4:
	.byte $06
	.byte $02
	.byte $A4
	.byte $32
	.byte $33
	.byte $32
	.byte $33
	.byte $32
	.byte $33
	.byte $34
	.byte $35
	.byte $34
	.byte $35
	.byte $34
	.byte $35
ofs2_80C3:
	.byte $02
	.byte $04
	.byte $AB
	.byte $38
	.byte $39
	.byte $3A
	.byte $3B
	.byte $3C
	.byte $3D
	.byte $3E
	.byte $3F
ofs2_80CE:
	.byte $01
	.byte $01
	.byte $95
	.byte $FF
ofs2_80D2:
	.byte $02
	.byte $05
	.byte $95
	.byte $01
	.byte $02
	.byte $05
	.byte $06
	.byte $09
	.byte $0A
	.byte $0D
	.byte $0E
	.byte $13
	.byte $14
ofs2_80DF:
	.byte $02
	.byte $05
	.byte $95
	.byte $03
	.byte $04
	.byte $07
	.byte $08
	.byte $0B
	.byte $0C
	.byte $0F
	.byte $10
	.byte $15
	.byte $16
ofs2_80EC:
	.byte $02
	.byte $05
	.byte $95
	.byte $03
	.byte $04
	.byte $07
	.byte $08
	.byte $0B
	.byte $0C
	.byte $11
	.byte $12
	.byte $15
	.byte $16
ofs2_80F9:
	.byte $02
	.byte $05
	.byte $95
	.byte $13
	.byte $14
	.byte $0D
	.byte $0E
	.byte $09
	.byte $0A
	.byte $05
	.byte $06
	.byte $01
	.byte $02
ofs2_8106:
	.byte $02
	.byte $05
	.byte $95
	.byte $15
	.byte $16
	.byte $0F
	.byte $10
	.byte $0B
	.byte $0C
	.byte $07
	.byte $08
	.byte $03
	.byte $04
ofs2_8113:
	.byte $02
	.byte $05
	.byte $95
	.byte $15
	.byte $16
	.byte $11
	.byte $12
	.byte $0B
	.byte $0C
	.byte $07
	.byte $08
	.byte $03
	.byte $04
ofs2_8120:
	.byte $02
	.byte $0A
	.byte $95
	.byte $1B
	.byte $1C
	.byte $13
	.byte $14
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1F
	.byte $FF
ofs2_8137:
	.byte $02
	.byte $0A
	.byte $95
	.byte $17
	.byte $18
	.byte $15
	.byte $16
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1F
	.byte $FF
ofs2_814E:
	.byte $02
	.byte $0A
	.byte $95
	.byte $19
	.byte $1A
	.byte $15
	.byte $16
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1F
	.byte $FF
ofs2_8165:
	.byte $02
	.byte $11
	.byte $95
	.byte $1B
	.byte $1C
	.byte $13
	.byte $14
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1F
	.byte $FF
ofs2_818A:
	.byte $02
	.byte $11
	.byte $95
	.byte $17
	.byte $18
	.byte $15
	.byte $16
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1F
	.byte $FF
ofs2_81AF:
	.byte $02
	.byte $11
	.byte $95
	.byte $19
	.byte $1A
	.byte $15
	.byte $16
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1E
	.byte $FF
	.byte $1F
	.byte $FF
ofs2_81D4:
	.byte $02
	.byte $02
	.byte $A4
	.byte $2E
	.byte $2F
	.byte $30
	.byte $31
ofs2_81DB:
	.byte $02
	.byte $02
	.byte $A4
	.byte $2A
	.byte $2B
	.byte $2C
	.byte $2D
ofs2_81E2:
	.byte $06
	.byte $02
	.byte $A4
	.byte $39
	.byte $3A
	.byte $3A
	.byte $3A
	.byte $3A
	.byte $3B
	.byte $3C
	.byte $3D
	.byte $3D
	.byte $3D
	.byte $3D
	.byte $3E
ofs2_81F1:
	.byte $05
	.byte $02
	.byte $A4
	.byte $24
	.byte $25
	.byte $25
	.byte $25
	.byte $26
	.byte $27
	.byte $28
	.byte $28
	.byte $28
	.byte $29
ofs2_81FE:
	.byte $03
	.byte $02
	.byte $A4
	.byte $01
	.byte $02
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $0D
ofs2_8207:
	.byte $03
	.byte $02
	.byte $A4
	.byte $03
	.byte $04
	.byte $FF
	.byte $0E
	.byte $0C
	.byte $0F
ofs2_8210:
	.byte $02
	.byte $04
	.byte $94
	.byte $14
	.byte $15
	.byte $20
	.byte $21
	.byte $2F
	.byte $30
	.byte $3B
	.byte $3C
ofs2_821B:
	.byte $02
	.byte $02
	.byte $97
	.byte $2C
	.byte $2D
	.byte $32
	.byte $33
ofs2_8222:
	.byte $02
	.byte $02
	.byte $97
	.byte $2E
	.byte $2F
	.byte $34
	.byte $35
ofs2_8229:
	.byte $02
	.byte $02
	.byte $97
	.byte $38
	.byte $39
	.byte $3C
	.byte $3D
ofs2_8230:
	.byte $02
	.byte $02
	.byte $97
	.byte $3A
	.byte $3B
	.byte $3E
	.byte $3F
ofs2_8237:
	.byte $02
	.byte $02
	.byte $97
	.byte $30
	.byte $31
	.byte $36
	.byte $37
ofs2_823E:
	.byte $02
	.byte $02
	.byte $97
	.byte $32
	.byte $33
	.byte $2C
	.byte $2D
ofs2_8245:
	.byte $02
	.byte $02
	.byte $97
	.byte $34
	.byte $35
	.byte $2E
	.byte $2F
ofs2_824C:
	.byte $02
	.byte $02
	.byte $97
	.byte $3C
	.byte $3D
	.byte $38
	.byte $39
ofs2_8253:
	.byte $02
	.byte $02
	.byte $97
	.byte $3E
	.byte $3F
	.byte $3A
	.byte $3B
ofs2_825A:
	.byte $02
	.byte $02
	.byte $97
	.byte $36
	.byte $37
	.byte $30
	.byte $31
ofs2_8261:
	.byte $04
	.byte $05
	.byte $B6
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $8B
	.byte $8C
	.byte $8D
	.byte $8E
	.byte $99
	.byte $9A
	.byte $9B
	.byte $9C
	.byte $A7
	.byte $A8
	.byte $A9
	.byte $AA
	.byte $B2
	.byte $B3
	.byte $B3
	.byte $B4
ofs2_8278:
	.byte $04
	.byte $05
	.byte $B6
	.byte $84
	.byte $85
	.byte $86
	.byte $FF
	.byte $8F
	.byte $90
	.byte $91
	.byte $92
	.byte $9D
	.byte $9E
	.byte $9F
	.byte $A0
	.byte $AB
	.byte $AC
	.byte $AD
	.byte $AA
	.byte $B2
	.byte $B3
	.byte $B3
	.byte $B4
ofs2_828F:
	.byte $04
	.byte $05
	.byte $B6
	.byte $87
	.byte $88
	.byte $89
	.byte $8A
	.byte $93
	.byte $94
	.byte $95
	.byte $96
	.byte $A1
	.byte $A2
	.byte $A3
	.byte $A4
	.byte $AE
	.byte $AF
	.byte $B0
	.byte $B1
	.byte $B2
	.byte $B3
	.byte $B3
	.byte $B4
ofs2_82A6:
	.byte $02
	.byte $02
	.byte $B6
	.byte $97
	.byte $98
	.byte $A5
	.byte $A6
ofs2_82AD:
	.byte $02
	.byte $02
	.byte $B6
	.byte $A5
	.byte $A6
	.byte $97
	.byte $98
ofs2_82B4:
	.byte $04
	.byte $01
	.byte $B6
	.byte $B2
	.byte $B3
	.byte $B3
	.byte $B4
ofs2_82BB:
	.byte $04
	.byte $04
	.byte $B6
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $8B
	.byte $8C
	.byte $8D
	.byte $8E
	.byte $99
	.byte $9A
	.byte $9B
	.byte $9C
	.byte $A7
	.byte $A8
	.byte $A9
	.byte $AA
obj_h78:
	JSR sub5_82EC
	LDA FrameCount
	AND #$00
	BNE bra5_82DC
	LDA #$2C
	JSR jmp_54_B11D
bra5_82DC:
	LDY #$03
	LDA $062B
	AND #$04
	BEQ bra5_82E7
	LDY #$C4
bra5_82E7:
	TYA
	STA EnemyAnimFrame,X
	RTS
sub5_82EC:
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
	BEQ bra5_830E
	CMP #$FF
	BEQ bra5_830E
	JMP loc3_A6B5
bra5_830E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_8350
	LDA ObjYScreenDistance,X
	BPL bra5_833F
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_8350
bra5_833F:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_8350:
loc5_8350:
	LDA FreezeFlag
	BEQ bra5_8356
	RTS
bra5_8356:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_836A,Y
	STA $32
	LDA tbl5_836A+1,Y
	STA $33
	JMP ($32)
tbl5_836A:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr10_8372
ptr10_8372:
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
obj_h77:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_8397
	CMP #$FF
	BEQ bra5_8397
	JMP loc3_A6B5
bra5_8397:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_83D9
	LDA ObjYScreenDistance,X
	BPL bra5_83C8
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_83D9
bra5_83C8:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_83D9:
loc5_83D9:
	LDA FreezeFlag
	BEQ bra5_83DF
	RTS
bra5_83DF:
	LDA ObjectVariables,X
	BPL bra5_844D
	LDA #$00
	STA ReznorsDefeated
	STA ObjectVariables,X
	LDY ObjectCount
	INC ObjectCount
	INC ObjectCount
	LDA #$18
	STA ObjectVariables,Y
	LDA #$40
	STA $0641,Y
	LDA #$0C
	STA $0579,Y
	LDA #$80
	STA $0642,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	STA ObjectXScreen+1,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	STA ObjectYScreen+1,Y
	LDA ObjectXPos,X
	CLC
	ADC #$27
	STA ObjectXPos,Y
	LDA ObjectXPos,X
	SEC
	SBC #$2A
	STA ObjectXPos+1,Y
	LDA ObjectYPos,X
	CLC
	ADC #$45
	STA ObjectYPos,Y
	STA ObjectYPos+1,Y
	LDA #$77
	STA ObjectSlot,Y
	STA ObjectSlot+1,Y
	LDA #$00
	STA ObjectState,Y
	STA ObjectState+1,Y
	STA ObjectAction,Y
	STA ObjectAction+1,Y
	RTS
bra5_844D:
	JSR sub5_85C6
	LDA ObjectAction,X
	ASL
	TAY
	LDA tbl5_8462,Y
	STA $32
	LDA tbl5_8462+1,Y
	STA $33
	JMP ($32)
tbl5_8462:
	.word ptr10_8470
	.word ptr10_8494
	.word ptr10_84B5
	.word ptr10_84E7
	.word ptr10_851D
	.word ptr10_8553
	.word ptr10_8564
ptr10_8470:
	LDA FrameCount
	AND #$07
	BNE bra5_847B
	LDA #$2B
	JSR jmp_54_B470
bra5_847B:
	JSR sub5_8580
	LDA #$68
	STA EnemyAnimFrame,X
	LDA ObjXScreenDistance,X
	BPL bra5_8493_RTS
	LDA #$00
	STA $0641,X
	INC ObjectAction,X
	INC ObjectAction,X
bra5_8493_RTS:
	RTS
ptr10_8494:
	LDA FrameCount
	AND #$07
	BNE bra5_849F
	LDA #$2B
	JSR jmp_54_B470
bra5_849F:
	JSR sub5_8580
	LDA #$28
	STA EnemyAnimFrame,X
	LDA ObjXScreenDistance,X
	BMI bra5_84B4_RTS
	LDA #$00
	STA $0641,X
	INC ObjectAction,X
bra5_84B4_RTS:
	RTS
ptr10_84B5:
	LDA FrameCount
	AND #$07
	BNE bra5_84C0
	LDA #$2B
	JSR jmp_54_B470
bra5_84C0:
	LDA #$02
	STA EnemyAnimFrame,X
	LDA $0641,X
	CMP #$20
	BCS bra5_84D0
	INC $0641,X
	RTS
bra5_84D0:
	LDA ObjXScreenDistance,X
	BMI bra5_84DE
	LDA #$00
	STA ObjectAction,X
	STA $0641,X
	RTS
bra5_84DE:
	LDA #$00
	STA $0641,X
	DEC ObjectAction,X
	RTS
ptr10_84E7:
	LDA FrameCount
	AND #$07
	BNE bra5_84F2
	LDA #$2B
	JSR jmp_54_B470
bra5_84F2:
	LDA #$41
	STA EnemyAnimFrame,X
	INC $0641,X
	LDA $0641,X
	CMP #$20
	BEQ bra5_8514
	CMP #$40
	BCC bra5_8513_RTS
	LDA #$00
	STA $0641,X
	DEC ObjectAction,X
	DEC ObjectAction,X
	DEC ObjectAction,X
bra5_8513_RTS:
	RTS
bra5_8514:
	JSR sub5_8599
	LDA #$40
	STA ObjectState,Y
	RTS
ptr10_851D:
	LDA FrameCount
	AND #$07
	BNE bra5_8528
	LDA #$2B
	JSR jmp_54_B470
bra5_8528:
	LDA #$01
	STA EnemyAnimFrame,X
	INC $0641,X
	LDA $0641,X
	CMP #$20
	BEQ bra5_854A
	CMP #$40
	BCC bra5_854E_RTS
	LDA #$00
	STA $0641,X
	DEC ObjectAction,X
	DEC ObjectAction,X
	DEC ObjectAction,X
bra5_854E_RTS:
	RTS
bra5_854A:
	JSR sub5_8599
	LDA #$00
	STA ObjectState,Y
	RTS
ptr10_8553:
	LDA FrameCount
	AND #$07
	BNE bra5_855E
	LDA #$2B
	JSR jmp_54_B470
bra5_855E:
	LDA #$05
	STA EnemyAnimFrame,X
	RTS
ptr10_8564:
	LDA #$06
	STA EnemyAnimFrame,X
	LDA ReznorsDefeated
	CMP #$03
	BCC bra5_857F_RTS
	LDA ObjectYPos,X
	CMP #$B0
	BCC bra5_857F_RTS
	LDA #$23
	STA MusicRegister
	LDA #$09
	STA Event
bra5_857F_RTS:
	RTS
sub5_8580:
	INC $0641,X
	LDA $0641,X
	CMP #$E0
	BCC bra5_8598_RTS
	LDA #$00
	STA $0641,X
	INC ObjectAction,X
	INC ObjectAction,X
	INC ObjectAction,X
bra5_8598_RTS:
	RTS
sub5_8599:
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	LDA #$78
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectVariables,Y
	STA $0641,Y
	STA ObjectAction,Y
	RTS
sub5_85C6:
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
	BEQ bra5_85E8
	CMP #$FF
	BEQ bra5_85E8
	JMP loc3_A6B5
bra5_85E8:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_862A
	LDA ObjYScreenDistance,X
	BPL bra5_8619
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_862A
bra5_8619:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_862A:
loc5_862A:
	LDA FreezeFlag
	BEQ bra5_8630
	RTS
bra5_8630:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8644,Y
	STA $32
	LDA tbl5_8644+1,Y
	STA $33
	JMP ($32)
tbl5_8644:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr10_864E
	.word ptr_AD88
ptr10_864E:
	LDX $A4
	LDA ObjectAction,X
	CMP #$05
	BCS bra5_86BC_RTS
	JSR sub5_86BD
	JSR sub5_86C6
	LDA PlayerMovement
	AND #$04
	BEQ bra5_86BC_RTS
	LDA #$F7
	STA InvincibilityTimer
	LDA PlayerMovement
	AND #$FB
	STA PlayerMovement
	LDA #$30
	STA PlayerYSpeed
	LDA #$0F
	STA SFXRegister
	LDA #$05
	STA ObjectAction,X
	LDA #$00
	STA $0641,X
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectYPos,X
	CLC
	ADC #$20
	STA ObjectYPos,X
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	LDA #$77
	STA ObjectSlot,Y
	LDA #$04
	STA ObjectState,Y
	LDA #$00
	STA ObjectVariables,Y
	LDA #$06
	STA ObjectAction,Y
	INC ReznorsDefeated
bra5_86BC_RTS:
	RTS
sub5_86BD:
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	PLA
	PLA
	RTS
sub5_86C6:
	LDA ObjXScreenDistance,X
	BPL bra5_86D8
	LDA #$08
	CLC
	ADC #$20
	CLC
	ADC ObjectXDistance,X
	BCS bra5_86DF
	BCC bra5_86FF
bra5_86D8:
	LDA ObjectXDistance,X
	CMP #$08
	BCS bra5_86FF
bra5_86DF:
	LDA ObjYScreenDistance,X
	BEQ bra5_86F5
	CMP #$FF
	BNE bra5_86FF
	LDA #$10
	CLC
	ADC #$28
	CLC
	ADC ObjectYDistance,X
	BCS bra5_86FC
	BCC bra5_86FF
bra5_86F5:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra5_86FF
bra5_86FC:
	CLC
	BCC bra5_8700
bra5_86FF:
	SEC
bra5_8700:
	BCC bra5_870C_RTS
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	PLA
	PLA
bra5_870C_RTS:
	RTS
obj_h4A:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra5_8786
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_8730
	CMP #$FF
	BEQ bra5_8730
	JMP loc3_A6B5
bra5_8730:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_8772
	LDA ObjYScreenDistance,X
	BPL bra5_8761
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_8772
bra5_8761:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_8772:
loc5_8772:
	LDA FreezeFlag
	BEQ bra5_8778
	RTS
bra5_8778:
	LDA #$00
	STA ObjectAction,X
	JSR jmp_54_B5BB
	LDA #$47
	STA EnemyAnimFrame,X
	RTS
bra5_8786:
	JSR sub5_8A0D
	LDX $A4
	LDA ObjectAction,X
	ASL
	TAY
	LDA tbl5_879D,Y
	STA $32
	LDA tbl5_879D+1,Y
	STA $33
	JMP ($32)
tbl5_879D:
	.word ptr10_87A5
	.word ptr10_8814
	.word ptr10_8889
	.word ptr10_88FA
ptr10_87A5:
	LDA EnemyAnimFrame,X
	AND #$4F
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	BNE bra5_87E4
	LDA #$02
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_87D0
	LDA #$11
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_87D0
	LDA #$01
	STA ObjectAction,X
	RTS
bra5_87D0:
	LDA #$0E
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_87E1
	LDA #$03
	STA ObjectAction,X
	RTS
bra5_87E1:
	JMP loc5_89D4
bra5_87E4:
	LDA #$0E
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_8800
	LDA #$FF
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_8800
	LDA #$03
	STA ObjectAction,X
	RTS
bra5_8800:
	LDA #$00
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_8811
	LDA #$01
	STA ObjectAction,X
	RTS
bra5_8811:
	JMP loc5_89B2
ptr10_8814:
	LDA EnemyAnimFrame,X
	AND #$CF
	ORA #$40
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	BNE bra5_8855
	LDA #$FB
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BNE bra5_8841
	LDA #$FB
	STA $36
	LDA #$11
	JSR sub3_B7A2
	BNE bra5_8841
	LDA #$02
	STA ObjectAction,X
	RTS
bra5_8841:
	LDA #$08
	STA $36
	LDA #$10
	JSR sub3_B7A2
	BEQ bra5_8852
	LDA #$00
	STA ObjectAction,X
	RTS
bra5_8852:
	JMP loc5_898B
bra5_8855:
	LDA #$FB
	STA $36
	LDA #$0E
	JSR sub3_B7A2
	BNE bra5_8871
	LDA #$FB
	STA $36
	LDA #$FF
	JSR sub3_B7A2
	BNE bra5_8871
	LDA #$00
	STA ObjectAction,X
	RTS
bra5_8871:
	LDA #$08
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BEQ bra5_8886
	LDA #$0E
	STA SFXRegister
	LDA #$02
	STA ObjectAction,X
	RTS
bra5_8886:
	JMP loc5_8969
ptr10_8889:
	LDA EnemyAnimFrame,X
	AND #$CF
	ORA #$80
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	BNE bra5_88CA
	LDA #$10
	STA $36
	LDA #$F8
	JSR sub3_B7A2
	BNE bra5_88B6
	LDA #$FF
	STA $36
	LDA #$F8
	JSR sub3_B7A2
	BNE bra5_88B6
	LDA #$03
	STA ObjectAction,X
	RTS
bra5_88B6:
	LDA #$00
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_88C7
	LDA #$01
	STA ObjectAction,X
	RTS
bra5_88C7:
	JMP loc5_89B2
bra5_88CA:
	LDA #$00
	STA $36
	LDA #$FB
	JSR sub3_B7A2
	BNE bra5_88E6
	LDA #$0F
	STA $36
	LDA #$FB
	JSR sub3_B7A2
	BNE bra5_88E6
	LDA #$01
	STA ObjectAction,X
	RTS
bra5_88E6:
	LDA #$0F
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_88F7
	LDA #$03
	STA ObjectAction,X
	RTS
bra5_88F7:
	JMP loc5_89D4
ptr10_88FA:
	LDA EnemyAnimFrame,X
	AND #$8F
	STA EnemyAnimFrame,X
	LDA ObjectState,X
	AND #$40
	BNE bra5_8939
	LDA #$14
	STA $36
	LDA #$0E
	JSR sub3_B7A2
	BNE bra5_8925
	LDA #$14
	STA $36
	LDA #$FF
	JSR sub3_B7A2
	BNE bra5_8925
	LDA #$00
	STA ObjectAction,X
	RTS
bra5_8925:
	LDA #$08
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BEQ bra5_8936
	LDA #$02
	STA ObjectAction,X
	RTS
bra5_8936:
	JMP loc5_8969
bra5_8939:
	LDA #$14
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BNE bra5_8955
	LDA #$14
	STA $36
	LDA #$11
	JSR sub3_B7A2
	BNE bra5_8955
	LDA #$02
	STA ObjectAction,X
	RTS
bra5_8955:
	LDA #$08
	STA $36
	LDA #$0E
	JSR sub3_B7A2
	BEQ bra5_8966
	LDA #$00
	STA ObjectAction,X
	RTS
bra5_8966:
	JMP loc5_898B
loc5_8969:
	LDA $062B
	AND #$01
	BNE bra5_8981
	LDA ObjectYPos,X
	SEC
	SBC #$01
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
bra5_8981:
	LDY #$09
	LDA EnemyAnimFrame,X
	AND #$40
	JMP loc5_89AC
loc5_898B:
	LDA $062B
	AND #$01
	BNE bra5_89A3
	LDA ObjectYPos,X
	CLC
	ADC #$01
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,X
bra5_89A3:
	LDY #$0E
	LDA EnemyAnimFrame,X
	AND #$C0
	ORA #$80
loc5_89AC:
	STA EnemyAnimFrame,X
	JMP loc5_89FD
loc5_89B2:
	LDA $062B
	AND #$01
	BNE bra5_89CA
	LDA ObjectXPos,X
	SEC
	SBC #$01
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	SBC #$00
	STA ObjectXScreen,X
bra5_89CA:
	LDA EnemyAnimFrame,X
	AND #$80
	ORA #$40
	JMP loc5_89F1
loc5_89D4:
	LDA $062B
	AND #$01
	BNE bra5_89EC
	LDA ObjectXPos,X
	CLC
	ADC #$01
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,X
bra5_89EC:
	LDA EnemyAnimFrame,X
	AND #$80
loc5_89F1:
	STA EnemyAnimFrame,X
	LDY #$07
	LDA ObjectAction,X
	BEQ bra5_89FD
	LDY #$0C
bra5_89FD:
loc5_89FD:
	LDA $062B
	AND #$04
	BEQ bra5_8A05
	INY
bra5_8A05:
	TYA
	ORA EnemyAnimFrame,X
	STA EnemyAnimFrame,X
	RTS
sub5_8A0D:
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
	BEQ bra5_8A2F
	CMP #$FF
	BEQ bra5_8A2F
	JMP loc3_A6B5
bra5_8A2F:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_8A71
	LDA ObjYScreenDistance,X
	BPL bra5_8A60
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_8A71
bra5_8A60:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_8A71:
loc5_8A71:
	LDA FreezeFlag
	BEQ bra5_8A77
	RTS
bra5_8A77:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8A8B,Y
	STA $32
	LDA tbl5_8A8B+1,Y
	STA $33
	JMP ($32)
tbl5_8A8B:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr10_8A95
	.word ptr_AD88
ptr10_8A95:
	JSR jmp_54_A6D4
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
obj_h4E:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra5_8AA9
	JMP loc5_8B21
bra5_8AA9:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_8AC5
	CMP #$FF
	BEQ bra5_8AC5
	JMP loc3_A6B5
bra5_8AC5:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_8B07
	LDA ObjYScreenDistance,X
	BPL bra5_8AF6
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_8B07
bra5_8AF6:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_8B07:
loc5_8B07:
	LDA FreezeFlag
	BEQ bra5_8B0D
	RTS
bra5_8B0D:
	LDA ObjectVariables,X
	CMP #$80
	BNE bra5_8B1D
	JSR jmp_54_B5BB
	LDA #$11
	STA EnemyAnimFrame,X
	RTS
bra5_8B1D:
	JSR sub_54_B4FC
	RTS
loc5_8B21:
	JSR sub5_8C27
	LDA ObjectSlot,X
	CMP #$50
	BCS bra5_8B83
	LDA ObjectState,X
	AND #$40
	BNE bra5_8B59
	LDA #$18
	STA $36
	LDA #$18
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8B48
	LDA ObjectState,X
	ORA #$40
	STA ObjectState,X
	RTS
bra5_8B48:
	LDA ObjectXPos,X
	CLC
	ADC #$01
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
	JMP loc5_8B7D
bra5_8B59:
	LDA #$F8
	STA $36
	LDA #$18
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8B6F
	LDA ObjectState,X
	AND #$BF
	STA ObjectState,X
	RTS
bra5_8B6F:
	LDA ObjectXPos,X
	SEC
	SBC #$01
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	SBC #$00
loc5_8B7D:
	STA ObjectXScreen,X
	JMP loc5_8C17
bra5_8B83:
	LDA ObjectState,X
	AND #$80
	BNE bra5_8BD2
	LDA #$08
	STA $36
	LDA #$28
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8BA0
	LDA ObjectState,X
	ORA #$80
	STA ObjectState,X
	RTS
bra5_8BA0:
	LDA #$01
	BMI bra5_8BBD
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra5_8BB1
	CMP #$F0
	BCC bra5_8BCF
bra5_8BB1:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc5_8BCF
bra5_8BBD:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra5_8BCF
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra5_8BCF:
loc5_8BCF:
	JMP loc5_8C17
bra5_8BD2:
	LDA #$08
	STA $36
	LDA #$00
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8BE8
	LDA ObjectState,X
	AND #$7F
	STA ObjectState,X
	RTS
bra5_8BE8:
	LDA #$FF
	BMI bra5_8C05
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra5_8BF9
	CMP #$F0
	BCC bra5_8C17
bra5_8BF9:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc5_8C17
bra5_8C05:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra5_8C17
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra5_8C17:
loc5_8C17:
	LDA $062B
	AND #$07
	BNE bra5_8C26_RTS
	LDA EnemyAnimFrame,X
	EOR #$40
	STA EnemyAnimFrame,X
bra5_8C26_RTS:
	RTS
sub5_8C27:
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
	BEQ bra5_8C49
	CMP #$FF
	BEQ bra5_8C49
	JMP loc3_A6B5
bra5_8C49:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_8C8B
	LDA ObjYScreenDistance,X
	BPL bra5_8C7A
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_8C8B
bra5_8C7A:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_8C8B:
loc5_8C8B:
	LDA FreezeFlag
	BEQ bra5_8C91
	RTS ;unlogged
bra5_8C91:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8CA5,Y
	STA $32
	LDA tbl5_8CA5+1,Y
	STA $33
	JMP ($32)
tbl5_8CA5:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr10_8CAF
	.word ptr_AD88
ptr10_8CAF:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	LDA #sfxEnemyHit2
	STA SFXRegister
	LDA #$01
	JSR sub3_BCD4
	LDX $A4
	LDA #$81
	STA ObjectVariables,X
	LDA PlayerState
	CMP #$03
	BEQ bra5_8CDE
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$30
	STA PlayerXSpeed
bra5_8CDE:
	PLA
	PLA
	RTS
obj_h76:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_8CFF
	CMP #$FF
	BEQ bra5_8CFF
	JMP loc3_A6B5
bra5_8CFF:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_8D41
	LDA ObjYScreenDistance,X
	BPL bra5_8D30
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_8D41
bra5_8D30:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_8D41:
loc5_8D41:
	LDA FreezeFlag
	BEQ bra5_8D47
	RTS
bra5_8D47:
	LDA ObjectVariables,X
	BPL bra5_8D5A
	LDA #$00
	STA ObjectVariables,X
	STA ONOFFBlockFlag
	LDA #$57
	STA EnemyAnimFrame,X
	RTS
bra5_8D5A:
	JSR sub5_8D67
	LDA ONOFFBlockFlag
	CLC
	ADC #$57
	STA EnemyAnimFrame,X
	RTS
sub5_8D67:
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
	BEQ bra5_8D89
	CMP #$FF
	BEQ bra5_8D89
	JMP loc3_A6B5
bra5_8D89:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_8DCB
	LDA ObjYScreenDistance,X
	BPL bra5_8DBA
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_8DCB
bra5_8DBA:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_8DCB:
loc5_8DCB:
	LDA FreezeFlag
	BEQ bra5_8DD1
	RTS
bra5_8DD1:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8DE5,Y
	STA $32
	LDA tbl5_8DE5+1,Y
	STA $33
	JMP ($32)
tbl5_8DE5:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr10_8DED
ptr10_8DED:
	LDA ObjXScreenDistance,X
	BPL bra5_8DFF
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra5_8E06
	BCC bra5_8E26
bra5_8DFF:
	LDA ObjectXDistance,X
	CMP #$08
	BCS bra5_8E26
bra5_8E06:
	LDA ObjYScreenDistance,X
	BEQ bra5_8E1C
	CMP #$FF
	BNE bra5_8E26
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC ObjectYDistance,X
	BCS bra5_8E23
	BCC bra5_8E26
bra5_8E1C:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra5_8E26
bra5_8E23:
	CLC
	BCC bra5_8E27
bra5_8E26:
	SEC
bra5_8E27:
	BCC bra5_8E32
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	RTS
bra5_8E32:
	LDA PlayerMovement
	AND #$04
	BEQ bra5_8E4E_RTS
	LDA ONOFFBlockFlag
	EOR #$01
	STA ONOFFBlockFlag
	LDA PlayerMovement
	AND #$FB
	STA PlayerMovement
	LDA #$20
	STA PlayerYSpeed
	LDA #$16
	STA SFXRegister
bra5_8E4E_RTS:
	RTS
obj_h54:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_8E6D
	CMP #$FF
	BEQ bra5_8E6D
	JMP loc3_A6B5
bra5_8E6D:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_8EAF
	LDA ObjYScreenDistance,X
	BPL bra5_8E9E
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_8EAF
bra5_8E9E:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_8EAF:
loc5_8EAF:
	LDA FreezeFlag
	BEQ bra5_8EB5
	RTS
bra5_8EB5:
	LDA ObjectVariables,X
	BMI bra5_8EBD
	JMP loc5_8F3F
bra5_8EBD:
	JSR jmp_54_B5BB
	LDA ObjectSlot,X
	CMP #$55
	BCC bra5_8EEB
	CMP #$56
	BEQ bra5_8F25
	CMP #$57
	BCC bra5_8F0D
	BEQ bra5_8EE2
	LDA ObjectXPos,X
	SEC
	SBC #$08
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	SBC #$00
	STA ObjectXScreen,X
bra5_8EE2:
	LDA ObjectYPos,X
	SEC
	SBC #$08
	JMP loc5_8F02
bra5_8EEB:
	LDA ObjectXPos,X
	SEC
	SBC #$07
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	SBC #$00
	STA ObjectXScreen,X
	LDA ObjectYPos,X
	SEC
	SBC #$04
loc5_8F02:
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
bra5_8F0D:
	LDY ObjectSlot,X
	CPY #$57
	BNE bra5_8F18
	LDY #$54
	BNE bra5_8F1E
bra5_8F18:
	CPY #$79
	BNE bra5_8F1E
	LDY #$57
bra5_8F1E:
	DEY
	DEY
	TYA
	STA EnemyAnimFrame,X
	RTS
bra5_8F25:
	LDA ObjectXPos,X
	CLC
	ADC #$04
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,X
	LDA ObjectYPos,X
	SEC
	SBC #$08
	JMP loc5_8F02
loc5_8F3F:
	LDY ObjectSlot,X
	CPY #$79
	BEQ bra5_8F7E
	CPY #$57
	BNE bra5_8F4C
	LDY #$54
bra5_8F4C:
	DEY
	DEY
	TYA
	STA EnemyAnimFrame,X
	LDA $058C,X
	LSR
	SEC
	SBC #$01
	TAY
	LDA tbl5_9263,Y
	CMP #$FF
	BNE bra5_8F62
	RTS
bra5_8F62:
	ASL
	TAY
	JSR jmp_54_B896
	LDY #$DA
	LDA ObjectSlot,X
	CMP #$58
	BCS bra5_8F78
	SEC
	SBC #$54
	TAY
	LDA tbl5_8FA5,Y
	TAY
bra5_8F78:
	STY $25
	JSR sub5_93A8
	RTS
bra5_8F7E:
	JSR sub5_82EC
	LDA $058C,X
	LSR
	SEC
	SBC #$18
	TAY
	LDA tbl5_9297,Y
	CMP #$FF
	BNE bra5_8F91
	RTS
bra5_8F91:
	ASL
	TAY
	JSR jmp_54_B896
	LDY #$55
	LDA $062B
	AND #$10
	BEQ bra5_8FA0
	INY
bra5_8FA0:
	TYA
	STA EnemyAnimFrame,X
	RTS
tbl5_8FA5:
	.byte $CA
	.byte $CA
	.byte $D6
	.byte $CA
obj_h5C:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_8FC7
	CMP #$FF
	BEQ bra5_8FC7
	JMP loc3_A6B5
bra5_8FC7:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_9009
	LDA ObjYScreenDistance,X
	BPL bra5_8FF8
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_9009
bra5_8FF8:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_9009:
loc5_9009:
	LDA FreezeFlag
	BEQ bra5_900F
	RTS
bra5_900F:
	LDA ObjectVariables,X
	BPL bra5_902C
	JSR jmp_54_B5BB
	LDA ObjectYPos,X
	SEC
	SBC #$08
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	JSR sub5_9056
	RTS
bra5_902C:
	LDA $062B
	AND #$07
	BNE bra5_9037
	LDA #$1D
	STA SFXRegister
bra5_9037:
	JSR sub5_92D7
	LDA $058C,X
	LSR
	SEC
	SBC #$03
	TAY
	LDA tbl5_92B7,Y
	CMP #$FF
	BNE bra5_904A
	RTS
bra5_904A:
	ASL
	TAY
	JSR jmp_54_B896
	JSR sub5_9522
	JSR sub5_9056
	RTS
sub5_9056:
	LDA ObjectSlot,X
	AND #$FE
	CMP #$60
	BNE bra5_9063
	LDA #$E2
	BNE bra5_9074
bra5_9063:
	LDA ObjectSlot,X
	AND #$FE
	SEC
	SBC #$5A
	STA $32
	LSR
	CLC
	ADC $32
	CLC
	ADC #$59
bra5_9074:
	STA $32
	LDA $062B
	AND #$18
	LSR
	LSR
	LSR
	TAY
	LDA tbl5_9089,Y
	CLC
	ADC $32
	STA EnemyAnimFrame,X
	RTS
tbl5_9089:
	.byte $00
	.byte $01
	.byte $00
	.byte $02
obj_h5A:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_90AB
	CMP #$FF
	BEQ bra5_90AB
	JMP loc3_A6B5
bra5_90AB:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_90ED
	LDA ObjYScreenDistance,X
	BPL bra5_90DC
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_90ED
bra5_90DC:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_90ED:
loc5_90ED:
	LDA FreezeFlag
	BEQ bra5_90F3
	RTS
bra5_90F3:
	LDA ObjectVariables,X
	BPL bra5_913D
	LDA ObjectSlot,X
	CMP #$62
	BCS bra5_9117
	JSR jmp_54_B5BB
	LDA ObjectYPos,X
	SEC
	SBC #$08
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	JSR sub5_9056
	RTS
bra5_9117:
	LDA ObjectXPos,X
	SEC
	SBC #$A0
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	SBC #$00
	STA ObjectXScreen,X
	LDA ObjectYPos,X
	SEC
	SBC #$08
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	JSR sub5_9056
	RTS
bra5_913D:
	LDA $062B
	AND #$07
	BNE bra5_9148
	LDA #sfxCutter
	STA SFXRegister
bra5_9148:
	JSR sub5_82EC
	LDA $058C,X
	LSR
	SEC
	SBC #$03
	TAY
	LDA tbl5_92B7,Y
	CMP #$FF
	BNE bra5_915B
	RTS
bra5_915B:
	ASL
	TAY
	JSR jmp_54_B896
	JSR sub5_9056
	RTS
obj_h66:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_9182
	CMP #$FF
	BEQ bra5_9182
	JMP loc3_A6B5
bra5_9182:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_91C4
	LDA ObjYScreenDistance,X
	BPL bra5_91B3
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_91C4
bra5_91B3:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_91C4:
loc5_91C4:
	LDA FreezeFlag
	BEQ bra5_91CA
	RTS
bra5_91CA:
	LDA $0635
	BNE bra5_91D5
	LDA #$00
	STA EnemyAnimFrame,X
	RTS
bra5_91D5:
	INC $067C
	LDA ObjectSlot,X
	CMP #$68
	BCS bra5_91F2
	LDA #$69
	STA EnemyAnimFrame,X
	LDA #$00
	STA $28
	STA $2B
	LDA #$CA
	STA $25
	JSR sub5_93A8
	RTS
bra5_91F2:
	LDA #$6A
	STA EnemyAnimFrame,X
	LDA ObjXScreenDistance,X
	BPL bra5_9209
	LDA #$00
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra5_9210
	BCC bra5_9230
bra5_9209:
	LDA ObjectXDistance,X
	CMP #$00
	BCS bra5_9230
bra5_9210:
	LDA ObjYScreenDistance,X
	BEQ bra5_9226
	CMP #$FF
	BNE bra5_9230
	LDA #$14
	CLC
	ADC #$20
	CLC
	ADC ObjectYDistance,X
	BCS bra5_922D
	BCC bra5_9230
bra5_9226:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra5_9230
bra5_922D:
	CLC
	BCC bra5_9231
bra5_9230:
	SEC
bra5_9231:
	BCS bra5_9262_RTS
	LDA $1E
	CMP #$08
	BNE bra5_9262_RTS
	LDA DataBank2
	CMP #$23
	BEQ bra5_9262_RTS
	LDA $1E
	CMP #$08
	BNE bra5_9262_RTS
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	ASL
	STA WarpLevelNumber
	LDA #$03
	STA Event
	LDA #$7E
	SEC
	SBC #$78
	ASL
	ASL
	ASL
	STA WarpNumber
bra5_9262_RTS:
	RTS
tbl5_9263:
	.byte $26
	.byte $01
	.byte $26
	.byte $05
	.byte $03
	.byte $04
	.byte $05
	.byte $05
	.byte $06
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $0B
	.byte $0C
	.byte $0D
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $22
	.byte $23
	.byte $23
	.byte $24
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $3E
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
tbl5_9297:
	.byte $07
	.byte $08
	.byte $09
	.byte $0A
	.byte $27
	.byte $28
	.byte $29
	.byte $2A
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $2F
	.byte $30
	.byte $31
	.byte $32
	.byte $33
	.byte $34
	.byte $35
	.byte $FF
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $2F
	.byte $30
	.byte $31
	.byte $32
	.byte $33
	.byte $41
	.byte $41
	.byte $41
	.byte $41
tbl5_92B7:
	.byte $0E
	.byte $0F
	.byte $10
	.byte $17
	.byte $17
	.byte $18
	.byte $18
	.byte $19
	.byte $19
	.byte $18
	.byte $1A
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $1E
	.byte $1F
	.byte $20
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
sub5_92D7:
	LDA Player1YoshiStatus
	BNE bra5_92E1_RTS
	LDA PlayerHoldFlag
	BEQ bra5_92E2
bra5_92E1_RTS:
	RTS
bra5_92E2:
	LDA $06DC
	BEQ bra5_9329
	LDA ObjXScreenDistance,X
	BPL bra5_92F9
	LDA #$05
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra5_9300
	BCC bra5_9320
bra5_92F9:
	LDA ObjectXDistance,X
	CMP #$05
	BCS bra5_9320
bra5_9300:
	LDA ObjYScreenDistance,X
	BEQ bra5_9316
	CMP #$FF
	BNE bra5_9320
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC ObjectYDistance,X
	BCS bra5_931D
	BCC bra5_9320
bra5_9316:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra5_9320
bra5_931D:
	CLC
	BCC bra5_9321
bra5_9320:
	SEC
bra5_9321:
	BCS bra5_9329
	LDA #$01
	STA $06DD
	RTS
bra5_9329:
	LDY #$50
	LDA ObjectSlot,X
	CMP #$5E
	BCC bra5_9334
	LDY #$88
bra5_9334:
	STY $38
	LDA ObjXScreenDistance,X
	BPL bra5_9348
	LDA #$04
	CLC
	ADC #$04
	CLC
	ADC ObjectXDistance,X
	BCS bra5_934F
	BCC bra5_936F
bra5_9348:
	LDA ObjectXDistance,X
	CMP #$00
	BCS bra5_936F
bra5_934F:
	LDA ObjYScreenDistance,X
	BEQ bra5_9365
	CMP #$FF
	BNE bra5_936F
	LDA #$10
	CLC
	ADC $38
	CLC
	ADC ObjectYDistance,X
	BCS bra5_936C
	BCC bra5_936F
bra5_9365:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra5_936F
bra5_936C:
	CLC
	BCC bra5_9370
bra5_936F:
	SEC
bra5_9370:
	BCS bra5_9395
	LDA $1E
	CMP #$0D
	BEQ bra5_9394_RTS
	CMP #$0E
	BEQ bra5_9394_RTS
	LDA ButtonsHeld
	AND #$08
	BEQ bra5_9394_RTS
	LDA #$00
	STA PlayerYSpeed
	STA PlayerXSpeed
	LDA #$03
	STA PlayerState
	STA $06DC
	LDA #$0D
	STA PlayerAction
bra5_9394_RTS:
	RTS
bra5_9395:
	LDA $1E
	CMP #$0D
	BEQ bra5_939F
	CMP #$0E
	BNE bra5_93A7_RTS
bra5_939F:
	LDA #$00
	STA PlayerState
	LDA #$0A
	STA PlayerAction
bra5_93A7_RTS:
	RTS
sub5_93A8:
	LDX $A4
	LDA ObjectState,X
	BMI bra5_93B2
	JMP loc5_94B2
bra5_93B2:
	LDA PlayerXPosDup
	CLC
	ADC $28
	STA PlayerXPosDup
	LDA $28
	BMI bra5_93C4
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc5_93C8
bra5_93C4:
	LDA PlayerXScreenDup
	SBC #$00
loc5_93C8:
	STA PlayerXScreenDup
	LDA $2B
	BMI bra5_93E3
	CLC
	ADC PlayerYPosDup
	STA PlayerYPosDup
	BCS bra5_93D9
	CMP #$F0
	BCC bra5_93FF
bra5_93D9:
	CLC
	ADC #$10
	STA PlayerYPosDup
	INC PlayerYScreenDup
	JMP loc5_93FF
bra5_93E3:
	CLC
	ADC PlayerYPosDup
	STA PlayerYPosDup
	BCS bra5_93FF
	SEC
	SBC #$10
	STA PlayerYPosDup
	DEC PlayerYScreenDup
	LDY VertScrollLock
	CPY PlayerYScreenDup
	BNE bra5_93FF
	INY
	STY PlayerYScreenDup
	LDA #$00
	STA PlayerYPosDup
bra5_93FF:
loc5_93FF:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_941B
	CMP #$FF
	BEQ bra5_941B
	JMP loc3_A6B5
bra5_941B:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_945D
	LDA ObjYScreenDistance,X
	BPL bra5_944C
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_945D
bra5_944C:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_945D:
loc5_945D:
	LDA FreezeFlag
	BEQ bra5_9463
	RTS
bra5_9463:
	LDA #$00
	STA ObjectState,X
	LDA ObjXScreenDistance,X
	BEQ bra5_947A
	CMP #$FF
	BNE bra5_9481_RTS
	LDA ObjectXDistance,X
	CMP $25
	BCC bra5_9481_RTS
	BCS bra5_9482
bra5_947A:
	LDA ObjectXDistance,X
	CMP #$05
	BCC bra5_9482
bra5_9481_RTS:
	RTS
bra5_9482:
	LDA PlayerMovement
	AND #$04
	BNE bra5_94A1_RTS
	LDA ObjYScreenDistance,X
	BNE bra5_9496
	LDA ObjectYDistance,X
	CMP #$08
	BCC bra5_94A2
	BCS bra5_94A1_RTS
bra5_9496:
	CMP #$FF
	BNE bra5_94A1_RTS
	LDA ObjectYDistance,X
	CMP #$FA
	BCS bra5_94A2
bra5_94A1_RTS:
	RTS
bra5_94A2:
	LDA #$00
	STA PlayerYSpeed
	STA ObjectYDistance,X
	STA ObjYScreenDistance,X
	LDA #$80
	STA ObjectState,X
	RTS
loc5_94B2:
	LDA ObjXScreenDistance,X
	BEQ bra5_94C4
	CMP #$FF
	BNE bra5_94CB_RTS
	LDA ObjectXDistance,X
	CMP $25
	BCC bra5_94CB_RTS
	BCS bra5_94CC
bra5_94C4:
	LDA ObjectXDistance,X
	CMP #$05
	BCC bra5_94CC
bra5_94CB_RTS:
	RTS
bra5_94CC:
	LDA PlayerMovement
	AND #$04
	BNE bra5_94EB_RTS
	LDA ObjYScreenDistance,X
	BNE bra5_94E0
	LDA ObjectYDistance,X
	CMP #$08
	BCC bra5_94EC
	BCS bra5_94EB_RTS
bra5_94E0:
	CMP #$FF
	BNE bra5_94EB_RTS
	LDA ObjectYDistance,X
	CMP #$FA
	BCS bra5_94EC
bra5_94EB_RTS:
	RTS
bra5_94EC:
	LDA #$00
	STA PlayerYSpeed
	STA ObjectYDistance,X
	STA ObjYScreenDistance,X
	LDA ObjectYPos,X
	STA PlayerYPosDup
	LDA ObjectYScreen,X
	STA PlayerYScreenDup
	LDY VertScrollLock
	CPY PlayerYScreenDup
	BNE bra5_950E
	INY
	STY PlayerYScreenDup
	LDA #$00
	STA PlayerYPosDup
bra5_950E:
	LDA #$00
	STA ObjectYDistance,X
	STA ObjYScreenDistance,X
	LDA #$80
	STA ObjectState,X
	LDA #$01
	STA PlayerAction
	STA PlayerYSpeed
	RTS
sub5_9522:
	LDA PlayerState
	CMP #$03
	BEQ bra5_9529
	RTS
bra5_9529:
	LDA #$00
	STA PlayerXSpeed
	LDA PlayerXPosDup
	CLC
	ADC $28
	STA PlayerXPosDup
	LDA $28
	BMI bra5_953F
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc5_9543
bra5_953F:
	LDA PlayerXScreenDup
	SBC #$00
loc5_9543:
	STA PlayerXScreenDup
	LDA $2B
	BMI bra5_955E
	CLC
	ADC PlayerYPosDup
	STA PlayerYPosDup
	BCS bra5_9554
	CMP #$F0
	BCC bra5_957A
bra5_9554:
	CLC
	ADC #$10
	STA PlayerYPosDup
	INC PlayerYScreenDup
	JMP loc5_957A
bra5_955E:
	CLC
	ADC PlayerYPosDup
	STA PlayerYPosDup
	BCS bra5_957A
	SEC
	SBC #$10
	STA PlayerYPosDup
	DEC PlayerYScreenDup
	LDY VertScrollLock
	CPY PlayerYScreenDup
	BNE bra5_957A
	INY
	STY PlayerYScreenDup
	LDA #$00
	STA PlayerYPosDup
bra5_957A:
loc5_957A:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_9596
	CMP #$FF
	BEQ bra5_9596
	JMP loc3_A6B5
bra5_9596:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_95D8
	LDA ObjYScreenDistance,X
	BPL bra5_95C7
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_95D8
bra5_95C7:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_95D8:
loc5_95D8:
	LDA FreezeFlag
	BEQ bra5_95DE_RTS
	RTS
bra5_95DE_RTS:
	RTS
obj_h7E:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_95FD
	CMP #$FF
	BEQ bra5_95FD
	JMP loc3_A6B5
bra5_95FD:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_963F
	LDA ObjYScreenDistance,X
	BPL bra5_962E
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_963F
bra5_962E:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_963F:
loc5_963F:
	LDA FreezeFlag
	BEQ bra5_9645
	RTS
bra5_9645:
	LDA ObjectVariables,X
	BPL bra5_964E
	JSR jmp_54_B5BB
	RTS
bra5_964E:
	JSR sub5_82EC
	LDA $058C,X
	LSR
	SEC
	SBC #$24
	TAY
	LDA tbl5_9667,Y
	CMP #$FF
	BNE bra5_9661
	RTS
bra5_9661:
	ASL
	TAY
	JSR jmp_54_B896
	RTS
tbl5_9667:
	.byte $3A
	.byte $3B
	.byte $3C
	.byte $3D
	.byte $3C
	.byte $3C
	.byte $3B
	.byte $3B
	.byte $3D
ptr6_9670:
	LDY #$00
	LDX $A4
	LDA $062B
	AND #$10
	BEQ bra5_967C
	INY
bra5_967C:
	TYA
	ASL
	TAX
	LDA tbl5_96A1,X
	STA $32
	LDA tbl5_96A1+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra5_9696
	LDY #$C0
bra5_9696:
	STY $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl5_96A1:
	.word WallUrchin1
	.word WallUrchin2
WallUrchin1:
	.byte $04
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
WallUrchin2:
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
ptr6_96CB:
	LDX $A4
	LDA EnemyAnimFrame,X
	ASL
	TAX
	LDA tbl5_96EB,X
	STA $32
	LDA tbl5_96EB+1,X
	STA $33
	LDA #$80
	STA $36
	LDX $A4
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl5_96EB:
	.word GrassPlatform1
	.word GrassPlatform2
	.word GrassPlatform3
	.word GrassPlatform4
	.word GrassPlatform5
GrassPlatform1:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $9B
	.byte $9E
	.byte $9F
	.byte $9C
	.byte $9D
	.byte $A0
	.byte $A1
GrassPlatform2:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $A2
	.byte $A3
	.byte $9F
	.byte $9C
	.byte $A4
	.byte $A5
	.byte $A1
GrassPlatform3:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $AD
	.byte $AE
	.byte $9F
	.byte $9C
	.byte $AF
	.byte $B0
	.byte $A1
GrassPlatform4:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $B1
	.byte $B2
	.byte $9F
	.byte $9C
	.byte $B3
	.byte $B4
	.byte $A1
GrassPlatform5:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $B5
	.byte $B6
	.byte $9F
	.byte $9C
	.byte $B7
	.byte $B8
	.byte $A1
obj_hFA:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_974A
	CMP #$FF
	BEQ bra5_974A
	JMP loc3_A6B5
bra5_974A:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_978C
	LDA ObjYScreenDistance,X
	BPL bra5_977B
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_978C
bra5_977B:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_978C:
loc5_978C:
	LDA FreezeFlag
	BEQ bra5_9792
	RTS
bra5_9792:
	LDA ObjectVariables,X
	BMI bra5_979A
	JMP loc5_97D3
bra5_979A:
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectXPos,X
	SEC
	SBC #$08
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	SBC #$00
	STA ObjectXScreen,X
	LDA ObjectYPos,X
	SEC
	SBC #$08
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	LDY #$01
	LDA ObjectSlot,X
	AND #$FE
	CMP #$FE
	BNE bra5_97CE
	LDY #$04
bra5_97CE:
	TYA
	STA EnemyAnimFrame,X
	RTS
loc5_97D3:
	LDA $058C,X
	LSR
	SEC
	SBC #$03
	TAY
	LDA tbl5_97F0,Y
	CMP #$FF
	BNE bra5_97E3
	RTS
bra5_97E3:
	ASL
	TAY
	JSR jmp_54_B896
	LDA #$DA
	STA $25
	JSR sub5_93A8
	RTS
tbl5_97F0:
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
obj_hED:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_982F
	CMP #$FF
	BEQ bra5_982F
	JMP loc3_A6B5
bra5_982F:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_9871
	LDA ObjYScreenDistance,X
	BPL bra5_9860
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_9871
bra5_9860:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_9871:
loc5_9871:
	LDA FreezeFlag
	BEQ bra5_9877
	RTS
bra5_9877:
	LDA ObjectVariables,X
	BPL bra5_98A4
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectXPos,X
	CLC
	ADC #$08
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,X
	LDA ObjectYPos,X
	CLC
	ADC #$08
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,X
	RTS
bra5_98A4:
	LDA Event
	CMP #$02
	BNE bra5_9920_RTS
	LDA ObjXScreenDistance,X
	BPL bra5_98BC
	LDA #$00
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra5_98C3
	BCC bra5_98E3
bra5_98BC:
	LDA ObjectXDistance,X
	CMP #$00
	BCS bra5_98E3
bra5_98C3:
	LDA ObjYScreenDistance,X
	BEQ bra5_98D9
	CMP #$FF
	BNE bra5_98E3
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC ObjectYDistance,X
	BCS bra5_98E0
	BCC bra5_98E3
bra5_98D9:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra5_98E3
bra5_98E0:
	CLC
	BCC bra5_98E4
bra5_98E3:
	SEC
bra5_98E4:
	BCS bra5_9920_RTS
	LDA ObjectSlot,X
	CMP #$F0
	BEQ bra5_98F6
	CMP #$F1
	BEQ bra5_98F6
	LDA Player1YoshiStatus
	BNE bra5_9920_RTS
bra5_98F6:
	LDY #$06
	LDA PlayerMovement
	AND #$40
	BEQ bra5_9900
	LDY #$0A
bra5_9900:
	STY $25
	LDA ObjectSlot,X
	SEC
	SBC #$EF
	TAY
	LDA ObjectSlot,X
	CMP #$F5
	BEQ bra5_9940
	CMP #$EF
	BNE bra5_9921
	LDA #$01
	STA $06E9
	LDA ButtonsHeld
	AND #$08
	BNE bra5_992C
bra5_9920_RTS:
	RTS
bra5_9921:
	LDA #$00
	STA $06E9
	LDA $1E
	CMP #$07
	BNE bra5_9920_RTS
bra5_992C:
	LDA ObjectXPos,X
	CLC
	ADC $25
	STA PlayerXPosDup
	LDA ObjectXScreen,X
	ADC #$00
	STA PlayerXScreenDup
	LDA #$20
	STA $06E0
bra5_9940:
	LDA tbl5_994A,Y
	STA Event
	LDA #$00
	STA EventPart
	RTS
tbl5_994A:
	.byte $13
	.byte $0F
	.byte $11
	.byte $FF
	.byte $FF
	.byte $0B
	.byte $0D
ptr6_9951:
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl5_997F,X
	STA $32
	LDA tbl5_997F+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra5_9971
	LDY #$C0
bra5_9971:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR sub_52_ADAF
	RTS
tbl5_997F:
	.word ofs_9989 ;Bonus ? Block
	.word ofs_9990
	.word ofs_9997
	.word ofs_999E
	.word ofs_99A5
ofs_9989:
	.byte $02
	.byte $02
	.byte $CC
	.byte $00
	.byte $01
	.byte $02
	.byte $03
ofs_9990:
	.byte $02
	.byte $02
	.byte $CC
	.byte $04
	.byte $05
	.byte $06
	.byte $07
ofs_9997:
	.byte $02
	.byte $02
	.byte $CC
	.byte $08
	.byte $09
	.byte $0A
	.byte $0B
ofs_999E:
	.byte $02
	.byte $02
	.byte $CC
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $0F
ofs_99A5:
	.byte $02
	.byte $02
	.byte $90
	.byte $27
	.byte $28
	.byte $29
	.byte $2A
obj_hE7:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_99CA
	CMP #$FF
	BEQ bra5_99CA
	JMP loc3_A6B5
bra5_99CA:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_9A0C
	LDA ObjYScreenDistance,X
	BPL bra5_99FB
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_9A0C
bra5_99FB:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_9A0C:
loc5_9A0C:
	LDA FreezeFlag
	BEQ bra5_9A12
	RTS
bra5_9A12:
	LDA #$03
	STA EnemyAnimFrame,X
	LDA ObjectAction,X
	ASL
	TAY
	LDA tbl5_9A29,Y
	STA $32
	LDA tbl5_9A29+1,Y
	STA $33
	JMP ($32)
tbl5_9A29:
	.word ptr10_9A2D
	.word ptr10_9A45
ptr10_9A2D:
	LDA FrameCount
	AND #$00
	BNE bra5_9A38
	LDA #$49
	JSR jmp_54_B470
bra5_9A38:
	LDA ObjectVariables,X
	AND #$0F
	CMP #$0E
	BNE bra5_9A44_RTS
	INC ObjectAction,X
bra5_9A44_RTS:
	RTS
ptr10_9A45:
	LDA #$00
	STA ObjectSlot,X
	RTS
obj_hE8:
	LDX $A4 ;Get index for current object?
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X ;Calculate horizontal distance between the player and the object
	STA $28
	BEQ bra5_9A69
	CMP #$FF
	BEQ bra5_9A69
	JMP loc3_A6B5
bra5_9A69:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X ;Calculate vertical distance between the player and the object
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_9AAB
	LDA ObjYScreenDistance,X
	BPL bra5_9A9A
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_9AAB
bra5_9A9A:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_9AAB:
loc5_9AAB:
	LDA FreezeFlag
	BEQ bra5_9AB1
	RTS
bra5_9AB1:
	LDA ObjectAction,X
	ASL
	TAY ;Get pointer for current action
	LDA tbl5_9AC3,Y
	STA $32 ;Load lower byte
	LDA tbl5_9AC3+1,Y
	STA $33 ;Load upper byte
	JMP ($32) ;Jump to loaded pointer
tbl5_9AC3:
	.word ptr10_9AD1
	.word ptr10_9B30
	.word ptr10_9B48
	.word ptr10_9B6C
	.word ptr10_9B8B
	.word ptr10_9B8C
	.word ptr10_9BEC
ptr10_9AD1:
	LDA #$40
	STA EnemyAnimFrame,X
	LDY #$22
	LDA PlayerPowerup
	BNE bra5_9AE4 ;Branch ahead if the player has no powerup
	LDA Player1YoshiStatus
	BNE bra5_9AE4 ;Branch ahead if the player is riding Yoshi
	LDY #$18
bra5_9AE4:
	STY $25
	LDA ObjXScreenDistance,X
	BPL bra5_9AF8
	LDA #$06
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra5_9AFF
	BCC bra5_9B1F
bra5_9AF8:
	LDA ObjectXDistance,X
	CMP #$06
	BCS bra5_9B1F
bra5_9AFF:
	LDA ObjYScreenDistance,X
	BEQ bra5_9B15
	CMP #$FF
	BNE bra5_9B1F
	LDA $25
	CLC
	ADC #$10
	CLC
	ADC ObjectYDistance,X
	BCS bra5_9B1C
	BCC bra5_9B1F
bra5_9B15:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra5_9B1F
bra5_9B1C:
	CLC
	BCC bra5_9B20
bra5_9B1F:
	SEC
bra5_9B20:
	BCS bra5_9B2F_RTS
	LDA PlayerYSpeed
	BEQ bra5_9B2F_RTS
	LDA PlayerMovement
	AND #$04
	BEQ bra5_9B2F_RTS
	INC ObjectAction,X
bra5_9B2F_RTS:
	RTS
ptr10_9B30:
	LDA FrameCount
	AND #$00
	BNE bra5_9B3B
	LDA #$48
	JSR jmp_54_B470
bra5_9B3B:
	LDA ObjectVariables,X
	AND #$0F
	CMP #$09
	BNE bra5_9B47_RTS
	INC ObjectAction,X
bra5_9B47_RTS:
	RTS
ptr10_9B48:
	LDA $06EA
	BMI bra5_9B68
	LDA ObjectSlot,X
	SEC
	SBC #$EA
	TAY
	LDA $06EA,Y
	CMP #$02
	BEQ bra5_9B62
	JSR jmp_54_B785
	AND #$01
	BNE bra5_9B68
bra5_9B62:
	INC ObjectAction,X
	INC ObjectAction,X
bra5_9B68:
	INC ObjectAction,X
	RTS
ptr10_9B6C:
	LDA ObjectSlot,X
	STA $25
	LDY #$FF
bra5_9B73:
	INY
	LDA ObjectSlot,Y
	CMP $25
	BNE bra5_9B87
	LDA ObjectAction,Y
	CMP #$05
	BCS bra5_9B87
	LDA #$00
	STA ObjectSlot,Y
bra5_9B87:
	CPY ObjectCount
	BCC bra5_9B73
ptr10_9B8B:
	RTS
ptr10_9B8C:
	LDA ObjectSlot,X
	SEC
	SBC #$EA
	TAY
	LDA $06EA,Y
	CLC
	ADC #$01
	STA $06EA,Y
	STA $25
	LDA #$01
	STA EnemyAnimFrame,X
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
	LDA #$80
	STA ObjectVariables,Y
	LDA $25
	CMP #$03
	BNE bra5_9BDA
	LDA #sfxBlockRelease
	STA SFXRegister ;Play block release sound
	LDA #$E8
	BNE bra5_9BE5 ;Spawn 1UP
bra5_9BDA:
	LDA #$00
	JSR sub3_BCD4 ;Give the player 100 points
	LDA #sfxCoin
	STA SFXRegister ;Play coin sound
	LDA #$E9 ;Spawn coin sprite
bra5_9BE5:
	STA ObjectSlot,Y ;Store sprite in memory
	INC ObjectAction,X
	RTS
ptr10_9BEC:
	RTS
ptr6_9BED:
	LDA #$04
	ASL
	TAX
	LDA tbl5_997F,X
	STA $32
	LDA tbl5_997F+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$20
	STA $05F0
	STA $06E1
	JSR sub_52_ADAF
	LDA #$00
	STA $06E1
	RTS
obj_hE6:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra5_9C2E
	CMP #$FF
	BEQ bra5_9C2E
	JMP loc3_A6B5
bra5_9C2E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra5_9C70
	LDA ObjYScreenDistance,X
	BPL bra5_9C5F
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc5_9C70
bra5_9C5F:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra5_9C70:
loc5_9C70:
	LDA FreezeFlag
	BEQ bra5_9C76
	RTS
bra5_9C76:
	LDA ObjectAction,X
	BNE bra5_9C9B
	LDA FrameCount
	AND #$00
	BNE bra5_9C86
	LDA #$4A
	JSR jmp_54_B470
bra5_9C86:
	LDA ObjectVariables,X
	AND #$1F
	CMP #$0F
	BCC bra5_9C9A_RTS
	INC ObjectAction,X
	LDA #$00
	STA ObjectVariables,X
	STA ObjectState,X
bra5_9C9A_RTS:
	RTS
bra5_9C9B:
	LDA FrameCount
	AND #$00
	BNE bra5_9CA6
	LDA #$0B
	JSR GetMovementData
bra5_9CA6:
	LDA ObjXScreenDistance,X
	BPL bra5_9CB8
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra5_9CBF
	BCC bra5_9CDF
bra5_9CB8:
	LDA ObjectXDistance,X
	CMP #$08
	BCS bra5_9CDF
bra5_9CBF:
	LDA ObjYScreenDistance,X
	BEQ bra5_9CD5
	CMP #$FF
	BNE bra5_9CDF
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC ObjectYDistance,X
	BCS bra5_9CDC
	BCC bra5_9CDF
bra5_9CD5:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra5_9CDF
bra5_9CDC:
	CLC
	BCC bra5_9CE0
bra5_9CDF:
	SEC
bra5_9CE0:
	BCS bra5_9CF3_RTS
	INC Player1Lives
	LDA #$07
	STA SFXRegister
	LDA #$00
	STA ObjectSlot,X
	LDA #$03
	JSR sub3_BCD4
bra5_9CF3_RTS:
	RTS
	.byte $01
	.byte $00
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FE
	.byte $01
	.byte $FE
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $02
	.byte $01
	.byte $02
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
	.byte $80
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $02
	.byte $81
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $FE
	.byte $81
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
