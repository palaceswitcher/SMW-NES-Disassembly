jmp_52_A000:
	LDY ItemBox
	BNE bra2_A006 ;Don't render item sprite if the item box is empty
ptr6_A005:
	RTS
bra2_A006:
	LDX tbl2_A064,Y ;Get index for item's sprite data
	LDY $3C ;Get current OAM index (always seems to be $80 for the item)
;Upload item box sprite to OAM
	LDA tbl2_A068,X
	STA SpriteMem+1,Y
	LDA tbl2_A074,X
	STA SpriteMem+2,Y ;Copy upper left tile
	LDA tbl2_A068+1,X
	STA SpriteMem+5,Y
	LDA tbl2_A074+1,X
	STA SpriteMem+6,Y ;Copy upper right tile
	LDA tbl2_A068+2,X
	STA SpriteMem+9,Y
	LDA tbl2_A074+2,X
	STA SpriteMem+10,Y ;Copy bottom left tile
	LDA tbl2_A068+3,X
	STA SpriteMem+13,Y
	LDA tbl2_A074+3,X
	STA SpriteMem+14,Y ;Copy bottom right tile

	LDA #$D3
	STA SpriteMem,Y
	STA SpriteMem+4,Y
	LDA #$DB
	STA SpriteMem+8,Y
	STA SpriteMem+12,Y
	LDA #$78
	STA SpriteMem+3,Y
	STA SpriteMem+11,Y
	LDA #$80
	STA SpriteMem+7,Y
	STA SpriteMem+15,Y
	INC $3C
	INC $3C
	INC $3C
	INC $3C ;Move to next slot in OAM
	RTS

tbl2_A064:
	db $00
	db $00
	db $04
	db $08
tbl2_A068:
;Mushroom
	db $41, $42
	db $4B, $4C
;Fire Flower
	db $57, $58
	db $5F, $60
;Feather
	db $5D, $5E
	db $65, $66
tbl2_A074:
;Mushroom
	db $03, $03
	db $03, $03
;Fire Flower
	db $03, $03
	db $02, $02
;Feather
	db $00, $03
	db $00, $00
jmp_52_A080:
	LDA #53
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
	STA SpriteMem+3,X
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
	STA SpriteMem+1,X
	LDY $A4
	LDA $05F0
	EOR #$40
	AND #$E0
	LDY $38
	ORA ($30),Y
	ORA $06E1
	STA SpriteMem+2,X
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
	db $B0
	db $13
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
	STA SpriteMem+3,X
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
	STA SpriteMem+1,X
	LDY $A4
	LDA $05F0
	EOR #$40
	AND #$E0
	LDY $38
	ORA ($30),Y
	ORA $06E1
	STA SpriteMem+2,X
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
	db $00
	db $00
	db $08
	db $10
	db $18
	db $20
	db $28
	db $30
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
	STA SpriteMem+3,X
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
	STA SpriteMem+1,X
	LDA YoshiIdleMovement
	EOR #$40
	AND #$C0
	ORA ($30),Y
	STA SpriteMem+2,X
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
	STA SpriteMem+3,X
	LDA $2B
	STA SpriteMem,X
	LDY $40
	LDA $25
	STA SpriteMem+1,X
	LDA #$22
	STA SpriteMem+2,X
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
	db $05
	db $A0
	db $8E
	db $83
	db $2C
	db $85
	db $F3
	db $86
	db $6A
	db $8A
	db $6A
	db $8D
	db $42
	db $8E
	db $8F
	db $8E
	db $DC
	db $8E
	db $B5
	db $8F
	db $3A
	db $90
	db $C8
	db $90
	db $B0
	db $91
	db $CE
	db $92
	db $E1
	db $93
	db $B8
	db $94
	db $00
	db $80
	db $00
	db $80
	db $66
	db $96
	db $66
	db $96
	db $99
	db $82
	db $99
	db $82
	db $88
	db $84
	db $88
	db $84
	db $88
	db $84
	db $88
	db $84
	db $CA
	db $86
	db $CA
	db $86
	db $AB
	db $88
	db $AB
	db $88
	db $13
	db $89
	db $13
	db $89
	db $13
	db $89
	db $13
	db $89
	db $13
	db $89
	db $13
	db $89
	db $8B
	db $8B
	db $8B
	db $8B
	db $52
	db $8D
	db $52
	db $8D
	db $52
	db $8D
	db $52
	db $8D
	db $52
	db $8D
	db $52
	db $8D
	db $52
	db $8D
	db $52
	db $8D
	db $52
	db $8E
	db $52
	db $8E
	db $F4
	db $8F
	db $F4
	db $8F
	db $F4
	db $8F
	db $F4
	db $8F
	db $F4
	db $8F
	db $F4
	db $8F
	db $00
	db $80
	db $00
	db $80
	db $9D
	db $8B
	db $C8
	db $90
	db $7F
	db $91
	db $7F
	db $91
	db $CA
	db $93
	db $CA
	db $93
	db $CA
	db $93
	db $CA
	db $93
	db $CA
	db $93
	db $CA
	db $93
	db $FD
	db $98
	db $FD
	db $98
	db $3D
	db $8A
	db $3D
	db $8A
	db $9D
	db $8B
	db $9D
	db $8B
	db $28
	db $9C
	db $FE
	db $8C
	db $0D
	db $87
	db $0D
	db $87
	db $C7
	db $9D
	db $C7
	db $9D
	db $9F
	db $8A
	db $9F
	db $8A
	db $9F
	db $8A
	db $9F
	db $8A
	db $F4
	db $8F
	db $F4
	db $8F
	db $4F
	db $8E
	db $4F
	db $8E
	db $4F
	db $8E
	db $4F
	db $8E
	db $25
	db $83
	db $25
	db $83
	db $8D
	db $90
	db $8D
	db $90
	db $A9
	db $8F
	db $A9
	db $8F
	db $A9
	db $8F
	db $A9
	db $8F
	db $8D
	db $90
	db $8D
	db $90
	db $8D
	db $90
	db $8D
	db $90
	db $A4
	db $97
	db $A4
	db $97
	db $64
	db $91
	db $64
	db $91
	db $64
	db $91
	db $64
	db $91
	db $C3
	db $84
	db $5E
	db $90
	db $00
	db $9A
	db $00
	db $9A
	db $DF
	db $96
	db $DF
	db $96
	db $66
	db $89
	db $A4
	db $97
	db $B7
	db $93
	db $B7
	db $93
	db $BF
	db $9A
	db $B7
	db $93
	db $E1
	db $8C
	db $79
	db $83
	db $CE
	db $82
	db $4F
	db $8E
	db $8D
	db $98
	db $8D
	db $98
	db $F7
	db $9E
	db $43
	db $99
	db $DF
	db $95
	db $DF
	db $95
;Extra (sprite animation?) code for objects $00-7F
tbl2_A83B:
	dw ptr6_A005 ;0
	dw ptr6_9562 ;1
	dw ptr6_9590 ;2
	dw ptr6_9630 ;3
	dw ptr6_9660 ;4
	dw ptr6_96B7 ;5
	dw ptr6_96D5 ;6
	dw ptr6_96D5 ;7
	dw ptr7_96F8 ;8
	dw ptr7_96F8 ;9
	dw ptr7_96F8 ;a
	dw ptr6_9724 ;b
	dw ptr6_9742 ;c
	dw ptr6_9769 ;d
	dw ptr6_979C ;e
	dw ptr6_97C3 ;f
	dw ptr6_820E ;10
	dw ptr6_820E ;11
	dw ptr6_820E ;12
	dw ptr6_820E ;13
	dw ptr6_820E ;14
	dw ptr6_820E ;15
	dw ptr6_8657 ;16
	dw ptr6_8657 ;17
	dw ptr6_865B ;18
	dw ptr6_865B ;19
	dw ptr6_884B ;1a
	dw ptr6_884B ;1b
	dw ptr6_8912 ;1c
	dw ptr6_8912 ;1d
	dw ptr6_8AA0 ;1e
	dw ptr6_8AA0 ;1f
	dw ptr6_8AA0 ;20
	dw ptr6_8AA0 ;21
	dw ptr6_8AA0 ;22
	dw ptr6_8AA0 ;23
	dw ptr6_8CDE ;24
	dw ptr6_8CDE ;25
	dw ptr6_8E17 ;26
	dw ptr6_8E17 ;27
	dw ptr6_8E17 ;28
	dw ptr6_8E17 ;29
	dw ptr6_8E17 ;2a
	dw ptr6_8E17 ;2b
	dw ptr6_8E17 ;2c
	dw ptr6_8E17 ;2d
	dw ptr6_8F90 ;2e
	dw ptr6_8F90 ;2f
	dw ptr6_9118 ;30
	dw ptr6_9118 ;31
	dw ptr6_9118 ;32
	dw ptr6_9118 ;33
	dw ptr6_9118 ;34
	dw ptr6_9118 ;35
	dw ptr6_820E ;36
	dw ptr6_820E ;37
	dw ptr6_9660 ;38
	dw ptr6_9724 ;39
	dw ptr6_9349 ;3a
	dw ptr6_9349 ;3b
	dw ptr6_95B5 ;3c
	dw ptr6_95B5 ;3d
	dw ptr6_95B5 ;3e
	dw ptr6_95B5 ;3f
	dw ptr6_95B5 ;40
	dw ptr6_95B5 ;41
	dw ptr6_99CD ;42
	dw ptr6_99CD ;43
	dw ptr6_9A11 ;44
	dw ptr6_9A11 ;45
	dw ptr6_9A68 ;46
	dw ptr6_9A68 ;47
	dw ptr5_9DA5 ;48
	dw ptr6_96B7 ;49
	dw bra5_8008 ;4a
	dw bra5_8008 ;4b
	dw ptr6_9BFB ;4c
	dw ptr6_9BFB ;4d
	dw bra5_8008 ;4e
	dw bra5_8008 ;4f
	dw bra5_8008 ;50
	dw bra5_8008 ;51
	dw ptr6_9118 ;52
	dw ptr6_9118 ;53
	dw ptr6_8039 ;54
	dw ptr6_8039 ;55
	dw ptr6_8039 ;56
	dw ptr6_8039 ;57
	dw ptr6_820E ;58
	dw ptr6_820E ;59
	dw bra5_8008 ;5a
	dw bra5_8008 ;5b
	dw bra5_8008 ;5c
	dw bra5_8008 ;5d
	dw bra5_8008 ;5e
	dw bra5_8008 ;5f
	dw bra5_8008 ;60
	dw bra5_8008 ;61
	dw bra5_8008 ;62
	dw bra5_8008 ;63
	dw ptr6_9389 ;64
	dw ptr6_9389 ;65
	dw bra5_8008 ;66
	dw bra5_8008 ;67
	dw bra5_8008 ;68
	dw bra5_8008 ;69
	dw ptr6_958D ;6a
	dw ptr6_9727 ;6b
	dw ptr6_99A9 ;6c
	dw ptr6_99A9 ;6d
	dw ptr6_820E ;6e
	dw ptr6_820E ;6f
	dw ptr6_8CA2 ;70
	dw ptr6_9364 ;71
	dw ptr6_8CDB ;72
	dw ptr6_8CDB ;73
	dw ptr6_9BDB ;74
	dw ptr6_8CDB ;75
	dw ptr6_8039 ;76
	dw ptr6_8000 ;77
	dw ptr6_8000 ;78
	dw ptr6_8039 ;79
	dw ptr6_820E ;7a
	dw ptr6_820E ;7b
	dw ptr6_A005 ;7c
	dw ptr6_A005 ;7d
	dw ptr6_9670 ;7e
	dw ptr6_9670 ;7f
tbl2_A93B:
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $35
	db $35
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $31
	db $31
	db $35
	db $35
	db $31
	db $31
	db $31
	db $31
	db $37
	db $37
	db $31
	db $31
	db $31
	db $31
	db $37
	db $37
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $32
	db $32
	db $31
	db $31
	db $31
	db $31
	db $35
	db $35
	db $32
	db $32
	db $37
	db $37
	db $32
	db $32
	db $32
	db $32
	db $35
	db $32
	db $31
	db $31
	db $31
	db $31
	db $37
	db $37
	db $35
	db $37
	db $31
	db $31

;----------------------------------------
;Unused, duplicate pointers for objects 80-FF. Can be found in bank 54
	dw ObjID_h80
	dw ObjID_h80
	dw ObjID_h82
	dw ObjID_h82
	dw ObjID_h84
	dw ObjID_h84
	dw ObjID_h86
	dw ObjID_h86
	dw ObjID_h88
	dw ObjID_h88
	dw ObjID_h8A
	dw ObjID_h8A
	dw ObjID_h8C
	dw ObjID_h8C
	dw ObjID_h8E
	dw ObjID_h8E
	dw ObjID_h90
	dw ObjID_h90
	dw ObjID_h92
	dw ObjID_h92
	dw ObjID_h94
	dw ObjID_h94
	dw ObjID_h96
	dw ObjID_h96
	dw ObjID_h98
	dw ObjID_h98
	dw ObjID_h9A
	dw ObjID_h9A
	dw ObjID_h9C
	dw ObjID_h9C
	dw ObjID_h9E
	dw ObjID_h9E
	dw ObjID_hA0
	dw ObjID_hA0
	dw ObjID_hA2
	dw ObjID_hA2
	dw ObjID_hA4
	dw ObjID_hA4
	dw ObjID_hA6
	dw ObjID_hA6
	dw ObjID_hA8
	dw ObjID_hA8
	dw ObjID_hA8
	dw ObjID_hA8
	dw ObjID_hAA
	dw ObjID_hAA
	dw ObjID_hAC
	dw ObjID_hAC
	dw ObjID_hAE
	dw ObjID_hAE
	dw ObjID_hB0
	dw ObjID_hB0
	dw ObjID_hB2
	dw ObjID_hB2
	dw ObjID_hB4
	dw ObjID_hB4
	dw ObjID_hB6
	dw ptr6_A005 ;(different)
	dw ObjID_hB8
	dw ptr6_A005 ;(different)
	dw ObjID_hBA
	dw ptr6_A005 ;(different)
	dw ptr6_A005 ;(different)
	dw ObjID_hBD
	dw ObjID_hBE
	dw ObjID_hBE
	dw ObjID_hC0
	dw ObjID_hC0
	dw ObjID_hC2
	dw ObjID_hC2
	dw ObjID_hBE
	dw ObjID_hBE
	dw ObjID_hC0
	dw ObjID_hC0
	dw ObjID_hC2
	dw ObjID_hC2
	dw ObjID_hBE
	dw ObjID_hBE
	dw ObjID_hC0
	dw ObjID_hC0
	dw ObjID_hCE
	dw ObjID_hCE
	dw ObjID_hD0
	dw ObjID_hD0
	dw ObjID_hD2
	dw ObjID_hD2
	dw ObjID_hD4
	dw ObjID_hD5
	dw ObjID_hD6
	dw ObjID_hD6
	dw ObjID_hD8
	dw ObjID_hD8
	dw ObjID_hDA
	dw ObjID_hDA
	dw ObjID_hDC
	dw ObjID_hDC
	dw ObjID_hDE
	dw ObjID_hDF
	dw ObjID_hE0
	dw ObjID_hE0
	dw ObjID_hE2
	dw ObjID_hE2
	dw ObjID_hE4
	dw ObjID_hE4
	dw ObjID_hE6
	dw ObjID_hE7
	dw ObjID_hE8
	dw ObjID_hE8
	dw ObjID_hE8 ;1st bonus block
	dw ObjID_hE8
	dw ObjID_hE8 ;2nd bonus block
	dw ObjID_hED
	dw ObjID_hED ;3rd bonus block
	dw ObjID_hED
	dw ObjID_hF0
	dw ObjID_hF0
	dw ObjID_hED
	dw ObjID_hED
	dw ObjID_hF4
	dw ObjID_hF4
	dw ObjID_hF4
	dw ObjID_hF4
	dw ObjID_h58
	dw ObjID_h58
	dw ObjID_hFA
	dw ObjID_hFA
	dw ObjID_hFA
	dw ObjID_hFA

;Extra (perhaps sprite handling?) code for objects 80-FF
tbl2_AABB:
	dw ptr6_8BF1 ;80
	dw ptr6_8BF1 ;81
	dw ptr6_9093 ;82
	dw ptr6_9093 ;83
	dw ptr6_83B3 ;84
	dw ptr6_83B3 ;85
	dw ptr6_87FE ;86
	dw ptr6_87FE ;87
	dw ptr6_817B ;88
	dw ptr6_817B ;89
	dw ptr6_9519 ;8a
	dw ptr6_9519 ;8b
	dw ptr7_9632 ;8c
	dw ptr7_9632 ;8d
	dw ptr6_8544 ;8e
	dw ptr6_8544 ;8f
	dw ptr7_8544 ;90
	dw ptr7_8544 ;91
	dw ptr6_87FE ;92
	dw ptr6_87FE ;93
	dw ptr6_88E0 ;94
	dw ptr6_88E0 ;95
	dw ptr6_8897 ;96
	dw ptr6_8897 ;97
	dw ptr6_8517 ;98
	dw ptr6_8517 ;99
	dw ptr6_8A5E ;9a
	dw ptr6_8A5E ;9b
	dw ptr6_8D95 ;9c
	dw ptr6_8D95 ;9d
	dw ptr6_8F15 ;9e
	dw ptr6_8F15 ;9f
	dw ptr6_82C7 ;a0
	dw ptr6_82C7 ;a1
	dw ptr6_9980 ;a2
	dw ptr6_9980 ;a3
	dw ptr6_9980 ;a4
	dw ptr6_9980 ;a5
	dw ptr6_9B79 ;a6
	dw ptr6_9B79 ;a7
	dw ptr7_9A87 ;a8
	dw ptr7_9A87 ;a9
	dw ptr7_9A87 ;aa
	dw ptr7_9A87 ;ab
	dw ptr6_9279 ;ac
	dw ptr6_9279 ;ad
	dw ptr6_93B7 ;ae
	dw ptr6_93B7 ;af
	dw ptr6_8B71 ;b0
	dw ptr6_8B71 ;b1
	dw ptr6_8E28 ;b2
	dw ptr6_8E28 ;b3
	dw ptr6_90C4 ;b4
	dw ptr6_90C4 ;b5
	dw ptr6_990E ;b6
	dw ptr6_990E ;b7
	dw ptr6_8ECE ;b8
	dw ptr6_A005 ;b9
	dw ptr6_8F2E ;ba
	dw ptr6_A005 ;bb
	dw ptr6_8F2E ;bc
	dw ptr6_A005 ;bd
	dw ptr6_A005 ;be
	dw ptr6_8349 ;bf
	dw ptr9_843B ;c0
	dw ptr9_843B ;c1
	dw ptr6_8640 ;c2
	dw ptr6_8640 ;c3
	dw ptr6_87C8 ;c4
	dw ptr6_87C8 ;c5
	dw ptr9_843B ;c6
	dw ptr9_843B ;c7
	dw ptr6_8640 ;c8
	dw ptr6_8640 ;c9
	dw ptr6_87C8 ;ca
	dw ptr6_87C8 ;cb
	dw ptr9_843B ;cc
	dw ptr9_843B ;cd
	dw ptr6_8640 ;ce
	dw ptr6_8640 ;cf
	dw ptr6_8A81 ;d0
	dw ptr6_8A81 ;d1
	dw ptr6_8D59 ;d2
	dw ptr6_8D59 ;d3
	dw ptr6_901A ;d4
	dw ptr6_901A ;d5
	dw ptr6_A005 ;d6
	dw ptr6_A005 ;d7
	dw ptr6_9286 ;d8
	dw ptr6_9286 ;d9
	dw ptr6_98E1 ;da
	dw ptr6_98E1 ;db
	dw ptr6_98B7 ;dc
	dw ptr6_98B7 ;dd
	dw bra4_98BE ;de
	dw bra4_98BE ;df
	dw ptr6_88D1 ;e0
	dw ptr6_88F9 ;e1
	dw ptr7_8000 ;e2
	dw ptr7_8000 ;e3
	dw ptr6_8475 ;e4
	dw ptr6_8475 ;e5
	dw ptr6_8475 ;e6
	dw ptr6_8475 ;e7
	dw ptr6_9BED ;e8
	dw ptr6_9951 ;e9
	dw ptr6_9951 ;ea
	dw ptr6_9951 ;eb
	dw ptr6_9951 ;ec
	dw ptr6_9951 ;ed
	dw ptr6_9951 ;ee
	dw ptr6_A005 ;ef
	dw ptr6_A005 ;f0
	dw ptr6_A005 ;f1
	dw ptr6_A005 ;f2
	dw ptr6_A005 ;f3
	dw ptr6_A005 ;f4
	dw ptr6_A005 ;f5
	dw ptr7_8000 ;f6
	dw ptr7_8000 ;f7
	dw ptr7_8000 ;f8
	dw ptr7_8000 ;f9
	dw ptr6_820E ;fa
	dw ptr6_820E ;fb
	dw ptr6_96CB ;fc
	dw ptr6_96CB ;fd
	dw ptr6_96CB ;fe
	dw ptr6_96CB ;ff
tbl2_ABBB:
	db $38
	db $38
	db $38
	db $38
	db $32
	db $32
	db $32
	db $32
	db $32
	db $32
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $32
	db $32
	db $32
	db $32
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $25
	db $25
	db $25
	db $30
	db $25
	db $30
	db $30
	db $25
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $25
	db $25
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $25
	db $25
	db $25
	db $25
	db $25
	db $25
	db $25
	db $25
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $37
	db $37
	db $31
	db $31
	db $25
	db $25
	db $25
	db $25
	db $37
	db $37
	db $31
	db $31
	db $31
	db $31
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
	STA SpriteMem+3,X
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
	STA SpriteMem+1,X
	LDY $A4
	LDA $05F0
	EOR #$40
	AND #$C0
	LDY $38
	ORA ($30),Y
	STA SpriteMem+2,X
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
	STA SpriteMem+3,X
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
	STA SpriteMem+1,X
	LDY $A4
	LDA $05F0
	EOR #$40
	AND #$E0
	LDY $38
	ORA ($30),Y
	ORA $06E1
	STA SpriteMem+2,X
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