;disassembled by BZK 6502 Disassembler
sub9_8000:
	LDX $A4
	LDA ObjectVariables,X
	AND #$7F
	ASL
	TAY
	LDA ObjectState,X
	AND #$20
	BNE bra9_8013
	JMP loc9_80A2
bra9_8013:
	JSR sub3_B077
	BNE bra9_8078
	LDA ObjectVariables,X
	AND #$7F
	CMP #$07
	BCS bra9_8024
	INC ObjectVariables,X
bra9_8024:
	PHA
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	PLA
	BMI bra9_8036
	LDA ObjectYScreen,X
	ADC #$00
	BPL bra9_803B
bra9_8036:
	LDA ObjectYScreen,X
	SBC #$00
bra9_803B:
	STA ObjectYScreen,X
	JSR sub3_B057
	BEQ bra9_804B
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra9_804B:
	LDY #$00
	LDA ($32),Y
	TAY
	LDA ObjectState,X
	AND #$40
	BEQ bra9_805C
	TYA
	EOR #$FF
	TAY
	INY
bra9_805C:
	TYA
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra9_806F
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra9_8074
bra9_806F:
	LDA ObjectXScreen,X
	SBC #$00
bra9_8074:
	STA ObjectXScreen,X
	RTS
bra9_8078:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA ObjectYPos,X
	SEC
	SBC $25
	BCS bra9_808E
	DEC ObjectYScreen,X
	SEC
	SBC #$10
bra9_808E:
	STA ObjectYPos,X
	LDA ObjectState,X
	AND #$C0
	STA ObjectState,X
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
loc9_80A2:
	INY
	LDA ($32),Y
	BMI bra9_80BD
	JSR sub3_B077
	BNE bra9_80BD
	LDA ObjectState,X
	ORA #$20
	STA ObjectState,X
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
bra9_80BD:
	DEY
	JSR sub3_B057
	BEQ bra9_80CB
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra9_80CB:
	LDA ObjectState,X
	AND #$40
	BEQ bra9_80DC
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc9_80DE
bra9_80DC:
	LDA ($32),Y
loc9_80DE:
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra9_80F0
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra9_80F5
bra9_80F0:
	LDA ObjectXScreen,X
	SBC #$00
bra9_80F5:
	STA ObjectXScreen,X
	INY
	LDA ($32),Y
	PHA
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	PLA
	BMI bra9_810D
	LDA ObjectYScreen,X
	ADC #$00
	BPL bra9_8112
bra9_810D:
	LDA ObjectYScreen,X
	SBC #$00
bra9_8112:
	STA ObjectYScreen,X
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra9_8127
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
	JMP loc9_8145
bra9_8127:
	AND #$F0
	BEQ bra9_8145
	LDA ($32),Y
	AND #$3F
	BNE bra9_813A
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
bra9_813A:
	STA $32
	LDA ObjectVariables,X
	SEC
	SBC $32
	STA ObjectVariables,X
bra9_8145:
loc9_8145:
	INC ObjectVariables,X
	RTS
obj_hA0:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra9_8153
	JMP jmp_54_B5BB
bra9_8153:
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
	BEQ bra9_8175
	CMP #$FF
	BEQ bra9_8175
	JMP loc3_A6B5
bra9_8175:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_81B7
	LDA ObjYScreenDistance,X
	BPL bra9_81A6
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_81B7
bra9_81A6:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_81B7:
loc9_81B7:
	LDA FreezeFlag
	BEQ bra9_81BD
	RTS
bra9_81BD:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_81D1,Y
	STA $32
	LDA tbl9_81D1+1,Y
	STA $33
	JMP ($32)
tbl9_81D1:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_81D1
	.word ptr_AD88
ptr2_81D1:
	LDX $A4
	LDA ObjectVariables,X
	BNE bra9_81FC
	LDY #$00
	LDA ObjXScreenDistance,X
	BMI bra9_81EB
	LDY #$40
bra9_81EB:
	STY $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	LDA #$01
	STA ObjectVariables,X
bra9_81FC:
	JSR sub9_82AE
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
	LDA #$12
	STA SFXRegister
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	ORA #$94
	STA ObjectSlot,X
	LDA #$80
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
	ADC #$10
	STA ObjectYPos,X
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_8265
	CMP #$FF
	BEQ bra9_8265
	JMP loc3_A6B5
bra9_8265:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_82A7
	LDA ObjYScreenDistance,X
	BPL bra9_8296
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_82A7
bra9_8296:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_82A7:
loc9_82A7:
	LDA FreezeFlag
	BEQ bra9_82AD_RTS
	RTS
bra9_82AD_RTS:
	RTS
sub9_82AE:
	LDA $062B
	AND #$02
	BNE bra9_82C6_RTS
	LDA #$89
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_82C6_RTS:
	RTS
	LDY #$08
	LDX $A4
	LDA ObjectVariables,X
	CMP #$10
	BCC bra9_82D4
	LDY #$04
bra9_82D4:
	STY $25
	LDY #$00
	LDA $062B
	AND $25
	BEQ bra9_82E1
	LDY #$01
bra9_82E1:
	LDA ObjectState,X
	AND #$40
	STA $05F0
	TYA
	ASL
	TAX
	LDA ParagoombaMappings,X
	STA $32
	LDA ParagoombaMappings+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_8303
	LDY #$C0
bra9_8303:
	STY $36
	JSR jmp_54_A118
	RTS
ParagoombaMappings:
	.word Paragoomba1
	.word Paragoomba2
Paragoomba1:
	.byte $04
	.byte $04
	.byte $A5
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $FF, $FF, $FF
	.byte $03, $04, $05, $FF
	.byte $0A, $0B, $0C, $FF
Paragoomba2:
	.byte $04
	.byte $04
	.byte $A5
	.byte $0F, $FF, $10, $11
	.byte $12, $13, $14, $15
	.byte $16, $17, $18, $19
	.byte $1A, $1B, $1C, $FF
obj_h98:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra9_83A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_8356
	CMP #$FF
	BEQ bra9_8356
	JMP loc3_A6B5
bra9_8356:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8398
	LDA ObjYScreenDistance,X
	BPL bra9_8387
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8398
bra9_8387:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8398:
loc9_8398:
	LDA FreezeFlag
	BEQ bra9_839E
	RTS
bra9_839E:
	LDA #$00
	STA ObjectVariables,X
	RTS
bra9_83A4:
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
	BEQ bra9_83C6
	CMP #$FF
	BEQ bra9_83C6
	JMP loc3_A6B5
bra9_83C6:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8408
	LDA ObjYScreenDistance,X
	BPL bra9_83F7
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8408
bra9_83F7:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8408:
loc9_8408:
	LDA FreezeFlag
	BEQ bra9_840E
	RTS
bra9_840E:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8422,Y
obj_h8E:
	STA $32
	LDA tbl9_8422+1,Y
	STA $33
	JMP ($32)
tbl9_8422:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_842C
	.word ptr_AD88
ptr2_842C:
	LDA ObjXScreenDistance,X
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	JSR sub9_84FE
	JSR sub3_B077
	BEQ bra9_8448
	JMP loc9_846E
bra9_8448:
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
	LDA #$12
	STA SFXRegister
	JMP loc9_846E
	RTS
loc9_846E:
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	ORA #$94
	STA ObjectSlot,X
	LDA #$80
	STA ObjectVariables,X
	LDA ObjectXPos,X
	CLC
	ADC #$04
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,X
	LDA ObjectYPos,X
	CLC
	ADC #$0E
	STA ObjectYPos,X
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_84B5
	CMP #$FF
	BEQ bra9_84B5
	JMP loc3_A6B5
bra9_84B5:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_84F7
	LDA ObjYScreenDistance,X
	BPL bra9_84E6
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_84F7
bra9_84E6:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_84F7:
loc9_84F7:
	LDA FreezeFlag
	BEQ bra9_84FD_RTS
	RTS
bra9_84FD_RTS:
	RTS
sub9_84FE:
	LDA $062B
	AND #$0E
	BNE bra9_8516_RTS
	LDA #$86
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8516_RTS:
	RTS
	LDA $062B
	LSR
	LSR
	LSR
	AND #$06
	TAY
	LDA tbl9_8549,Y
	STA $05F0
	LDA tbl9_8548,Y
	ASL
	TAX
	LDA tbl9_8550,X
	STA $32
	LDA tbl9_8551,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_8542
	LDY #$C0
bra9_8542:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_8548:
	.byte $00
tbl9_8549:
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $40
tbl9_8550:
	.byte $54
tbl9_8551:
	.byte $85
	.byte $63
	.byte $85
	.byte $03
	.byte $04
	.byte $A5
	.byte $1D
	.byte $1E
	.byte $1F
	.byte $22
	.byte $23
	.byte $24
	.byte $27
	.byte $28
	.byte $FF
	.byte $2C
	.byte $2D
	.byte $FF
	.byte $03
	.byte $04
	.byte $A5
	.byte $FF
	.byte $20
	.byte $21
	.byte $FF
	.byte $25
	.byte $26
	.byte $29
	.byte $2A
	.byte $2B
	.byte $2E
	.byte $2F
	.byte $30
obj_h94:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra9_85E0
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_8595
	CMP #$FF
	BEQ bra9_8595
	JMP loc3_A6B5
bra9_8595:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_85D7
	LDA ObjYScreenDistance,X
	BPL bra9_85C6
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_85D7
bra9_85C6:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_85D7:
loc9_85D7:
	LDA FreezeFlag
	BEQ bra9_85DD
	RTS
bra9_85DD:
	JMP jmp_54_B5BB
bra9_85E0:
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
	BEQ bra9_8602
	CMP #$FF
	BEQ bra9_8602
	JMP loc3_A6B5
bra9_8602:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8644
	LDA ObjYScreenDistance,X
	BPL bra9_8633
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8644
bra9_8633:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8644:
loc9_8644:
	LDA FreezeFlag
	BEQ bra9_864A
	RTS
bra9_864A:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_865E,Y
	STA $32
	LDA tbl9_865E+1,Y
	STA $33
	JMP ($32)
tbl9_865E:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_8668
	.word ptr_AD88
ptr2_8668:
	JSR sub9_8698
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
	LDA #$12
	STA SFXRegister
	LDX $A4
	INC ObjectSlot,X
	INC ObjectSlot,X
	LDA #$80
	STA ObjectVariables,X
	RTS
sub9_8698:
	LDA ObjectVariables,X
	CMP #$03
	BCS bra9_86A2
	JMP loc9_86BB
bra9_86A2:
	LDA $062B
	AND #$00
	BNE bra9_86BA_RTS
	LDA #$85
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_86BA_RTS:
	RTS
loc9_86BB:
	LDA $062B
	AND #$02
	BNE bra9_86D3_RTS
	LDA #$85
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_86D3_RTS:
	RTS
obj_h96:
	LDX $A4
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
	BEQ bra9_86F8
	CMP #$FF
	BEQ bra9_86F8
	JMP loc3_A6B5
bra9_86F8:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_873A
	LDA ObjYScreenDistance,X
	BPL bra9_8729
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_873A
bra9_8729:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_873A:
loc9_873A:
	LDA FreezeFlag
	BEQ bra9_8740
	RTS
bra9_8740:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8754,Y
	STA $32
	LDA tbl9_8754+1,Y
	STA $33
	JMP ($32)
tbl9_8754:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_875E
	.word ptr_AD88
ptr2_875E:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra9_87D7
	JSR sub9_887E
	JSR sub3_B077
	BEQ bra9_87D6_RTS
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_878E
	CMP #$FF
	BEQ bra9_878E
	JMP loc3_A6B5
bra9_878E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_87D0
	LDA ObjYScreenDistance,X
	BPL bra9_87BF
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_87D0
bra9_87BF:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_87D0:
loc9_87D0:
	LDA FreezeFlag
	BEQ bra9_87D6_RTS
	RTS
bra9_87D6_RTS:
	RTS
bra9_87D7:
	CMP #$0D
	BEQ bra9_880C
	CMP #$0F
	BCS bra9_87E5
	JSR sub9_881D
	JMP loc9_87E8
bra9_87E5:
	JSR sub9_8865
loc9_87E8:
	JSR jmp_54_BC3E
	JSR jmp_54_A74D
	LDX $A4
	LDA ObjectVariables,X
	BEQ bra9_880B_RTS
	LDA #$0F
	STA ObjectVariables,X
	LDA ObjXScreenDistance,X
	AND #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
bra9_880B_RTS:
	RTS
bra9_880C:
	DEC ObjectSlot,X
	DEC ObjectSlot,X
	JSR jmp_54_B5BB
	LDA #$03
	STA ObjectVariables,X
	JMP obj_h94
sub9_881D:
	LDA ObjectState,X
	AND #$20
	BEQ bra9_884C
	LDA $062B
	AND #$00
	BNE bra9_883C
	LDA #$84
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_883C:
	LDA ObjectState,X
	AND #$20
	BNE bra9_884B_RTS
	LDA ObjectState,X
	AND #$F0
	STA ObjectState,X
bra9_884B_RTS:
	RTS
bra9_884C:
	LDA $062B
	AND #$1E
	BNE bra9_8864_RTS
	LDA #$84
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8864_RTS:
	RTS
sub9_8865:
	LDA $062B
	AND #$00
	BNE bra9_887D_RTS
	LDA #$84
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_887D_RTS:
	RTS
sub9_887E:
	LDA $062B
	AND #$00
	BNE bra9_8896_RTS
	LDA #$85
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8896_RTS:
	RTS
	LDX $A4
	LDY #$08
	LDA ObjectVariables,X
	SEC
	SBC #$09
	BCC bra9_88A9
	CMP #$04
	BCS bra9_88A9
	LDY #$04
bra9_88A9:
	STY $25
	LDY #$02
	LDA $062B
	AND $25
	BEQ bra9_88B6
	LDY #$03
bra9_88B6:
	LDA ObjectState,X
	AND #$C0
	ORA #$80
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_8915,X
	STA $32
	LDA tbl9_8916,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_88DA
	LDY #$C0
bra9_88DA:
	STY $36
	JSR jmp_54_A118
	RTS
	LDX $A4
	LDY #$00
	LDA $062B
	AND #$08
	BEQ bra9_88ED
	LDY #$01
bra9_88ED:
	LDA ObjectState,X
	AND #$C0
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_8915,X
	STA $32
	LDA tbl9_8916,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_890F
	LDY #$C0
bra9_890F:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_8915:
	.byte $1D
tbl9_8916:
	.byte $89
	.byte $24
	.byte $89
	.byte $2B
	.byte $89
	.byte $32
	.byte $89
	.byte $02
	.byte $02
	.byte $A5
	.byte $01
	.byte $02
	.byte $08
	.byte $09
	.byte $02
	.byte $02
	.byte $A5
	.byte $06
	.byte $07
	.byte $0D
	.byte $0E
	.byte $02
	.byte $02
	.byte $A5
	.byte $08
	.byte $09
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $A5
	.byte $0D
	.byte $0E
	.byte $06
	.byte $07
obj_h9A:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra9_89AE
	CMP #$81
	BEQ bra9_89AB
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_8960
	CMP #$FF
	BEQ bra9_8960
	JMP loc3_A6B5
bra9_8960:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_89A2
	LDA ObjYScreenDistance,X
	BPL bra9_8991
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_89A2
bra9_8991:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_89A2:
loc9_89A2:
	LDA FreezeFlag
	BEQ bra9_89A8
	RTS
bra9_89A8:
	JMP jmp_54_B5BB
bra9_89AB:
	JMP sub_54_B4FC
bra9_89AE:
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
	BEQ bra9_89D0
	CMP #$FF
	BEQ bra9_89D0
	JMP loc3_A6B5
bra9_89D0:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8A12
	LDA ObjYScreenDistance,X
	BPL bra9_8A01
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8A12
bra9_8A01:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8A12:
loc9_8A12:
	LDA FreezeFlag
	BEQ bra9_8A18
	RTS
bra9_8A18:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8A2C,Y
	STA $32
	LDA tbl9_8A2C+1,Y
	STA $33
	JMP ($32)
tbl9_8A2C:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_8A36
	.word ptr_AD88
ptr2_8A36:
	JSR sub9_8A45
	JSR jmp_54_A6D4
	JSR jmp_54_BC3E
	JSR jmp_54_A74D
	JMP jmp_54_BF74
sub9_8A45:
	LDA $062B
	AND #$02
	BNE bra9_8A5D_RTS
	LDA #$86
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8A5D_RTS:
	RTS
	LDA #$00
	STA $05F0
	LDA $062B
	LSR
	LSR
	LSR
	AND #$01
	ASL
	TAX
	LDA tbl9_8A8A,X
	STA $32
	LDA tbl9_8A8A+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_8A84
	LDY #$C0
bra9_8A84:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_8A8A:
	.word SpinyWalk1
	.word SpinyWalk2
SpinyWalk1:
	.byte $02
	.byte $02
	.byte $A6
	.byte $14
	.byte $15
	.byte $16
	.byte $17
SpinyWalk2:
	.byte $02
	.byte $02
	.byte $A6
	.byte $14
	.byte $15
	.byte $18
	.byte $19
	.byte $02
	.byte $02
	.byte $A6
	.byte $1A
	.byte $1B
	.byte $1E
	.byte $1F
	.byte $02
	.byte $02
	.byte $A6
	.byte $1C
	.byte $1D
	.byte $20
	.byte $21
obj_h80:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra9_8AB4
	JMP loc9_8B27
bra9_8AB4:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_8AD0
	CMP #$FF
	BEQ bra9_8AD0
	JMP loc3_A6B5
bra9_8AD0:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8B12
	LDA ObjYScreenDistance,X
	BPL bra9_8B01
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8B12
bra9_8B01:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8B12:
loc9_8B12:
	LDA FreezeFlag
	BEQ bra9_8B18
	RTS
bra9_8B18:
	LDA ObjectVariables,X
	CMP #$81
	BCS bra9_8B23
	JSR jmp_54_B5BB
	RTS
bra9_8B23:
	JSR sub_54_B4FC
	RTS
loc9_8B27:
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
	BEQ bra9_8B49
	CMP #$FF
	BEQ bra9_8B49
	JMP loc3_A6B5
bra9_8B49:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8B8B
	LDA ObjYScreenDistance,X
	BPL bra9_8B7A
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8B8B
bra9_8B7A:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8B8B:
loc9_8B8B:
	LDA FreezeFlag
	BEQ bra9_8B91
	RTS
bra9_8B91:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8BA5,Y
	STA $32
	LDA tbl9_8BA5+1,Y
	STA $33
	JMP ($32)
tbl9_8BA5:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_8B8F
	.word ptr_AD88
ptr2_8B8F:
	LDA FrameCount
	AND #$00
	BEQ bra9_8BB6
	RTS
bra9_8BB6:
	LDA #$80
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B132
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
	LDA #$12
	STA SFXRegister
	LDX $A4
	LDA #$81
	STA ObjectVariables,X
	RTS
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDA #$00
	ASL
	TAX
	LDA BulletBillMappings,X
	STA $32
	LDA BulletBillMappings+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_8C16
	LDY #$C0
bra9_8C16:
	STY $36
	JSR jmp_54_A118
	RTS
BulletBillMappings:
	.word BulletBill
BulletBill:
	.byte $02	;Tile Width
	.byte $02	;Tile Height
	.byte $A6	;1K CHR Bank
	.byte $2A, $2B
	.byte $2C, $2D
	LDY #$00
	LDX $A4
	LDA ObjectState,X
	AND #$C0
	STA $05F0
	LDA ObjectState,X
	BPL bra9_8C38
	LDY #$01
bra9_8C38:
	TYA
	ASL
	TAX
	LDA VerticalBillMappings,X
	STA $32
	LDA VerticalBillMappings+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_8C52
	LDY #$C0
bra9_8C52:
	STY $36
	JSR jmp_54_A118
	RTS
VerticalBillMappings:
	.word VerticalBill1
	.word VerticalBill2
VerticalBill1:
	.byte $02	;Tile Width
	.byte $02	;Tile Height
	.byte $A6	;1K CHR Bank
	.byte $2E, $2F
	.byte $30, $31
VerticalBill2:
	.byte $02	;Tile Width
	.byte $02	;Tile Height
	.byte $A6	;1K CHR Bank
	.byte $30, $31
	.byte $2E, $2F
obj_h9C:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra9_8C76
	LDA #$00
	STA ObjectVariables,X
bra9_8C76:
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
	BEQ bra9_8C98
	CMP #$FF
	BEQ bra9_8C98
	JMP loc3_A6B5
bra9_8C98:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8CDA
	LDA ObjYScreenDistance,X
	BPL bra9_8CC9
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8CDA
bra9_8CC9:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8CDA:
loc9_8CDA:
	LDA FreezeFlag
	BEQ bra9_8CE0
	RTS
bra9_8CE0:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8CF4,Y
	STA $32
	LDA tbl9_8CF4+1,Y
	STA $33
	JMP ($32)
tbl9_8CF4:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_8CFE
	.word ptr_AD88
ptr2_8CFE:
	LDA ObjectVariables,X
	CMP #$06
	BCS bra9_8D73
	LDA FrameCount
	AND #$1E
	BNE bra9_8D0E
	INC ObjectVariables,X
bra9_8D0E:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_8D2A
	CMP #$FF
	BEQ bra9_8D2A
	JMP loc3_A6B5
bra9_8D2A:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8D6C
	LDA ObjYScreenDistance,X
	BPL bra9_8D5B
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8D6C
bra9_8D5B:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8D6C:
loc9_8D6C:
	LDA FreezeFlag
	BEQ bra9_8D72_RTS
	RTS
bra9_8D72_RTS:
	RTS
bra9_8D73:
	JSR sub9_8D7C
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub9_8D7C:
	LDA FrameCount
	AND #$02
	BEQ bra9_8D83
	RTS
bra9_8D83:
	LDA #$87
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B485
	RTS
	LDY #$00
	STY $05F0
	LDX $A4
	LDA ObjectVariables,X
	CMP #$06
	BCS bra9_8DA4
	RTS
bra9_8DA4:
	CMP #$15
	BCC bra9_8DAF
	LDY #$02
	LDA #$80
	STA $05F0
bra9_8DAF:
	LDA FrameCount
	AND #$08
	BEQ bra9_8DB6
	INY
bra9_8DB6:
	TYA
	ASL
	TAX
	LDA tbl9_8DD6,X
	STA $32
	LDA tbl9_8DD6+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_8DD0
	LDY #$C0
bra9_8DD0:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_8DD6:
	.word VPodoboo1
	.word VPodoboo2
	.word VPodoboo3
	.word VPodoboo4
VPodoboo1:
	.byte $02
	.byte $02
	.byte $AD
	.byte $2A
	.byte $2B
	.byte $2E
	.byte $2F
VPodoboo2:
	.byte $02
	.byte $02
	.byte $AD
	.byte $2C
	.byte $2D
	.byte $30
	.byte $31
VPodoboo3:
	.byte $02
	.byte $02
	.byte $AD
	.byte $2E
	.byte $2F
	.byte $2A
	.byte $2B
VPodoboo4:
	.byte $02
	.byte $02
	.byte $AD
	.byte $30
	.byte $31
	.byte $2C
	.byte $2D
obj_h9E:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra9_8E04
	JMP loc9_8E6B
bra9_8E04:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_8E20
	CMP #$FF
	BEQ bra9_8E20
	JMP loc3_A6B5
bra9_8E20:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8E62
	LDA ObjYScreenDistance,X
	BPL bra9_8E51
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8E62
bra9_8E51:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8E62:
loc9_8E62:
	LDA FreezeFlag
	BEQ bra9_8E68
	RTS
bra9_8E68:
	JMP jmp_54_B5BB
loc9_8E6B:
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
	BEQ bra9_8E8D
	CMP #$FF
	BEQ bra9_8E8D
	JMP loc3_A6B5
bra9_8E8D:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8ECF
	LDA ObjYScreenDistance,X
	BPL bra9_8EBE
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8ECF
bra9_8EBE:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8ECF:
loc9_8ECF:
	LDA FreezeFlag
	BEQ bra9_8ED5
	RTS
bra9_8ED5:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8EE9,Y
	STA $32
	LDA tbl9_8EE9+1,Y
	STA $33
	JMP ($32)
tbl9_8EE9:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_8EF3
	.word ptr_AD88
ptr2_8EF3:
	JSR sub9_8EFC	;unlogged
	JSR jmp_54_BC3E	;unlogged
	JMP jmp_54_BF74	;unlogged
sub9_8EFC:
	LDA FrameCount
	AND #$04
	BEQ bra9_8F03
	RTS
bra9_8F03:
	LDA #$88
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B132
	RTS
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA ObjectVariables,X
	CMP #$20
	BCS bra9_8F32
	LDY #$02
	LDA $05F0
	ORA #$80
	STA $05F0
bra9_8F32:
	LDA FrameCount
	AND #$08
	BEQ bra9_8F39
	INY
bra9_8F39:
	TYA
	ASL
	TAX
	LDA tbl9_8F59,X
	STA $32
	LDA tbl9_8F5A,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_8F53
	LDY #$C0
bra9_8F53:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_8F59:
	.byte $61
tbl9_8F5A:
	.byte $8F
	.byte $68
	.byte $8F
	.byte $6F
	.byte $8F
	.byte $76
	.byte $8F
	.byte $02
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
obj_h82:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra9_8F87
	JMP loc9_8FEF
bra9_8F87:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_8FA3
	CMP #$FF
	BEQ bra9_8FA3
	JMP loc3_A6B5
bra9_8FA3:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_8FE5
	LDA ObjYScreenDistance,X
	BPL bra9_8FD4
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_8FE5
bra9_8FD4:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_8FE5:
loc9_8FE5:
	LDA FreezeFlag
	BEQ bra9_8FEB
	RTS
bra9_8FEB:
	JSR jmp_54_B5BB
	RTS
loc9_8FEF:
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
	BEQ bra9_9011
	CMP #$FF
	BEQ bra9_9011
	JMP loc3_A6B5
bra9_9011:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_9053
	LDA ObjYScreenDistance,X
	BPL bra9_9042
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_9053
bra9_9042:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_9053:
loc9_9053:
	LDA FreezeFlag
	BEQ bra9_9059
	RTS
bra9_9059:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_906D,Y
	STA $32
	LDA tbl9_906D+1,Y
	STA $33
	JMP ($32)
tbl9_906D:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_9075
ptr2_9075:
	LDA FrameCount
	AND #$00
	BEQ bra9_907C
	RTS
bra9_907C:
	LDA #$80
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B132
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA $062B
	AND #$10
	BEQ bra9_90A8
	LDY #$01
bra9_90A8:
	TYA
	ASL
	TAX
	LDA tbl9_90C8,X
	STA $32
	LDA tbl9_90C8+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_90C2
	LDY #$C0
bra9_90C2:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_90C8:
	.word Eerie1
	.word Eerie2
Eerie1:
	.byte $02
	.byte $03
	.byte $AB
	.byte $0B
	.byte $0C
	.byte $13
	.byte $14
	.byte $1A
	.byte $1B
Eerie2:
	.byte $02
	.byte $03
	.byte $AB
	.byte $0D
	.byte $0E
	.byte $15
	.byte $16
	.byte $1A
	.byte $1C
obj_hAA:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra9_90E8
	JMP loc9_914F
bra9_90E8:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_9104
	CMP #$FF
	BEQ bra9_9104
	JMP loc3_A6B5
bra9_9104:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_9146
	LDA ObjYScreenDistance,X
	BPL bra9_9135
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_9146
bra9_9135:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_9146:
loc9_9146:
	LDA FreezeFlag
	BEQ bra9_914C
	RTS
bra9_914C:
	JMP jmp_54_B5BB
loc9_914F:
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
	BEQ bra9_9171
	CMP #$FF
	BEQ bra9_9171
	JMP loc3_A6B5
bra9_9171:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_91B3
	LDA ObjYScreenDistance,X
	BPL bra9_91A2
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_91B3
bra9_91A2:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_91B3:
loc9_91B3:
	LDA FreezeFlag
	BEQ bra9_91B9
	RTS
bra9_91B9:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_91CD,Y
	STA $32
	LDA tbl9_91CD+1,Y
	STA $33
	JMP ($32)
tbl9_91CD:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_91D7
	.word ptr_AD88
ptr2_91D7:
	LDA ObjectVariables,X
	CMP #$40
	BCS bra9_91E4
	JSR sub9_9224
	JMP loc9_91E7
bra9_91E4:
	JSR sub9_9260
loc9_91E7:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	LDA ObjectVariables,X
	CMP #$40
	BCS bra9_9221
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
	LDA #$12
	STA SFXRegister
	LDX $A4
	LDA ObjectSlot,X
	CLC
	ADC #$02
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	RTS
bra9_9221:
	JMP jmp_54_BF74
sub9_9224:
	LDA FrameCount
	AND #$02
	BEQ bra9_922B
	RTS
bra9_922B:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	LDX $A4
	LDA ObjectVariables,X
	BEQ bra9_9247
	CMP #$20
	BNE bra9_925F_RTS
bra9_9247:
	LDY #$00
	LDA ObjXScreenDistance,X
	BMI bra9_9250
	LDY #$40
bra9_9250:
	STY $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	INC ObjectVariables,X
bra9_925F_RTS:
	RTS
sub9_9260:
	LDA FrameCount
	AND #$1E
	BEQ bra9_9267
	RTS
bra9_9267:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	RTS
	LDX $A4
	LDA ObjectVariables,X
	BPL bra9_9281
	RTS
bra9_9281:
	CMP #$40
	BCS bra9_9291
	LDY #$00
	LDA FrameCount
	AND #$10
	BEQ bra9_929B
	LDY #$01
	BNE bra9_929B
bra9_9291:
	SEC
	SBC #$40
	AND #$07
	TAY
	LDA tbl9_92C3,Y
	TAY
bra9_929B:
	LDA ObjectState,X
	AND #$40
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_92D0,X
	STA $32
	LDA tbl9_92D0+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_92BD
	LDY #$C0
bra9_92BD:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_92C3:
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
tbl9_92D0:
	.word BonyBeetle1
	.word BonyBeetle2
	.word BonyBeetle3
	.word BonyBeetle4
BonyBeetle1:
	.byte $02
	.byte $02
	.byte $AD
	.byte $01
	.byte $02
	.byte $09
	.byte $0A
BonyBeetle2:
	.byte $02
	.byte $02
	.byte $AD
	.byte $03
	.byte $04
	.byte $0B
	.byte $0C
BonyBeetle3:
	.byte $02
	.byte $02
	.byte $AD
	.byte $07
	.byte $08
	.byte $0F
	.byte $10
BonyBeetle4:
	.byte $02
	.byte $02
	.byte $AD
	.byte $05
	.byte $06
	.byte $0D
	.byte $0E
obj_hAC:
	LDX $A4
	LDA ObjectVariables,X
	CMP #$05
	BCS bra9_9303
	JSR sub9_9385
	JMP loc9_9306
bra9_9303:
	JSR sub9_939E
loc9_9306:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_9322
	CMP #$FF
	BEQ bra9_9322
	JMP loc3_A6B5
bra9_9322:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_9364
	LDA ObjYScreenDistance,X
	BPL bra9_9353
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_9364
bra9_9353:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_9364:
loc9_9364:
	LDA FreezeFlag
	BEQ bra9_936A
	RTS
bra9_936A:
	LDA ObjectVariables,X
	CMP #$10
	BCC bra9_9384_RTS
	LDA ObjectSlot,X
	SEC
	SBC #$02
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	LDA #$80
	STA ObjectVariables,X
bra9_9384_RTS:
	RTS
sub9_9385:
	LDA FrameCount
	AND #$3F
	BEQ bra9_938C
	RTS
bra9_938C:
	LDA #$8C
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B132
	RTS
sub9_939E:
	LDA FrameCount
	AND #$02
	BEQ bra9_93A5
	RTS
bra9_93A5:
	LDA #$8C
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B485
	RTS
	LDY #$00
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDA ObjectVariables,X
	CMP #$0D
	BCC bra9_93CC
	LDY #$01
bra9_93CC:
	TYA
	ASL
	TAX
	LDA tbl9_93EC,X
	STA $32
	LDA tbl9_93EC+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_93E6
	LDY #$C0
bra9_93E6:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_93EC:
	.word StunBonyBeetle1
	.word StunBonyBeetle2
StunBonyBeetle1:
	.byte $03
	.byte $02
	.byte $AD
	.byte $FF
	.byte $FF
	.byte $11
	.byte $15
	.byte $16
	.byte $17
StunBonyBeetle2:
	.byte $03
	.byte $02
	.byte $AD
	.byte $12
	.byte $13
	.byte $14
	.byte $18
	.byte $19
	.byte $1A
obj_h8A:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra9_9470
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_9425
	CMP #$FF
	BEQ bra9_9425
	JMP loc3_A6B5
bra9_9425:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_9467
	LDA ObjYScreenDistance,X
	BPL bra9_9456
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_9467
bra9_9456:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_9467:
loc9_9467:
	LDA FreezeFlag
	BEQ bra9_946D
	RTS
bra9_946D:
	JMP jmp_54_B5BB
bra9_9470:
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
	BEQ bra9_9492
	CMP #$FF
	BEQ bra9_9492
	.byte $4C
	.byte $B5
	.byte $A6
bra9_9492:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_94D4
	LDA ObjYScreenDistance,X
	BPL bra9_94C3
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_94D4
bra9_94C3:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_94D4:
loc9_94D4:
	LDA FreezeFlag
	BEQ bra9_94DA
	RTS
bra9_94DA:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_94EE,Y
	STA $32
	LDA tbl9_94EE+1,Y
	STA $33
	JMP ($32)
tbl9_94EE:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_94F6
ptr2_94F6:
	JSR sub9_9500
	JSR jmp_54_BEBC
	JSR jmp_54_BF74
	RTS
sub9_9500:
	LDA FrameCount
	AND #$06
	BEQ bra9_9507
	RTS
bra9_9507:
	LDA #$83
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B132
	RTS
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA ObjectVariables,X
	AND #$08
	BNE bra9_9536
	LDY #$01
	LDA $062B
	AND #$04	;Set animation speed to per 4 frames
	BNE bra9_9536
	INY
bra9_9536:
	TYA
	ASL
	TAX
	LDA tbl9_9556,X
	STA $32
	LDA tbl9_9556+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_9550
	LDY #$C0
bra9_9550:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_9556:
	.word FishBones1
	.word FishBones2
	.word FishBones3
FishBones1:
	.byte $03	;Tile Width
	.byte $02	;Tile Height
	.byte $AD
	.byte $1B, $1C, $1D
	.byte $1E, $1F, $20
FishBones2:
	.byte $03
	.byte $02
	.byte $AD
	.byte $1B, $1C, $1D
	.byte $21, $1F, $20
FishBones3:
	.byte $03
	.byte $02
	.byte $AD
	.byte $1B, $1C, $22
	.byte $1E, $1F, $23
obj_h8C:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_9595
	CMP #$FF
	BEQ bra9_9595
	JMP loc3_A6B5
bra9_9595:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_95D7
	LDA ObjYScreenDistance,X
	BPL bra9_95C6
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_95D7
bra9_95C6:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_95D7:
loc9_95D7:
	LDA FreezeFlag
	BEQ bra9_95DD
	RTS
bra9_95DD:
	LDA ObjectVariables,X
	BPL bra9_960D
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectXPos,X
	SEC
	SBC #$0C
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	SBC #$00
	STA ObjectXScreen,X
	LDA ObjectYPos,X
	SEC
	SBC #$30
	STA ObjectYPos,X
	BCS bra9_960C_RTS
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra9_960C_RTS:
	RTS
bra9_960D:
	LDX $A4
	LDA $062B
	AND #$07
	BNE bra9_9621
	INC ObjectVariables,X
	LDA ObjectVariables,X
	AND #$1F
	STA ObjectVariables,X
bra9_9621:
	LDA $062B
	AND #$03
	BNE bra9_962B
	JSR jmp_54_BBC3
bra9_962B:
	JSR jmp_54_BEBC
	JSR jmp_54_BF74
	RTS
	LDY #$00
	LDX $A4
	LDA #$00
	ASL
	TAX
	LDA tbl9_9657,X
	STA $32
	LDA tbl9_9657+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_9651
	LDY #$C0
bra9_9651:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_9657:
	.word SpikeBall
SpikeBall:
	.byte $04
	.byte $04
	.byte $AC
	.byte $FF
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
obj_hA4:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra9_9676
	JMP loc9_96DD
bra9_9676:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_9692
	CMP #$FF
	BEQ bra9_9692
	JMP loc3_A6B5
bra9_9692:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_96D4
	LDA ObjYScreenDistance,X
	BPL bra9_96C3
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_96D4
bra9_96C3:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_96D4:
loc9_96D4:
	LDA FreezeFlag
	BEQ bra9_96DA
	RTS
bra9_96DA:
	JMP jmp_54_B5BB
loc9_96DD:
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
	BEQ bra9_96FF
	CMP #$FF
	BEQ bra9_96FF
	JMP loc3_A6B5
bra9_96FF:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_9741
	LDA ObjYScreenDistance,X
	BPL bra9_9730
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_9741
bra9_9730:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_9741:
loc9_9741:
	LDA FreezeFlag
	BEQ bra9_9747
	RTS
bra9_9747:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_975B,Y
	STA $32
	LDA tbl9_975B+1,Y
	STA $33
	JMP ($32)
tbl9_975B:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_9765
	.word ptr_AD88
ptr2_9765:
	JSR sub9_978D
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
	LDA #$12
	STA SFXRegister
	JMP loc9_98D1
sub9_978D:
	LDA FrameCount
	AND #$02
	BEQ bra9_9794
	RTS
bra9_9794:
	LDA #$8B
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	RTS
obj_hA2:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra9_97B0
	JMP loc9_9817
bra9_97B0:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_97CC
	CMP #$FF
	BEQ bra9_97CC
	JMP loc3_A6B5
bra9_97CC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_980E
	LDA ObjYScreenDistance,X
	BPL bra9_97FD
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_980E
bra9_97FD:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_980E:
loc9_980E:
	LDA FreezeFlag
	BEQ bra9_9814
	RTS
bra9_9814:
	JMP jmp_54_B5BB
loc9_9817:
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
	BEQ bra9_9839
	CMP #$FF
	BEQ bra9_9839
	JMP loc3_A6B5
bra9_9839:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_987B
	LDA ObjYScreenDistance,X
	BPL bra9_986A
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_987B
bra9_986A:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_987B:
loc9_987B:
	LDA FreezeFlag
	BEQ bra9_9881
	RTS
bra9_9881:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_9895,Y
	STA $32
	LDA tbl9_9895+1,Y
	STA $33
	JMP ($32)
tbl9_9895:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr2_989F
	.word ptr_AD88
ptr2_989F:
	LDA ObjectVariables,X
	CMP #$40
	BCS bra9_98AC
	JSR sub9_98E2
	JMP loc9_98AF
bra9_98AC:
	JSR sub9_991E
loc9_98AF:
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
	LDA #$12
	STA SFXRegister
loc9_98D1:
	LDX $A4
	LDA ObjectSlot,X
	CLC
	ADC #$06
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	RTS
sub9_98E2:
	LDA FrameCount
	AND #$02
	BEQ bra9_98E9
	RTS
bra9_98E9:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	LDX $A4
	LDA ObjectVariables,X
	BEQ bra9_9905
	CMP #$20
	BNE bra9_991D_RTS
bra9_9905:
	LDY #$00
	LDA ObjXScreenDistance,X
	BMI bra9_990E
	LDY #$40
bra9_990E:
	STY $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	INC ObjectVariables,X
bra9_991D_RTS:
	RTS
sub9_991E:
	LDA FrameCount
	AND #$1E
	BEQ bra9_9925
	RTS
bra9_9925:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	LDA ObjectVariables,X
	CMP #$46
	BNE bra9_997F_RTS
	INC ObjectVariables,X
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
	ADC #$08
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,Y
	LDA ObjectState,X
	AND #$40
	STA ObjectState,Y
	LDA #$00
	STA ObjectVariables,Y
	STA ObjectAction,Y
	LDA ObjectSlot,X
	CLC
	ADC #$04
	STA ObjectSlot,Y
bra9_997F_RTS:
	RTS
	LDX $A4
	LDA ObjectVariables,X
	CMP #$40
	BCS bra9_9995
	LDY #$00
	LDA FrameCount
	AND #$10
	BEQ bra9_99A2
	LDY #$01
	BNE bra9_99A2
bra9_9995:
	LDY #$00
	SEC
	SBC #$43
	BCC bra9_99A2
	CMP #$03
	BCS bra9_99A2
	LDY #$02
bra9_99A2:
	LDA ObjectState,X
	AND #$40
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_99CA,X
	STA $32
	LDA tbl9_99CA+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_99C4
	LDY #$C0
bra9_99C4:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_99CA:
	.word DryBones1
	.word DryBones2
	.word DryBones3
DryBones1:
	.byte $03
	.byte $04
	.byte $AC
	.byte $11
	.byte $12
	.byte $FF
	.byte $15
	.byte $17
	.byte $FF
	.byte $1F
	.byte $20
	.byte $21
	.byte $28
	.byte $29
	.byte $2A
DryBones2:
	.byte $03
	.byte $04
	.byte $AC
	.byte $13
	.byte $14
	.byte $FF
	.byte $18
	.byte $19
	.byte $FF
	.byte $1F
	.byte $22
	.byte $23
	.byte $28
	.byte $2B
	.byte $2C
DryBones3:
	.byte $03
	.byte $04
	.byte $AC
	.byte $13
	.byte $14
	.byte $FF
	.byte $18
	.byte $1A
	.byte $1B
	.byte $FF
	.byte $24
	.byte $23
	.byte $FF
	.byte $2D
	.byte $2C
obj_hA8:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_9A1B
	CMP #$FF
	BEQ bra9_9A1B
	JMP loc3_A6B5
bra9_9A1B:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_9A5D
	LDA ObjYScreenDistance,X
	BPL bra9_9A4C
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_9A5D
bra9_9A4C:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_9A5D:
loc9_9A5D:
	LDA FreezeFlag
	BEQ bra9_9A63
	RTS
bra9_9A63:
	LDA FrameCount
	AND #$07
	BNE bra9_9A86_RTS
	INC ObjectVariables,X
	LDA ObjectVariables,X
	CMP #$20
	BCC bra9_9A86_RTS
	LDA ObjectSlot,X
	SEC
	SBC #$06
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	LDA #$80
	STA ObjectVariables,X
bra9_9A86_RTS:
	RTS
	LDY #$00
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDA ObjectVariables,X
	CMP #$1D
	BCC bra9_9AA2
	LDY #$01
	CMP #$31
	BCC bra9_9AA2
	LDY #$02
bra9_9AA2:
	TYA
	ASL
	TAX
	LDA tbl9_9AC2,X
	STA $32
	LDA tbl9_9AC2+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_9ABC
	LDY #$C0
bra9_9ABC:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_9AC2:
	.word StunDryBones1
	.word StunDryBones2
	.word StunDryBones3
StunDryBones1:
	.byte $03
	.byte $04
	.byte $AC
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $36
	.byte $37
	.byte $38
StunDryBones2:
	.byte $03
	.byte $04
	.byte $AC
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $2E
	.byte $2F
	.byte $30
	.byte $33
	.byte $34
	.byte $35
StunDryBones3:
	.byte $03
	.byte $04
	.byte $AC
	.byte $11
	.byte $12
	.byte $FF
	.byte $15
	.byte $16
	.byte $FF
	.byte $1C
	.byte $1D
	.byte $1E
	.byte $25
	.byte $26
	.byte $27
obj_hA6:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra9_9B13
	CMP #$FF
	BEQ bra9_9B13
	JMP loc3_A6B5
bra9_9B13:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_9B55
	LDA ObjYScreenDistance,X
	BPL bra9_9B44
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_9B55
bra9_9B44:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_9B55:
loc9_9B55:
	LDA FreezeFlag
	BEQ bra9_9B5B
	RTS
bra9_9B5B:
	LDA FrameCount
	AND #$00
	BEQ bra9_9B62
	RTS
bra9_9B62:
	LDA #$8B
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B132
	JSR jmp_54_BEBC
	JMP jmp_54_BF74
	LDY #$00
	LDX $A4
	LDA FrameCount
	AND #$0E
	TAY
	LDA tbl9_9BAB,Y
	STA $05F0
	LDA tbl9_9BAA,Y
	ASL
	TAX
	LDA tbl9_9BBA,X
	STA $32
	LDA tbl9_9BBA+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra9_9BA4
	LDY #$C0
bra9_9BA4:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_9BAA:
	.byte $00
tbl9_9BAB:
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $40
	.byte $03
	.byte $00
	.byte $03
	.byte $00
	.byte $02
	.byte $C0
	.byte $02
	.byte $80
	.byte $00
	.byte $00
tbl9_9BBA:
	.word Bone1
	.word Bone2
	.word Bone3
	.word Bone4
Bone1:
	.byte $02
	.byte $02
	.byte $AC
	.byte $FF
	.byte $31
	.byte $39
	.byte $3A
Bone2:
	.byte $02
	.byte $02
	.byte $AC
	.byte $FF
	.byte $32
	.byte $FF
	.byte $3B
Bone3:
	.byte $02
	.byte $02
	.byte $AC
	.byte $39
	.byte $3A
	.byte $FF
	.byte $31
Bone4:
	.byte $02
	.byte $02
	.byte $AC
	.byte $32
	.byte $FF
	.byte $3B
	.byte $FF
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
	.byte $00
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
	.byte $01
tbl9_9C5E:
	.word ofs_9C78
	.word ofs_9C7B
	.word ofs_9C78
	.word ofs_9C7E
	.word ofs_9C9F
	.word ofs_9CCC
	.word ofs_9CED
	.word ofs_9CF0
	.word ofs_9D3B
	.word ofs_9DBC
	.word ofs_9DF3
	.word ofs_9E84
	.word ofs_9E87
ofs_9C78:
	.byte $03
	.byte $00
	.byte $80
ofs_9C7B:
	.byte $00
	.byte $01
	.byte $80
ofs_9C7E:
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $04
	.byte $00
	.byte $04
	.byte $00
	.byte $04
	.byte $00
	.byte $04
	.byte $00
	.byte $04
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $80
ofs_9C9F:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $81
	.byte $00
	.byte $08
	.byte $00
	.byte $07
	.byte $00
	.byte $07
	.byte $00
	.byte $07
	.byte $00
	.byte $04
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $80
ofs_9CCC:
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $81
	.byte $00
	.byte $00
	.byte $F8
	.byte $00
	.byte $FA
	.byte $00
	.byte $FB
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $03
	.byte $00
	.byte $04
	.byte $00
	.byte $05
	.byte $00
	.byte $06
	.byte $00
	.byte $08
	.byte $80
ofs_9CED:
	.byte $02
	.byte $00
	.byte $80
ofs_9CF0:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $F6
	.byte $00
	.byte $F6
	.byte $00
	.byte $F6
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $FA
	.byte $00
	.byte $FA
	.byte $00
	.byte $FB
	.byte $00
	.byte $FB
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $03
	.byte $00
	.byte $04
	.byte $00
	.byte $05
	.byte $00
	.byte $05
	.byte $00
	.byte $06
	.byte $00
	.byte $06
	.byte $00
	.byte $08
	.byte $00
	.byte $08
	.byte $00
	.byte $08
	.byte $00
	.byte $08
	.byte $00
	.byte $0A
	.byte $00
	.byte $0A
	.byte $00
	.byte $0A
	.byte $00
	.byte $00
	.byte $80
ofs_9D3B:
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $80
ofs_9DBC:
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $FA
	.byte $02
	.byte $FB
	.byte $02
	.byte $FC
	.byte $02
	.byte $FC
	.byte $02
	.byte $FD
	.byte $02
	.byte $FD
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FF
	.byte $02
	.byte $FF
	.byte $02
	.byte $00
	.byte $80
ofs_9DF3:
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
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $80
ofs_9E84:
	.byte $01
	.byte $00
	.byte $80
ofs_9E87:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $FE
	.byte $00
	.byte $02
	.byte $00
	.byte $FE
	.byte $00
	.byte $02
	.byte $00
	.byte $FE
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $81
	.byte $9E
	STA $33
	JMP ($32)	;This code seems to be cut off/overwritten
	.byte $BB
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $B8
	.byte $9E
	LDA ObjXScreenDistance,X	;The rest of the code in this is unused
	BPL bra9_9EE4_RTS
	LDA #$23
	STA MusicRegister
	LDA #$06
	STA Event
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAY
	LDA $0399
	BEQ bra9_9ED9
	TYA
	CLC
	ADC #$1C
	TAY
bra9_9ED9:
	LDA #$00
	STA CheckpointFlag,Y
	STA InvincibilityTimer
	STA PlayerPowerupBuffer
bra9_9EE4_RTS:
	RTS
	LDA PlayerPowerup
	BNE bra9_9EF6_RTS
	INC PlayerPowerup
	LDA #$07
	STA Event
	LDA #$01
	STA PlayerPowerupBuffer
bra9_9EF6_RTS:
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
	BEQ bra9_9F15
	CMP #$FF
	BEQ bra9_9F15
	JMP loc3_A6B5
bra9_9F15:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra9_9F57
	LDA ObjYScreenDistance,X
	BPL bra9_9F46
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc9_9F57
bra9_9F46:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra9_9F57:
loc9_9F57:
	LDA FreezeFlag
	BEQ bra9_9F5D
	RTS
bra9_9F5D:
	LDA ObjectVariables,X
	BPL bra9_9F78
	LDA $058C,X
	CMP #$02
	BEQ bra9_9F78
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectXPos,X
	CLC
	ADC #$0F
	STA ObjectXPos,X
	RTS
bra9_9F78:
	LDA $058C,X
	CMP #$02
	BEQ bra9_9F8D
	LDA ObjXScreenDistance,X
	BPL bra9_9F8C_RTS
bra9_9F84:
	INC $E0
	LDX $0399
	INC $036A,X
bra9_9F8C_RTS:
	RTS
bra9_9F8D:
	LDA ObjXScreenDistance,X
	BPL bra9_9F84
	RTS
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
