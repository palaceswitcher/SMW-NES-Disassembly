;disassembled by BZK 6502 Disassembler
sub4_8000:
	LDX $A4
	LDA ObjectVariables,X
	AND #$7F
	ASL
	TAY
	LDA ObjectState,X
	AND #$20
	BNE bra4_8013
	JMP loc4_809A
bra4_8013:
	JSR sub3_B077
	BNE bra4_8070
	LDA ObjectVariables,X
	AND #$7F
	CMP #$07
	BCS bra4_8024
	INC ObjectVariables,X
bra4_8024:
	PHA
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	PLA
	BMI bra4_8036
	LDA ObjectYScreen,X
	ADC #$00
	BPL bra4_803B
bra4_8036:
	LDA ObjectYScreen,X	;unlogged
	SBC #$00			;unlogged
bra4_803B:
	STA ObjectYScreen,X
	JSR sub3_B057
	BNE bra4_806F_RTS
	LDY #$00
	LDA ($32),Y
	TAY
	LDA ObjectState,X
	AND #$40
	BEQ bra4_8054
	TYA
	EOR #$FF
	TAY
	INY
bra4_8054:
	TYA
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra4_8067
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra4_806C
bra4_8067:
	LDA ObjectXScreen,X
	SBC #$00
bra4_806C:
	STA ObjectXScreen,X
bra4_806F_RTS:
	RTS
bra4_8070:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA ObjectYPos,X
	SEC
	SBC $25
	BCS bra4_8086
	DEC ObjectYScreen,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
bra4_8086:
	STA ObjectYPos,X
	LDA ObjectState,X
	AND #$C0
	STA ObjectState,X
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
loc4_809A:
	INY
	LDA ($32),Y
	BMI bra4_80B8
	JSR sub3_B077
	BNE bra4_80B8
	LDA ObjectState,X
	ORA #$20
	STA ObjectState,X
	STA ObjectState,X
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
bra4_80B8:
	DEY
	JSR sub3_B057
	BEQ bra4_80C2
	INY
	JMP loc4_80F0
bra4_80C2:
	LDA ObjectState,X
	AND #$40
	BEQ bra4_80D3
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc4_80D5
bra4_80D3:
	LDA ($32),Y
loc4_80D5:
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra4_80E7
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra4_80EC
bra4_80E7:
	LDA ObjectXScreen,X
	SBC #$00
bra4_80EC:
	STA ObjectXScreen,X
	INY
loc4_80F0:
	LDA ($32),Y
	PHA
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	PLA
	BMI bra4_8104
	LDA ObjectYScreen,X
	ADC #$00
	BPL bra4_8109
bra4_8104:
	LDA ObjectYScreen,X
	SBC #$00
bra4_8109:
	STA ObjectYScreen,X
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra4_811E
	LDA ObjectState,X	;unlogged
	EOR #$40	;unlogged
	STA ObjectState,X	;unlogged
	JMP loc4_813C	;unlogged
bra4_811E:
	AND #$F0
	BEQ bra4_813C
	LDA ($32),Y
	AND #$3F
	BNE bra4_8131
	LDA ObjectVariables,X	;unlogged
	AND #$80	;unlogged
	STA ObjectVariables,X	;unlogged
	RTS	;unlogged
bra4_8131:
	STA $32
	LDA ObjectVariables,X
	SEC
	SBC $32
	STA ObjectVariables,X
bra4_813C:
loc4_813C:
	INC ObjectVariables,X
	RTS
sub4_8140:
	LDX $A4
	LDA ObjectVariables,X
	AND #$7F
	ASL
	TAY
	LDA ObjectState,X
	AND #$20
	BNE bra4_8153
	JMP loc4_81D1
bra4_8153:
	JSR sub3_B077
	BNE bra4_81B8
	LDA ObjectVariables,X
	AND #$7F
	CMP #$07
	BCS bra4_8164
	INC ObjectVariables,X
bra4_8164:
	PHA
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	PLA
	BMI bra4_8176
	LDA ObjectYScreen,X
	ADC #$00
	BPL bra4_817B
bra4_8176:
	LDA ObjectYScreen,X
	SBC #$00
bra4_817B:
	STA ObjectYScreen,X
	JSR sub3_B057
	BEQ bra4_818B
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra4_818B:
	LDY #$00
	LDA ($32),Y
	TAY
	LDA ObjectState,X
	AND #$40
	BEQ bra4_819C
	TYA
	EOR #$FF
	TAY
	INY
bra4_819C:
	TYA
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra4_81AF
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra4_81B4
bra4_81AF:
	LDA ObjectXScreen,X
	SBC #$00
bra4_81B4:
	STA ObjectXScreen,X
	RTS
bra4_81B8:
	LDA ObjectYPos,X
	AND #$F8
	STA ObjectYPos,X
	LDA ObjectState,X
	AND #$C0
	STA ObjectState,X
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
loc4_81D1:
	INY
	LDA ($32),Y
	BMI bra4_81EC
	JSR sub3_B077
	BNE bra4_81EC
	LDA ObjectState,X
	ORA #$20
	STA ObjectState,X
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
bra4_81EC:
	DEY
	JSR sub3_B057
	BEQ bra4_81FA
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra4_81FA:
	LDA ObjectState,X
	AND #$40
	BEQ bra4_820B
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc4_820D
bra4_820B:
	LDA ($32),Y
loc4_820D:
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra4_821F
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra4_8224
bra4_821F:
	LDA ObjectXScreen,X
	SBC #$00
bra4_8224:
	STA ObjectXScreen,X
	INY
	LDA ($32),Y
	PHA
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	PLA
	BMI bra4_823C
	LDA ObjectYScreen,X
	ADC #$00
	BPL bra4_8241
bra4_823C:
	LDA ObjectYScreen,X
	SBC #$00
bra4_8241:
	STA ObjectYScreen,X
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra4_8256
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
	JMP loc4_8274
bra4_8256:
	AND #$F0
	BEQ bra4_8274
	LDA ($32),Y
	AND #$3F
	BNE bra4_8269
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
bra4_8269:
	STA $32
	LDA ObjectVariables,X
	SEC
	SBC $32
	STA ObjectVariables,X
bra4_8274:
loc4_8274:
	INC ObjectVariables,X
	RTS
obj_hBE:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra4_8282
	JMP loc4_82F0
bra4_8282:
	CMP #$80
	BEQ bra4_8289
	JMP sub_54_B4FC
bra4_8289:
	LDA ObjectXPos,X	;unlogged
	SEC	;unlogged
	SBC PlayerXPosDup	;unlogged
	STA ObjectXDistance,X	;unlogged
	LDA ObjectXScreen,X	;unlogged
	SBC PlayerXScreenDup	;unlogged
	STA ObjXScreenDistance,X	;unlogged
	STA $28	;unlogged
	BEQ bra4_82A5	;unlogged
	CMP #$FF	;unlogged
	BEQ bra4_82A5	;unlogged
	JMP loc3_A6B5	;unlogged
bra4_82A5:
	LDA ObjectYPos,X	;unlogged
	SEC	;unlogged
	SBC PlayerYPosDup	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjectYScreen,X	;unlogged
	SBC PlayerYScreenDup	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	LDA PlayerYScreenDup	;unlogged
	CMP ObjectYScreen,X	;unlogged
	BEQ bra4_82E7	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	BPL bra4_82D6	;unlogged
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_82E7	;unlogged
bra4_82D6:
	LDA ObjectYDistance,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	SBC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
bra4_82E7:
loc4_82E7:
	LDA FreezeFlag	;unlogged
	BEQ bra4_82ED	;unlogged
	RTS	;unlogged
bra4_82ED:
	JMP jmp_54_B5BB	;unlogged
loc4_82F0:
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
	BEQ bra4_8312
	CMP #$FF
	BEQ bra4_8312
	JMP loc3_A6B5
bra4_8312:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_8354
	LDA ObjYScreenDistance,X
	BPL bra4_8343
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_8354	;unlogged
bra4_8343:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_8354:
loc4_8354:
	LDA FreezeFlag
	BEQ bra4_835A
	RTS	;unlogged
bra4_835A:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_836E,Y
	STA $32
	LDA tbl4_836E+1,Y
	STA $33
	JMP ($32)
tbl4_836E:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr9_8378
	.word ptr_AD88
ptr9_8378:
	JSR sub4_83B3
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$30
	STA PlayerXSpeed
	LDA #$01
	JSR sub3_BCD4
	LDA #$12
	STA SFXRegister
	LDA ObjectSlot,X
	CLC
	ADC #$04
	CMP #$D0
	BCC bra4_83AA
	LDA #$81
	STA ObjectVariables,X
	RTS
bra4_83AA:
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	RTS
sub4_83B3:
	LDA ObjectVariables,X
	CMP #$08
	BCS bra4_8422
	LDA ObjectState,X
	AND #$20
	BEQ bra4_83DC
	LDA $062B	;unlogged
	AND #$00	;unlogged
	BNE bra4_83D9	;unlogged
	LDA #$80	;unlogged
	ASL	;unlogged
	TAY	;unlogged
	LDA tbl4_9A83,Y	;unlogged
	STA $32	;unlogged
	LDA tbl4_9A83+1,Y	;unlogged
	STA $33	;unlogged
	JSR sub4_8140	;unlogged
bra4_83D9:
	JMP loc4_83F4	;unlogged
bra4_83DC:
	LDA $062B
	AND #$0E
	BNE bra4_83F4
	LDA #$80
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_83F4:
loc4_83F4:
	LDA ObjectVariables,X
	CMP #$04
	BCC bra4_8421_RTS
	LDA ObjYScreenDistance,X
	BPL bra4_8421_RTS
	LDA ObjectSlot,X
	CLC
	ADC #$02
	STA ObjectSlot,X
	LDA #$11
	STA ObjectVariables,X
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
bra4_8421_RTS:
	RTS
bra4_8422:
	LDA $062B
	AND #$00
	BNE bra4_843A_RTS
	LDA #$80
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_843A_RTS:
	RTS
ptr9_843B:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra4_8446
	LDY #$03
	BNE bra4_8468
bra4_8446:
	CMP #$08
	BCS bra4_845D
	LDY #$00
	LDA $062B
	AND #$20
	BEQ bra4_8455
	LDY #$40
bra4_8455:
	STY $05F0
	LDA #$00
	JMP loc4_9104
bra4_845D:
	LDY #$01
	LDA $062B
	AND #$04
	BEQ bra4_8468
	LDY #$02
bra4_8468:
	LDA ObjectState,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $40
	.byte $01
	.byte $00
obj_hC0:
	LDX $A4
	LDA ObjectVariables,X
	CMP #$80
	BEQ bra4_8488
	JMP loc4_84F6
bra4_8488:
	CMP #$80
	BEQ bra4_848F
	JMP sub_54_B4FC	;unlogged
bra4_848F:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_84AB
	CMP #$FF
	BEQ bra4_84AB
	JMP loc3_A6B5	;unlogged
bra4_84AB:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_84ED
	LDA ObjYScreenDistance,X
	BPL bra4_84DC
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_84ED	;unlogged
bra4_84DC:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_84ED:
loc4_84ED:
	LDA FreezeFlag
	BEQ bra4_84F3
	RTS	;unlogged
bra4_84F3:
	JMP jmp_54_B5BB
loc4_84F6:
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
	BEQ bra4_8518
	CMP #$FF
	BEQ bra4_8518
	JMP loc3_A6B5
bra4_8518:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_855A
	LDA ObjYScreenDistance,X
	BPL bra4_8549
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_855A	;unlogged
bra4_8549:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_855A:
loc4_855A:
	LDA FreezeFlag
	BEQ bra4_8560
	RTS	;unlogged
bra4_8560:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8574,Y
	STA $32
	LDA tbl4_8574+1,Y
	STA $33
	JMP ($32)
tbl4_8574:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr9_857E
	.word ptr_AD88
ptr9_857E:
	JSR sub4_85B9
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$30
	STA PlayerXSpeed
	LDA #$01
	JSR sub3_BCD4
	LDA #$12
	STA SFXRegister
	LDA ObjectSlot,X
	CLC
	ADC #$02
	CMP #$D0
	BCC bra4_85B0
	LDA #$81
	STA ObjectVariables,X
	RTS
bra4_85B0:
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	RTS
sub4_85B9:
	LDA ObjectVariables,X
	CMP #$11
	BCC bra4_85CA
	JSR sub3_B057
	BEQ bra4_85CA
	LDA #$01
	STA ObjectVariables,X
bra4_85CA:
	LDA $062B
	AND #$00
	BNE bra4_85E2
	LDA #$81
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8000
bra4_85E2:
	LDA ObjectVariables,X
	CMP #$11
	BCS bra4_8611
	LDA ObjectState,X
	AND #$20
	BNE bra4_8610_RTS
	LDA ObjectVariables,X
	BNE bra4_8610_RTS
	LDA ObjYScreenDistance,X
	BPL bra4_85FD
	JMP loc4_8631
bra4_85FD:
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
bra4_8610_RTS:
	RTS
bra4_8611:
	LDA $062B
	AND #$1E
	BNE bra4_863F_RTS
	LDA ObjYScreenDistance,X
	BPL bra4_8631
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	RTS
bra4_8631:
loc4_8631:
	LDA ObjectSlot,X
	SEC
	SBC #$02
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
bra4_863F_RTS:
	RTS
	LDX $A4
	LDA ObjectVariables,X
	BPL bra4_864B
	LDY #$03
	BNE bra4_8669
bra4_864B:
	LDA ObjectState,X
	AND #$20
	BNE bra4_865E
	LDA ObjectVariables,X
	CMP #$11
	BCS bra4_865E
	LDY #$03
	JMP loc4_8669
bra4_865E:
	LDY #$01
	LDA $062B
	AND #$02
	BEQ bra4_8669
	LDY #$02
bra4_8669:
loc4_8669:
	LDA ObjectState,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
obj_hC2:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra4_867F
	JMP loc4_86E6
bra4_867F:
	LDA ObjectXPos,X	;unlogged
	SEC	;unlogged
	SBC PlayerXPosDup	;unlogged
	STA ObjectXDistance,X	;unlogged
	LDA ObjectXScreen,X	;unlogged
	SBC PlayerXScreenDup	;unlogged
	STA ObjXScreenDistance,X	;unlogged
	STA $28	;unlogged
	BEQ bra4_869B	;unlogged
	CMP #$FF	;unlogged
	BEQ bra4_869B	;unlogged
	JMP loc3_A6B5	;unlogged
bra4_869B:
	LDA ObjectYPos,X	;unlogged
	SEC	;unlogged
	SBC PlayerYPosDup	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjectYScreen,X	;unlogged
	SBC PlayerYScreenDup	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	LDA PlayerYScreenDup	;unlogged
	CMP ObjectYScreen,X	;unlogged
	BEQ bra4_86DD	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	BPL bra4_86CC	;unlogged
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_86DD	;unlogged
bra4_86CC:
	LDA ObjectYDistance,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	SBC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
bra4_86DD:
loc4_86DD:
	LDA FreezeFlag	;unlogged
	BEQ bra4_86E3	;unlogged
	RTS	;unlogged
bra4_86E3:
	JMP jmp_54_B5BB	;unlogged
loc4_86E6:
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
	BEQ bra4_8708
	CMP #$FF
	BEQ bra4_8708
	JMP loc3_A6B5	;unlogged
bra4_8708:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_874A
	LDA ObjYScreenDistance,X
	BPL bra4_8739
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_874A	;unlogged
bra4_8739:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_874A:
loc4_874A:
	LDA FreezeFlag
	BEQ bra4_8750
	RTS	;unlogged
bra4_8750:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8764,Y
	STA $32
	LDA tbl4_8764+1,Y
	STA $33
	JMP ($32)
tbl4_8764:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr9_876E
	.word ptr_AD88
ptr9_876E:
	JSR sub4_8778
	JSR jmp_54_A6D4
	JSR jmp_54_BC3E
	RTS
sub4_8778:
	LDA ObjectState,X
	AND #$20
	BEQ bra4_879A
	LDA $062B
	AND #$00
	BNE bra4_8797
	LDA #$82
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8797:
	JMP loc4_87C7_RTS
bra4_879A:
	LDA $062B
	AND #$02
	BNE bra4_87B2
	LDA #$82
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_87B2:
	LDA ObjectVariables,X
	CMP #$0E
	BCC bra4_87C7_RTS
	LDA ObjectSlot,X
	CLC
	ADC #$02
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
bra4_87C7_RTS:
loc4_87C7_RTS:
	RTS
	LDX $A4
	LDA ObjectVariables,X
	BPL bra4_87DC
	LDA ObjectState,X	;unlogged
	AND #$40	;unlogged
	STA $05F0	;unlogged
	LDA #$03	;unlogged
	JMP loc4_9104	;unlogged
bra4_87DC:
	CMP #$0A
	BCS bra4_87F1
	AND #$0F
	TAY
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDA tbl4_8804,Y
	JMP loc4_9104
bra4_87F1:
	LDY #$00
	LDA $062B
	AND #$04
	BEQ bra4_87FC
	LDY #$40
bra4_87FC:
	STY $05F0
	LDA #$07
	JMP loc4_9104
tbl4_8804:
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
obj_hCE:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra4_881E
	JMP loc4_8920
bra4_881E:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_883A
	CMP #$FF
	BEQ bra4_883A
	JMP loc3_A6B5	;unlogged
bra4_883A:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_887C
	LDA ObjYScreenDistance,X
	BPL bra4_886B
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_887C	;unlogged
bra4_886B:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_887C:
loc4_887C:
	LDA FreezeFlag
	BEQ bra4_8882
	RTS	;unlogged
bra4_8882:
	JSR jmp_54_B5BB
	LDY #$50
	LDA ObjectState,X
	AND #$40
	BNE bra4_8890
	LDY #$B0
bra4_8890:
	STY $25
	TYA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	LDA $25
	BMI bra4_88A6
	LDA ObjectXScreen,X
	ADC #$00
	JMP loc4_88AB
bra4_88A6:
	LDA ObjectXScreen,X
	SBC #$00
loc4_88AB:
	STA ObjectXScreen,X
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_88CA
	CMP #$FF
	BEQ bra4_88CA
	JMP loc3_A6B5	;unlogged
bra4_88CA:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_890C
	LDA ObjYScreenDistance,X
	BPL bra4_88FB
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_890C	;unlogged
bra4_88FB:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_890C:
loc4_890C:
	LDA FreezeFlag
	BEQ bra4_8912
	RTS	;unlogged
bra4_8912:
	LDA ObjectSlot,X
	AND #$01
	TAY
	LDA #$AA
	STA $03C9,Y
	JMP loc4_8A27
loc4_8920:
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
	BEQ bra4_8942
	CMP #$FF
	BEQ bra4_8942
	JMP loc3_A6B5
bra4_8942:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_8984
	LDA ObjYScreenDistance,X
	BPL bra4_8973
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_8984	;unlogged
bra4_8973:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_8984:
loc4_8984:
	LDA FreezeFlag
	BEQ bra4_898A
	RTS	;unlogged
bra4_898A:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_899E,Y
	STA $32
	LDA tbl4_899E+1,Y
	STA $33
	JMP ($32)
tbl4_899E:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr9_89A8
	.word ptr_AD88
ptr9_89A8:
	JSR sub4_89DA
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$30
	STA PlayerXSpeed
	LDA #$01
	JSR sub3_BCD4
	LDA #$12
	STA SFXRegister
	LDA ObjectSlot,X
	AND #$01
	ORA #$C4
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	RTS
sub4_89DA:
	LDA ObjectState,X
	AND #$20
	BNE bra4_8A06
	LDA ObjectVariables,X
	BNE bra4_8A06
	LDY #$01
	LDA ObjYScreenDistance,X
	BPL bra4_89EF
	LDY #$11
bra4_89EF:
	TYA
	STA ObjectVariables,X
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
bra4_8A06:
	LDA $062B
	AND #$04
	BNE bra4_8A1E
	LDA #$83
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8A1E:
	LDA ObjectVariables,X
	AND #$0F
	CMP #$0D
	BNE bra4_8A80_RTS
loc4_8A27:
	INC ObjectVariables,X
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectState,X
	AND #$40
	BNE bra4_8A49
	LDA ObjectXPos,X
	CLC
	ADC #$10
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,Y
	JMP loc4_8A55
bra4_8A49:
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
loc4_8A55:
	LDA ObjectYPos,X
	CLC
	ADC #$0C
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
	AND #$01
	ORA #$B0
	STA ObjectSlot,Y
bra4_8A80_RTS:
	RTS
	LDX $A4
	LDA ObjectVariables,X
	BPL bra4_8A8C
	LDY #$03
	BNE bra4_8A9F
bra4_8A8C:
	LDY #$0C
	LDA ObjectState,X
	AND #$20
	BNE bra4_8A9F
	LDA ObjectVariables,X
	AND #$1F
	TAY
	LDA tbl4_8AAB,Y
	TAY
bra4_8A9F:
	LDA ObjectState,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
tbl4_8AAB:
	.byte $08
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
	.byte $0A
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $08
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
	.byte $0A
	.byte $08
	.byte $08
	.byte $08
	.byte $08
obj_hAE:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_8AE9
	CMP #$FF
	BEQ bra4_8AE9
	JMP loc3_A6B5
bra4_8AE9:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_8B2B
	LDA ObjYScreenDistance,X
	BPL bra4_8B1A
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_8B2B	;unlogged
bra4_8B1A:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_8B2B:
loc4_8B2B:
	LDA FreezeFlag
	BEQ bra4_8B31
	RTS	;unlogged
bra4_8B31:
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BCC bra4_8B45
bra4_8B3A:
	LDA #$0F
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	RTS
bra4_8B45:
	LDA #$08
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BNE bra4_8B3A
	LDA $062B
	AND #$00
	BNE bra4_8B68
	LDA #$84
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub3_B132
bra4_8B68:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JMP jmp_54_BF74
	LDY #$00
	LDX $A4
	LDA $062B
	AND #$10
	BEQ bra4_8B7E
	LDY #$40
bra4_8B7E:
	STY $05F0
	LDA #$00
	JMP loc4_90CE
obj_hD0:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra4_8B90
	JMP loc4_8BF7
bra4_8B90:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_8BAC
	CMP #$FF	;unlogged
	BEQ bra4_8BAC	;unlogged
	JMP loc3_A6B5	;unlogged
bra4_8BAC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_8BEE	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	BPL bra4_8BDD	;unlogged
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_8BEE	;unlogged
bra4_8BDD:
	LDA ObjectYDistance,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	SBC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
bra4_8BEE:
loc4_8BEE:
	LDA FreezeFlag
	BEQ bra4_8BF4
	RTS	;unlogged
bra4_8BF4:
	JMP jmp_54_B5BB
loc4_8BF7:
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
	BEQ bra4_8C19
	CMP #$FF
	BEQ bra4_8C19
	JMP loc3_A6B5
bra4_8C19:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_8C5B
	LDA ObjYScreenDistance,X	;unlogged
	BPL bra4_8C4A	;unlogged
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_8C5B	;unlogged
bra4_8C4A:
	LDA ObjectYDistance,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	SBC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
bra4_8C5B:
loc4_8C5B:
	LDA FreezeFlag
	BEQ bra4_8C61
	RTS	;unlogged
bra4_8C61:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8C75,Y
	STA $32
	LDA tbl4_8C75+1,Y
	STA $33
	JMP ($32)
tbl4_8C75:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr9_8C7F
	.word ptr_AD88
ptr9_8C7F:
	JSR sub4_8CB1
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$30
	STA PlayerXSpeed
	LDA #$01
	JSR sub3_BCD4
	LDA #$12
	STA SFXRegister
	LDA ObjectSlot,X
	AND #$01
	ORA #$C4
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	RTS
sub4_8CB1:
	LDA ObjectVariables,X
	BNE bra4_8CCC
	INC ObjectVariables,X
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
bra4_8CCC:
	LDY #$0E
	LDA ObjectState,X
	AND #$20
	BEQ bra4_8CD7
	LDY #$00
bra4_8CD7:
	STY $25
	LDA $062B
	AND $25
	BNE bra4_8CF1
	LDA #$85
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8CF1:
	LDA ObjectState,X
	AND #$20
	BNE bra4_8D58_RTS
	LDA ObjectVariables,X
	CMP #$02
	BNE bra4_8D58_RTS
	INC ObjectVariables,X
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectState,X
	AND #$40
	BNE bra4_8D21
	LDA ObjectXPos,X
	CLC
	ADC #$10
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,Y
	JMP loc4_8D2D
bra4_8D21:
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
loc4_8D2D:
	LDA ObjectYPos,X
	CLC
	ADC #$0C
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,Y
	LDA ObjectState,X
	AND #$40
	STA ObjectState,Y
	LDA #$06
	STA ObjectVariables,Y
	STA ObjectAction,Y
	LDA ObjectSlot,X
	AND #$01
	ORA #$B2
	STA ObjectSlot,Y
bra4_8D58_RTS:
	RTS
	LDX $A4
	LDY #$03
	LDA ObjectState,X
	AND #$20
	BNE bra4_8D71
	LDY #$0E
	LDA ObjectVariables,X
	SEC
	SBC #$02
	CMP #$02
	BCC bra4_8D71
	DEY
bra4_8D71:
	LDA ObjectState,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
obj_hB0:
	LDX $A4
	JSR sub4_8DEC
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_8D9E
	CMP #$FF
	BEQ bra4_8D9E
	JMP loc3_A6B5
bra4_8D9E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_8DE0
	LDA ObjYScreenDistance,X
	BPL bra4_8DCF
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc4_8DE0
bra4_8DCF:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_8DE0:
loc4_8DE0:
	LDA FreezeFlag
	BEQ bra4_8DE6
	RTS	;unlogged
bra4_8DE6:
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_8DEC:
	LDA ObjectState,X
	AND #$20
	BNE bra4_8E0B
	LDA ObjectVariables,X
	BNE bra4_8E0B
	LDA $062B
	ADC ObjectXDistance+1,X
	LSR
	ADC ObjectYDistance,X
	AND #$03
	TAY
	LDA tbl4_8E24,Y
	STA ObjectVariables,X
bra4_8E0B:
	LDA $062B
	AND #$02
	BNE bra4_8E23_RTS
	LDA #$86
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8E23_RTS:
	RTS
tbl4_8E24:
	.byte $0E
	.byte $31
	.byte $31
	.byte $20
	LDY #$00
	LDX $A4
	LDA $062B
	AND #$10
	BEQ bra4_8E35
	LDY #$40
bra4_8E35:
	STY $05F0
	LDA #$01
	JMP loc4_90CE
obj_hD2:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra4_8E47
	JMP loc4_8EE3
bra4_8E47:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_8E63
	CMP #$FF
	BEQ bra4_8E63
	JMP loc3_A6B5	;unlogged
bra4_8E63:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_8EA5
	LDA ObjYScreenDistance,X	;unlogged
	BPL bra4_8E94	;unlogged
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_8EA5	;unlogged
bra4_8E94:
	LDA ObjectYDistance,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	SBC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
bra4_8EA5:
loc4_8EA5:
	LDA FreezeFlag
	BEQ bra4_8EAB
	RTS	;unlogged
bra4_8EAB:
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	LDA $062B
	AND #$00
	BNE bra4_8ED6
	LDA #$85
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8ED6:
	LDA ObjectState,X
	AND #$20
	BNE bra4_8EE2_RTS
	LDA #$00
	STA ObjectVariables,X
bra4_8EE2_RTS:
	RTS
loc4_8EE3:
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
	BEQ bra4_8F05
	CMP #$FF
	BEQ bra4_8F05
	JMP loc3_A6B5
bra4_8F05:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_8F47
	LDA ObjYScreenDistance,X	;unlogged
	BPL bra4_8F36	;unlogged
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_8F47	;unlogged
bra4_8F36:
	LDA ObjectYDistance,X	;unlogged
	SEC	;unlogged
	SBC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	SBC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
bra4_8F47:
loc4_8F47:
	LDA FreezeFlag
	BEQ bra4_8F4D
	RTS	;unlogged
bra4_8F4D:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8F61,Y
	STA $32
	LDA tbl4_8F61+1,Y
	STA $33
	JMP ($32)
tbl4_8F61:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr9_8F6B
	.word ptr_AD88
ptr9_8F6B:
	JSR sub4_8F9D
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$30
	STA PlayerXSpeed
	LDA #$01
	JSR sub3_BCD4
	LDA #$12
	STA SFXRegister
	LDA ObjectSlot,X
	AND #$01
	ORA #$C4
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	RTS
sub4_8F9D:
	LDA $062B
	AND #$0E
	BNE bra4_9019_RTS
	INC ObjectVariables,X
	LDA ObjectVariables,X
	CMP #$18
	BCC bra4_8FBA
	CMP #$1F
	BCC bra4_9019_RTS
	LDA #$00
	STA ObjectVariables,X
	JMP loc4_9019_RTS
bra4_8FBA:
	AND #$07
	CMP #$03
	BNE bra4_9019_RTS
	INC ObjectVariables,X
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectState,X
	AND #$40
	BNE bra4_8FE2
	LDA ObjectXPos,X
	CLC
	ADC #$10
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,Y
	JMP loc4_8FEE
bra4_8FE2:
	LDA ObjectXPos,X	;unlogged
	STA ObjectXPos,Y	;unlogged
	LDA ObjectXScreen,X	;unlogged
	STA ObjectXScreen,Y	;unlogged
loc4_8FEE:
	LDA ObjectYPos,X
	CLC
	ADC #$0C
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,Y
	LDA ObjectState,X
	AND #$40
	STA ObjectState,Y
	LDA #$06
	STA ObjectVariables,Y
	STA ObjectAction,Y
	LDA ObjectSlot,X
	AND #$01
	ORA #$B4
	STA ObjectSlot,Y
bra4_9019_RTS:
loc4_9019_RTS:
	RTS
	LDX $A4
	LDY #$0F
	LDA ObjectVariables,X
	CMP #$18
	BCS bra4_9034
	AND #$07
	TAY
	LDA tbl4_9038,Y
	TAY
	LDA ObjectState,X
	AND #$40
	STA $05F0
bra4_9034:
	TYA
	JMP loc4_9104
tbl4_9038:
	.byte $0F
	.byte $10
	.byte $11
	.byte $11
	.byte $12
	.byte $0F
	.byte $0F
	.byte $0F
obj_hB2:
	LDX $A4
	LDA $062B
	AND #$02
	BNE bra4_905A
	LDA #$87
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_905A:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_9076
	CMP #$FF
	BEQ bra4_9076
	JMP loc3_A6B5
bra4_9076:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_90B8
	LDA ObjYScreenDistance,X
	BPL bra4_90A7
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc4_90B8
bra4_90A7:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_90B8:
loc4_90B8:
	LDA FreezeFlag
	BEQ bra4_90BE
	RTS	;unlogged
bra4_90BE:
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
	LDY #$00
	STY $05F0
	LDA #$02
	JMP loc4_90CE
loc4_90CE:
	ASL
	TAX
	LDA tbl4_90EC,X
	STA $32
	LDA tbl4_90EC+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra4_90E7
	LDY #$C0
bra4_90E7:
	STY $36
	JMP jmp_52_AC3B
tbl4_90EC:
	.word Baseball
	.word Football
	.word Rock	;Unused
Baseball:
	.byte $01
	.byte $01
	.byte $AA
	.byte $01
Football:
	.byte $02
	.byte $02
	.byte $AA
	.byte $02, $03
	.byte $06, $07
Rock:
	.byte $02
	.byte $02
	.byte $AF
	.byte $04, $05
	.byte $08, $00
loc4_9104:
	ASL
	TAX
	LDA tbl4_9122,X
	STA $32
	LDA tbl4_9122+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra4_911D
	LDY #$C0
bra4_911D:
	STY $36
	JMP jmp_54_A118
tbl4_9122:
	.word ofs_9148
	.word ofs_9157
	.word ofs_916A
	.word ofs_917D
	.word ofs_9190
	.word ofs_919F
	.word ofs_91AE
	.word ofs_91BD
	.word ofs_923B
	.word ofs_924A
	.word ofs_9259
	.word ofs_9268
	.word ofs_9277
	.word ofs_921B
	.word ofs_922A
	.word ofs_91DF
	.word ofs_91EE
	.word ofs_91FD
	.word ofs_920C
ofs_9148:
	.byte $03	;charging chuck mappings
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $14, $15, $16
	.byte $22, $23, $24
	.byte $2A, $2B, $2C
ofs_9157:
	.byte $04
	.byte $04
	.byte $AA
	.byte $09, $0A, $FF, $FF
	.byte $0D, $0E, $0F, $10
	.byte $1A, $1D, $1E, $FF
	.byte $2C, $2D, $2E, $FF
ofs_916A:
	.byte $04
	.byte $04
	.byte $AA
	.byte $09, $0A, $FF, $FF
	.byte $0D, $0E, $0F, $10
	.byte $1A, $1B, $1C, $FF
	.byte $28, $29, $2A, $2B
ofs_917D:
	.byte $04
	.byte $04
	.byte $A8
	.byte $FF, $1F, $20, $FF
	.byte $23, $24, $25, $26
	.byte $2B, $2C, $2D, $2E
	.byte $33, $34, $35, $36
ofs_9190:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $09, $0A, $FF
	.byte $1A, $0F, $1B
	.byte $25, $26, $27
ofs_919F:
	.byte $03
	.byte $04
	.byte $A9
	.byte $09, $0A, $FF
	.byte $0E, $0F, $10
	.byte $1C, $1D, $1E
	.byte $25, $26, $27
ofs_91AE:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $0B, $0C, $0D
	.byte $17, $18, $19
	.byte $25, $26, $27
ofs_91BD:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $11, $12, $13
	.byte $1F, $20, $21
	.byte $28, $29, $27
	.byte $04	;clapping chuck (unused) mappings
	.byte $04
	.byte $A8
	.byte $FF, $1D, $1E, $FF
	.byte $FF, $21, $22, $FF
	.byte $27, $28, $29, $2A
	.byte $2F, $30, $31, $32
ofs_91DF:
	.byte $04	;digging chuck (unused) mappings
	.byte $03
	.byte $AF
	.byte $FF, $0B, $0C, $0D
	.byte $FF, $16, $17, $18
	.byte $23, $24, $25, $26
ofs_91EE:
	.byte $04
	.byte $03
	.byte $AF
	.byte $FF, $12, $13, $14
	.byte $FF, $1D, $1E, $1F
	.byte $2A, $2B, $2C, $2D
ofs_91FD:
	.byte $04
	.byte $03
	.byte $AF
	.byte $FF, $12, $13, $15
	.byte $FF, $20, $21, $22
	.byte $23, $24, $25, $26
ofs_920C:
	.byte $04
	.byte $03
	.byte $AF
	.byte $0E, $0F, $10, $11
	.byte $19, $1A, $1B, $1C
	.byte $FF, $27, $28, $29
ofs_921B:
	.byte $03	;football chuck mappings
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $30, $31, $32
	.byte $36, $37, $38
	.byte $3C, $3D, $3E
ofs_922A:
	.byte $03
	.byte $04
	.byte $AF
	.byte $FF, $2E, $FF
	.byte $2F, $30, $31
	.byte $32, $33, $34
	.byte $35, $36, $37
	.byte $37	;extra unused bytes
	.byte $38
ofs_923B:
	.byte $03	;baseball chuck mappings
	.byte $04
	.byte $AA
	.byte $FF, $FF, $FF
	.byte $11, $12, $FF
	.byte $1F, $20, $21
	.byte $2F, $30, $31
ofs_924A:
	.byte $03
	.byte $04
	.byte $AA
	.byte $09, $0A, $FF
	.byte $38, $39, $FF
	.byte $3A, $3B, $3C
	.byte $3D, $3E, $3F
ofs_9259:
	.byte $03
	.byte $04
	.byte $AA
	.byte $0B, $0C, $FF
	.byte $16, $18, $19
	.byte $25, $26, $27
	.byte $35, $36, $37
ofs_9268:
	.byte $03	;unused baseball chuck frame
	.byte $04
	.byte $AA
	.byte $0B, $0C, $FF
	.byte $16, $17, $FF
	.byte $25, $26, $27
	.byte $35, $36, $37
ofs_9277:
	.byte $03
	.byte $04
	.byte $AA
	.byte $FF, $FF, $FF
	.byte $13, $14, $15
	.byte $22, $23, $24
	.byte $32, $33, $34
	RTS
obj_hD6:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra4_92C1
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA ObjXScreenDistance,X
	BEQ bra4_92C0_RTS
	CMP #$FF
	BEQ bra4_92C0_RTS
	LDA #$00
	STA BooBuddiesFlag
	JMP loc3_A6B5
bra4_92C0_RTS:
	RTS
bra4_92C1:
	LDA BooBuddiesFlag
	CMP #$FF
	BNE bra4_92CA
	JMP loc3_A6B5	;unlogged
bra4_92CA:
	LDA #$FF
	STA BooBuddiesFlag
	LDA ObjectXPos,X
	STA BooBuddiesXPos
	LDA ObjectXScreen,X
	STA BooBuddiesXScreen
	LDA ObjectYPos,X
	STA BooBuddiesYPos
	LDA ObjectYScreen,X
	STA BooBuddiesYScreen
	LDA #$00
	STA ObjectVariables,X
	LDA #$09
	STA $25
	LDA ObjectSlot,X
	AND #$01
	ORA #$B6
	STA $26
bra4_92F4:
	LDX ObjectCount
	INC ObjectCount
	LDY $25
	LDA tbl4_934B,Y
	STA ObjectVariables,X
	TAY
	LDA tbl4_9983,Y
	PHA
	CLC
	ADC BooBuddiesXPos
	STA ObjectXPos,X
	PLA
	BMI bra4_9314
	LDA BooBuddiesXScreen
	ADC #$00
	BPL bra4_9318
bra4_9314:
	LDA BooBuddiesXScreen
	SBC #$00
bra4_9318:
	STA ObjectXScreen,X
	LDY $25
	LDA tbl4_935F,Y
	STA ObjectState,X
	LDA tbl4_9355,Y
	TAY
	LDA tbl4_9983,Y
	PHA
	CLC
	ADC BooBuddiesYPos
	STA ObjectYPos,X
	PLA
	BMI bra4_933A
	LDA BooBuddiesYScreen
	ADC #$00
	BPL bra4_933E
bra4_933A:
	LDA BooBuddiesYScreen
	SBC #$00
bra4_933E:
	STA ObjectYScreen,X
	LDA $26
	STA ObjectSlot,X
	DEC $25
	BPL bra4_92F4
	RTS
tbl4_934B:
	.byte $0B
	.byte $16
	.byte $21
	.byte $2C
	.byte $37
	.byte $42
	.byte $4D
	.byte $58
	.byte $63
	.byte $6E
tbl4_9355:
	.byte $2B
	.byte $36
	.byte $41
	.byte $4C
	.byte $57
	.byte $62
	.byte $6D
	.byte $78
	.byte $03
	.byte $0E
tbl4_935F:
	.byte $00
	.byte $40
	.byte $80
	.byte $00
	.byte $40
	.byte $80
	.byte $00
	.byte $40
obj_hB4:
	LDX $A4
	LDA BooBuddiesFlag
	CMP #$FF
	BEQ bra4_937B
	LDA #$00
	STA ObjectSlot,X
	STA ObjectState,X
	STA ObjectVariables,X
	RTS
bra4_937B:
	JSR sub4_93B0
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA ObjXScreenDistance,X
	BEQ bra4_93AA
	CMP #$FF
	BEQ bra4_93AA
	RTS
bra4_93AA:
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_93B0:
	LDA FrameCount
	AND #$07
	BEQ bra4_93B7
	RTS
bra4_93B7:
	LDA ObjectVariables,X
	CLC
	ADC #$01
	AND #$7F
	STA ObjectVariables,X
	LDA ObjectVariables,X
	TAY
	LDA tbl4_9983,Y
	PHA
	CLC
	ADC BooBuddiesXPos
	STA ObjectXPos,X
	PLA
	BMI bra4_93D9
	LDA BooBuddiesXScreen
	ADC #$00
	BPL bra4_93DD
bra4_93D9:
	LDA BooBuddiesXScreen
	SBC #$00
bra4_93DD:
	STA ObjectXScreen,X
	TYA
	CLC
	ADC #$20
	AND #$7F
	TAY
	LDA tbl4_9983,Y
	PHA
	CLC
	ADC BooBuddiesYPos
	STA ObjectYPos,X
	PLA
	BMI bra4_93FA
	LDA BooBuddiesYScreen
	ADC #$00
	BPL bra4_93FE
bra4_93FA:
	LDA BooBuddiesYScreen
	SBC #$00
bra4_93FE:
	STA ObjectYScreen,X
	RTS
obj_hD8:
	LDX $A4
	LDA ObjectVariables,X
	CMP #$80
	BEQ bra4_940E
	JMP loc4_9475
bra4_940E:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_942A
	CMP #$FF
	BEQ bra4_942A
	JMP loc3_A6B5
bra4_942A:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_946C
	LDA ObjYScreenDistance,X
	BPL bra4_945B
	LDA ObjectYDistance,X	;unlogged
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYDistance,X	;unlogged
	LDA ObjYScreenDistance,X	;unlogged
	ADC #$00	;unlogged
	STA ObjYScreenDistance,X	;unlogged
	JMP loc4_946C	;unlogged
bra4_945B:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_946C:
loc4_946C:
	LDA FreezeFlag
	BEQ bra4_9472
	RTS	;unlogged
bra4_9472:
	JMP jmp_54_B5BB
loc4_9475:
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
	BEQ bra4_9497
	CMP #$FF
	BEQ bra4_9497
	JMP loc3_A6B5
bra4_9497:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_94D9
	LDA ObjYScreenDistance,X
	BPL bra4_94C8
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc4_94D9
bra4_94C8:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_94D9:
loc4_94D9:
	LDA FreezeFlag
	BEQ bra4_94DF
	RTS
bra4_94DF:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_94F3,Y
	STA $32
	LDA tbl4_94F3+1,Y
	STA $33
	JMP ($32)
tbl4_94F3:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr9_94FD
	.word ptr_AD88
ptr9_94FD:
	JSR sub4_9506
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_9506:
	LDA $062B
	AND #$02
	BNE bra4_951E
	LDA #$88
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub3_B132
bra4_951E:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_953A
	CMP #$FF
	BEQ bra4_953A
	JMP loc3_A6B5	;unlogged
bra4_953A:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_957C
	LDA ObjYScreenDistance,X
	BPL bra4_956B
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc4_957C
bra4_956B:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_957C:
loc4_957C:
	LDA FreezeFlag
	BEQ bra4_9582
	RTS	;unlogged
bra4_9582:
	LDA ObjectVariables,X
	CMP #$20
	BCC bra4_95D0
	LDA PlayerMovement
	AND #$40
	STA $25
	LDA ObjXScreenDistance,X
	AND #$40
	CMP $25
	BEQ bra4_95BC
	LDA ObjYScreenDistance,X
	BMI bra4_95AD
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectState,X
	AND #$DF
	STA ObjectState,X
	JMP loc4_95BC
bra4_95AD:
	LDY #$00
	LDA ObjectState,X
	AND #$20
	BEQ bra4_95B8
	LDY #$10
bra4_95B8:
	TYA
	STA ObjectVariables,X
bra4_95BC:
loc4_95BC:
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	RTS
bra4_95D0:
	LDA ObjectState,X
	AND #$20
	BNE bra4_962E
	LDA PlayerMovement
	AND #$40
	STA $25
	LDA ObjXScreenDistance,X
	AND #$40
	CMP $25
	BNE bra4_95F2
	LDA FrameCount
	AND #$3E
	BNE bra4_95F1_RTS
	LDA #$20
	STA ObjectVariables,X
bra4_95F1_RTS:
	RTS
bra4_95F2:
	LDA ObjectVariables,X
	AND #$0F
	CMP #$0E
	BCC bra4_961A
	LDA ObjYScreenDistance,X
	BPL bra4_961A
	LDA ObjectYDistance,X
	CMP #$C8
	BCS bra4_961A
	LDA FrameCount
	AND #$06
	BNE bra4_961A
	LDA #$10
	STA ObjectVariables,X
	LDA ObjectState,X
	ORA #$20
	STA ObjectState,X
bra4_961A:
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	RTS
bra4_962E:
	LDA PlayerMovement
	AND #$40
	STA $25
	LDA ObjXScreenDistance,X
	AND #$40
	CMP $25
	BNE bra4_9649
	LDA FrameCount
	AND #$3E
	BNE bra4_9648_RTS
	LDA #$20
	STA ObjectVariables,X
bra4_9648_RTS:
	RTS
bra4_9649:
	LDA ObjectVariables,X
	AND #$0F
	CMP #$0E
	BCC bra4_9671
	LDA ObjYScreenDistance,X
	BPL bra4_965E
	LDA ObjectYDistance,X
	CMP #$E0
	BCC bra4_9671
bra4_965E:
	LDA FrameCount
	AND #$06
	BNE bra4_9671
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectState,X
	AND #$DF
	STA ObjectState,X
bra4_9671:
	LDA ObjXScreenDistance,X
	AND #$40
	EOR #$40
	STA $25
	LDA ObjectState,X
	AND #$BF
	ORA $25
	STA ObjectState,X
	RTS
obj_hDA:
	LDX $A4
	LDA ObjectVariables,X
	CMP #$80
	BEQ bra4_9691
	JMP loc4_9703
bra4_9691:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_96AD
	CMP #$FF
	BEQ bra4_96AD
	JMP loc3_A6B5
bra4_96AD:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_96EF
	LDA ObjYScreenDistance,X
	BPL bra4_96DE
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc4_96EF
bra4_96DE:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_96EF:
loc4_96EF:
	LDA FreezeFlag
	BEQ bra4_96F5
	RTS	;unlogged
bra4_96F5:
	JSR jmp_54_B5BB
	LDA $A4
	AND #$03
	ORA ObjectState,X
	STA ObjectState,X
	RTS
loc4_9703:
	JSR sub4_976B
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_9722
	CMP #$FF
	BEQ bra4_9722
	JMP loc3_A6B5
bra4_9722:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_9764
	LDA ObjYScreenDistance,X
	BPL bra4_9753
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc4_9764
bra4_9753:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_9764:
loc4_9764:
	LDA FreezeFlag
	BEQ bra4_976A_RTS
	RTS	;unlogged
bra4_976A_RTS:
	RTS
sub4_976B:
	LDA $062B
	AND #$04
	BNE bra4_9783
	LDA #$89
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub3_B132
bra4_9783:
	LDA ObjectState,X
	AND #$40
	BNE bra4_97A7
	LDA ObjXScreenDistance,X
	BMI bra4_97A4
	LDA ObjectXDistance,X
	CMP #$43
	BCC bra4_97A4
	LDA FrameCount
	AND #$1F
	BNE bra4_97A4
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra4_97A4:
	JMP loc4_97C1
bra4_97A7:
	LDA ObjXScreenDistance,X
	BPL bra4_97C1
	LDA ObjectXDistance,X
	CMP #$C6
	BCS bra4_97C1
	LDA FrameCount
	AND #$7E
	BNE bra4_97C1
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra4_97C1:
loc4_97C1:
	LDA FrameCount
	AND #$7F
	BNE bra4_97E7_RTS
	LDA ObjXScreenDistance,X
	EOR ObjectState,X
	AND #$40
	BEQ bra4_97E7_RTS
	LDA ObjectSlot,X
	CLC
	ADC #$02
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectState,X
	AND #$DF
	STA ObjectState,X
bra4_97E7_RTS:
	RTS
obj_hDC:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra4_9806
	CMP #$FF
	BEQ bra4_9806
	JMP loc3_A6B5
bra4_9806:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra4_9848
	LDA ObjYScreenDistance,X
	BPL bra4_9837
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc4_9848
bra4_9837:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra4_9848:
loc4_9848:
	LDA FreezeFlag
	BEQ bra4_984E
	RTS	;unlogged
bra4_984E:
	JSR sub4_9857
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_9857:
	LDA $062B
	AND #$02
	BNE bra4_986F
	LDA #$8A
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub3_B132
bra4_986F:
	LDA ObjectState,X
	AND #$20
	BNE bra4_9896
	LDA FrameCount
	AND #$1F
	BNE bra4_9895_RTS
	LDA ObjYScreenDistance,X
	BPL bra4_9888
	LDA ObjectYDistance,X
	CMP #$D0
	BCC bra4_9895_RTS
bra4_9888:
	LDA ObjectState,X
	ORA #$20
	STA ObjectState,X
	LDA #$10
	STA ObjectVariables,X
bra4_9895_RTS:
	RTS
bra4_9896:
	LDA FrameCount
	AND #$0F
	BNE bra4_98B6_RTS
	LDA ObjYScreenDistance,X
	BPL bra4_98B6_RTS
	LDA ObjectYDistance,X
	CMP #$9B
	BCS bra4_98B6_RTS
	LDA ObjectSlot,X
	SEC
	SBC #$02
	STA ObjectSlot,X
	LDA #$80
	STA ObjectVariables,X
bra4_98B6_RTS:
	RTS
	LDA FrameCount
	AND #$01
	BEQ bra4_98BE
	RTS
bra4_98BE:
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDA ObjectState,X
	AND #$03
	TAY
	LDA tbl4_98DD,Y
	TAY
	LDA FrameCount
	AND #$10
	BEQ bra4_98D9
	INY
bra4_98D9:
	TYA
	JMP loc4_992B
tbl4_98DD:
	.byte $00
	.byte $02
	.byte $04
	.byte $02
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	LDY #$03
	LDA ObjectVariables,X
	CMP #$20
	BCC bra4_990A
	LDY #$05
	INC ObjectAction,X
	LDA ObjectAction,X
	BMI bra4_990A
	CMP #$20
	BCS bra4_990A
	LDY #$00
	AND #$04
	BEQ bra4_990A
	LDY #$01
bra4_990A:
	TYA
	JMP loc4_992B
	LDX $A4
	LDY #$00
	LDA ObjectState,X
	ROL
	ROL
	ROL
	ROL
	AND #$06
	TAY
	LDA FrameCount
	AND #$10
	BEQ bra4_9923
	INY
bra4_9923:
	LDA #$00
	STA $05F0
	TYA
	AND #$07
loc4_992B:
	ASL
	TAX
	LDA tbl4_9949,X
	STA $32
	LDA tbl4_9949+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra4_9944
	LDY #$C0	;unlogged
bra4_9944:
	STY $36
	JMP jmp_54_A118
tbl4_9949:
	.word ofs_9959
	.word ofs_9960
	.word ofs_9967
	.word ofs_996E
	.word ofs_9975
	.word ofs_997C
	.word ofs_9959	;Unused
	.word ofs_9960	;Unused
ofs_9959:
	.byte $02	;boo mappings
	.byte $02
	.byte $AB
	.byte $01, $02
	.byte $04, $05
ofs_9960:
	.byte $02
	.byte $02
	.byte $AB
	.byte $01, $03
	.byte $06, $07
ofs_9967:
	.byte $02
	.byte $02
	.byte $AB
	.byte $17, $18
	.byte $1D, $1E
ofs_996E:
	.byte $02
	.byte $02
	.byte $AB
	.byte $17, $19
	.byte $1F, $20
ofs_9975:
	.byte $02
	.byte $02
	.byte $AB
	.byte $08, $09
	.byte $0F, $10
ofs_997C:
	.byte $02
	.byte $02
	.byte $AB
	.byte $08, $0A
	.byte $11, $12
tbl4_9983:
	.byte $4F
	.byte $4F
	.byte $4F
	.byte $4E
	.byte $4D
	.byte $4C
	.byte $4B
	.byte $49
	.byte $48
	.byte $46
	.byte $44
	.byte $42
	.byte $40
	.byte $3D
	.byte $3B
	.byte $38
	.byte $35
	.byte $32
	.byte $2F
	.byte $2C
	.byte $29
	.byte $25
	.byte $22
	.byte $1E
	.byte $1A
	.byte $17
	.byte $13
	.byte $0F
	.byte $0B
	.byte $07
	.byte $03
	.byte $00
	.byte $FD
	.byte $F9
	.byte $F5
	.byte $F1
	.byte $ED
	.byte $E9
	.byte $E6
	.byte $E2
	.byte $DE
	.byte $DB
	.byte $D7
	.byte $D4
	.byte $D1
	.byte $CE
	.byte $CB
	.byte $C8
	.byte $C5
	.byte $C3
	.byte $C0
	.byte $BE
	.byte $BC
	.byte $BA
	.byte $B8
	.byte $B7
	.byte $B5
	.byte $B4
	.byte $B3
	.byte $B2
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B2
	.byte $B3
	.byte $B4
	.byte $B5
	.byte $B7
	.byte $B8
	.byte $BA
	.byte $BC
	.byte $BE
	.byte $C0
	.byte $C3
	.byte $C5
	.byte $C8
	.byte $CB
	.byte $CE
	.byte $D1
	.byte $D4
	.byte $D7
	.byte $DB
	.byte $DE
	.byte $E2
	.byte $E6
	.byte $E9
	.byte $ED
	.byte $F1
	.byte $F5
	.byte $F9
	.byte $FD
	.byte $00
	.byte $03
	.byte $07
	.byte $0B
	.byte $0F
	.byte $13
	.byte $17
	.byte $1A
	.byte $1E
	.byte $22
	.byte $25
	.byte $29
	.byte $2C
	.byte $2F
	.byte $32
	.byte $35
	.byte $38
	.byte $3B
	.byte $3D
	.byte $40
	.byte $42
	.byte $44
	.byte $46
	.byte $48
	.byte $49
	.byte $4B
	.byte $4C
	.byte $4D
	.byte $4E
	.byte $4F
	.byte $4F
	.byte $4F
	.byte $4F
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
tbl4_9A83:
	.word ofs_9B1C
	.word ofs_9B7B
	.word ofs_9BA1
	.word ofs_9BC2
	.word ofs_9C02
	.word ofs_9C05
	.word ofs_9C20
	.word ofs_9C8E
	.word ofs_9CB0
	.word ofs_9CF4
	.word ofs_9D33
	.word ofs_9A9B
ofs_9A9B:
	.byte $00
	.byte $00
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
	.byte $00
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
	.byte $00
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
	.byte $00
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
ofs_9B1C:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $FF
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
	.byte $00
	.byte $00
	.byte $80
ofs_9B7B:
	.byte $04
	.byte $00
	.byte $04
	.byte $F8
	.byte $04
	.byte $F8
	.byte $04
	.byte $F8
	.byte $04
	.byte $FA
	.byte $04
	.byte $FA
	.byte $04
	.byte $FC
	.byte $04
	.byte $FC
	.byte $04
	.byte $FC
	.byte $04
	.byte $FD
	.byte $04
	.byte $FD
	.byte $04
	.byte $FE
	.byte $04
	.byte $FE
	.byte $04
	.byte $FF
	.byte $04
	.byte $00
	.byte $00
	.byte $00
	.byte $81
	.byte $00
	.byte $03
	.byte $00
	.byte $81
	.byte $00
ofs_9BA1:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
ofs_9BC2:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $FA
	.byte $00
	.byte $FA
	.byte $00
	.byte $FC
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
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
	.byte $80
	.byte $00
ofs_9C02:
	.byte $01
	.byte $00
	.byte $80
ofs_9C05:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
ofs_9C20:
	.byte $03
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $03
	.byte $FA
	.byte $03
	.byte $FB
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FB
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
ofs_9C8E:
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FB
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
ofs_9CB0:
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
	.byte $FF
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
	.byte $01
	.byte $81
	.byte $00
	.byte $00
	.byte $00
	.byte $81
	.byte $00
ofs_9CF4:
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
ofs_9D33:
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
