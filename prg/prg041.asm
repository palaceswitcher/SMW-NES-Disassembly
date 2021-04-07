;disassembled with BZK 6502 Disassembler
jmp_41_A000:
	LDA a:Event
	ASL
	TAY
	LDA tbl_A012,Y			;
	STA PCPointerLoByte	;Load the lower byte of the pointer
	LDA tbl_A013,Y			;
	STA PCPointerHiByte	;Load the upper byte of the pointer
	JMP (PCPointerLoByte)	;Jump to the pointer that was just loaded
tbl_A012:
			.byte $74
tbl_A013:	.byte $A0
			.byte $A2
			.byte $A0
			.byte $95
			.byte $A6
			.byte $06
			.byte $A7
			.byte $61
			.byte $A7
			.byte $A6
			.byte $A7
			.byte $9E
			.byte $A0
			.byte $D3
			.byte $A7
			.byte $FF
			.byte $A7
			.byte $6F
			.byte $A8
			.byte $92
			.byte $A8
			.byte $FE
			.byte $A8
			.byte $24
			.byte $A9
			.byte $33
			.byte $A9
			.byte $A7
			.byte $A9
			.byte $27
			.byte $A9
			.byte $33
			.byte $A9
			.byte $1D
			.byte $AB
			.byte $27
			.byte $A9
			.byte $8D
			.byte $AC
			.byte $27
			.byte $A9
			.byte $29
			.byte $AD
			.byte $5C
			.byte $AD
			.byte $7E
			.byte $AD
			.byte $C5
			.byte $AD
			.byte $27
			.byte $A9
			.byte $09
			.byte $AE
			.byte $8A
			.byte $99
			.byte $B9
			.byte $AE
			.byte $13
			.byte $AF
			.byte $13
			.byte $AF
			.byte $14
			.byte $AF
			.byte $27
			.byte $A9
			.byte $1F
			.byte $AF
			.byte $4C
			.byte $AF
			.byte $27
			.byte $A9
			.byte $93
			.byte $AF
			.byte $FF
			.byte $A7
			.byte $6F
			.byte $A8
			.byte $92
			.byte $A8
			.byte $28
			.byte $9B
			.byte $F3
			.byte $AF
			.byte $13
			.byte $B0
			.byte $27
			.byte $A9
			.byte $AF
			.byte $AF
			.byte $27
			.byte $A9
			.byte $3E
			.byte $B0
			.byte $27
			.byte $A9
			.byte $62
			.byte $B0
	LDA #42
	STA $08			;
	STA M90_PRG0	;swap first bank to bank 42
	LDA #$00
	STA WorldNumber	;clear world and level numbers
	STA LevelNumber	
	LDA #$0F		;
	STA Player1Lives;set life count to 15 for both players
	STA Player2Lives
	LDA #$01
	STA LevelsCompleted
	STA $039F
	LDA #$1E
	STA $B0
	LDA #$18
	STA $B1
	JSR sub_B75D
	INC a:Event
	RTS
	JSR sub_AE96
	LDA #$55
	STA $0100
	JSR sub_B800
	LDA #$00
	STA $3C						;
	STA PlayerXSpeed			;clears player speed and other variables
	STA PlayerYSpeed			;
	STA PlayerMovement			;
	STA PlayerSpriteAttributes	;
	LDA #42			;
	STA M90_PRG0	;swap 1st bank to bank 42
	LDA #$00
	STA WorldSelectNum
	JSR sub_AACB
	LDA #$00
	JSR $9A44
	JSR sub_AE8A
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	STA $0310
	LDA #musTitle		;
	STA MusicRegister	;play title music
	LDA #$00
	STA BGBlackoutFlag
	STA $0312
	STA $0310
	STA $0607
	LDA #$0A
	STA InterruptMode
	STA LogoFlag
	JSR sub_A107
	JSR sub_B068
	LDA #$00
	STA $52
	LDA #$EF
	STA LogoYOffset
	INC a:Event
	RTS
sub_A107:
	LDX #$07
	LDA #$03
	JSR $8DF8
	LDX #$01
	LDA #$11
	JSR $8DF8
	LDX #$02
	LDA #$13
	JSR $8DF8
	LDA #$9E
	STA $0357
	LDA #$60
	STA $42
	LDA #$00
	STA $034E
	STA $034F
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
	RTS
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
	RTS
	.byte $02
	.byte $0B
tbl_A155:
			.byte $01
tbl_A156:	.byte $00
tbl_A157:	.byte $07
tbl_A158:	.byte $A9
			.byte $01
			.byte $90
			.byte $0D
			.byte $70
			.byte $02
			.byte $30
			.byte $07
			.byte $A9
			.byte $02
			.byte $A0
			.byte $0D
			.byte $70
			.byte $03
			.byte $30
			.byte $0D
			.byte $80
			.byte $04
			.byte $00
			.byte $09
			.byte $A9
			.byte $04
			.byte $B0
			.byte $09
			.byte $A9
			.byte $05
			.byte $30
			.byte $0D
			.byte $50
			.byte $05
			.byte $C0
			.byte $07
			.byte $A9
			.byte $06
			.byte $30
			.byte $0D
			.byte $58
			.byte $06
			.byte $60
			.byte $07
			.byte $A9
			.byte $08
			.byte $30
			.byte $0D
			.byte $80
			.byte $08
			.byte $F0
			.byte $0D
			.byte $60
			.byte $0A
			.byte $30
			.byte $0D
			.byte $60
			.byte $0A
			.byte $60
			.byte $0D
			.byte $A9
			.byte $0B
			.byte $45
			.byte $09
			.byte $A9
			.byte $0B
			.byte $80
			.byte $09
			.byte $A9
			.byte $0C
			.byte $30
			.byte $0D
			.byte $80
			.byte $0C
			.byte $80
			.byte $0D
			.byte $60
			.byte $0D
			.byte $A0
			.byte $0D
			.byte $60
			.byte $0D
			.byte $E0
			.byte $0D
			.byte $60
			.byte $FF
			.byte $FF
			.byte $00
			.byte $00
tbl_A1AD:
	.byte $00
tbl_A1AE:
	.byte $01
tbl_A1AF:
	.byte $03
tbl_A1B0:
	.byte $00
	.byte $00
	.byte $70
	.byte $04
	.byte $00
	.byte $01
	.byte $40
	.byte $02
	.byte $01
	.byte $02
	.byte $30
	.byte $05
	.byte $01
	.byte $02
	.byte $A0
	.byte $06
	.byte $0E
	.byte $03
	.byte $A0
	.byte $01
	.byte $01
	.byte $04
	.byte $2E
	.byte $07
	.byte $01
	.byte $04
	.byte $F0
	.byte $05
	.byte $01
	.byte $05
	.byte $B0
	.byte $06
	.byte $0E
	.byte $05
	.byte $EE
	.byte $07
	.byte $01
	.byte $06
	.byte $70
	.byte $01
	.byte $01
	.byte $06
	.byte $A0
	.byte $01
	.byte $01
	.byte $FF
	.byte $FF
	.byte $02
	.byte $00
sub_A1E1:
	LDA $0360
	ASL
	ASL
	TAX
	LDA tbl_A155,X
	STA $25
	LDA tbl_A156,X
	STA $26
	LDA tbl_A157,X
	STA $27
	LDA tbl_A158,X
	STA $28
	LDA PlayerXScreenDup
	CMP $25
	BNE bra_A22E_RTS
	LDA PlayerXPosDup
	CMP $26
	BNE bra_A22E_RTS
	LDX #$03
bra_A209:
	LDA $B2,X
	BEQ bra_A214
	INX
	CPX #$06
	BCC bra_A209
	BCS bra_A22B
bra_A214:
	STX $30
	LDA $27
	JSR $8DF8
	LDX $30
	LDA $28
	STA $0356,X
	LDA #$01
	STA $034D,X
	LDA #$40
	STA $41,X
bra_A22B:
	INC $0360
bra_A22E_RTS:
	RTS
sub_A22F:
	LDA $0361
	ASL
	ASL
	TAX
	LDA tbl_A1AD,X
	STA $25
	LDA tbl_A1AE,X
	STA $26
	LDA tbl_A1AF,X
	STA $27
	LDA tbl_A1B0,X
	STA $28
	LDA PlayerXScreenDup
	CMP $25
	BNE bra_A262_RTS
	LDA PlayerXPosDup
	CMP $26
	BNE bra_A262_RTS
	LDA $27
	STA $0365
	LDA $28
	STA $0366
	INC $0361
bra_A262_RTS:
	RTS
sub_A263:
	LDA $0365
	ASL
	TAY
	LDA tbl_A275,Y
	STA $32
	LDA tbl_A276,Y
	STA $33
	JMP ($32)
tbl_A275:
	.byte $AE
tbl_A276:
	.byte $A2
	.byte $D8
	.byte $A2
	.byte $3B
	.byte $A4
	.byte $69
	.byte $A5
	.byte $8D
	.byte $A2
	.byte $CE
	.byte $A3
	.byte $68
	.byte $A3
	.byte $80
	.byte $A4
	.byte $80
	.byte $A4
	.byte $80
	.byte $A4
	.byte $80
	.byte $A4
	.byte $80
	.byte $A4
	JSR sub_A2AE
	LDA $42
	CMP #$B0
	BCS bra_A2AD_RTS
	LDX #$01
	JSR $96F6
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
bra_A2AD_RTS:
	RTS
sub_A2AE:
	LDA FrameCount
	AND #$07
	BNE bra_A2C8_RTS
	INC $0367
	LDA $0367
	AND #$01
	BEQ bra_A2C9
	LDA $A2D4
	STA $B3
	LDA $A2D6
	STA $B4
bra_A2C8_RTS:
	RTS
bra_A2C9:
	LDA $A2D5
	STA $B3
	LDA $A2D7
	STA $B4
	RTS
	.byte $11	;player/yoshi frames?
	.byte $12	;
	.byte $13	;
	.byte $14	;
	LDA FrameCount
	AND #$01
	BEQ bra_A313_RTS
	LDA $0366
	BEQ bra_A313_RTS
	LDX $0366
	LDA tbl_A31D,X	;load values from table
	CMP #$80		;when $80 loaded,
	BEQ bra_A314	;branch
	CLC
	ADC $0357
	STA $0357
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
	LDA tbl_A336,X
	STA $B3
	LDA tbl_A34F,X
	STA $B4
	INC $0366
bra_A313_RTS:
	RTS
bra_A314:
	LDA #$00
	STA $0366
	STA $0365
	RTS
tbl_A31D:
	.byte $00
	.byte $F7
	.byte $F8
	.byte $F8
	.byte $F9
	.byte $FA
	.byte $FB
	.byte $FC
	.byte $FD
	.byte $FE
	.byte $FF
	.byte $FF
	.byte $00
	.byte $01
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $08
	.byte $09
	.byte $80
tbl_A336:
	.byte $00
	.byte $11
	.byte $11
	.byte $11
	.byte $11
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
	.byte $12
	.byte $12
	.byte $12
	.byte $80
tbl_A34F:
	.byte $00
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $80
	LDA FrameCount
	AND #$01
	BEQ bra_A3C4_RTS
	LDA $0366
	BEQ bra_A3C4_RTS
	LDX $0366
	LDA tbl_A31D,X
	CMP #$80
	BEQ bra_A3C5
	CLC
	ADC $0357
	STA $0357
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
	LDA PlayerTitleYPos	;
	CMP #$9E			;if the player's y position is below this,
	BCC bra_A3B7		;branch
	LDA #$9E			;
	STA PlayerTitleYPos	;set y position to $9E
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
	JMP loc_A3C5
bra_A3B7:
	LDA tbl_A336,X
	STA $B3
	LDA tbl_A34F,X
	STA $B4
	INC $0366
bra_A3C4_RTS:
	RTS
bra_A3C5:
loc_A3C5:
	LDA #$00
	STA $0366
	STA $0365
	RTS
	LDA FrameCount
	AND #$01
	BEQ bra_A431_RTS
	LDA $0366
	BEQ bra_A431_RTS
	LDX $0366
	LDA tbl_A31D,X
	CMP #$80
	BEQ bra_A432
	CLC
	ADC $0357
	STA $0357
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
	LDA $0366
	CMP #$0C
	BCC bra_A424
	LDA $0357
	CMP #$7E
	BCC bra_A424
	LDA #$7E
	STA $0357
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
	JMP loc_A432
bra_A424:
	LDA tbl_A336,X
	STA $B3
	LDA tbl_A34F,X
	STA $B4
	INC $0366
bra_A431_RTS:
	RTS
bra_A432:
loc_A432:
	LDA #$00
	STA $0366
	STA $0365
	RTS
	LDA FrameCount
	AND #$01
	BEQ bra_A476_RTS
	LDA $0366
	BEQ bra_A476_RTS
	LDX $0366
	LDA tbl_A4FD,X
	CMP #$80
	BEQ bra_A477
	CLC
	ADC $0357
	STA $0357
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
	LDA tbl_A518,X
	STA $B3
	LDA tbl_A533,X
	STA $B4
	INC $0366
bra_A476_RTS:
	RTS
bra_A477:
	LDA #$00
	STA $0366
	STA $0365
	RTS
	LDA FrameCount
	AND #$01
	BEQ bra_A4C3_RTS
	LDA $0366
	BEQ bra_A4C3_RTS
	LDX $0366
	LDA tbl_A4FD,X
	CMP #$80
	BEQ bra_A4C4
	CLC
	ADC $0357
	STA $0357
	CLC
	LDA $42
	ADC $A153
	STA $43
	CLC
	LDA $0357
	ADC $A154
	STA $0358
	LDA tbl_A518,X
	STA $B3
	LDA tbl_A533,X
	STA $B4
	LDA tbl_A54E,X
	STA $B2
	JSR sub_A4E8
	INC $0366
bra_A4C3_RTS:
	RTS
bra_A4C4:
	LDX $0361
	LDA tbl_A4D7,X
	TAX
	LDA #$00
	STA $0366
	STA $0365
	STA $B2,X
	RTS
	.byte $00
tbl_A4D7:
	.byte $00
	.byte $00
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
sub_A4E8:
	CLC
	LDA $42
	ADC $A4FB
	STA $41
	CLC
	LDA $0357
	ADC $A4FC
	STA $0356
	RTS
	.byte $04
	.byte $1B
tbl_A4FD:
	.byte $00
	.byte $F4
	.byte $F7
	.byte $F8
	.byte $F8
	.byte $F9
	.byte $FA
	.byte $FB
	.byte $FC
	.byte $FD
	.byte $FE
	.byte $FF
	.byte $FF
	.byte $00
	.byte $01
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $08
	.byte $09
	.byte $0C
	.byte $80
tbl_A518:
	.byte $00
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $11
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
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $80
tbl_A533:
	.byte $00
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $80
tbl_A54E:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $00
	.byte $80
	LDA #$11
	STA $B3
	LDA #$13
	STA $B4
	RTS
sub_A572:
	INC $0F
	BNE bra_A578
	INC PlayerXScreenDup
bra_A578:
	LDX #$03
bra_A57A:
	LDA $B2,X
	BEQ bra_A581
	JSR $96DB
bra_A581:
	INX
	CPX #$07
	BCC bra_A57A
	RTS
	LDA ButtonsPressed
	AND #$01
	BEQ bra_A5AB_RTS
	LDX #$02
	STX $30
	LDA $0362
	JSR $8DF8
	INC $0362
	LDX $30
	LDA #$80
	STA $0356,X
	LDA #$00
	STA $034D,X
	LDA #$C0
	STA $41,X
bra_A5AB_RTS:
	RTS
sub_A5AC:
	LDX #$03
bra_A5AE:
	LDA $B2,X
	BEQ bra_A5E1
	JSR sub_A5F9
	LDX $29
	CMP #$0D
	BEQ bra_A5C5
	CMP #$0E
	BEQ bra_A5C5
	LDA FrameCount
	AND #$01
	BNE bra_A5DF
bra_A5C5:
	DEC $41,X
	LDA $41,X
	CMP #$FF
	BNE bra_A5D0
	DEC $034D,X
bra_A5D0:
	LDA $034D,X
	BNE bra_A5DF
	LDA $41,X
	CMP #$20
	BCS bra_A5DF
	LDA #$00
	STA $B2,X
bra_A5DF:
	LDX $29
bra_A5E1:
	INX
	CPX #$06
	BCC bra_A5AE
	RTS
	CMP #$0D
	BEQ bra_A5F5
	CMP #$0E
	BEQ bra_A5F5
	LDA FrameCount
	AND #$01
	BNE bra_A5F8_RTS
bra_A5F5:
	JSR $96DB
bra_A5F8_RTS:
	RTS
sub_A5F9:
	STA $28
	STX $29
	LDA $033B,X
	BEQ bra_A635_RTS
	ASL
	TAX
	LDA $8A50,X
	STA $AE
	LDA $8A51,X
	STA $AF
	LDY #$00
	LDA ($AE),Y
	STA $25
	INY
	LDA ($AE),Y
	STA $26
	INY
	INY
	LDA ($AE),Y
	STA $27
	LDA FrameCount
	AND $27
	BNE bra_A635_RTS
	LDX $29
	INC $28
	LDA $28
	CMP $26
	BEQ bra_A636
	BCC bra_A636
	LDA $25
	STA $B2,X
bra_A635_RTS:
	RTS
bra_A636:
	LDA $28
	STA $B2,X
	RTS
	LDA ButtonsPressed
	AND #$80
	BEQ bra_A64C_RTS
	LDA #$07
	STA $0365
	LDA #$01
	STA $0366
bra_A64C_RTS:
	RTS
sub_A64D:
	LDA PlayerXScreenDup
	BEQ bra_A677
	LDX #$07
	JSR $96DB
	LDA #$03
	STA $B9
	LDA $0354
	BNE bra_A677
	LDA $48
	BNE bra_A677
	LDA #$01
	STA $0354
	LDA #$40
	STA $48
	LDA FrameCount
	AND #$03
	TAX
	LDA tbl_A691,X
	STA $035D
bra_A677:
	LDA FrameCount
	AND #$07
	BNE bra_A680
	INC $0363
bra_A680:
	LDA $0363
	AND #$03
	TAX
	LDA tbl_A68D,X
	STA $0362
	RTS
tbl_A68D:
	.byte $F2
	.byte $EC
	.byte $EE
	.byte $FA
tbl_A691:
	.byte $20
	.byte $30
	.byte $20
	.byte $30
	JSR sub_A1E1
	JSR sub_A22F
	JSR sub_A64D
	JSR sub_A263
	JSR sub_A5AC
	JSR $8823
	LDA ButtonsPressed
	AND #$F0
	BNE bra_A6D3
	JSR sub_A572
	LDA PlayerXScreenDup
	CMP #$07
	BCC bra_A6CF
	LDA #$05
	STA $0312
	JSR sub_B068
	LDX #$D0
bra_A6C1:
	LDY #$00
bra_A6C3:
	DEY
	BNE bra_A6C3
	DEX
	BNE bra_A6C1
	LDA #$04
	STA a:Event
	RTS
bra_A6CF:
	JSR sub_B486
	RTS
bra_A6D3:
	JSR sub_AAD4
	JSR sub_AAE0
	LDX #$00
	LDA #$01
	JSR $8DF8
	LDX #$01
	LDA #$02
	JSR $8DF8
	JSR sub_A6EE
	INC a:Event
	RTS
sub_A6EE:
	LDA #$00
	JSR $99FA
	LDX #$F8
	JSR sub_A6F9
	RTS
sub_A6F9:
	LDY #$02
bra_A6FB:
	TXA
	STA $03C5,Y
	INX
	INY
	CPY #$06
	BCC bra_A6FB
	RTS
	JSR $99B2
	JSR $8823
	LDA ButtonsPressed
	AND #$D0
	BEQ bra_A735
	LDA #$05
	STA $0312
	LDA #$0A
	STA SFXRegister
	JSR sub_B068
	LDA #$00
	STA InterruptMode
	STA $0361
	LDA #$00
	STA $52
	LDA #$2A
	STA $08
	LDA #$07
	STA a:Event
	RTS
bra_A735:
	LDA ButtonsPressed
	AND #$08
	BEQ bra_A74B
	LDA #$80
	STA $0357
	LDA #$00
	STA GameType
	LDA #sfxBeep
	STA SFXRegister
	RTS
bra_A74B:
	LDA ButtonsPressed
	AND #$04
	BEQ bra_A760_RTS
	LDA #$90
	STA $0357
	LDA #$01
	STA GameType
	LDA #$05
	STA SFXRegister
bra_A760_RTS:
	RTS
	JSR sub_AE96
	LDA #$2A
	STA M90_PRG0
	LDA #$03
	STA WorldSelectNum
	JSR sub_AACB
	LDA #$03
	JSR $9A44
	JSR sub_AE8A
	JSR sub_AAD4
	JSR sub_AAE0
	LDA #$03
	STA $0310
	LDA #$00
	STA BGBlackoutFlag
	STA $0312
	STA $0607
	STA InterruptMode
	STA LogoFlag
	STA $02
	STA $03
	STA $0368
	STA $0369
	JSR sub_B068
	INC a:Event
	RTS
	LDA ButtonsHeld
	BNE bra_A7BB
	LDA FrameCount
	AND #$0F
	BNE bra_A7B4
	INC $0368
bra_A7B4:
	LDA $0368
	CMP #$10
	BCC bra_A7D2_RTS
bra_A7BB:
	LDA #$05
	STA $0312
	JSR sub_B068
	LDA #$00
	STA a:Event
	STA PlayerXScreenDup
	STA PlayerXPosDup
	STA $0360
	STA $0361
bra_A7D2_RTS:
	RTS
	LDA #$2A
	STA $08
	NOP
	NOP
	INC Event
	NOP
	NOP
	NOP
	RTS
tbl_A7DF:
	.byte $25	;world select music settings
	.byte $25
	.byte $25
	.byte $25
	.byte $25	;World 1
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24	;World 2
	.byte $24
	.byte $24
	.byte $24
	.byte $24	;World 3
	.byte $24
	.byte $24
	.byte $24
	.byte $24	;World 4
	.byte $28
	.byte $28
	.byte $28
	.byte $28
	.byte $28	;World 5
	.byte $27
	.byte $27
	.byte $27
	.byte $27	;World 6
	.byte $27
	.byte $27
	.byte $26
	.byte $26	;World 7
	.byte $00
	LDX #$01
	LDA CurrentPlayer
	BNE bra_A808
	LDX #$00
bra_A808:
	LDA LevelID,X
	STA MapLevelID
	TAX
	LDA tbl_A7DF,X
	STA MusicRegister
	LDA LevelsCompleted,X
	CMP #$06
	BEQ bra_A825
	LDA LevelsCompleted,X
	CMP #$14
	BEQ bra_A825
	JMP loc_A828
bra_A825:
	INC LevelsCompleted,X
loc_A828:
	LDA LevelsCompleted,X
	STA $039B
	JSR sub_AAE0
	JSR sub_AAD4
	LDA #$00
	STA WorldNumber
	STA $0378
	STA $0379
	STA $0360
	STA $0361
	LDA #$01
	STA LevelNumber
	LDA #$38
	STA $B0
	LDA #$30
	STA $B1
	LDX #$05
bra_A854:
	LDA tbl_A869,X
	STA $03C5,X
	DEX
	BPL bra_A854
	LDX #$00
	STX $033B
	JSR sub_AC1D
	INC a:Event
	RTS
tbl_A869:
	.byte $E8
	.byte $EA
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $E7
	JSR sub_B75D
	JSR $99D6
	JSR sub_AE96
	JSR $97D3
	LDA PlayerXScreen
	STA PlayerXScreenDup
	LDA PlayerXPos
	STA PlayerXPosDup
	LDA $0C
	STA $10
	LDA $0D
	STA $11
	JSR sub_AE8A
	INC a:Event
	RTS
	LDX #$01
	LDA CurrentPlayer
	BNE bra_A89B
	LDX #$00
bra_A89B:
	LDA Player1Lives,X
	BNE bra_A8A6
	LDA #$2C
	STA a:Event
	RTS
bra_A8A6:
	JSR sub_AE96
	JSR sub_B800
	LDA MapLevelID
	ASL
	ASL
	TAX
	LDA tbl_AB9F,X
	STA $03
	LDA #$00
	STA $3C
	STA PlayerXSpeed
	STA PlayerYSpeed
	STA PlayerMovement
	STA PlayerSpriteAttributes
	LDA #$2A
	STA M90_PRG0
	JSR $9C43
	LDA #$00
	STA $0378
	STA $0379
	JSR sub_AE8A
	LDA CurrentPlayer
	BEQ bra_A8DF
	LDA #$06
	BNE bra_A8E1
bra_A8DF:
	LDA #$04
bra_A8E1:
	STA $0310
	LDA #$00
	STA BGBlackoutFlag
	STA $0312
	STA $0607
	STA LogoFlag
	LDA #$0B
	STA InterruptMode
	JSR sub_B068
	INC a:Event
	RTS
	LDA $0379
	BNE bra_A90F
	JSR sub_AA5F
	JSR sub_AAEE
	JSR $96FE
	JMP loc_A912
bra_A90F:
	JSR $8FFB
loc_A912:
	JSR $9728
	JSR $8823
	JSR sub_B486
	LDA #$2A
	STA M90_PRG0
	JSR $9DF8
	RTS
	JSR $9DF8
	LDA #$05
	STA $0312
	JSR sub_B068
	INC a:Event
	RTS
	JSR sub_B75D
	LDA $0390
	ASL
	ASL
	TAX
	LDA tbl_A98F,X
	STA $51
	STA PlayerWallColPos
	STA PlayerXScreen
	LDA tbl_A990,X
	STA $52
	STA $65
	STA $02
	CLC
	ADC PlayerXPos
	STA PlayerXPos
	LDA PlayerXScreen
	ADC #$00
	STA PlayerXScreen
	LDA PlayerXScreen
	STA PlayerXScreenDup
	LDA PlayerXPos
	STA PlayerXPosDup
	LDA $0C
	STA $10
	LDA $0D
	STA $11
	JSR sub_AE96
	JSR sub_B800
	LDA $0390
	ASL
	ASL
	TAX
	LDA tbl_A991,X
	STA $03
	JSR sub_AAE0
	JSR sub_AE8A
	LDA #$00
	STA BGBlackoutFlag
	STA $0312
	JSR sub_B068
	INC a:Event
	RTS
tbl_A98F:
	.byte $09
tbl_A990:
	.byte $00
tbl_A991:
	.byte $EF
	.byte $00
	.byte $06
	.byte $F0
	.byte $00
	.byte $00
	.byte $05
	.byte $00
	.byte $00
	.byte $00
	.byte $0A
	.byte $F0
	.byte $EF
	.byte $00
	.byte $0D
	.byte $00
	.byte $00
	.byte $00
	.byte $05
	.byte $00
	.byte $EF
	.byte $00
	INC $0360
	LDA #$00
	STA $037C
	LDA #$0B
	STA a:Event
	RTS
tbl_A9B5:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $00
	.byte $00
	.byte $03
	.byte $00
	.byte $00
	.byte $00
	.byte $04
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $05
	.byte $00
	.byte $00
	.byte $00
	.byte $06
	.byte $00
	.byte $00
	.byte $00
	.byte $07
	.byte $00
sub_A9D5:
	CLC
	LDX #$08
	LDA CurrentPlayer
	BNE bra_A9DF
	LDX #$00
bra_A9DF:
	STX $25
	LDY MapLevelID
	LDA tbl_A9B5,Y
	ADC $25
	STA $25
	LDX $25
	LDA $0380,X
	BEQ bra_A9F3
	RTS
bra_A9F3:
	LDX #$01
	LDA CurrentPlayer
	BNE bra_A9FC
	LDX #$00
bra_A9FC:
	LDA MapLevelID
	STA LevelID,X
	LDA $0361
	CMP #$07
	BNE bra_AA0D
	LDA #$0E
	BNE bra_AA25
bra_AA0D:
	LDA $0361
	CMP #$0A
	BNE bra_AA18
	LDA #$0F
	BNE bra_AA25
bra_AA18:
	LDA $0361
	CMP #$04
	BNE bra_AA23
	LDA #$10
	BNE bra_AA25
bra_AA23:
	LDA #$0D
bra_AA25:
	STA $0361
	LDA #$05
	STA SFXRegister
	LDA #$00
	STA WorldSelectNum
	STA $06
	STA $07
	STA $0378
bra_AA38:
	LDA FrameCount
	CMP $07
	BEQ bra_AA38
	STA $07
	JSR $9728
	JSR $8823
	JSR $9DF8
	LDA FrameCount
	AND #$1F
	BNE bra_AA52
	INC WorldSelectNum
bra_AA52:
	LDA WorldSelectNum
	CMP #$04
	BCC bra_AA38
	LDA #$12
	STA a:Event
	RTS
sub_AA5F:
	LDA ButtonsPressed
	AND #$90
	BEQ bra_AA6A
	JSR sub_A9D5
	RTS
bra_AA6A:
	LDX CurrentPlayer
	LDA LevelsCompleted,X
	STA $039B
	LDA MapLevelID
	ASL
	TAX
	LDA GameType
	BNE bra_AA89
	LDA UnlockNextLevel
	BEQ bra_AA89
	LDA #$00
	STA UnlockNextLevel
	BEQ bra_AAA3
bra_AA89:
	LDA MapLevelID
	CMP $039B
	BCS bra_AA99
	LDA ButtonsPressed
	AND $9C03,X
	BNE bra_AAA3
bra_AA99:
	INX
	LDA ButtonsPressed
	AND $9C03,X
	BNE bra_AAA9
	RTS
bra_AAA3:
	INC MapLevelID
	JMP loc_AAB1
bra_AAA9:
	LDA MapLevelID
	BEQ bra_AAB1
	DEC MapLevelID
bra_AAB1:
loc_AAB1:
	STX $0391
	LDA #$FF
	STA $0379
	LDA #$00
	STA $0360
	STA $037C
	RTS
	RTS
	LDA #$88
	STA $00
	STA PPUCtrl
	RTS
sub_AACB:
	LDA #$2A
	STA M90_PRG0
	JSR $87AC
	RTS
sub_AAD4:
	LDX #$00
	LDA #$00
bra_AAD8:
	STA $B2,X
	INX
	CPX #$07
	BCC bra_AAD8
	RTS
sub_AAE0:
	LDX #$00
	LDA #$F8
bra_AAE4:
	STA SpriteMem,X
	INX
	INX
	INX
	INX
	BNE bra_AAE4
	RTS
sub_AAEE:
	LDA $0396
	BEQ bra_AAFA
	LDA ButtonsPressed
	AND #$20
	BEQ bra_AB0C_RTS
bra_AAFA:
	LDA #$04
	STA $0390
	LDA #$00
	STA $0361
	STA WorldSelectNum
	LDA #$0F
	JSR sub_BFD0
bra_AB0C_RTS:
	RTS
tbl_AB0D:
	.byte $00
tbl_AB0E:
	.byte $60
	.byte $00
	.byte $80
	.byte $00
	.byte $A0
	.byte $00
	.byte $C0
	.byte $00
	.byte $E0
	.byte $01
	.byte $00
	.byte $01
	.byte $20
	.byte $01
	.byte $40
	LDA ButtonsPressed
	AND #$02
	BEQ bra_AB30
	LDA #sfxBeep
	STA SFXRegister
	LDA WorldSelectNum
	BEQ bra_AB45
	DEC WorldSelectNum
bra_AB30:
	LDA ButtonsPressed
	AND #$01
	BEQ bra_AB45
	LDA #sfxBeep
	STA SFXRegister
	LDA WorldSelectNum
	CMP #$06
	BCS bra_AB45
	INC WorldSelectNum
bra_AB45:
	LDA ButtonsHeld
	AND #$90
	BEQ bra_AB79
	LDA #sfxBeep
	STA SFXRegister
	LDX WorldSelectNum
	LDA tbl_AB95,X
	STA MapLevelID
	LDX #$01
	LDA CurrentPlayer
	BNE bra_AB62
	LDX #$00
bra_AB62:
	LDA MapLevelID
	STA LevelID,X
	STA LevelsCompleted,X
	LDA #$05
	STA $0312
	JSR sub_B068
	LDA #$08
	STA a:Event
	RTS
bra_AB79:
	LDA WorldSelectNum
	ASL
	TAX
	LDA tbl_AB0D,X
	STA $034D
	LDA tbl_AB0E,X
	STA $41
	LDA #$50
	STA $0356
	JSR $9728
	JSR $8823
	RTS
tbl_AB95:
	.byte $04
	.byte $09
	.byte $0D
	.byte $11
	.byte $16
	.byte $1A
	.byte $1E
	.byte $1E
	.byte $05
	.byte $00
tbl_AB9F:
	.byte $EF
	.byte $00
	.byte $05
	.byte $00
	.byte $EF
	.byte $00
	.byte $05
	.byte $00
	.byte $EF
	.byte $00
	.byte $05
	.byte $00
	.byte $EF
	.byte $00
	.byte $05
	.byte $00
	.byte $BF
	.byte $00
	.byte $05
	.byte $00
	.byte $4F
	.byte $00
	.byte $05
	.byte $00
	.byte $4F
	.byte $00
	.byte $05
	.byte $00
	.byte $4F
	.byte $00
	.byte $09
	.byte $10
	.byte $9F
	.byte $00
	.byte $09
	.byte $70
	.byte $8F
	.byte $00
	.byte $09
	.byte $60
	.byte $3F
	.byte $00
	.byte $09
	.byte $70
	.byte $0F
	.byte $00
	.byte $09
	.byte $80
	.byte $0F
	.byte $00
	.byte $09
	.byte $A0
	.byte $00
	.byte $00
	.byte $0A
	.byte $00
	.byte $00
	.byte $00
	.byte $0A
	.byte $60
	.byte $60
	.byte $00
	.byte $0A
	.byte $B0
	.byte $18
	.byte $00
	.byte $0A
	.byte $E0
	.byte $28
	.byte $00
	.byte $0A
	.byte $F0
	.byte $B8
	.byte $00
	.byte $0A
	.byte $F0
	.byte $EF
	.byte $00
	.byte $07
	.byte $60
	.byte $30
	.byte $00
	.byte $06
	.byte $D0
	.byte $60
	.byte $00
	.byte $07
	.byte $00
	.byte $80
	.byte $00
	.byte $07
	.byte $00
	.byte $EF
	.byte $00
	.byte $07
	.byte $00
	.byte $EF
	.byte $00
	.byte $06
	.byte $90
	.byte $EF
	.byte $00
	.byte $06
	.byte $30
	.byte $EF
	.byte $00
	.byte $05
	.byte $90
	.byte $EF
	.byte $00
	.byte $05
	.byte $A0
	.byte $8F
	.byte $00
	.byte $06
	.byte $50
	.byte $8F
	.byte $00
	.byte $06
	.byte $50
	.byte $2F
	.byte $00
	.byte $05
	.byte $00
	.byte $00
	.byte $00
sub_AC1D:
	LDA MapLevelID
	ASL
	ASL
	TAX
	LDA $9B83,X
	STA $034D
	LDA $9B84,X
	STA $41
	LDA $9B85,X
	STA $0356
	LDX CurrentPlayer
	LDA P1YoshiBackup,X
	BEQ bra_AC5C
	SEC
	LDA $0356
	SBC #$09
	STA $0356
	LDA #$07
	STA $0361
	LDA MapLevelID
	CMP #$0B
	BEQ bra_AC56
	CMP #$15
	BEQ bra_AC56
	RTS
bra_AC56:
	LDA #$0A
	STA $0361
	RTS
bra_AC5C:
	LDA MapLevelID
	CMP #$0B
	BEQ bra_AC68
	CMP #$15
	BEQ bra_AC68
	RTS
bra_AC68:
	LDA #$04
	STA $0361
	RTS
bra_AC6E:
sub_AC6E:
	LDX #$00
bra_AC70:
	JSR sub_AC85_RTS
	JSR sub_AC85_RTS
	JSR sub_AC85_RTS
	JSR sub_AC85_RTS
	NOP
	NOP
	NOP
	DEX
	BNE bra_AC70
	DEY
	BNE bra_AC6E
sub_AC85_RTS:
	RTS
tbl_AC86:
	.byte $00
	.byte $06
	.byte $14
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	LDY #$00
	LDX #$01
	LDA CurrentPlayer
	BNE bra_AC98
	LDX #$00
bra_AC98:
	LDA LevelID,X
	CMP tbl_AC86,Y
	BEQ bra_ACA8
	INY
	CPY #$03
	BCC bra_AC98
	JMP loc_ACB3
bra_ACA8:
	LDY #$40
	JSR sub_AC6E
	LDA #$2E
	STA a:Event
	RTS
loc_ACB3:
	LDA #$00
	STA $02
	STA $03
	STA PPUMask
	STA $01
	JSR $9B0D
	LDA #$2E
	STA MusicRegister
	LDA CurrentPlayer
	BNE bra_ACCE
	LDA #$01
	BNE bra_ACD0
bra_ACCE:
	LDA #$03
bra_ACD0:
	JSR $986A
loc_ACD3:
	JSR sub_AAD4
	JSR sub_AAE0
	LDA #$00
	STA BGBlackoutFlag
	STA $0312
	STA $0607
	STA LogoFlag
	LDA #$05
	STA $0310
	JSR $9A44
	LDY #$40
	JSR sub_AC6E
	LDA #$1E
	STA $01
	LDA #$0C
	STA InterruptMode
	JSR sub_B068
	LDY #$E0
	JSR sub_AC6E
	INC a:Event
	RTS
tbl_AD09:
	.byte $00
	.byte $00
	.byte $01
	.byte $02
	.byte $03
	.byte $10
	.byte $00
	.byte $11
	.byte $12
	.byte $13
	.byte $20
	.byte $21
	.byte $22
	.byte $23
	.byte $30
	.byte $31
	.byte $32
	.byte $33
	.byte $40
	.byte $41
	.byte $00
	.byte $42
	.byte $43
	.byte $50
	.byte $51
	.byte $52
	.byte $53
	.byte $60
	.byte $61
	.byte $62
	.byte $63
	.byte $00
	LDA #$00
	STA $037E
	STA UnlockNextLevel
	STA $0398
	STA $039A
	LDX CurrentPlayer
	LDA LevelID,X
	TAX
	LDA tbl_AD09,X
	STA $25
	AND #$0F
	STA LevelNumber
	LDA $25
	LSR
	LSR
	LSR
	LSR
	STA WorldNumber
	LDA #$01
	STA a:GameState
	LDA #$00
	STA a:Event
	RTS
	LDA #$00
	STA $5B
	LDA #$2A
	STA $08
	INC a:Event
	RTS
tbl_AD68:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $04
	.byte $04
	.byte $04
	.byte $07
	.byte $07
	.byte $07
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $00
	.byte $07
	.byte $0A
	.byte $04
	.byte $00
	.byte $04
	.byte $07
	.byte $0A
	.byte $00
	JSR sub_AAE0
	LDA $0361
	AND #$1F
	TAX
	LDA tbl_AD68,X
	STA $0361
	LDA #$00
	STA $0378
	STA $0379
	LDA CurrentPlayer
	BEQ bra_ADA0
	LDA $0361
	STA $0332
bra_ADA0:
	LDA $037E
	BEQ bra_ADA9
	INC a:Event
	RTS
bra_ADA9:
	LDA UnlockNextLevel
	BEQ bra_ADB4
	LDA #$1C
	STA a:Event
	RTS
bra_ADB4:
	LDA $0398
	BEQ bra_ADBF
	LDA #$1F
	STA a:Event
	RTS
bra_ADBF:
	LDA #$21
	STA a:Event
	RTS
	JSR sub_AE96
	LDA #musEnding
	STA MusicRegister
	LDA #$2A
	STA M90_PRG0
	LDA #$02
	STA WorldSelectNum
	JSR sub_AACB
	LDA #$02
	JSR $9A44
	JSR sub_AE8A
	LDA #$00
	STA BGBlackoutFlag
	STA $0312
	STA $0607
	STA LogoFlag
	STA $02
	STA $03
	LDA #$02
	STA $0310
	LDA #$0C
	STA InterruptMode
	JSR sub_B068
	LDY #$FF
	JSR sub_AC6E
	INC a:Event
	RTS
	JSR sub_AE96
	LDA #$2A
	STA M90_PRG0
	LDA #$01
	STA WorldSelectNum
	JSR sub_AACB
	LDA #$01
	JSR $9A44
	JSR sub_AE8A
	JSR sub_AAE0
	LDX #$00
bra_AE26:
	LDA tbl_AE5A,X
	STA SpriteMem,X
	INX
	CPX #$30
	BCC bra_AE26
	LDA #$00
	STA BGBlackoutFlag
	STA $0312
	STA $0607
	STA LogoFlag
	LDA #$01
	STA $0310
	LDA #$0C
	STA InterruptMode
	LDY #$A0
	JSR sub_AC6E
	JSR sub_B068
	LDA #$00
	STA WorldSelectNum
	INC a:Event
	RTS
tbl_AE5A:
	.byte $28
	.byte $01
	.byte $00
	.byte $50
	.byte $28
	.byte $02
	.byte $00
	.byte $60
	.byte $28
	.byte $03
	.byte $00
	.byte $70
	.byte $28
	.byte $04
	.byte $00
	.byte $88
	.byte $28
	.byte $05
	.byte $00
	.byte $98
	.byte $28
	.byte $06
	.byte $00
	.byte $A8
	.byte $30
	.byte $07
	.byte $00
	.byte $50
	.byte $30
	.byte $08
	.byte $00
	.byte $60
	.byte $30
	.byte $09
	.byte $00
	.byte $70
	.byte $30
	.byte $0A
	.byte $00
	.byte $88
	.byte $30
	.byte $0B
	.byte $00
	.byte $98
	.byte $30
	.byte $0C
	.byte $00
	.byte $A8
sub_AE8A:
	LDA #$18
	STA $01
	LDA #$88
	STA PPUCtrl
	STA $00
	RTS
sub_AE96:
	LDA #$00
	STA PPUCtrl
	STA $00
	STA PPUMask
	STA $01
	RTS
sub_AEA3:
	LDA #$00
	STA $02
	STA $03
	STA PPUMask
	STA $01
	JSR $9B0D
	RTS
tbl_AEB2:
	.byte $04
	.byte $09
	.byte $0D
	.byte $11
	.byte $16
	.byte $1A
	.byte $1E
	LDY #$00
	LDX CurrentPlayer
bra_AEBE:
	LDA LevelID,X
	CMP tbl_AEB2,Y
	BEQ bra_AECD
	INY
	CPY #$07
	BCC bra_AEBE
	BCS bra_AEE3
bra_AECD:
	STY $25
	INC $25
	LDY $25
	LDA CurrentPlayer
	BEQ bra_AEDE
	CLC
	LDA $25
	ADC #$08
	TAY
bra_AEDE:
	LDA #$01
	STA $0380,Y
bra_AEE3:
	LDA GameType
	BNE bra_AEF9
	LDA #$08
	STA a:Event
	LDY LevelsCompleted
	CPY LevelID
	BNE bra_AEF8_RTS
	INC LevelsCompleted
bra_AEF8_RTS:
	RTS
bra_AEF9:
	LDX #$01
	LDA CurrentPlayer
	BNE bra_AF02
	LDX #$00
bra_AF02:
	LDA LevelsCompleted,X
	CMP LevelID,X
	BNE bra_AF0D
	INC LevelsCompleted,X
bra_AF0D:
	LDA #$25
	STA a:Event
	RTS
	RTS
	JSR sub_AEA3
	LDA #$02
	JSR $986A
	JMP loc_ACD3
	LDA GameType
	BEQ bra_AF2B
	LDX #$01
	LDA CurrentPlayer
	BNE bra_AF2D
bra_AF2B:
	LDX #$00
bra_AF2D:
	DEC Player1Lives,X
	LDA Player1Lives,X
	BEQ bra_AF40
	LDA GameType
	BNE bra_AF46
	LDA #$2C
	STA a:Event
	RTS
bra_AF40:
	LDA #$22
	STA a:Event
	RTS
bra_AF46:
	LDA #$25
	STA a:Event
	RTS
	JSR sub_AEA3
	LDA #$00
	JSR $986A
	LDA #musGameOver
	STA MusicRegister
	JSR sub_AAD4
	JSR sub_AAE0
	LDA #$00
	STA BGBlackoutFlag
	STA $0312
	STA $0607
	STA LogoFlag
	LDA #$05
	STA $0310
	JSR $9A44
	LDY #$40
	JSR sub_AC6E
	LDA #$1E
	STA $01
	LDA #$0C
	STA InterruptMode
	JSR sub_B068
	LDY #$E0
	JSR sub_AC6E
	LDY #$E0
	JSR sub_AC6E
	INC a:Event
	RTS
	LDA GameType
	BNE bra_AFA0
loc_AF98:
	LDY #$40
	JSR sub_AC6E
	JMP $E193
bra_AFA0:
	LDA Player1Lives
	ORA Player2Lives
	BNE bra_AFAB
	JMP loc_AF98
bra_AFAB:
	INC a:Event
	RTS
	LDA GameType
	BEQ bra_AFD5
	LDA Player1Lives
	ORA Player2Lives
	BEQ bra_AFEB
bra_AFBC:
	LDA CurrentPlayer
	EOR #$01
	STA CurrentPlayer
	LDX #$01
	LDA CurrentPlayer
	BNE bra_AFCD
	LDX #$00
bra_AFCD:
	LDA Player1Lives,X
	BEQ bra_AFBC
	JMP loc_AFDA
bra_AFD5:
	LDA #$00
	STA CurrentPlayer
loc_AFDA:
	LDA #$07
	STA a:Event
	LDA CurrentPlayer
	BEQ bra_AFEA_RTS
	LDA $0332
	STA $0361
bra_AFEA_RTS:
	RTS
bra_AFEB:
	LDY #$40
	JSR sub_AC6E
	JMP $E193
	LDA $0379
	BNE bra_AFFE
	INC a:Event
	JMP loc_B001
bra_AFFE:
	JSR $8FFB
loc_B001:
	JSR $9728
	JSR $8823
	JSR sub_B486
	LDA #$2A
	STA M90_PRG0
	JSR $9DF8
	RTS
	LDA FrameCount
	AND #$1F
	BNE bra_B01C
	INC WorldSelectNum
bra_B01C:
	LDA WorldSelectNum
	CMP #$04
	BCC bra_B029
	INC a:Event
	JMP loc_B02C
bra_B029:
	JSR $90D3
loc_B02C:
	JSR $9728
	JSR $8823
	JSR sub_B486
	LDA #$2A
	STA M90_PRG0
	JSR $9DF8
	RTS
	LDA #$00
	STA $037E
	STA $0398
	STA $039A
	STA $0361
	STA LevelNumber
	LDA #$07
	STA WorldNumber
	LDA #$01
	STA a:GameState
	STA UnlockNextLevel
	LDA #$00
	STA a:Event
	RTS
	LDA #$07
	STA a:Event
	RTS
sub_B068:
	LDA $0310
	ASL
	TAY
	LDA tbl_B0EB,Y
	STA $32
	LDA tbl_B0EC,Y
	STA $33
	LDA BGBlackoutFlag
	ASL
	TAY
	LDA tbl_B0E7,Y
	STA $34
	LDA tbl_B0E8,Y
	STA $35
bra_B086:
loc_B086:
	LDA $03A1
	BNE bra_B086
	LDA FrameCount
	AND #$03
	BNE bra_B086
	LDX $0312
	LDA tbl_B0DE,X
	STA $25
	LDY #$00
bra_B09B:
	LDA ($34),Y
	BPL bra_B0A4
	LDA ($32),Y
	JMP loc_B0AD
bra_B0A4:
	LDA ($32),Y
	SEC
	SBC $25
	BPL bra_B0AD
	LDA #$FF
bra_B0AD:
loc_B0AD:
	STA $03A5,Y
	INY
	CPY #$20
	BNE bra_B09B
	LDA #$3F
	STA $03A1
	LDA #$00
	STA $03A2
	STA $03A0
	LDA #$20
	STA $03A4
	LDA #$01
	STA $03A3
	INC $0312
	LDA $0312
	CMP #$05
	BEQ bra_B0DD_RTS
	CMP #$09
	BEQ bra_B0DD_RTS
	JMP loc_B086
bra_B0DD_RTS:
	RTS
tbl_B0DE:
	.byte $40	;fadeout effect
	.byte $30	;
	.byte $20	;
	.byte $10	;
	.byte $00	;
	.byte $10	;
	.byte $20	;
	.byte $30	;
	.byte $40	;
tbl_B0E7:
	.byte $C9
tbl_B0E8:
	.byte $B1
	.byte $E9
	.byte $B1
tbl_B0EB:
	.byte $F9
tbl_B0EC:
	.byte $B0
	.byte $19
	.byte $B1
	.byte $39
	.byte $B1
	.byte $49
	.byte $B1
	.byte $69
	.byte $B1
	.byte $89
	.byte $B1
	.byte $A9
	.byte $B1
	.byte $11
	.byte $30
	.byte $2A
	.byte $0E
	.byte $11
	.byte $38
	.byte $26
	.byte $0E
	.byte $11
	.byte $37
	.byte $2A
	.byte $1A
	.byte $11
	.byte $39
	.byte $29
	.byte $1A
	.byte $11
	.byte $37
	.byte $16
	.byte $0E
	.byte $11
	.byte $30
	.byte $16
	.byte $02
	.byte $11
	.byte $2A
	.byte $30
	.byte $0F
	.byte $11
	.byte $28
	.byte $16
	.byte $0E
	.byte $0E
	.byte $20
	.byte $35
	.byte $1A
	.byte $0E
	.byte $21
	.byte $11
	.byte $14
	.byte $0E
	.byte $20
	.byte $35
	.byte $38
	.byte $0E
	.byte $20
	.byte $24
	.byte $14
	.byte $0E
	.byte $37
	.byte $27
	.byte $17
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
	.byte $0E
	.byte $17
	.byte $37
	.byte $27
	.byte $0E
	.byte $30
	.byte $20
	.byte $10
	.byte $0E
	.byte $2A
	.byte $2C
	.byte $36
	.byte $0E
	.byte $37
	.byte $27
	.byte $38
	.byte $0E
	.byte $2A
	.byte $37
	.byte $30
	.byte $0E
	.byte $1C
	.byte $2C
	.byte $30
	.byte $0E
	.byte $11
	.byte $2C
	.byte $30
	.byte $0E
	.byte $37
	.byte $27
	.byte $38
	.byte $0E
	.byte $2A
	.byte $37
	.byte $30
	.byte $0E
	.byte $1C
	.byte $2C
	.byte $30
	.byte $0E
	.byte $2A
	.byte $2C
	.byte $36
	.byte $0E
	.byte $37
	.byte $27
	.byte $38
	.byte $0E
	.byte $2A
	.byte $37
	.byte $30
	.byte $0E
	.byte $1C
	.byte $2C
	.byte $30
	.byte $0E
	.byte $21
	.byte $37
	.byte $20
	.byte $0E
	.byte $20
	.byte $2A
	.byte $37
	.byte $0E
	.byte $1A
	.byte $2A
	.byte $21
	.byte $0E
	.byte $20
	.byte $3D
	.byte $28
	.byte $0E
	.byte $37
	.byte $16
	.byte $0E
	.byte $0E
	.byte $37
	.byte $16
	.byte $02
	.byte $0E
	.byte $30
	.byte $2A
	.byte $0E
	.byte $0E
	.byte $20
	.byte $2A
	.byte $0E
	.byte $0E
	.byte $27
	.byte $30
	.byte $38
	.byte $0E
	.byte $27
	.byte $30
	.byte $38
	.byte $0E
	.byte $27
	.byte $30
	.byte $38
	.byte $0E
	.byte $27
	.byte $30
	.byte $38
	.byte $0E
	.byte $30
	.byte $20
	.byte $10
	.byte $0E
	.byte $20
	.byte $10
	.byte $30
	.byte $0E
	.byte $10
	.byte $30
	.byte $20
	.byte $0E
	.byte $37
	.byte $27
	.byte $17
	.byte $0E
	.byte $21
	.byte $37
	.byte $20
	.byte $0E
	.byte $20
	.byte $2A
	.byte $37
	.byte $0E
	.byte $1A
	.byte $2A
	.byte $21
	.byte $0E
	.byte $20
	.byte $3D
	.byte $28
	.byte $0E
	.byte $37
	.byte $1A
	.byte $0E
	.byte $0E
	.byte $37
	.byte $1A
	.byte $11
	.byte $0E
	.byte $30
	.byte $2A
	.byte $0E
	.byte $0E
	.byte $20
	.byte $2A
	.byte $0E
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
tbl_B209:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
tbl_B309:
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
tbl_B319:
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
sub_B399:
	LDA PPUStatus
	LDA $00
	ORA #$04
	STA PPUCtrl
	LDA PPUStatus
	LDA $0480
	STA PPUAddr
	LDA NextBGColumn
	STA PPUAddr
	LDX #$00
bra_B3B4:
	LDA $0485,X
	STA PPUData
	INX
	CPX #$1E
	BCC bra_B3B4
	LDA PPUStatus
	LDA $0480
	ORA #$08
	STA PPUAddr
	LDA NextBGColumn
	STA PPUAddr
bra_B3D0:
	LDA $0485,X
	STA PPUData
	INX
	CPX #$38
	BCC bra_B3D0
	LDA PPUStatus
	LDA $00
	AND #$FB
	STA PPUCtrl
	RTS
	LDA $04C1
	BEQ bra_B40E_RTS
	LDX #$00
bra_B3ED:
	LDA PPUStatus
	LDA $04C1,X
	STA PPUAddr
	LDA $04C2,X
	STA PPUAddr
	LDA $04C3,X
	STA PPUData
	INX
	INX
	INX
	CPX #$30
	BCC bra_B3ED
	LDA #$00
	STA $04C1
bra_B40E_RTS:
	RTS
	LDA ButtonsPressed
	AND #$80
	BEQ bra_B424
	INC ScrollSpeed
	LDA #$08
	CMP ScrollSpeed
	BCS bra_B423_RTS
	STA ScrollSpeed
bra_B423_RTS:
	RTS
bra_B424:
	LDA ButtonsPressed
	AND #$40
	BEQ bra_B439
	INC $0327
	LDA #$08
	CMP $0327
	BCS bra_B438_RTS
	STA $0327
bra_B438_RTS:
	RTS
bra_B439:
	LDA ScrollSpeed
	AND #$07
	STA ScrollSpeed
	LDA $0327
	AND #$07
	STA $0327
	LDA ButtonsHeld
	AND #$01
	BEQ bra_B458
	LDA ScrollSpeed
	AND #$7F
	STA ScrollSpeed
bra_B458:
	LDA ButtonsHeld
	AND #$02
	BEQ bra_B467
	LDA ScrollSpeed
	ORA #$80
	STA ScrollSpeed
bra_B467:
	LDA ButtonsHeld
	AND #$04
	BEQ bra_B476
	LDA $0327
	AND #$7F
	STA $0327
bra_B476:
	LDA ButtonsHeld
	AND #$08
	BEQ bra_B485_RTS
	LDA $0327
	ORA #$80
	STA $0327
bra_B485_RTS:
	RTS
sub_B486:
	JSR sub_BC6E
	JSR sub_BDD1
	JSR sub_BE23
	JMP loc_B4BB
	LDA ButtonsHeld
	AND #$0F
	BEQ bra_B4BB
	LDA ButtonsHeld
	AND #$0C
	BEQ bra_B4A0
bra_B4A0:
	LDA ButtonsHeld
	AND #$03
	BEQ bra_B4AA
	JSR sub_BDD1
bra_B4AA:
	LDA ButtonsHeld
	AND #$0C
	BEQ bra_B4B1
bra_B4B1:
	LDA ButtonsHeld
	AND #$03
	BEQ bra_B4BB
	JSR sub_BE23
bra_B4BB:
loc_B4BB:
	LDA PlayerXScreenDup
	STA PlayerXScreen
	LDA PlayerXPosDup
	STA PlayerXPos
	LDA PlayerYScreenDup
	STA PlayerYScreen
	LDA PlayerYPosDup
	STA PlayerYPos
	LDA $55
	STA $51
	LDA $56
	STA $52
	RTS
	RTS
sub_B4D5:
	LDA LevelNumber
	ASL
	ASL
	ASL
	ASL
	TAY
	LDX #$00
bra_B4DF:
	LDA tbl_B4EB,Y
	STA $D0,X
	INY
	INX
	CPX #$0C
	BCC bra_B4DF
	RTS
tbl_B4EB:
	.byte $00
	.byte $80
	.byte $00
	.byte $81
	.byte $00
	.byte $82
	.byte $00
	.byte $83
	.byte $00
	.byte $84
	.byte $00
	.byte $85
	.byte $00
	.byte $86
	.byte $00
	.byte $00
	.byte $00
	.byte $88
	.byte $00
	.byte $89
	.byte $00
	.byte $8A
	.byte $00
	.byte $8B
	.byte $00
	.byte $8C
	.byte $00
	.byte $8D
	.byte $40
	.byte $86
	.byte $00
	.byte $00
	.byte $00
	.byte $90
	.byte $00
	.byte $91
	.byte $00
	.byte $92
	.byte $00
	.byte $93
	.byte $00
	.byte $94
	.byte $00
	.byte $95
	.byte $80
	.byte $86
	.byte $00
	.byte $00
	.byte $00
	.byte $98
	.byte $00
	.byte $99
	.byte $00
	.byte $9A
	.byte $00
	.byte $9B
	.byte $00
	.byte $9C
	.byte $00
	.byte $9D
	.byte $C0
	.byte $86
	.byte $00
	.byte $00
sub_B52B:
	LDA #$00
	STA $9C
	LDA $02
	LSR
	LSR
	LSR
	STA $59
	STA NextBGColumn
	LDA #$20
	STA $5A
	STA $0480
	LDA $59
	AND #$01
	EOR #$01
	STA $9B
	LDX #$00
	LDA $65
	AND #$08
	BEQ bra_B551
	INX
bra_B551:
	STX $2A
	LDX #$00
	LDA $67
	AND #$08
	BEQ bra_B55C
	INX
bra_B55C:
	STX $2D
	JSR sub_B670
	LDA DataBank2
	STA M90_PRG0
	LDX #$00
	STX $28
loc_B56B:
	LDX $28
	LDA $6E,X
	STA $5F
	LDY $5F
	LDA $2A
	BNE bra_B582
	LDA ($D0),Y
	STA $60
	LDA ($D4),Y
	STA $61
	JMP loc_B58A
bra_B582:
	LDA ($D2),Y
	STA $60
	LDA ($D6),Y
	STA $61
loc_B58A:
	LDY $2D
loc_B58C:
	LDA a:$0060,Y
	LDX $9C
	STA $0485,X
	LDA $9B
	BEQ bra_B5CE
	LDY $5F
	LDA ($D8),Y
	STA $6A
	LDY $59
	LDA tbl_B209,Y
	STA $25
	LDA $5A
	AND #$0F
	TAX
	LDA tbl_B309,X
	ORA $25
	STA $5C
	TYA
	AND #$7F
	TAX
	LDA tbl_B319,X
	TAX
	AND $6A
	STA $37
	TXA
	EOR #$FF
	STA $25
	LDY $5C
	LDA TileAttributes,Y
	AND $25
	ORA $37
	STA TileAttributes,Y
bra_B5CE:
	INC $9C
	LDA $9C
	CMP #$38
	BCS bra_B612
	LDA $59
	CLC
	ADC #$20
	STA $59
	BCC bra_B5E1
	INC $5A
bra_B5E1:
	LDA $5A
	AND #$03
	CMP #$03
	BNE bra_B5FE
	LDA $59
	CMP #$C0
	BCC bra_B5FE
	AND #$1F
	STA $59
	STA $0484
	LDA $5A
	AND #$F8
	EOR #$08
	STA $5A
bra_B5FE:
	INC $2D
	LDY $2D
	CPY #$02
	BCS bra_B609
	JMP loc_B58C
bra_B609:
	LDA #$00
	STA $2D
	INC $28
	JMP loc_B56B
bra_B612:
	LDA $02
	ROR
	ROR
	ROR
	ROR
	ROR
	AND #$07
	STA $5C
	LDX #$00
bra_B61F:
	LDY $5C
	LDA TileAttributes,Y
	STA $04C3,X
	TYA
	AND #$3F
	ORA #$C0
	STA $04C2,X
	TYA
	LDY #$23
	AND #$40
	BEQ bra_B638
	LDY #$2B
bra_B638:
	TYA
	STA $04C1,X
	LDA $5C
	CLC
	ADC #$08
	AND #$7F
	STA $5C
	INX
	INX
	INX
	CPX #$30
	BCC bra_B61F
	RTS
	LDA $02
	LSR
	LSR
	LSR
	STA $25
	LDA $03
	ASL
	ASL
	AND #$E0
	ORA $25
	STA $59
	LDA $03
	ROL
	ROL
	ROL
	AND #$03
	ORA #$20
	LDY $5B
	BEQ bra_B66D
	ORA #$08
bra_B66D:
	STA $5A
	RTS
sub_B670:
	LDA $66
	PHA
	LDA $67
	PHA
	LDX #$00
bra_B678:
	CLC
	LDA #$00
	LDY $66
	BEQ bra_B684
bra_B67F:
	ADC $6D
	DEY
	BNE bra_B67F
bra_B684:
	CLC
	ADC $64
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($8C),Y
	TAY
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	TYA
	AND #$20
	BNE bra_B6A9
	LDA DataBank1
	STA M90_PRG0
	JMP loc_B6AF
bra_B6A9:
	LDA $04F4
	STA M90_PRG0
loc_B6AF:
	LDA $65
	LSR
	LSR
	LSR
	LSR
	STA $25
	LDA $67
	AND #$F0
	ORA $25
	TAY
	STA $2B
bra_B6C0:
	LDY $2B
	LDA ($32),Y
	STA $6E,X
	INX
	CPX #$1C
	BCS bra_B6DE
	LDA $2B
	CLC
	ADC #$10
	STA $2B
	CMP #$F0
	BCC bra_B6C0
	INC $66
	LDA #$00
	STA $67
	BEQ bra_B678
bra_B6DE:
	PLA
	STA $67
	PLA
	STA $66
	RTS
sub_B6E5:
	LDA $59
	TAY
	LDA tbl_B209,Y
	STA $25
	LDA $5A
	AND #$0F
	TAX
	LDA tbl_B309,X
	ORA $25
	STA $5C
	TYA
	AND #$7F
	TAX
	LDA tbl_B319,X
	TAX
	AND $6A
	STA $37
	TXA
	EOR #$FF
	STA $25
	LDY $5C
	LDA TileAttributes,Y
	AND $25
	ORA $37
	STA TileAttributes,Y
	RTS
	LDA $59
	TAY
	LDA tbl_B209,Y
	STA $25
	LDA $5A
	AND #$0F
	TAX
	LDA tbl_B309,X
	ORA $25
	STA $5C
	RTS
	LDA $59
	CLC
	ADC #$20
	STA $59
	BCC bra_B737
	INC $5A
bra_B737:
	LDA $5A
	AND #$03
	CMP #$03
	BNE bra_B75C_RTS
	LDA $59
	CMP #$C0
	BCC bra_B75C_RTS
	AND #$1F
	STA $59
	STA $0484
	LDA $5A
	AND #$F8
	EOR #$08
	STA $5A
	STA $0483
	LDA $9C
	STA $0482
bra_B75C_RTS:
	RTS
sub_B75D:
	JSR sub_B4D5
	LDA WorldNumber
	ASL
	ASL
	ASL
	ASL
	STA $32
	LDA LevelNumber
	ASL
	ASL
	CLC
	ADC $32
	TAX
	LDA tbl_B997,X
	STA DataBank1
	LDA tbl_B998,X
	STA $04F4
	LDA tbl_B999,X
	STA DataBank2
	LDA tbl_B99A,X
	STA $6D
	LDY #$00
	STY $04FA
	STA $04FB
	LDY LevelNumber
	LDA tbl_BA07,Y
	STA $8C
	LDA tbl_BA0B,Y
	STA $8D
	LDA WorldNumber
	ASL
	TAY
	LDA tbl_BA2D,Y
	STA $32
	LDA tbl_BA2E,Y
	STA $33
	LDA LevelNumber
	ASL
	ASL
	ASL
	TAY
	LDA ($32),Y
	STA $51
	STA PlayerWallColPos
	LDA #$00
	STA $52
	STA $65
	INY
	LDA ($32),Y
	STA $53
	ASL
	STA $5B
	LDA #$00
	STA $66
	STA $54
	STA $67
	LDA $51
	STA PlayerXScreen
	INY
	LDA ($32),Y
	STA PlayerXPos
	STA $12
	LDA $53
	STA PlayerYScreen
	INY
	LDA ($32),Y
	STA PlayerYPos
	STA $13
	INY
	LDA ($32),Y
	STA $060F
	INY
	LDA ($32),Y
	STA ScreenCount
	INY
	LDA ($32),Y
	STA VertScrollLock
	INY
	LDA ($32),Y
	STA $060E
	RTS
	RTS
sub_B800:
	LDA PPUStatus
	LDA $00
	AND #$7F
	STA PPUCtrl
	LDA #$00
	STA $03
	LDA $02
	LSR
	LSR
	LSR
	STA $59
	STA $30
	LDA #$20
	STA $5A
	LDA #$20
	STA $26
loc_B81F:
	JSR sub_B670
	LDA DataBank2
	STA M90_PRG0
	LDA #$00
	STA $2A
loc_B82C:
	LDA #$00
	STA $27
	STA $2D
	LDX $27
bra_B834:
	LDA $6E,X
	STA $5F
	JSR sub_BA0F
	LDX $2D
	LDA $60
	STA $0485,X
	INX
	LDA $61
	STA $0485,X
	INX
	STX $2D
	INC $27
	LDX $27
	CPX #$1C
	BCC bra_B834
	LDA $5A
	STA $0480
	STA $31
	LDA $59
	STA NextBGColumn
	STA $30
	JSR sub_B399
	LDA $2A
	BNE bra_B8A1
	LDX #$00
	STX $36
	LDX $36
bra_B86E:
	LDA $6E,X
	TAY
	LDA ($D8),Y
	STA $6A
	JSR sub_B6E5
	LDA $59
	CLC
	ADC #$40
	STA $59
	BCC bra_B883
	INC $5A
bra_B883:
	LDA $59
	CMP #$C0
	BCC bra_B899
	LDA $5A
	CMP #$23
	BNE bra_B899
	LDA $59
	AND #$1F
	STA $59
	LDA #$28
	STA $5A
bra_B899:
	INC $36
	LDX $36
	CPX #$1C
	BCC bra_B86E
bra_B8A1:
	INC $30
	LDA $30
	AND #$1F
	STA $59
	LDA $31
	STA $5A
	DEC $26
	INC $2A
	LDA $2A
	CMP #$02
	BCS bra_B8BA
	JMP loc_B82C
bra_B8BA:
	LDA $26
	BEQ bra_B8CC
	LDA $65
	CLC
	ADC #$10
	STA $65
	BCC bra_B8C9
	INC $64
bra_B8C9:
	JMP loc_B81F
bra_B8CC:
	LDA PPUStatus
	LDA #$23
	STA PPUAddr
	LDA #$C0
	STA PPUAddr
	LDX #$00
bra_B8DB:
	LDA TileAttributes,X
	STA PPUData
	INX
	CPX #$40
	BCC bra_B8DB
	LDA PPUStatus
	LDA #$2B
	STA PPUAddr
	LDA #$C0
	STA PPUAddr
bra_B8F3:
	LDA TileAttributes,X
	STA PPUData
	INX
	CPX #$80
	BCC bra_B8F3
	RTS
	LDA #$2B
	STA PPUAddr
	LDA #$40
	STA PPUAddr
	LDX #$00
bra_B90B:
	LDA tbl_B917,X
	STA PPUData
	INX
	CPX #$80
	BCC bra_B90B
	RTS
tbl_B917:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $15
	.byte $16
	.byte $17
	.byte $18
	.byte $19
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $1E
	.byte $1F
	.byte $10
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $15
	.byte $16
	.byte $17
	.byte $18
	.byte $19
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $1E
	.byte $1F
	.byte $20
	.byte $21
	.byte $22
	.byte $23
	.byte $24
	.byte $25
	.byte $26
	.byte $27
	.byte $28
	.byte $29
	.byte $2A
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $2F
	.byte $20
	.byte $21
	.byte $22
	.byte $23
	.byte $24
	.byte $25
	.byte $26
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
	.byte $36
	.byte $37
	.byte $38
	.byte $39
	.byte $3A
	.byte $3B
	.byte $3C
	.byte $3D
	.byte $3E
	.byte $3F
tbl_B997:
	.byte $2D
tbl_B998:
	.byte $00
tbl_B999:
	.byte $2C
tbl_B99A:
	.byte $12
	.byte $2E
	.byte $00
	.byte $2C
	.byte $12
	.byte $02
	.byte $00
	.byte $1C
	.byte $12
	.byte $03
	.byte $00
	.byte $1C
	.byte $12
	.byte $04
	.byte $00
	.byte $1D
	.byte $12
	.byte $05
	.byte $00
	.byte $1D
	.byte $12
	.byte $06
	.byte $00
	.byte $1D
	.byte $12
	.byte $07
	.byte $00
	.byte $1D
	.byte $12
	.byte $08
	.byte $00
	.byte $1E
	.byte $12
	.byte $09
	.byte $00
	.byte $1E
	.byte $12
	.byte $0A
	.byte $00
	.byte $1E
	.byte $12
	.byte $0B
	.byte $00
	.byte $1E
	.byte $12
	.byte $0C
	.byte $00
	.byte $1F
	.byte $12
	.byte $0D
	.byte $00
	.byte $1F
	.byte $12
	.byte $0E
	.byte $00
	.byte $1F
	.byte $12
	.byte $0F
	.byte $00
	.byte $1F
	.byte $12
	.byte $10
	.byte $00
	.byte $20
	.byte $12
	.byte $11
	.byte $00
	.byte $20
	.byte $12
	.byte $12
	.byte $00
	.byte $20
	.byte $12
	.byte $13
	.byte $00
	.byte $20
	.byte $12
	.byte $14
	.byte $00
	.byte $21
	.byte $12
	.byte $15
	.byte $00
	.byte $21
	.byte $12
	.byte $16
	.byte $00
	.byte $21
	.byte $12
	.byte $17
	.byte $00
	.byte $21
	.byte $12
	.byte $18
	.byte $00
	.byte $22
	.byte $12
	.byte $19
	.byte $00
	.byte $22
	.byte $12
	.byte $1A
	.byte $00
	.byte $22
	.byte $12
	.byte $1B
	.byte $00
	.byte $22
	.byte $12
tbl_BA07:
	.byte $00
	.byte $40
	.byte $80
	.byte $C0
tbl_BA0B:
	.byte $86
	.byte $86
	.byte $86
	.byte $86
sub_BA0F:
	LDA DataBank2
	STA M90_PRG0
	LDY $5F
	LDA $2A
	BNE bra_BA24
	LDA ($D0),Y
	STA $60
	LDA ($D4),Y
	STA $61
	RTS
bra_BA24:
	LDA ($D2),Y
	STA $60
	LDA ($D6),Y
	STA $61
	RTS
tbl_BA2D:
	.byte $3B
tbl_BA2E:
	.byte $BA
	.byte $5B
	.byte $BA
	.byte $7B
	.byte $BA
	.byte $9B
	.byte $BA
	.byte $BB
	.byte $BA
	.byte $DB
	.byte $BA
	.byte $FB
	.byte $BA
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $01
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $02
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $03
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $04
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $06
	.byte $FF
	.byte $01
	.byte $05
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $06
	.byte $01
	.byte $80
	.byte $B0
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $07
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $02
	.byte $FF
	.byte $01
	.byte $08
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $09
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $0A
	.byte $01
	.byte $80
	.byte $B0
	.byte $FF
	.byte $04
	.byte $00
	.byte $01
	.byte $0B
	.byte $00
	.byte $80
	.byte $40
	.byte $FF
	.byte $09
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $FF
	.byte $10
	.byte $FF
	.byte $01
	LDA PlayerXSpeed
	ROR
	ROR
	ROR
	ROR
	AND #$0F
	TAY
	LDA tbl_BC4E,Y
	STA $28
	LDA PlayerXSpeed
	BNE bra_BB31
	LDA #$00
	STA $28
bra_BB31:
	LDA $28
	BNE bra_BB40
	LDA PlayerXScreen
	STA PlayerXScreenDup
	LDA PlayerXPos
	STA PlayerXPosDup
	JMP loc_BB63
bra_BB40:
	LDA PlayerMovement
	AND #$01
	BEQ bra_BB56
	LDA PlayerXPos
	SEC
	SBC $28
	STA PlayerXPosDup
	LDA PlayerXScreen
	SBC #$00
	STA PlayerXScreenDup
	JMP loc_BB63
bra_BB56:
	LDA PlayerXPos
	CLC
	ADC $28
	STA PlayerXPosDup
	LDA PlayerXScreen
	ADC #$00
	STA PlayerXScreenDup
loc_BB63:
	LDA PlayerYSpeed
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA tbl_BC5E,X
	STA $2B
	LDA $2B
	BNE bra_BB7E
	LDA PlayerYScreen
	STA PlayerYScreenDup
	LDA PlayerYPos
	STA PlayerYPosDup
	JMP loc_BBB9
bra_BB7E:
	LDA PlayerMovement
	AND #$04
	BEQ bra_BB9F
	LDA PlayerYPos
	SEC
	SBC $2B
	STA PlayerYPosDup
	LDA PlayerYScreen
	SBC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra_BB9C
	SEC
	SBC #$10
	STA PlayerYPosDup
bra_BB9C:
	JMP loc_BBB9
bra_BB9F:
	LDA PlayerYPos
	CLC
	ADC $2B
	STA PlayerYPosDup
	LDA PlayerYScreen
	ADC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra_BBB9
	CLC
	ADC #$10
	STA PlayerYPosDup
	INC PlayerYScreenDup
bra_BBB9:
loc_BBB9:
	JSR sub_BED2
	JSR sub_BE4D
	LDA PlayerXPosDup
	SEC
	SBC PlayerXPos
	STA $28
	LDA PlayerXScreenDup
	SBC PlayerXScreen
	BPL bra_BBE7
	LDA $28
	EOR #$FF
	SEC
	ADC #$00
	CMP #$07
	BCC bra_BBE4
	LDA PlayerXPos
	SEC
	SBC #$07
	STA PlayerXPosDup
	LDA PlayerXScreen
	SBC #$00
	STA PlayerXScreenDup
bra_BBE4:
	JMP loc_BBFA
bra_BBE7:
	LDA $28
	CMP #$07
	BCC bra_BBFA
	LDA PlayerXPos
	CLC
	ADC #$07
	STA PlayerXPosDup
	LDA PlayerXScreen
	ADC #$00
	STA PlayerXScreenDup
bra_BBFA:
loc_BBFA:
	LDA PlayerYPosDup
	SEC
	SBC PlayerYPos
	STA $28
	LDA PlayerYScreenDup
	SBC PlayerYScreen
	BPL bra_BC2D
	LDA $28
	EOR #$FF
	SEC
	ADC #$00
	CMP #$07
	BCC bra_BC2A
	LDA PlayerYPos
	SEC
	SBC #$07
	STA PlayerYPosDup
	LDA PlayerYScreen
	SBC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra_BC2A
	SEC
	SBC #$10
	STA PlayerYPosDup
bra_BC2A:
	JMP loc_BC4D_RTS
bra_BC2D:
	LDA $28
	CMP #$07
	BCC bra_BC4D_RTS
	LDA PlayerYPos
	CLC
	ADC #$07
	STA PlayerYPosDup
	LDA PlayerYScreen
	ADC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra_BC4D_RTS
	CLC
	ADC #$10
	STA PlayerYPosDup
	INC PlayerYScreenDup
bra_BC4D_RTS:
loc_BC4D_RTS:
	RTS
tbl_BC4E:
	.byte $01
	.byte $01
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
tbl_BC5E:
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
sub_BC6E:
	LDA PlayerXPosDup
	SEC
	SBC $52
	STA $28
	LDA PlayerXScreenDup
	SBC $51
	BPL bra_BC84
	LDA $28
	EOR #$FF
	SEC
	ADC #$00
	STA $28
bra_BC84:
	LDA $28
	CMP #$7F
	BCS bra_BCC3
	LDA #$7F
	STA $12
	LDA PlayerXPosDup
	SEC
	SBC $12
	STA $56
	LDA PlayerXScreenDup
	SBC #$00
	STA $55
	BPL bra_BCA6
	LDA $56
	EOR #$FF
	SEC
	ADC #$00
	STA $56
bra_BCA6:
	LDA $060F
	CMP $55
	BNE bra_BCC0
	LDA #$00
	STA $55
	STA $56
	LDA PlayerXPosDup
	SEC
	SBC $56
	STA $12
	LDA PlayerXScreenDup
	SBC $55
	BPL bra_BCC0
bra_BCC0:
	JMP loc_BD0E
bra_BCC3:
	LDA $28
	CMP #$80
	BCC bra_BD04
	LDA #$80
	STA $12
	LDA PlayerXPosDup
	SEC
	SBC $12
	STA $56
	LDA PlayerXScreenDup
	SBC #$00
	STA $55
	BPL bra_BCE5
	LDA $56
	EOR #$FF
	SEC
	ADC #$00
	STA $56
bra_BCE5:
	LDA ScreenCount
	CMP $55
	BNE bra_BD01
	STA $55
	LDA #$00
	STA $56
	LDA PlayerXPosDup
	SEC
	SBC $56
	STA $12
	LDA PlayerXScreenDup
	SBC $55
	BPL bra_BD01
	STA $12
bra_BD01:
	JMP loc_BD0E
bra_BD04:
	STA $12
	LDA $51
	STA $55
	LDA $52
	STA $56
loc_BD0E:
	LDA PlayerYPosDup
	SEC
	SBC $54
	STA $2B
	LDA PlayerYScreenDup
	SBC $53
	BPL bra_BD24
	LDA $2B
	EOR #$FF
	SEC
	ADC #$00
	STA $2B
bra_BD24:
	LDA PlayerYScreenDup
	CMP $53
	BEQ bra_BD31
	LDA $2B
	SEC
	SBC #$10
	STA $2B
bra_BD31:
	LDA $2B
	CMP #$7F
	BCS bra_BD70
	LDA #$7F
	STA $13
	LDA PlayerYPosDup
	SEC
	SBC $13
	STA $58
	LDA PlayerYScreenDup
	SBC #$00
	STA $57
	BPL bra_BD53
	LDA $58
	EOR #$FF
	SEC
	ADC #$00
	STA $58
bra_BD53:
	LDA VertScrollLock
	CMP $57
	BNE bra_BD6D
	LDA #$00
	STA $57
	STA $58
	LDA PlayerYPosDup
	SEC
	SBC $58
	STA $13
	LDA PlayerYScreenDup
	SBC $57
	BPL bra_BD6D
bra_BD6D:
	JMP loc_BDC3
bra_BD70:
	LDA $2B
	CMP #$80
	BCC bra_BDB8
	LDA #$80
	STA $13
	LDA PlayerYPosDup
	SEC
	SBC $13
	STA $58
	LDA PlayerYScreenDup
	SBC #$00
	STA $57
	BPL bra_BD9B
	LDA $58
	EOR #$FF
	SEC
	ADC #$00
	STA $58
	LDA $57
	EOR #$FF
	SEC
	ADC #$00
	STA $57
bra_BD9B:
	LDA $060E
	CMP $57
	BNE bra_BDB5
	STA $57
	LDA #$00
	STA $58
	LDA PlayerYPosDup
	SEC
	SBC $58
	STA $13
	LDA PlayerYScreenDup
	SBC $57
	BPL bra_BDB5
bra_BDB5:
	JMP loc_BDC3
bra_BDB8:
	STA $13
	LDA $53
	STA $57
	LDA $54
	STA $58
	RTS
loc_BDC3:
	LDA $57
	CMP $10
	BEQ bra_BDD0_RTS
	LDA $58
	SEC
	SBC #$10
	STA $58
bra_BDD0_RTS:
	RTS
sub_BDD1:
	SEC
	LDA $56
	SBC $52
	STA ScrollSpeed
	LDA $55
	SBC $51
	BPL bra_BDEC
	LDA ScrollSpeed
	EOR #$FF
	SEC
	ADC #$00
	ORA #$80
	STA ScrollSpeed
bra_BDEC:
	LDA ScrollSpeed
	BEQ bra_BE22_RTS
	LDA $52
	EOR $56
	AND #$F8
	BEQ bra_BE22_RTS
	LDA $51
	STA PlayerWallColPos
	LDA $52
	STA $65
	LDA #$00
	STA $66
	LDA #$00
	STA $67
	LDA ScrollSpeed
	BMI bra_BE1A
	INC $64
	JSR sub_B52B
	LDX $51
	INX
	STX $04F2
	RTS
bra_BE1A:
	JSR sub_B52B
	LDA $51
	STA $04F2
bra_BE22_RTS:
	RTS
sub_BE23:
	LDA ScrollSpeed
	BMI bra_BE36
	CLC
	ADC $02
	STA $02
	LDA $56
	STA $52
	LDA $55
	STA $51
	RTS
bra_BE36:
	AND #$7F
	STA ScrollSpeed
	LDA $02
	SEC
	SBC ScrollSpeed
	STA $02
	LDA $56
	STA $52
	LDA $55
	STA $51
	RTS
	RTS
sub_BE4D:
	LDA PlayerXScreenDup
	STA PlayerWallColPos
	LDA PlayerXPosDup
	STA $65
	LDA PlayerYScreenDup
	STA $66
	LDA PlayerYPosDup
	STA $67
loc_BE5D:
	LDA #$00
	STA $26
	LDY $66
	LDA $04FA,Y
	CLC
	ADC $64
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($8C),Y
	TAY
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	TYA
	AND #$20
	BNE bra_BE8B
	LDA DataBank1
	STA M90_PRG0
	JMP loc_BE91
bra_BE8B:
	LDA $04F4
	STA M90_PRG0
loc_BE91:
	LDA $65
	LSR
	LSR
	LSR
	LSR
	STA $25
	LDA $67
	AND #$F0
	ORA $25
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA $96
	LDA #$3C
	STA M90_PRG0
	JSR $8000
	LDA $26
	BEQ bra_BEBC
	JMP loc_BE5D
bra_BEBC:
	JMP loc_BEC1
	STA $95
loc_BEC1:
	LDA PlayerWallColPos
	STA PlayerXScreenDup
	LDA $65
	STA PlayerXPosDup
	LDA $66
	STA PlayerYScreenDup
	LDA $67
	STA PlayerYPosDup
	RTS
sub_BED2:
	LDA PlayerXScreen
	STA PlayerWallColPos
	LDA PlayerXPos
	SEC
	SBC #$08
	STA $65
	LDA PlayerYScreen
	STA $66
	LDA PlayerYPos
	SEC
	SBC #$20
	STA $67
	JSR sub_BF31
	LDA PlayerXScreen
	STA PlayerWallColPos
	LDA PlayerXPos
	CLC
	ADC #$08
	STA $65
	LDA PlayerYScreen
	STA $66
	LDA PlayerYPos
	SEC
	SBC #$20
	STA $67
	JSR sub_BF31
	LDA PlayerXScreen
	STA PlayerWallColPos
	LDA PlayerXPos
	SEC
	SBC #$08
	STA $65
	LDA PlayerYScreen
	STA $66
	LDA PlayerYPos
	STA $67
	JSR sub_BF31
	LDA PlayerXScreen
	STA PlayerWallColPos
	LDA PlayerXPos
	SEC
	SBC #$08
	STA $65
	LDA PlayerYScreen
	STA $66
	LDA PlayerYPos
	STA $67
	JSR sub_BF31
	RTS
sub_BF31:
	LDY $66
	LDA $04FA,Y
	CLC
	ADC $64
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($8C),Y
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	LDA DataBank1
	STA M90_PRG0
	LDA $65
	LSR
	LSR
	LSR
	LSR
	STA $25
	LDA $67
	AND #$F0
	ORA $25
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	CMP #$78
	BCC bra_BF7A_RTS
	STA $96
	LDA #$3C
	STA M90_PRG0
	JSR $8000
bra_BF7A_RTS:
	RTS
	.byte $C0
	.byte $FF
	.byte $06
	.byte $50
	.byte $CE
	.byte $EB
	.byte $DB
	.byte $C7
	.byte $06
	.byte $50
	.byte $CE
	.byte $00
	.byte $00
	.byte $A1
	.byte $7C
	.byte $CE
	.byte $8B
	.byte $1E
	.byte $50
	.byte $CE
	.byte $3B
	.byte $D8
	.byte $74
	.byte $17
	.byte $48
	.byte $2B
	.byte $C3
	.byte $8B
	.byte $F0
	.byte $8A
	.byte $84
	.byte $C1
	.byte $1A
	.byte $98
	.byte $50
	.byte $0E
	.byte $E8
	.byte $2F
	.byte $03
	.byte $8B
	.byte $E5
	.byte $FF
	.byte $06
	.byte $50
	.byte $CE
	.byte $EB
	.byte $DE
	.byte $C4
	.byte $36
	.byte $99
	.byte $C0
	.byte $26
	.byte $C6
	.byte $04
	.byte $3A
	.byte $FF
	.byte $06
	.byte $99
	.byte $C0
	.byte $C7
	.byte $06
	.byte $50
	.byte $CE
	.byte $00
	.byte $00
	.byte $A1
	.byte $7E
	.byte $CE
	.byte $8B
	.byte $1E
	.byte $50
	.byte $CE
	.byte $3B
	.byte $D8
	.byte $74
	.byte $17
	.byte $48
	.byte $2B
	.byte $C3
	.byte $8B
	.byte $F0
	.byte $8A
	.byte $84
	.byte $CD
	.byte $1A
sub_BFD0:
	STA a:Event
	LDA #$01
	STA $0396
	RTS
	.byte $EA
	.byte $EA
	.byte $EA
	.byte $EB
	.byte $DE
	.byte $C7
	.byte $06
	.byte $50
	.byte $CE
	.byte $00
	.byte $00
	.byte $A1
	.byte $76
	.byte $CE
	.byte $03
	.byte $06
	.byte $74
	.byte $CE
	.byte $BB
	.byte $0F
	.byte $00
	.byte $2B
	.byte $D8
	.byte $A1
	.byte $50
	.byte $CE
	.byte $3B
	.byte $C3
	.byte $74
	.byte $12
	.byte $C4
	.byte $36
	.byte $99
	.byte $C0
	.byte $26
	.byte $C6
	.byte $04
	.byte $20
	.byte $FF
