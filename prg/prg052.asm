;disassembled by BZK 6502 Disassembler
jmp_52_A000:
	LDY ItemBox
	BNE bra2_A006
ptr6_A005:
	RTS
bra2_A006:
	LDX tbl2_A064,Y
	LDY $3C
	LDA tbl2_A068,X
	STA $0201,Y
	LDA tbl2_A074,X
	STA $0202,Y
	LDA tbl2_A069,X
	STA $0205,Y
	LDA tbl2_A075,X
	STA $0206,Y
	LDA tbl2_A06A,X
	STA $0209,Y
	LDA tbl2_A076,X
	STA $020A,Y
	LDA tbl2_A06B,X
	STA $020D,Y
	LDA tbl2_A077,X
	STA $020E,Y
	LDA #$D3
	STA SpriteMem,Y
	STA $0204,Y
	LDA #$DB
	STA $0208,Y
	STA $020C,Y
	LDA #$78
	STA $0203,Y
	STA $020B,Y
	LDA #$80
	STA $0207,Y
	STA $020F,Y
	INC $3C
	INC $3C
	INC $3C
	INC $3C
	RTS
tbl2_A064:
	.byte $00
	.byte $00
	.byte $04
	.byte $08
tbl2_A068:
	.byte $41
tbl2_A069:
	.byte $42
tbl2_A06A:
	.byte $4B
tbl2_A06B:
	.byte $4C
	.byte $57
	.byte $58
	.byte $5F
	.byte $60
	.byte $5D
	.byte $5E
	.byte $65
	.byte $66
tbl2_A074:
	.byte $03
tbl2_A075:
	.byte $03
tbl2_A076:
	.byte $03
tbl2_A077:
	.byte $03
	.byte $03
	.byte $03
	.byte $02
	.byte $02
	.byte $00
	.byte $03
	.byte $00
	.byte $00
jmp_52_A080:
	LDA #$35
	STA M90_PRG0
	JSR sub_53_827C
	RTS
jmp_52_A089:
	LDA FrameCount
	AND #$01
	BNE bra2_A0A3
	LDX #$00
bra2_A091:
	STX $A4
	LDA ObjectSlot,X
	BEQ bra2_A09B
	JSR sub2_A0B5
bra2_A09B:
	LDX $A4
	INX
	CPX ObjectCount
	BCC bra2_A091
	RTS
bra2_A0A3:
	LDX ObjectCount
bra2_A0A5:
	STX $A4
	LDA ObjectSlot,X
	BEQ bra2_A0AF
	JSR sub2_A0B5
bra2_A0AF:
	LDX $A4
	DEX
	BPL bra2_A0A5
	RTS
sub2_A0B5:
	LDY ObjectSlot,X
	BMI bra2_A0BF
	LDA tbl2_A93B,Y
	BNE bra2_A0C7
bra2_A0BF:
	TYA
	SEC
	SBC #$80
	TAY
	LDA tbl2_ABBB,Y
bra2_A0C7:
	STA $AD
	STA $25
	LDA $25
	STA M90_PRG0
	LDA ObjectSlot,X
	BMI bra2_A0E4
	ASL
	TAX
	LDA tbl2_A83B,X
	STA $32
	LDA tbl2_A83B+1,X
	STA $33
	JMP ($32)
bra2_A0E4:
	ASL
	TAX
	LDA tbl2_AABB,X
	STA $32
	LDA tbl2_AABB+1,X
	STA $33
	JMP ($32)
jmp_52_A0F3:
	LDX #$00
bra2_A0F5:
	STX $A4
	LDA ObjectAction,X
	CMP #$F2
	BEQ bra2_A102
	CMP #$F3
	BNE bra2_A105
bra2_A102:
	JSR sub2_A10D
bra2_A105:
	LDX $A4
	INX
	CPX ObjectCount
	BCC bra2_A0F5
	RTS
sub2_A10D:
	LDA ObjectAction,X
	AND #$0F
	STA $2D
	JSR sub2_A5D0
	RTS
jmp_52_A118:
	LDY #$00
	LDA ($32),Y ;Load from first byte of sprite map
	STA $2A ;Get width in tiles
	TAX
	LDA tbl2_A45B,X ;Get size in pixels based on width in tiles
	STA $25
	INY ;Move to next byte
	LDA ($32),Y
	STA $2D ;Get height in tiles
	INY ;Move to next byte
	LDA ($32),Y
	STA $2E ;Get CHR bank number
	AND #$7F ;Ignore highest bit
	ASL
	TAX ;Get bank attribute index
	LDA #$2F
	STA M90_PRG2
	LDA CHRSprBankAttrs,X
	STA $30
	LDA CHRSprBankAttrs+1,X
	STA $31 ;Get sprite tile attribute pointer for the given bank
	LDA $05F0
	AND #$40
	BEQ bra2_A18C ;Branch if sprite tile isn't horizontally flipped
	LDX #$00
	LDY $A4 ;Get index for current object
	LDA ObjectXDistance,Y
	CLC
	ADC PlayerSprXPos
	STA $28 ;Object X Distance + Player X = Object Position (low byte)
	LDA ObjXScreenDistance,Y
	ADC #$00 ;Add high byte if needed
	BMI bra2_A16E
	BEQ bra2_A15E
	RTS
bra2_A15E:
	LDA $28
bra2_A160:
	STA $41,X
	INX
	CPX $2A
	BCS bra2_A1D7 ;Position sprites vertically once the tile width is exceeded
	;Otherwise, move next sprite a tile over
		CLC
		ADC #$08
	BCC bra2_A160 ;Write every tile until the width is exceeded
	BCS bra2_A181
bra2_A16E:
	LDA $28
	LDY #$00 ;Set index to first object?
bra2_A172:
	STY $41,X
	INX
	CPX $2A
	BCS bra2_A180_RTS
	CLC
	ADC #$08
	BCC bra2_A172
	BCS bra2_A160
bra2_A180_RTS:
	RTS
bra2_A181:
	LDA #$00
bra2_A183:
	STA $41,X
	INX
	CPX $2A
	BCC bra2_A183
	BCS bra2_A1D7 ;Position sprites vertically once the tile width is exceeded
bra2_A18C:
	LDX #$00
	STX $41
	LDY $A4
	LDA $25
	CLC
	ADC PlayerSprXPos
	BCC bra2_A19B
	INC $41
bra2_A19B:
	CLC
	ADC ObjectXDistance,Y
	STA $28
	LDA ObjXScreenDistance,Y
	ADC $41
	BMI bra2_A1BB
	BEQ bra2_A1AB
	RTS
bra2_A1AB:
	LDA $28
bra2_A1AD:
	STA $41,X
	INX
	CPX $2A
	BCS bra2_A1D7
	SEC
	SBC #$08
	BCS bra2_A1AD
	BCC bra2_A1CE
bra2_A1BB:
	LDA $28
	LDY #$00
bra2_A1BF:
	STY $41,X
	INX
	CPX $2A
	BCS bra2_A1CD_RTS
	SEC
	SBC #$08
	BCS bra2_A1BF
	BCC bra2_A1AD ;unlogged
bra2_A1CD_RTS:
	RTS
bra2_A1CE:
	LDA #$00
bra2_A1D0:
	STA $41,X
	INX
	CPX $2A
	BCC bra2_A1D0
bra2_A1D7:
	LDX #$00
	LDY $A4
	LDA ObjectYDistance,Y
	CLC
	ADC PlayerSprYPos
	STA $2B
	LDA ObjYScreenDistance,Y
	ADC #$00
	BMI bra2_A205
	BEQ bra2_A1ED
	RTS
bra2_A1ED:
	LDA $2B
	CMP #$C8
	BCC bra2_A1F5
	LDA #$F8
bra2_A1F5:
	STA $B2,X
	INX
	CPX $2D
	BCS bra2_A221
	CLC
	ADC #$08
	STA $2B
	BCC bra2_A1ED
	BCS bra2_A218
bra2_A205:
	LDA $2B
	LDY #$00
bra2_A209:
	STY $B2,X
	INX
	CPX $2D
	BCS bra2_A217_RTS
	CLC
	ADC #$08
	BCC bra2_A209
	BCS bra2_A1F5
bra2_A217_RTS:
	RTS
bra2_A218:
	LDA #$00
bra2_A21A:
	STA $B2,X
	INX
	CPX $2D
	BCC bra2_A21A
bra2_A221:
	LDX $3C
	LDA #$00
	STA $40
	LDA #$00
	TAY
bra2_A22A:
	STY $3F
	LDA a:$B2,Y
	BNE bra2_A23B
	LDA $40
	CLC
	ADC $2A
	STA $40
	JMP loc2_A28A
bra2_A23B:
	STA $2B
	LDY #$00
bra2_A23F:
	STY $3E
	LDA a:$41,Y
	BEQ bra2_A281
	STA $0203,X
	LDA $2B
	STA SpriteMem,X
	LDY $40
	INY
	INY
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra2_A260
	LDA #$F8
	STA SpriteMem,X
	BMI bra2_A281
bra2_A260:
	AND #$3F
	STA $38
	ORA $36
	STA $0201,X
	LDY $A4
	LDA $05F0
	EOR #$40
	AND #$E0
	LDY $38
	ORA ($30),Y
	ORA $06E1
	STA $0202,X
	TXA
	CLC
	ADC #$04
	TAX
bra2_A281:
	INC $40
	LDY $3E
	INY
	CPY $2A
	BCC bra2_A23F
loc2_A28A:
	LDY $3F
	INY
	CPY $2D
	BCC bra2_A22A
	STX $3C
	LDA $36
	AND #$80
	BEQ bra2_A2A7_RTS
	LDY #$01
	LDA $36
	AND #$40
	BNE bra2_A2A2
	TAY
bra2_A2A2:
	LDA $2E
	STA $03C9,Y
bra2_A2A7_RTS:
	RTS
sub_52_A2A8:
	LDY #$00
	LDA ($32),Y
	STA $2A
	TAX
	LDA tbl2_A45B,X
	STA $25
	INY
	LDA ($32),Y
	STA $2D
	INY
	LDA ($32),Y
	CLC
	ADC #$0C
	JSR sub2_A2DE
	JSR sub2_A446
	RTS
	JSR sub2_A2CA ;unlogged
	RTS ;unlogged
sub2_A2CA:
	LDY #$00
	LDA ($32),Y
	STA $2A
	TAX
	LDA tbl2_A45B,X
	STA $25
	INY
	LDA ($32),Y
	STA $2D
	INY
	LDA ($32),Y
sub2_A2DE:
	STA $2E
	AND #$7F
	ASL
	TAX
	LDA #$2F
	STA M90_PRG2
	LDA CHRSprBankAttrs,X
	STA $30
	LDA CHRSprBankAttrs+1,X
	STA $31
	LDA $05F0
	AND #$40
	BEQ bra2_A33E
	LDX #$00
	LDY $A4
	LDA ObjectXDistance,Y
	CLC
	ADC PlayerSprXPos
	STA $28
	LDA ObjXScreenDistance,Y
	ADC #$00
	BMI bra2_A320
	BEQ bra2_A310
	RTS ;unlogged
bra2_A310:
	LDA $28
bra2_A312:
	STA $41,X
	INX
	CPX $2A
	BCS bra2_A389
	CLC
	ADC #$08
	BCC bra2_A312
	BCS bra2_A333 ;unlogged
bra2_A320:
	LDA $28 ;unlogged
	LDY #$00 ;unlogged
bra2_A324:
	STY $41,X ;unlogged
	INX ;unlogged
	CPX $2A ;unlogged
	BCS bra2_A332_RTS ;unlogged
	CLC ;unlogged
	ADC #$08 ;unlogged
	BCC bra2_A324 ;unlogged
	BCS bra2_A312 ;unlogged
bra2_A332_RTS:
	RTS ;unlogged
bra2_A333:
	LDA #$00 ;unlogged
bra2_A335:
	STA $41,X ;unlogged
	INX ;unlogged
	CPX $2A ;unlogged
	BCC bra2_A335 ;unlogged
	BCS bra2_A389 ;unlogged
bra2_A33E:
	LDX #$00
	STX $41
	LDY $A4
	LDA $25
	CLC
	ADC PlayerSprXPos
	BCC bra2_A34D
	INC $41
bra2_A34D:
	CLC
	ADC ObjectXDistance,Y
	STA $28
	LDA ObjXScreenDistance,Y
	ADC $41
	BMI bra2_A36D
	BEQ bra2_A35D
	RTS
bra2_A35D:
	LDA $28
bra2_A35F:
	STA $41,X
	INX
	CPX $2A
	BCS bra2_A389
	SEC
	SBC #$08
	BCS bra2_A35F
	BCC bra2_A380
bra2_A36D:
	LDA $28
	LDY #$00
bra2_A371:
	STY $41,X
	INX
	CPX $2A
	BCS bra2_A37F_RTS
	SEC
	SBC #$08
	BCS bra2_A371
	BCC bra2_A35F ;unlogged
bra2_A37F_RTS:
	RTS
bra2_A380:
	LDA #$00
bra2_A382:
	STA $41,X
	INX
	CPX $2A
	BCC bra2_A382
bra2_A389:
	LDX #$00
	LDY $A4
	LDA ObjectYDistance,Y
	CLC
	ADC PlayerSprYPos
	STA $2B
	LDA ObjYScreenDistance,Y
	ADC #$00
	BMI bra2_A3B7
	BEQ bra2_A39F
	RTS
bra2_A39F:
	LDA $2B
	CMP #$C8
	BCC bra2_A3A7
	LDA #$F8
bra2_A3A7:
	STA $B2,X
	INX
	CPX $2D
	BCS bra2_A3D3
	CLC
	ADC #$08
	STA $2B
	BCC bra2_A39F
	.byte $B0
	.byte $13
bra2_A3B7:
	LDA $2B
	LDY #$00
bra2_A3BB:
	STY $B2,X
	INX
	CPX $2D
	BCS bra2_A3C9_RTS
	CLC ;unlogged
	ADC #$08 ;unlogged
	BCC bra2_A3BB ;unlogged
	BCS bra2_A3A7 ;unlogged
bra2_A3C9_RTS:
	RTS
	LDA #$00 ;unlogged
bra2_A3CC:
	STA $B2,X ;unlogged
	INX ;unlogged
	CPX $2D ;unlogged
	BCC bra2_A3CC ;unlogged
bra2_A3D3:
	LDX $3C
	LDA #$00
	STA $40
	LDA #$00
	TAY
bra2_A3DC:
	STY $3F
	LDA a:$B2,Y
	BNE bra2_A3ED
	LDA $40
	CLC
	ADC $2A
	STA $40
	JMP loc2_A43C
bra2_A3ED:
	STA $2B
	LDY #$00
bra2_A3F1:
	STY $3E
	LDA a:$41,Y
	BEQ bra2_A433
	STA $0203,X
	LDA $2B
	STA SpriteMem,X
	LDY $40
	INY
	INY
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra2_A412
	LDA #$F8
	STA SpriteMem,X
	BMI bra2_A433
bra2_A412:
	AND #$3F
	STA $38
	ORA $36
	STA $0201,X
	LDY $A4
	LDA $05F0
	EOR #$40
	AND #$E0
	LDY $38
	ORA ($30),Y
	ORA $06E1
	STA $0202,X
	TXA
	CLC
	ADC #$04
	TAX
bra2_A433:
	INC $40
	LDY $3E
	INY
	CPY $2A
	BCC bra2_A3F1
loc2_A43C:
	LDY $3F
	INY
	CPY $2D
	BCC bra2_A3DC
	STX $3C
	RTS
sub2_A446:
	LDA $36
	AND #$80
	BEQ bra2_A45A_RTS
	LDY #$01
	LDA $36
	AND #$40
	BNE bra2_A455
	TAY
bra2_A455:
	LDA $2E
	STA $03C9,Y
bra2_A45A_RTS:
	RTS
tbl2_A45B:
	.byte $00
	.byte $00
	.byte $08
	.byte $10
	.byte $18
	.byte $20
	.byte $28
	.byte $30
jmp_52_A463:
	LDY #$00
	LDA ($32),Y
	STA $2A
	TAX
	LDA tbl2_A45B,X
	STA $25
	INY
	LDA ($32),Y
	STA $2D
	INY
	LDA ($32),Y
	STA $2E
	AND #$7F
	ASL
	TAX
	LDA #$2F
	STA M90_PRG2
	LDA CHRSprBankAttrs,X
	STA $30
	LDA CHRSprBankAttrs+1,X
	STA $31
	LDA YoshiIdleMovement
	AND #$40
	BEQ bra2_A4D5
	LDX #$00
	LDA YoshiXDistance
	CLC
	ADC PlayerSprXPos
	STA $28
	LDA YoshiXScreenDist
	ADC #$00
	BMI bra2_A4B7
	BEQ bra2_A4A7
	RTS
bra2_A4A7:
	LDA $28
bra2_A4A9:
	STA $41,X
	INX
	CPX $2A
	BCS bra2_A518
	CLC
	ADC #$08
	BCC bra2_A4A9
	BCS bra2_A4CA
bra2_A4B7:
	LDA $28
	LDY #$00
bra2_A4BB:
	STY $41,X
	INX
	CPX $2A
	BCS bra2_A4C9_RTS
	CLC
	ADC #$08
	BCC bra2_A4BB
	BCS bra2_A4A9
bra2_A4C9_RTS:
	RTS
bra2_A4CA:
	LDA #$00
bra2_A4CC:
	STA $41,X
	INX
	CPX $2A
	BCC bra2_A4CC
	BCS bra2_A518
bra2_A4D5:
	LDX #$00
	LDA $25
	CLC
	ADC PlayerSprXPos
	CLC
	ADC YoshiXDistance
	STA $28
	LDA YoshiXScreenDist
	ADC #$00
	BMI bra2_A4FC
	BEQ bra2_A4EC
	RTS
bra2_A4EC:
	LDA $28
bra2_A4EE:
	STA $41,X
	INX
	CPX $2A
	BCS bra2_A518
	SEC
	SBC #$08
	BCS bra2_A4EE
	BCC bra2_A50F
bra2_A4FC:
	LDA $28
	LDY #$00
bra2_A500:
	STY $41,X
	INX
	CPX $2A
	BCS bra2_A50E_RTS
	SEC
	SBC #$08
	BCS bra2_A500
	BCC bra2_A4EE ;unlogged
bra2_A50E_RTS:
	RTS
bra2_A50F:
	LDA #$00
bra2_A511:
	STA $41,X
	INX
	CPX $2A
	BCC bra2_A511
bra2_A518:
	LDX #$00
	LDA YoshiYDistance
	CLC
	ADC PlayerSprYPos
	STA $2B
	LDA YoshiYScreenDist
	ADC #$00
	BMI bra2_A544
	BEQ bra2_A52C
	RTS
bra2_A52C:
	LDA $2B
	CMP #$C8
	BCC bra2_A534
	LDA #$F8
bra2_A534:
	STA $B2,X
	INX
	CPX $2D
	BCS bra2_A560
	CLC
	ADC #$08
	STA $2B
	BCC bra2_A52C
	BCS bra2_A557
bra2_A544:
	LDA $2B
	LDY #$00
bra2_A548:
	STY $B2,X
	INX
	CPX $2D
	BCS bra2_A556_RTS
	CLC
	ADC #$08
	BCC bra2_A548
	BCS bra2_A534
bra2_A556_RTS:
	RTS
bra2_A557:
	LDA #$00
bra2_A559:
	STA $B2,X
	INX
	CPX $2D
	BCC bra2_A559
bra2_A560:
	LDX $3C
	LDA #$00
	STA $40
	LDA #$00
	TAY
bra2_A569:
	STY $3F
	LDA a:$B2,Y
	BNE bra2_A57A
	LDA $40
	CLC
	ADC $2A
	STA $40
	JMP loc2_A5C1
bra2_A57A:
	STA $2B
	LDY #$00
bra2_A57E:
	STY $3E
	LDA a:$41,Y
	BEQ bra2_A5B8
	STA $0203,X
	LDA $2B
	STA SpriteMem,X
	LDY $40
	INY
	INY
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra2_A59F
	LDA #$F8
	STA SpriteMem,X
	BMI bra2_A5B8
bra2_A59F:
	AND #$3F
	TAY
	ORA $36
	STA $0201,X
	LDA YoshiIdleMovement
	EOR #$40
	AND #$C0
	ORA ($30),Y
	STA $0202,X
	TXA
	CLC
	ADC #$04
	TAX
bra2_A5B8:
	INC $40
	LDY $3E
	INY
	CPY $2A
	BCC bra2_A57E
loc2_A5C1:
	LDY $3F
	INY
	CPY $2D
	BCC bra2_A569
	STX $3C
	LDA $2E
	STA $03C8
	RTS
sub2_A5D0:
	LDA #$40
	STA $05F0
	LDA #$08
	STA $25
	LDA $05F0
	AND #$40
	BEQ bra2_A624
	LDX #$00
	LDY $A4
	LDA ObjectXDistance,Y
	CLC
	ADC PlayerSprXPos
	STA $28
	LDA ObjXScreenDistance,Y
	ADC #$00
	BMI bra2_A606
	BEQ bra2_A5F6
	RTS
bra2_A5F6:
	LDA $28
bra2_A5F8:
	STA $41,X
	INX
	CPX #$02
	BCS bra2_A66F
	CLC
	ADC #$08
	BCC bra2_A5F8
	BCS bra2_A619
bra2_A606:
	LDA $28
	LDY #$00
bra2_A60A:
	STY $41,X
	INX
	CPX #$02
	BCS bra2_A618_RTS
	CLC
	ADC #$08
	BCC bra2_A60A
	BCS bra2_A5F8
bra2_A618_RTS:
	RTS
bra2_A619:
	LDA #$00
bra2_A61B:
	STA $41,X
	INX
	CPX #$02
	BCC bra2_A61B
	BCS bra2_A66F
bra2_A624:
	LDX #$00 ;unlogged code start
	STX $41
	LDY $A4
	LDA $25
	CLC
	ADC PlayerSprXPos
	BCC bra2_A633
	INC $41
bra2_A633:
	CLC
	ADC ObjectXDistance,Y
	STA $28
	LDA ObjXScreenDistance,Y
	ADC $41
	BMI bra2_A653
	BEQ bra2_A643
	RTS
bra2_A643:
	LDA $28
bra2_A645:
	STA $41,X
	INX
	CPX #$02
	BCS bra2_A66F
	SEC
	SBC #$08
	BCS bra2_A645
	BCC bra2_A666
bra2_A653:
	LDA $28
	LDY #$00
bra2_A657:
	STY $41,X
	INX
	CPX #$02
	BCS bra2_A665_RTS
	SEC
	SBC #$08
	BCS bra2_A657
	BCC bra2_A645
bra2_A665_RTS:
	RTS
bra2_A666:
	LDA #$00
bra2_A668:
	STA $41,X
	INX
	CPX #$02
	BCC bra2_A668 ;unlogged code end
bra2_A66F:
	LDX #$00
	LDY $A4
	LDA ObjectYDistance,Y
	CLC
	ADC PlayerSprYPos
	STA $2B
	LDA ObjYScreenDistance,Y
	ADC #$00
	BMI bra2_A69D
	BEQ bra2_A685
	RTS
bra2_A685:
	LDA $2B
	CMP #$C8
	BCC bra2_A68D
	LDA #$F8
bra2_A68D:
	STA $B2,X
	INX
	CPX $2D
	BCS bra2_A6B9
	CLC
	ADC #$08
	STA $2B
	BCC bra2_A685
	BCS bra2_A6B0
bra2_A69D:
	LDA $2B
	LDY #$00
bra2_A6A1:
	STY $B2,X
	INX
	CPX $2D
	BCS bra2_A6AF_RTS
	CLC
	ADC #$08
	BCC bra2_A6A1
	BCS bra2_A68D
bra2_A6AF_RTS:
	RTS
bra2_A6B0:
	LDA #$00
bra2_A6B2:
	STA $B2,X
	INX
	CPX $2D
	BCC bra2_A6B2
bra2_A6B9:
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAY
	LDA tbl2_A71F,Y
	BNE bra2_A6CC
	LDA #$40
	BNE bra2_A6CE
bra2_A6CC:
	LDA #$5A
bra2_A6CE:
	STA $25
	LDX $3C
	LDA #$00
	STA $40
	TAY
bra2_A6D7:
	STY $3F
	LDA a:$B2,Y
	BNE bra2_A6E8
	LDA $40
	CLC
	ADC #$02
	STA $40
	JMP loc2_A715
bra2_A6E8:
	STA $2B
	LDY #$00
bra2_A6EC:
	STY $3E
	LDA a:$41,Y
	BEQ bra2_A70C
	STA $0203,X
	LDA $2B
	STA SpriteMem,X
	LDY $40
	LDA $25
	STA $0201,X
	LDA #$22
	STA $0202,X
	TXA
	CLC
	ADC #$04
	TAX
bra2_A70C:
	INC $40
	LDY $3E
	INY
	CPY #$02
	BCC bra2_A6EC
loc2_A715:
	LDY $3F
	INY
	CPY $2D
	BCC bra2_A6D7
	STX $3C
	RTS
tbl2_A71F:
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
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
	.byte $05
	.byte $A0
	.byte $8E
	.byte $83
	.byte $2C
	.byte $85
	.byte $F3
	.byte $86
	.byte $6A
	.byte $8A
	.byte $6A
	.byte $8D
	.byte $42
	.byte $8E
	.byte $8F
	.byte $8E
	.byte $DC
	.byte $8E
	.byte $B5
	.byte $8F
	.byte $3A
	.byte $90
	.byte $C8
	.byte $90
	.byte $B0
	.byte $91
	.byte $CE
	.byte $92
	.byte $E1
	.byte $93
	.byte $B8
	.byte $94
	.byte $00
	.byte $80
	.byte $00
	.byte $80
	.byte $66
	.byte $96
	.byte $66
	.byte $96
	.byte $99
	.byte $82
	.byte $99
	.byte $82
	.byte $88
	.byte $84
	.byte $88
	.byte $84
	.byte $88
	.byte $84
	.byte $88
	.byte $84
	.byte $CA
	.byte $86
	.byte $CA
	.byte $86
	.byte $AB
	.byte $88
	.byte $AB
	.byte $88
	.byte $13
	.byte $89
	.byte $13
	.byte $89
	.byte $13
	.byte $89
	.byte $13
	.byte $89
	.byte $13
	.byte $89
	.byte $13
	.byte $89
	.byte $8B
	.byte $8B
	.byte $8B
	.byte $8B
	.byte $52
	.byte $8D
	.byte $52
	.byte $8D
	.byte $52
	.byte $8D
	.byte $52
	.byte $8D
	.byte $52
	.byte $8D
	.byte $52
	.byte $8D
	.byte $52
	.byte $8D
	.byte $52
	.byte $8D
	.byte $52
	.byte $8E
	.byte $52
	.byte $8E
	.byte $F4
	.byte $8F
	.byte $F4
	.byte $8F
	.byte $F4
	.byte $8F
	.byte $F4
	.byte $8F
	.byte $F4
	.byte $8F
	.byte $F4
	.byte $8F
	.byte $00
	.byte $80
	.byte $00
	.byte $80
	.byte $9D
	.byte $8B
	.byte $C8
	.byte $90
	.byte $7F
	.byte $91
	.byte $7F
	.byte $91
	.byte $CA
	.byte $93
	.byte $CA
	.byte $93
	.byte $CA
	.byte $93
	.byte $CA
	.byte $93
	.byte $CA
	.byte $93
	.byte $CA
	.byte $93
	.byte $FD
	.byte $98
	.byte $FD
	.byte $98
	.byte $3D
	.byte $8A
	.byte $3D
	.byte $8A
	.byte $9D
	.byte $8B
	.byte $9D
	.byte $8B
	.byte $28
	.byte $9C
	.byte $FE
	.byte $8C
	.byte $0D
	.byte $87
	.byte $0D
	.byte $87
	.byte $C7
	.byte $9D
	.byte $C7
	.byte $9D
	.byte $9F
	.byte $8A
	.byte $9F
	.byte $8A
	.byte $9F
	.byte $8A
	.byte $9F
	.byte $8A
	.byte $F4
	.byte $8F
	.byte $F4
	.byte $8F
	.byte $4F
	.byte $8E
	.byte $4F
	.byte $8E
	.byte $4F
	.byte $8E
	.byte $4F
	.byte $8E
	.byte $25
	.byte $83
	.byte $25
	.byte $83
	.byte $8D
	.byte $90
	.byte $8D
	.byte $90
	.byte $A9
	.byte $8F
	.byte $A9
	.byte $8F
	.byte $A9
	.byte $8F
	.byte $A9
	.byte $8F
	.byte $8D
	.byte $90
	.byte $8D
	.byte $90
	.byte $8D
	.byte $90
	.byte $8D
	.byte $90
	.byte $A4
	.byte $97
	.byte $A4
	.byte $97
	.byte $64
	.byte $91
	.byte $64
	.byte $91
	.byte $64
	.byte $91
	.byte $64
	.byte $91
	.byte $C3
	.byte $84
	.byte $5E
	.byte $90
	.byte $00
	.byte $9A
	.byte $00
	.byte $9A
	.byte $DF
	.byte $96
	.byte $DF
	.byte $96
	.byte $66
	.byte $89
	.byte $A4
	.byte $97
	.byte $B7
	.byte $93
	.byte $B7
	.byte $93
	.byte $BF
	.byte $9A
	.byte $B7
	.byte $93
	.byte $E1
	.byte $8C
	.byte $79
	.byte $83
	.byte $CE
	.byte $82
	.byte $4F
	.byte $8E
	.byte $8D
	.byte $98
	.byte $8D
	.byte $98
	.byte $F7
	.byte $9E
	.byte $43
	.byte $99
	.byte $DF
	.byte $95
	.byte $DF
	.byte $95
;Extra (sprite animation?) code for objects $00-7F
tbl2_A83B:
	.word ptr6_A005 ;0
	.word obj_u80 ;1
	.word ptr6_9590 ;2
	.word ptr6_9630 ;3
	.word ptr6_9660 ;4
	.word ptr6_96B7 ;5
	.word ptr6_96D5 ;6
	.word ptr6_96D5 ;7
	.word ptr7_96F8 ;8
	.word ptr7_96F8 ;9
	.word ptr7_96F8 ;a
	.word ptr6_9724 ;b
	.word ptr6_9742 ;c
	.word ptr6_9769 ;d
	.word ptr6_979C ;e
	.word ptr6_97C3 ;f
	.word ptr6_820E ;10
	.word ptr6_820E ;11
	.word ptr6_820E ;12
	.word ptr6_820E ;13
	.word ptr6_820E ;14
	.word ptr6_820E ;15
	.word ptr6_8657 ;16
	.word ptr6_8657 ;17
	.word ptr6_865B ;18
	.word ptr6_865B ;19
	.word ptr6_884B ;1a
	.word ptr6_884B ;1b
	.word ptr6_8912 ;1c
	.word ptr6_8912 ;1d
	.word ptr6_8AA0 ;1e
	.word ptr6_8AA0 ;1f
	.word ptr6_8AA0 ;20
	.word ptr6_8AA0 ;21
	.word ptr6_8AA0 ;22
	.word ptr6_8AA0 ;23
	.word ptr6_8CDE ;24
	.word ptr6_8CDE ;25
	.word ptr6_8E17 ;26
	.word ptr6_8E17 ;27
	.word ptr6_8E17 ;28
	.word ptr6_8E17 ;29
	.word ptr6_8E17 ;2a
	.word ptr6_8E17 ;2b
	.word ptr6_8E17 ;2c
	.word ptr6_8E17 ;2d
	.word ptr6_8F90 ;2e
	.word ptr6_8F90 ;2f
	.word ptr6_9118 ;30
	.word ptr6_9118 ;31
	.word ptr6_9118 ;32
	.word ptr6_9118 ;33
	.word ptr6_9118 ;34
	.word ptr6_9118 ;35
	.word ptr6_820E ;36
	.word ptr6_820E ;37
	.word ptr6_9660 ;38
	.word ptr6_9724 ;39
	.word ptr6_9349 ;3a
	.word ptr6_9349 ;3b
	.word ptr6_95B5 ;3c
	.word ptr6_95B5 ;3d
	.word ptr6_95B5 ;3e
	.word ptr6_95B5 ;3f
	.word ptr6_95B5 ;40
	.word ptr6_95B5 ;41
	.word ptr6_99CD ;42
	.word ptr6_99CD ;43
	.word ptr6_9A11 ;44
	.word ptr6_9A11 ;45
	.word ptr6_9A68 ;46
	.word ptr6_9A68 ;47
	.word ptr5_9DA5 ;48
	.word ptr6_96B7 ;49
	.word bra5_8008 ;4a
	.word bra5_8008 ;4b
	.word ptr6_9BFB ;4c
	.word ptr6_9BFB ;4d
	.word bra5_8008 ;4e
	.word bra5_8008 ;4f
	.word bra5_8008 ;50
	.word bra5_8008 ;51
	.word ptr6_9118 ;52
	.word ptr6_9118 ;53
	.word ptr6_8039 ;54
	.word ptr6_8039 ;55
	.word ptr6_8039 ;56
	.word ptr6_8039 ;57
	.word ptr6_820E ;58
	.word ptr6_820E ;59
	.word bra5_8008 ;5a
	.word bra5_8008 ;5b
	.word bra5_8008 ;5c
	.word bra5_8008 ;5d
	.word bra5_8008 ;5e
	.word bra5_8008 ;5f
	.word bra5_8008 ;60
	.word bra5_8008 ;61
	.word bra5_8008 ;62
	.word bra5_8008 ;63
	.word ptr6_9389 ;64
	.word ptr6_9389 ;65
	.word bra5_8008 ;66
	.word bra5_8008 ;67
	.word bra5_8008 ;68
	.word bra5_8008 ;69
	.word ptr6_958D ;6a
	.word ptr6_9727 ;6b
	.word ptr6_99A9 ;6c
	.word ptr6_99A9 ;6d
	.word ptr6_820E ;6e
	.word ptr6_820E ;6f
	.word ptr6_8CA2 ;70
	.word ptr6_9364 ;71
	.word ptr6_8CDB ;72
	.word ptr6_8CDB ;73
	.word ptr6_9BDB ;74
	.word ptr6_8CDB ;75
	.word ptr6_8039 ;76
	.word ptr6_8000 ;77
	.word ptr6_8000 ;78
	.word ptr6_8039 ;79
	.word ptr6_820E ;7a
	.word ptr6_820E ;7b
	.word ptr6_A005 ;7c
	.word ptr6_A005 ;7d
	.word ptr6_9670 ;7e
	.word ptr6_9670 ;7f
tbl2_A93B:
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $35
	.byte $35
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $31
	.byte $31
	.byte $35
	.byte $35
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $37
	.byte $37
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $37
	.byte $37
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $32
	.byte $32
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $35
	.byte $35
	.byte $32
	.byte $32
	.byte $37
	.byte $37
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $35
	.byte $32
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $37
	.byte $37
	.byte $35
	.byte $37
	.byte $31
	.byte $31

;Seemingly unused set of pointers. They don't have banks specified anywhere, but it might help to give these labels.
	.byte $AA
	.byte $8A
	.byte $AA
	.byte $8A
	.byte $7D
	.byte $8F
	.byte $7D
	.byte $8F
	.byte $C8
	.byte $81
	.byte $C8
	.byte $81
	.byte $86
	.byte $85
	.byte $86
	.byte $85
	.byte $00
	.byte $80
	.byte $00
	.byte $80
	.byte $02
	.byte $94
	.byte $02
	.byte $94
	.byte $77
	.byte $95
	.byte $77
	.byte $95
	.byte $18
	.byte $84
	.byte $18
	.byte $84
	.byte $AE
	.byte $84
	.byte $AE
	.byte $84
	.byte $CF
	.byte $86
	.byte $CF
	.byte $86
	.byte $72
	.byte $85
	.byte $72
	.byte $85
	.byte $D4
	.byte $86
	.byte $D4
	.byte $86
	.byte $33
	.byte $83
	.byte $33
	.byte $83
	.byte $39
	.byte $89
	.byte $39
	.byte $89
	.byte $6A
	.byte $8C
	.byte $6A
	.byte $8C
	.byte $FA
	.byte $8D
	.byte $FA
	.byte $8D
	.byte $49
	.byte $81
	.byte $49
	.byte $81
	.byte $A6
	.byte $97
	.byte $A6
	.byte $97
	.byte $6C
	.byte $96
	.byte $6C
	.byte $96
	.byte $F5
	.byte $9A
	.byte $F5
	.byte $9A
	.byte $FD
	.byte $99
	.byte $FD
	.byte $99
	.byte $FD
	.byte $99
	.byte $FD
	.byte $99
	.byte $DE
	.byte $90
	.byte $DE
	.byte $90
	.byte $F4
	.byte $92
	.byte $F4
	.byte $92
	.byte $CB
	.byte $8A
	.byte $CB
	.byte $8A
	.byte $7D
	.byte $8D
	.byte $7D
	.byte $8D
	.byte $40
	.byte $90
	.byte $40
	.byte $90
	.byte $67
	.byte $93
	.byte $67
	.byte $93
	.byte $64
	.byte $97
	.byte $05
	.byte $A0
	.byte $E1
	.byte $93
	.byte $05
	.byte $A0
	.byte $D6
	.byte $8F
	.byte $05
	.byte $A0
	.byte $05
	.byte $A0
	.byte $6D
	.byte $83
	.byte $78
	.byte $82
	.byte $78
	.byte $82
	.byte $7C
	.byte $84
	.byte $7C
	.byte $84
	.byte $75
	.byte $86
	.byte $75
	.byte $86
	.byte $78
	.byte $82
	.byte $78
	.byte $82
	.byte $7C
	.byte $84
	.byte $7C
	.byte $84
	.byte $75
	.byte $86
	.byte $75
	.byte $86
	.byte $78
	.byte $82
	.byte $78
	.byte $82
	.byte $7C
	.byte $84
	.byte $7C
	.byte $84
	.byte $14
	.byte $88
	.byte $14
	.byte $88
	.byte $86
	.byte $8B
	.byte $86
	.byte $8B
	.byte $3D
	.byte $8E
	.byte $3D
	.byte $8E
	.byte $62
	.byte $80
	.byte $B3
	.byte $8B
	.byte $87
	.byte $92
	.byte $87
	.byte $92
	.byte $02
	.byte $94
	.byte $02
	.byte $94
	.byte $85
	.byte $96
	.byte $85
	.byte $96
	.byte $E8
	.byte $97
	.byte $E8
	.byte $97
	.byte $78
	.byte $8C
	.byte $E4
	.byte $90
	.byte $E4
	.byte $80
	.byte $E4
	.byte $80
	.byte $34
	.byte $86
	.byte $34
	.byte $86
	.byte $E8
	.byte $84
	.byte $E8
	.byte $84
	.byte $10
	.byte $9C
	.byte $AC
	.byte $99
	.byte $4B
	.byte $9A
	.byte $4B
	.byte $9A
	.byte $4B
	.byte $9A
	.byte $4B
	.byte $9A
	.byte $4B
	.byte $9A
	.byte $11
	.byte $98
	.byte $11
	.byte $98
	.byte $11
	.byte $98
	.byte $B6
	.byte $99
	.byte $B6
	.byte $99
	.byte $11
	.byte $98
	.byte $11
	.byte $98
	.byte $CE
	.byte $81
	.byte $CE
	.byte $81
	.byte $CE
	.byte $81
	.byte $CE
	.byte $81
	.byte $25
	.byte $83
	.byte $25
	.byte $83
	.byte $2C
	.byte $97
	.byte $2C
	.byte $97
	.byte $2C
	.byte $97
	.byte $2C
	.byte $97
;Extra (perhaps sprite handling?) code for objects 80-FF
tbl2_AABB:
	.word ptr6_8BF1 ;80
	.word ptr6_8BF1 ;81
	.word ptr6_9093 ;82
	.word ptr6_9093 ;83
	.word ptr6_83B3 ;84
	.word ptr6_83B3 ;85
	.word ptr6_87FE ;86
	.word ptr6_87FE ;87
	.word ptr6_817B ;88
	.word ptr6_817B ;89
	.word ptr6_9519 ;8a
	.word ptr6_9519 ;8b
	.word ptr7_9632 ;8c
	.word ptr7_9632 ;8d
	.word ptr6_8544 ;8e
	.word ptr6_8544 ;8f
	.word ptr7_8544 ;90
	.word ptr7_8544 ;91
	.word ptr6_87FE ;92
	.word ptr6_87FE ;93
	.word ptr6_88E0 ;94
	.word ptr6_88E0 ;95
	.word ptr6_8897 ;96
	.word ptr6_8897 ;97
	.word ptr6_8517 ;98
	.word ptr6_8517 ;99
	.word ptr6_8A5E ;9a
	.word ptr6_8A5E ;9b
	.word ptr6_8D95 ;9c
	.word ptr6_8D95 ;9d
	.word ptr6_8F15 ;9e
	.word ptr6_8F15 ;9f
	.word ptr6_82C7 ;a0
	.word ptr6_82C7 ;a1
	.word ptr6_9980 ;a2
	.word ptr6_9980 ;a3
	.word ptr6_9980 ;a4
	.word ptr6_9980 ;a5
	.word ptr6_9B79 ;a6
	.word ptr6_9B79 ;a7
	.word ptr7_9A87 ;a8
	.word ptr7_9A87 ;a9
	.word ptr7_9A87 ;aa
	.word ptr7_9A87 ;ab
	.word ptr6_9279 ;ac
	.word ptr6_9279 ;ad
	.word ptr6_93B7 ;ae
	.word ptr6_93B7 ;af
	.word ptr6_8B71 ;b0
	.word ptr6_8B71 ;b1
	.word ptr6_8E28 ;b2
	.word ptr6_8E28 ;b3
	.word ptr6_90C4 ;b4
	.word ptr6_90C4 ;b5
	.word ptr6_990E ;b6
	.word ptr6_990E ;b7
	.word ptr6_8ECE ;b8
	.word ptr6_A005 ;b9
	.word ptr6_8F2E ;ba
	.word ptr6_A005 ;bb
	.word ptr6_8F2E ;bc
	.word ptr6_A005 ;bd
	.word ptr6_A005 ;be
	.word ptr6_8349 ;bf
	.word ptr9_843B ;c0
	.word ptr9_843B ;c1
	.word ptr6_8640 ;c2
	.word ptr6_8640 ;c3
	.word ptr6_87C8 ;c4
	.word ptr6_87C8 ;c5
	.word ptr9_843B ;c6
	.word ptr9_843B ;c7
	.word ptr6_8640 ;c8
	.word ptr6_8640 ;c9
	.word ptr6_87C8 ;ca
	.word ptr6_87C8 ;cb
	.word ptr9_843B ;cc
	.word ptr9_843B ;cd
	.word ptr6_8640 ;ce
	.word ptr6_8640 ;cf
	.word ptr6_8A81 ;d0
	.word ptr6_8A81 ;d1
	.word ptr6_8D59 ;d2
	.word ptr6_8D59 ;d3
	.word ptr6_901A ;d4
	.word ptr6_901A ;d5
	.word ptr6_A005 ;d6
	.word ptr6_A005 ;d7
	.word ptr6_9286 ;d8
	.word ptr6_9286 ;d9
	.word ptr6_98E1 ;da
	.word ptr6_98E1 ;db
	.word ptr6_98B7 ;dc
	.word ptr6_98B7 ;dd
	.word bra4_98BE ;de
	.word bra4_98BE ;df
	.word ptr6_88D1 ;e0
	.word ptr6_88F9 ;e1
	.word ptr7_8000 ;e2
	.word ptr7_8000 ;e3
	.word ptr6_8475 ;e4
	.word ptr6_8475 ;e5
	.word ptr6_8475 ;e6
	.word ptr6_8475 ;e7
	.word ptr6_9BED ;e8
	.word ptr6_9951 ;e9
	.word ptr6_9951 ;ea
	.word ptr6_9951 ;eb
	.word ptr6_9951 ;ec
	.word ptr6_9951 ;ed
	.word ptr6_9951 ;ee
	.word ptr6_A005 ;ef
	.word ptr6_A005 ;f0
	.word ptr6_A005 ;f1
	.word ptr6_A005 ;f2
	.word ptr6_A005 ;f3
	.word ptr6_A005 ;f4
	.word ptr6_A005 ;f5
	.word ptr7_8000 ;f6
	.word ptr7_8000 ;f7
	.word ptr7_8000 ;f8
	.word ptr7_8000 ;f9
	.word ptr6_820E ;fa
	.word ptr6_820E ;fb
	.word ptr6_96CB ;fc
	.word ptr6_96CB ;fd
	.word ptr6_96CB ;fe
	.word ptr6_96CB ;ff
tbl2_ABBB:
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $25
	.byte $25
	.byte $25
	.byte $30
	.byte $25
	.byte $30
	.byte $30
	.byte $25
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $25
	.byte $25
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $37
	.byte $37
	.byte $31
	.byte $31
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $37
	.byte $37
	.byte $31
	.byte $31
	.byte $31
	.byte $31
jmp_52_AC3B:
	LDY #$00
	LDA ($32),Y
	STA $2A
	TAX
	LDA tbl2_A45B,X
	STA $25
	INY
	LDA ($32),Y
	STA $2D
	INY
	LDA ($32),Y
	STA $2E
	AND #$7F
	ASL
	TAX
	LDA CHRSprBankAttrs,X
	STA $30
	LDA CHRSprBankAttrs+1,X
	STA $31
	LDA $05F0
	AND #$40
	BEQ bra2_ACAA
	LDX #$00
	LDY $A4
	LDA ObjectXDistance,Y
	CLC
	ADC PlayerSprXPos
	STA $28
	LDA ObjXScreenDistance,Y
	ADC #$00
	BMI bra2_AC8C
	BEQ bra2_AC7C
	RTS
bra2_AC7C:
	LDA $28
bra2_AC7E:
	STA $41,X
	INX
	CPX $2A
	BCS bra2_ACF5
	CLC
	ADC #$08
	BCC bra2_AC7E
	BCS bra2_AC9F
bra2_AC8C:
	LDA $28
	LDY #$00
bra2_AC90:
	STY $41,X
	INX
	CPX $2A
	BCS bra2_AC9E_RTS
	CLC
	ADC #$08
	BCC bra2_AC90
	BCS bra2_AC7E
bra2_AC9E_RTS:
	RTS
bra2_AC9F:
	LDA #$00
bra2_ACA1:
	STA $41,X
	INX
	CPX $2A
	BCC bra2_ACA1
	BCS bra2_ACF5
bra2_ACAA:
	LDX #$00
	STX $41
	LDY $A4
	LDA $25
	CLC
	ADC PlayerSprXPos
	BCC bra2_ACB9
	INC $41 ;unlogged
bra2_ACB9:
	CLC
	ADC ObjectXDistance,Y
	STA $28
	LDA ObjXScreenDistance,Y
	ADC $41
	BMI bra2_ACD9
	BEQ bra2_ACC9
	RTS
bra2_ACC9:
	LDA $28
bra2_ACCB:
	STA $41,X
	INX
	CPX $2A
	BCS bra2_ACF5
	SEC
	SBC #$08
	BCS bra2_ACCB
	BCC bra2_ACEC
bra2_ACD9:
	LDA $28
	LDY #$00
bra2_ACDD:
	STY $41,X
	INX
	CPX $2A
	BCS bra2_ACEB_RTS
	SEC
	SBC #$08
	BCS bra2_ACDD
	BCC bra2_ACCB ;unlogged
bra2_ACEB_RTS:
	RTS
bra2_ACEC:
	LDA #$00
bra2_ACEE:
	STA $41,X
	INX
	CPX $2A
	BCC bra2_ACEE
bra2_ACF5:
	LDX #$00
	LDY $A4
	LDA ObjectYDistance,Y
	CLC
	ADC PlayerSprYPos
	STA $2B
	LDA ObjYScreenDistance,Y
	ADC #$00
	BMI bra2_AD23
	BEQ bra2_AD0B
	RTS
bra2_AD0B:
	LDA $2B
	CMP #$C8
	BCC bra2_AD13
	LDA #$F8
bra2_AD13:
	STA $B2,X
	INX
	CPX $2D
	BCS bra2_AD3F
	CLC
	ADC #$08
	STA $2B
	BCC bra2_AD0B
	BCS bra2_AD36
bra2_AD23:
	LDA $2B
	LDY #$00
bra2_AD27:
	STY $B2,X
	INX
	CPX $2D
	BCS bra2_AD35_RTS
	CLC
	ADC #$08
	BCC bra2_AD27
	BCS bra2_AD13
bra2_AD35_RTS:
	RTS
bra2_AD36:
	LDA #$00
bra2_AD38:
	STA $B2,X
	INX
	CPX $2D
	BCC bra2_AD38
bra2_AD3F:
	LDX $3C
	LDA #$00
	STA $40
	LDA #$00
	TAY
bra2_AD48:
	STY $3F
	LDA a:$B2,Y
	BNE bra2_AD59
	LDA $40
	CLC
	ADC $2A
	STA $40
	JMP loc2_ADA5
bra2_AD59:
	STA $2B
	LDY #$00
bra2_AD5D:
	STY $3E
	LDA a:$41,Y
	BEQ bra2_AD9C
	STA $0203,X
	LDA $2B
	STA SpriteMem,X
	LDY $40
	INY
	INY
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra2_AD7E
	LDA #$F8 ;unlogged
	STA SpriteMem,X ;unlogged
	BMI bra2_AD9C ;unlogged
bra2_AD7E:
	AND #$3F
	STA $38
	ORA $36
	STA $0201,X
	LDY $A4
	LDA $05F0
	EOR #$40
	AND #$C0
	LDY $38
	ORA ($30),Y
	STA $0202,X
	TXA
	CLC
	ADC #$04
	TAX
bra2_AD9C:
	INC $40
	LDY $3E
	INY
	CPY $2A
	BCC bra2_AD5D
loc2_ADA5:
	LDY $3F
	INY
	CPY $2D
	BCC bra2_AD48
	STX $3C
	RTS
sub_52_ADAF:
	LDY #$02
	LDA ($32),Y
	STA $2E
	AND #$7F
	ASL
	TAX
	LDA #$2F
	STA M90_PRG2
	LDA CHRSprBankAttrs,X
	STA $30
	LDA CHRSprBankAttrs+1,X
	STA $31
	LDA $05F0
	AND #$40
	BEQ bra2_AE13
	LDX #$00
	LDY $A4
	LDA ObjectXDistance,Y
	CLC
	ADC PlayerSprXPos
	STA $28
	LDA ObjXScreenDistance,Y
	ADC #$00
	BMI bra2_ADF5
	BEQ bra2_ADE5
	RTS ;unlogged
bra2_ADE5:
	LDA $28
bra2_ADE7:
	STA $41,X
	INX
	CPX #$02
	BCS bra2_AE58
	CLC
	ADC #$08
	BCC bra2_ADE7
	BCS bra2_AE08 ;unlogged
bra2_ADF5:
	LDA $28 ;unlogged
	LDY #$00 ;unlogged
bra2_ADF9:
	STY $41,X ;unlogged
	INX ;unlogged
	CPX #$02 ;unlogged
	BCS bra2_AE07_RTS ;unlogged
	CLC ;unlogged
	ADC #$08 ;unlogged
	BCC bra2_ADF9 ;unlogged
	BCS bra2_ADE7 ;unlogged
bra2_AE07_RTS:
	RTS ;unlogged
bra2_AE08:
	LDA #$00 ;unlogged
bra2_AE0A:
	STA $41,X ;unlogged
	INX ;unlogged
	CPX #$02 ;unlogged
	BCC bra2_AE0A ;unlogged
	BCS bra2_AE58 ;unlogged
bra2_AE13:
	LDX #$00
	LDY $A4
	LDA #$08
	CLC
	ADC PlayerSprXPos
	CLC
	ADC ObjectXDistance,Y
	STA $28
	LDA ObjXScreenDistance,Y
	ADC #$00
	BMI bra2_AE3C
	BEQ bra2_AE2C
	RTS ;unlogged
bra2_AE2C:
	LDA $28
bra2_AE2E:
	STA $41,X
	INX
	CPX #$02
	BCS bra2_AE58
	SEC
	SBC #$08
	BCS bra2_AE2E
	BCC bra2_AE4F ;unlogged
bra2_AE3C:
	LDA $28 ;unlogged
	LDY #$00 ;unlogged
bra2_AE40:
	STY $41,X ;unlogged
	INX ;unlogged
	CPX #$02 ;unlogged
	BCS bra2_AE4E_RTS ;unlogged
	SEC ;unlogged
	SBC #$08 ;unlogged
	BCS bra2_AE40 ;unlogged
	BCC bra2_AE2E ;unlogged
bra2_AE4E_RTS:
	RTS ;unlogged
bra2_AE4F:
	LDA #$00 ;unlogged
bra2_AE51:
	STA $41,X ;unlogged
	INX ;unlogged
	CPX #$02 ;unlogged
	BCC bra2_AE51 ;unlogged
bra2_AE58:
	LDX #$00
	LDY $A4
	LDA ObjectYDistance,Y
	CLC
	ADC PlayerSprYPos
	STA $2B
	LDA ObjYScreenDistance,Y
	ADC #$00
	BMI bra2_AE86
	BEQ bra2_AE6E
	RTS
bra2_AE6E:
	LDA $2B
	CMP #$C8
	BCC bra2_AE76
	LDA #$F8
bra2_AE76:
	STA $B2,X
	INX
	CPX #$02
	BCS bra2_AEA2
	CLC
	ADC #$08
	STA $2B
	BCC bra2_AE6E
	BCS bra2_AE99
bra2_AE86:
	LDA $2B
	LDY #$00
bra2_AE8A:
	STY $B2,X
	INX
	CPX #$02
	BCS bra2_AE98_RTS
	CLC
	ADC #$08
	BCC bra2_AE8A
	BCS bra2_AE76
bra2_AE98_RTS:
	RTS
bra2_AE99:
	LDA #$00
bra2_AE9B:
	STA $B2,X
	INX
	CPX #$02
	BCC bra2_AE9B
bra2_AEA2:
	LDX $3C
	LDA #$00
	STA $40
	LDA #$00
	TAY
bra2_AEAB:
	STY $3F
	LDA a:$B2,Y
	BNE bra2_AEBC
	LDA $40
	CLC
	ADC #$02
	STA $40
	JMP loc2_AF0B
bra2_AEBC:
	STA $2B
	LDY #$00
bra2_AEC0:
	STY $3E
	LDA a:$41,Y
	BEQ bra2_AF02
	STA $0203,X
	LDA $2B
	STA SpriteMem,X
	LDY $40
	INY
	INY
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra2_AEE1
	LDA #$F8 ;unlogged
	STA SpriteMem,X ;unlogged
	BMI bra2_AF02 ;unlogged
bra2_AEE1:
	AND #$3F
	STA $38
	ORA $36
	STA $0201,X
	LDY $A4
	LDA $05F0
	EOR #$40
	AND #$E0
	LDY $38
	ORA ($30),Y
	ORA $06E1
	STA $0202,X
	TXA
	CLC
	ADC #$04
	TAX
bra2_AF02:
	INC $40
	LDY $3E
	INY
	CPY #$02
	BCC bra2_AEC0
loc2_AF0B:
	LDY $3F
	INY
	CPY #$02
	BCC bra2_AEAB
	STX $3C
	LDA $36
	AND #$80
	BEQ bra2_AF28_RTS
	LDY #$01
	LDA $36
	AND #$40
	BNE bra2_AF23
	TAY
bra2_AF23:
	LDA $2E
	STA $03C9,Y
bra2_AF28_RTS:
	RTS