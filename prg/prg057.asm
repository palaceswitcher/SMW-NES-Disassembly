;disassembled by BZK 6502 Disassembler
jmp_57_A000:
	LDA PlayerAction
	CMP $1E
	BEQ bra4_A020
	BNE bra4_A014
	LDA PlayerXSpeed	;unlogged
	ROR	;unlogged
	ROR	;unlogged
	ROR	;unlogged
	ROR	;unlogged
	AND #$0F	;unlogged
	TAX	;unlogged
	LDA tbl4_A095,X	;unlogged
bra4_A014:
	STA PlayerAnimation
	LDA #$00
	STA PlayerAnimationFrame
	JSR sub4_A185
	JMP loc4_A03E
bra4_A020:
	CMP #$01
	BNE bra4_A034
	LDA PlayerXSpeed
	ROR
	ROR
	ROR
	ROR
	AND #$0F
	TAX
	LDA tbl4_A095,X	;load animation from table
	TAY				;move it to the y reg
	JMP loc4_A035	;jump
bra4_A034:
	TAY
loc4_A035:
	CPY PlayerAnimation	;compare current animation to frame loaded from table
	BEQ bra4_A03E		;branch if they're equal
	STY PlayerAnimation	;unlogged
	JSR sub4_A185	;unlogged
bra4_A03E:
loc4_A03E:
	LDA PlayerAction
	STA PlayerActionDup
	JSR sub4_A17C
	JSR sub4_A1B4
	LDA #$14
	STA $3C
	JSR $F176
	LDA PlayerActionDup
	CMP $062C
	BEQ bra4_A061
	STA $062C
	LDA #$00
	STA $0629
	STA $0627
bra4_A061:
	JSR sub4_A0CD
	LDA Event
	CMP #$01
	BEQ bra4_A06D
	JSR sub4_B938
bra4_A06D:
	LDA FreezeFlag
	BNE bra4_A094_RTS
	LDA $062B
	AND #$01
	BNE bra4_A07F
	INC $0629
	INC $0627
bra4_A07F:
	INC $062B
	LDA $4A
	BEQ bra4_A094_RTS
	INC $4B
	LDA $4B
	CMP #$20
	BCC bra4_A094_RTS
	LDA #$00
	STA $4A
	STA $4B
bra4_A094_RTS:
	RTS
tbl4_A095:
	.db $01	;player walk cycle
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $02
	.db $02
	.db $02
	.db $03
	.db $03
	.db $03
	.db $04
	.db $04
	.db $05
	.db $05
	.db $05
	.db $60
tbl4_A0A8:
	.db $01
	.db $01
	.db $01
	.db $01
	.db $FF
	.db $FF
	.db $FF
	.db $FF
sub4_A0B0:
	TXA
	ADC $E4
	STA $E4
	AND #$01
	BNE bra4_A0C2
	TXA
	ADC $E4
	TYA
	ADC $E4
	STA $E4
	RTS
bra4_A0C2:
	ADC $E4
	STA $E4
	ROR
	ROR
	ADC $E4
	STA $E4
	RTS
sub4_A0CD:
	LDA Event		;
	CMP #$04		;if event is set to 04,
	BEQ bra4_A0DC	;branch
	CMP #$07
	BEQ bra4_A118_RTS
	CMP #$08
	BNE bra4_A0E0
	RTS
bra4_A0DC:
	LDA LevelTransitionFlag	;
	BEQ bra4_A118_RTS		;if transition flag isn't set, branch
bra4_A0E0:
	LDA PlayerState				;
	CMP #$03			;if player is climbing,
	BEQ bra4_A118_RTS	;branch
	LDA #$03
	LDX UnderwaterFlag
	BEQ bra4_A0EF
	LDA #$01
bra4_A0EF:
	STA $32
	LDA PlayerMovement
	AND #$04
	BEQ bra4_A119
	LDA PlayerXSpeed
	BEQ bra4_A101
	CMP #$20
	BCS bra4_A101
	INC PlayerXSpeed
bra4_A101:
	LDA PlayerYSpeed
	SEC					;set carry
	SBC #$03			;
	STA PlayerYSpeed	;subtract 3 from the player's y speed
	LDA #$F8			;
	CMP PlayerYSpeed	;if player's y speed exceeds #$F8,
	BCS bra4_A118_RTS	;branch
	LDA #$02			;sets y speed
	STA PlayerYSpeed	;
	LDA PlayerMovement	;
	AND #%01110011		;sets player to be standing (regardless of direction)
	STA PlayerMovement	;
bra4_A118_RTS:
	RTS
bra4_A119:
	LDA PlayerYSpeed
	CLC
	ADC $32
	STA PlayerYSpeed
	LDA #$F8			;
	CMP PlayerYSpeed	;if player's y speed exceeds #$F8,
	BCS bra4_A118_RTS	;branch
	STA PlayerYSpeed
	RTS
	.db $00
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $03
	.db $02
	.db $04
	.db $05
	.db $02
	.db $01
	.db $01
	.db $01
	.db $00
	.db $00
	.db $00
	.db $01
	.db $01
	.db $01
	.db $00
	.db $02
	.db $02
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
sub4_A14A:
	LDA Player1YoshiStatus
	ASL
	TAX
	LDA #36
	STA M90_PRG2
	LDA lda_36_C000,X
	STA $32
	LDA lda_36_C001,X
	STA $33
	LDA PlayerPowerup
	LDY Player1YoshiStatus
	BNE bra4_A16E
	LDY PlayerCarryFlag
	BEQ bra4_A16E
	CLC
	ADC #$05
bra4_A16E:
	AND #$0F
	ASL
	TAY
	LDA ($32),Y	;load byte from pointer location
	STA $E5		;store here
	INY
	LDA ($32),Y	;load next byte from pointer location
	STA $E6		;store here
	RTS
sub4_A17C:
	LDA $18
	BMI bra4_A183
	DEC $18
	RTS
bra4_A183:
	INC PlayerAnimationFrame
sub4_A185:
loc4_A185:
	LDA PlayerAnimation
	ASL
	TAY
	LDA #$24
	STA M90_PRG2
	LDA ($E5),Y
	STA $32
	INY
	LDA ($E5),Y
	STA $33
	LDA PlayerAnimationFrame
	ASL
	ASL
	TAY
	LDA ($32),Y
	STA PlayerFramePCLow
	INY
	LDA ($32),Y
	STA $1C
	INY
	LDA ($32),Y
	BPL bra4_A1B1
	AND #$7F
	STA PlayerAnimationFrame
	JMP loc4_A185
bra4_A1B1:
	STA $18
	RTS
sub4_A1B4:
	LDY #$00
	LDA #$24
	STA M90_PRG2
	LDA (PlayerFramePCLow),Y
	AND #$3F
	STA PlayerWidth
	LDA (PlayerFramePCLow),Y
	AND #$C0
	STA PlayerSpriteAttributes
	INY
	LDA (PlayerFramePCLow),Y
	STA PlayerHeight
	INY
	LDA (PlayerFramePCLow),Y
	ASL
	TAX
	LDA #$2F
	STA M90_PRG2
	LDA $C000,X
	STA $C9
	LDA $C001,X
	STA $CA
	LDA #$24
	STA M90_PRG2
	LDA PlayerMovement
	AND #$F0
	EOR #$40
	STA $23
	LDA #$00
	STA $24
	INY
	LDA $23
	AND #$40
	BNE bra4_A208
	LDA PlayerSprXPos
	SEC
	SBC (PlayerFramePCLow),Y
	STA $1F
	LDA #$00
	SBC #$00
	STA $20
	JMP loc4_A218
bra4_A208:
	LDA (PlayerFramePCLow),Y
	SEC
	SBC #$08
	CLC
	ADC PlayerSprXPos
	STA $1F
	LDA #$00
	ADC #$00
	STA $20
loc4_A218:
	LDX #$00
	LDY PlayerHeight
	LDA tbl4_A22E,Y
	BPL bra4_A223
	LDX #$FF
bra4_A223:
	CLC
	ADC PlayerSprYPos
	STA $21
	BCC bra4_A22B
	INX
bra4_A22B:
	STX $22
	RTS
tbl4_A22E:
	.db $00
	.db $F8	;unlogged
	.db $F0
	.db $E8
	.db $E0
	.db $D8
	.db $D0	;unlogged
	.db $C8	;unlogged
	.db $C0	;unlogged
	.db $B8	;unlogged
	.db $B0	;unlogged
	.db $A8	;unlogged
	.db $A0	;unlogged
	LDA UnderwaterFlag
	BEQ bra4_A29E
	LDA $061B
	CMP #$E8
	BCC bra4_A25B
	LDA PlayerXPos
	STA BubbleXPos
	LDA #$F0
	LDX Player1YoshiStatus
	BEQ bra4_A255
	LDA #$E0
bra4_A255:
	CLC
	ADC PlayerYPos
	STA $061A
bra4_A25B:
	LDA BubbleXPos
	SEC
	SBC $52
	STA $0203
	LDA $061A
	SEC
	SBC $54
	LDX PlayerYScreen
	BEQ bra4_A275
	LDX $03
	BEQ bra4_A275
	SEC
	SBC #$10
bra4_A275:
	STA $061B
	STA SpriteMem
	LDA #$3E
	STA $0201
	LDA #$00
	STA $0202
	DEC $061A
	DEC $061A
	JSR sub4_A0B0
	LSR
	LSR
	LSR
	AND #$07
	TAX
	LDA tbl4_A0A8,X
	CLC
	ADC BubbleXPos
	STA BubbleXPos
bra4_A29E:
	LDA PlayerPowerupBuffer
	BMI bra4_A2C1_RTS
	BEQ bra4_A2AC
	LDA FrameCount
	AND #$04
	BEQ bra4_A2C2
	RTS
bra4_A2AC:
	LDA #$02
	LDY InvincibilityTimer
	BEQ bra4_A2C2
	CPY #$D0
	BCC bra4_A2BD
	CPY #$F6
	BCS bra4_A2C2
	LDA #$01
bra4_A2BD:
	AND FrameCount
	BEQ bra4_A2C2
bra4_A2C1_RTS:
	RTS
bra4_A2C2:
	LDA Player1YoshiStatus
	BEQ bra4_A2CD
	LDA PlayerSprYPos
	CMP #$E0
	BCC bra4_A2D0
bra4_A2CD:
	JMP loc4_A3CF
bra4_A2D0:
	LDA PlayerPowerup
	ASL
	TAX
	LDA tbl4_A5E7,X
	STA $38
	LDA tbl4_A5E8,X
	STA $39
	LDX PlayerActionDup
	LDA PlayerRidingActionTable,X
	BNE bra4_A2E9
	JMP loc4_A4FC
bra4_A2E9:
	CMP #$01
	BNE bra4_A2F0
	JMP loc4_A50E
bra4_A2F0:
	CMP #$02
	BNE bra4_A2F7
	JMP loc4_A523
bra4_A2F7:
	LDY #$08
loc4_A2F9:
	LDA ($38),Y
	STA $03C7
	TYA
	PHA
	LDA PlayerPowerup
	ASL
	TAY
	LDA tbl4_A60C,Y
	STA $34
	LDA tbl4_A60D,Y
	STA $35
	PLA
	PHA
	ASL
	TAY
	LDA ($34),Y
	STA $32
	INY
	LDA ($34),Y
	STA $33
	LDA #$00
	STA $2E
	PLA
	TAY
	LDA PlayerSprYPos
	SEC
	SBC PlayerRidingSpriteOffset,Y
	LDX PlayerActionDup
	CLC
	ADC tbl4_A59B,X
	LDX PlayerPowerup
	BNE bra4_A336
	SEC
	SBC #$03
bra4_A336:
	STA PlayerMetaspriteVAlign
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra4_A361
	LDA PlayerSprXPos
	CLC
	ADC tbl4_A5D5,Y
	STA PlayerMetaspriteHAlign
loc4_A348:
	LDA $2E
	CLC
	ADC #$10
	TAY
	LDX $3C
	LDA ($32),Y
	CMP #$FF
	BEQ bra4_A3BC
	AND #$3F
	STA $0201,X
	PHA
	LDA #$40
	JMP loc4_A37B
bra4_A361:
	LDA PlayerSprXPos
	CLC
	ADC tbl4_A5DE,Y
	STA PlayerMetaspriteHAlign
bra4_A369:
	LDY $2E
	LDX $3C
	LDA ($32),Y
	CMP #$FF
	BEQ bra4_A3BC
	AND #$3F
	STA $0201,X
	PHA
	LDA #$00
loc4_A37B:
	STA $38
	LDA $03C7
	ASL
	TAY
	LDA #$2F
	STA M90_PRG2
	LDA $C000,Y
	STA $34
	LDA $C001,Y
	STA $35
	PLA
	TAY
	LDA ($34),Y
	ORA $38
	ORA $06E0
	STA $0202,X
	LDA #$24
	STA M90_PRG2
	LDY $2E
	LDA PlayerMetaspriteHAlign
	CLC
	ADC PlayerRidingTileHorizPos,Y
	STA $0203,X
	LDA PlayerMetaspriteVAlign
	CLC
	ADC PlayerRidingTileVertPos,Y
	STA SpriteMem,X
	TXA
	CLC
	ADC #$04
	STA $3C
bra4_A3BC:
	INC $2E
	LDA $2E
	CMP #$10
	BCS bra4_A3CF
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra4_A369
	JMP loc4_A348
bra4_A3CF:
loc4_A3CF:
	LDA $23
	AND #$40
	BEQ bra4_A3F5
	LDA $1F
	LDX #$00
	BEQ bra4_A3E2
bra4_A3DB:
	SEC
	SBC #$08
	BCS bra4_A3E2
	DEC $20
bra4_A3E2:
	LDY $20
	BEQ bra4_A3EC
	LDY #$FF
	STY $41,X
	BMI bra4_A3EE
bra4_A3EC:
	STA $41,X
bra4_A3EE:
	INX
	CPX PlayerWidth
	BCC bra4_A3DB
	BCS bra4_A413
bra4_A3F5:
	LDA $1F
	LDX #$00
	BEQ bra4_A402
bra4_A3FB:
	CLC
	ADC #$08
	BCC bra4_A402
	INC $20
bra4_A402:
	LDY $20
	BEQ bra4_A40C
	LDY #$FF
	STY $41,X
	BMI bra4_A40E
bra4_A40C:
	STA $41,X
bra4_A40E:
	INX
	CPX PlayerWidth
	BCC bra4_A3FB
bra4_A413:
	LDA $21
	LDX #$00
	BEQ bra4_A422
bra4_A419:
	CLC
	ADC #$08
	STA PlayerMetaspriteVAlign
	BCC bra4_A422
	INC $22
bra4_A422:
	LDY $22
	BEQ bra4_A42C
	LDY #$FF
	STY $B2,X
	BMI bra4_A438
bra4_A42C:
	STA PlayerMetaspriteVAlign
	CMP #$C0
	BCC bra4_A434
	LDA #$00
bra4_A434:
	STA $B2,X
	LDA PlayerMetaspriteVAlign
bra4_A438:
	INX
	CPX PlayerHeight
	BCC bra4_A419
	LDA #$04
	STA $40
	LDA #$00
	STA $3E
	STA $3F
	TAX
bra4_A448:
	LDA $B2,X
	CMP #$FF
	BNE bra4_A458
	LDA $40
	CLC
	ADC PlayerWidth
	STA $40
	JMP loc4_A4B2
bra4_A458:
	STA PlayerMetaspriteVAlign
	LDA #$00
	STA $3E
	TAX
bra4_A45F:
	LDA $41,X
	CMP #$FF
	BEQ bra4_A4A8
	STA PlayerMetaspriteHAlign
	LDX $3C
	LDY $40
	LDA #$24
	STA M90_PRG2
	LDA (PlayerFramePCLow),Y
	CMP #$FF
	BEQ bra4_A4A8
	ORA $24
	AND #$3F
	LDY Player1YoshiStatus
	BEQ bra4_A481
	ORA #$40
bra4_A481:
	STA $0201,X
	AND #$3F
	TAY
	LDA #$2F
	STA M90_PRG2
	LDA ($C9),Y
	ORA $23
	EOR PlayerSpriteAttributes
	ORA $06E0
	STA $0202,X
	LDA PlayerMetaspriteHAlign
	STA $0203,X
	LDA PlayerMetaspriteVAlign
	STA SpriteMem,X
	TXA
	CLC
	ADC #$04
	STA $3C
bra4_A4A8:
	INC $40
	INC $3E
	LDX $3E
	CPX PlayerWidth
	BCC bra4_A45F
loc4_A4B2:
	INC $3F
	LDX $3F
	CPX PlayerHeight
	BCC bra4_A448
	LDY #$02
	LDA #$24
	STA M90_PRG2
	LDA (PlayerFramePCLow),Y
	LDY Player1YoshiStatus
	BEQ bra4_A4CA
	LDY #$01
bra4_A4CA:
	STA $03C7,Y
	RTS
sub4_A4CE:
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAX
	LDA tbl4_A4DE,X
	STA MusicRegister
	RTS
tbl4_A4DE:
	.db $29
	.db $28
	.db $20
	.db $2C
	.db $29
	.db $28
	.db $2B
	.db $2C
	.db $2A
	.db $2D
	.db $2B
	.db $2C
	.db $29
	.db $28
	.db $20
	.db $2C
	.db $29
	.db $2B
	.db $2D
	.db $2C
	.db $29
	.db $2B
	.db $28
	.db $2C
	.db $29
	.db $28
	.db $2B
	.db $2C
	.db $29
	.db $60
loc4_A4FC:
	LDY #$00
	LDA PlayerYSpeed
	BNE bra4_A50B
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_A50B
	LDY #$06
bra4_A50B:
	JMP loc4_A2F9
loc4_A50E:
	LDA #$00
	STA $0629
	LDA $062B
	AND #$08
	BEQ bra4_A51E
	LDY #$00
	BEQ bra4_A520
bra4_A51E:
	LDY #$01
bra4_A520:
	JMP loc4_A2F9
loc4_A523:
	LDA Player1YoshiStatus
	CMP #$02
	BCC bra4_A537
	LDY #$00
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_A555
	LDY #$07
	BNE bra4_A555
bra4_A537:
	LDY $0629
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_A547
	LDX tbl4_A571,Y
	JMP loc4_A54A
bra4_A547:
	LDX tbl4_A558,Y
loc4_A54A:
	BPL bra4_A553
	LDA #$00
	STA $0629
	LDX #$04
bra4_A553:
	TXA
	TAY
bra4_A555:
	JMP loc4_A2F9
tbl4_A558:
	.db $00
	.db $00
	.db $03
	.db $03
	.db $03
	.db $03
	.db $02
	.db $02
	.db $02
	.db $02
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $80
tbl4_A571:
	.db $04
	.db $04
	.db $05
	.db $05
	.db $05
	.db $05
	.db $02
	.db $02
	.db $02
	.db $02
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $80
PlayerRidingActionTable:	;im bad at naming these but basically it maps an animation to each action when you ride yosh
	.db $00	;standing still
	.db $01	;walking
	.db $01	;running
	.db $01	;unused
	.db $00	;jump
	.db $02	;spinning (unused)
	.db $02	;unused
	.db $00	;ducking
	.db $00	;looking up (unused)
	.db $00	;running jump
	.db $00	;falling
	.db $00	;falling (underwater)
	.db $00	;swimming
	.db $02	;yoshi tongue out
	.db $02	;yoshi tongue out (while moving)
	.db $00	;flying
	.db $03	;victory pose
tbl4_A59B:
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $05
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
PlayerRidingTileHorizPos:
	.db $00, $08, $10, $18	;1st row
	.db $00, $08, $10, $18	;2nd row
	.db $00, $08, $10, $18	;3rd row
	.db $00, $08, $10, $18	;4th row
PlayerRidingTileVertPos:
	.db $00, $00, $00, $00	;1st column
	.db $08, $08, $08, $08	;2nd column
	.db $10, $10, $10, $10	;3rd column
	.db $18, $18, $18, $18	;4th column
PlayerRidingSpriteOffset:
	.db $28, $29	;walking
	.db $24, $28, $24, $24	;pointing
	.db $2A	;ducking
	.db $25, $28	;unknown
tbl4_A5D5:
	.db $ED
	.db $ED
	.db $ED
	.db $ED
	.db $ED
	.db $ED
	.db $EF
	.db $EF
	.db $ED
tbl4_A5DE:
	.db $F3
	.db $F3
	.db $F3
	.db $F3
	.db $F3
	.db $F3
	.db $F1
	.db $F1
	.db $F3
tbl4_A5E7:
	.db $F1
tbl4_A5E8:
	.db $A5
	.db $FA
	.db $A5
	.db $03
	.db $A6
	.db $FA
	.db $A5
	.db $FA
	.db $A5
	.db $98
	.db $98
	.db $98
	.db $99
	.db $98
	.db $99
	.db $99
	.db $99
	.db $98
	.db $8A
	.db $8A
	.db $8A
	.db $8B
	.db $8A
	.db $8B
	.db $86
	.db $86
	.db $8B
	.db $81
	.db $81
	.db $81
	.db $81
	.db $81
	.db $81
	.db $81
	.db $81
	.db $81
tbl4_A60C:
	.db $16
tbl4_A60D:
	.db $A6
	.db $C8
	.db $A6
	.db $9A
	.db $A7
	.db $6C
	.db $A8
	.db $C8
	.db $A6
	.db $28
	.db $A6
	.db $28
	.db $A6
	.db $48
	.db $A6
	.db $68
	.db $A6
	.db $28
	.db $A6
	.db $68
	.db $A6
	.db $88
	.db $A6
	.db $88
	.db $A6
	.db $A8
	.db $A6
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $01
	.db $02
	.db $FF
	.db $FF
	.db $03
	.db $04
	.db $FF
	.db $FF
	.db $05
	.db $06
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $02
	.db $01
	.db $FF
	.db $FF
	.db $04
	.db $03
	.db $FF
	.db $FF
	.db $06
	.db $05
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $07
	.db $08
	.db $FF
	.db $FF
	.db $09
	.db $0A
	.db $FF
	.db $FF
	.db $0B
	.db $0C
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $08
	.db $07
	.db $FF
	.db $FF
	.db $0A
	.db $09
	.db $FF
	.db $FF
	.db $0C
	.db $0B
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $64
	.db $65
	.db $FF
	.db $FF
	.db $66
	.db $67
	.db $FF
	.db $FF
	.db $54
	.db $55
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $65
	.db $64
	.db $FF
	.db $FF
	.db $67
	.db $66
	.db $FF
	.db $FF
	.db $55
	.db $54
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $44
	.db $45
	.db $FF
	.db $FF
	.db $46
	.db $47
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $45
	.db $44
	.db $FF
	.db $FF
	.db $47
	.db $46
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $0E
	.db $0D
	.db $FF
	.db $FF
	.db $15
	.db $16
	.db $FF
	.db $FF
	.db $13
	.db $14
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $0D
	.db $0E
	.db $FF
	.db $FF
	.db $16
	.db $15
	.db $FF
	.db $FF
	.db $14
	.db $13
	.db $FF
	.db $DA
	.db $A6
	.db $FA
	.db $A6
	.db $1A
	.db $A7
	.db $3A
	.db $A7
	.db $DA
	.db $A6
	.db $3A
	.db $A7
	.db $5A
	.db $A7
	.db $5A
	.db $A7
	.db $7A
	.db $A7
	.db $FF
	.db $A1
	.db $A2
	.db $FF
	.db $FF
	.db $A3
	.db $A4
	.db $FF
	.db $FF
	.db $A5
	.db $A6
	.db $FF
	.db $FF
	.db $A8
	.db $A7
	.db $FF
	.db $FF
	.db $A2
	.db $A1
	.db $FF
	.db $FF
	.db $A4
	.db $A3
	.db $FF
	.db $FF
	.db $A6
	.db $A5
	.db $FF
	.db $FF
	.db $A7
	.db $A8
	.db $FF
	.db $FF
	.db $A9
	.db $AA
	.db $FF
	.db $FF
	.db $AB
	.db $AC
	.db $FF
	.db $FF
	.db $AD
	.db $AE
	.db $FF
	.db $FF
	.db $AF
	.db $B0
	.db $FF
	.db $FF
	.db $AA
	.db $A9
	.db $FF
	.db $FF
	.db $AC
	.db $AB
	.db $FF
	.db $FF
	.db $AE
	.db $AD
	.db $FF
	.db $FF
	.db $B0
	.db $AF
	.db $FF
	.db $FF
	.db $A1
	.db $A2
	.db $FF
	.db $FF
	.db $B3
	.db $B4
	.db $FF
	.db $B9
	.db $B5
	.db $B6
	.db $FF
	.db $FF
	.db $B7
	.db $B8
	.db $FF
	.db $FF
	.db $A2
	.db $A1
	.db $FF
	.db $FF
	.db $B4
	.db $B3
	.db $FF
	.db $FF
	.db $B6
	.db $B5
	.db $B9
	.db $FF
	.db $B8
	.db $B7
	.db $FF
	.db $FF
	.db $E1
	.db $E2
	.db $FF
	.db $FF
	.db $E3
	.db $E4
	.db $FF
	.db $FF
	.db $E5
	.db $E6
	.db $FF
	.db $FF
	.db $E7
	.db $E8
	.db $FF
	.db $FF
	.db $E2
	.db $E1
	.db $FF
	.db $FF
	.db $E4
	.db $E3
	.db $FF
	.db $FF
	.db $E6
	.db $E5
	.db $FF
	.db $FF
	.db $E8
	.db $E7
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $B4
	.db $B5
	.db $FF
	.db $FF
	.db $B6
	.db $B7
	.db $FF
	.db $FF
	.db $B8
	.db $B9
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $B5
	.db $B4
	.db $FF
	.db $FF
	.db $B7
	.db $B6
	.db $FF
	.db $FF
	.db $B9
	.db $B8
	.db $FF
	.db $FF
	.db $F1
	.db $F2
	.db $FF
	.db $FF
	.db $F3
	.db $F4
	.db $FF
	.db $FF
	.db $F5
	.db $F6
	.db $FF
	.db $FF
	.db $F7
	.db $F8
	.db $FF
	.db $FF
	.db $F2
	.db $F1
	.db $FF
	.db $FF
	.db $F4
	.db $F3
	.db $FF
	.db $FF
	.db $F6
	.db $F5
	.db $FF
	.db $FF
	.db $F8
	.db $F7
	.db $FF
	.db $AC
	.db $A7
	.db $AC
	.db $A7
	.db $EC
	.db $A7
	.db $0C
	.db $A8
	.db $AC
	.db $A7
	.db $0C
	.db $A8
	.db $2C
	.db $A8
	.db $2C
	.db $A8
	.db $4C
	.db $A8
	.db $FF
	.db $48
	.db $49
	.db $FF
	.db $FF
	.db $4A
	.db $4B
	.db $FF
	.db $FF
	.db $4C
	.db $4D
	.db $FF
	.db $FF
	.db $4E
	.db $4F
	.db $FF
	.db $FF
	.db $49
	.db $48
	.db $FF
	.db $FF
	.db $4B
	.db $4A
	.db $FF
	.db $FF
	.db $4D
	.db $4C
	.db $FF
	.db $FF
	.db $4F
	.db $4E
	.db $FF
	.db $FF
	.db $50
	.db $51
	.db $FF
	.db $FF
	.db $52
	.db $53
	.db $FF
	.db $FF
	.db $54
	.db $55
	.db $FF
	.db $FF
	.db $56
	.db $3A
	.db $FF
	.db $FF
	.db $51
	.db $50
	.db $FF
	.db $FF
	.db $53
	.db $52
	.db $FF
	.db $FF
	.db $55
	.db $54
	.db $FF
	.db $FF
	.db $3A
	.db $56
	.db $FF
	.db $FF
	.db $48
	.db $59
	.db $FF
	.db $FF
	.db $5A
	.db $5B
	.db $FF
	.db $7F
	.db $5C
	.db $5D
	.db $FF
	.db $FF
	.db $5E
	.db $5F
	.db $FF
	.db $FF
	.db $59
	.db $48
	.db $FF
	.db $FF
	.db $5B
	.db $5A
	.db $FF
	.db $FF
	.db $5D
	.db $5C
	.db $7F
	.db $FF
	.db $5F
	.db $5E
	.db $FF
	.db $FF
	.db $60
	.db $61
	.db $FF
	.db $FF
	.db $62
	.db $63
	.db $FF
	.db $FF
	.db $64
	.db $65
	.db $FF
	.db $FF
	.db $66
	.db $67
	.db $FF
	.db $FF
	.db $61
	.db $60
	.db $FF
	.db $FF
	.db $63
	.db $62
	.db $FF
	.db $FF
	.db $65
	.db $64
	.db $FF
	.db $FF
	.db $67
	.db $66
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $78
	.db $79
	.db $FF
	.db $FF
	.db $7A
	.db $7B
	.db $FF
	.db $FF
	.db $7C
	.db $7D
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $79
	.db $78
	.db $FF
	.db $FF
	.db $7B
	.db $7A
	.db $FF
	.db $FF
	.db $7D
	.db $7C
	.db $FF
	.db $FF
	.db $70
	.db $71
	.db $FF
	.db $FF
	.db $72
	.db $73
	.db $FF
	.db $FF
	.db $74
	.db $75
	.db $FF
	.db $FF
	.db $76
	.db $77
	.db $FF
	.db $FF
	.db $71
	.db $70
	.db $FF
	.db $FF
	.db $73
	.db $72
	.db $FF
	.db $FF
	.db $75
	.db $74
	.db $FF
	.db $FF
	.db $77
	.db $76
	.db $FF
	.db $7E
	.db $A8
	.db $FA
	.db $A6
	.db $9E
	.db $A8
	.db $BE
	.db $A8
	.db $7E
	.db $A8
	.db $BE
	.db $A8
	.db $5A
	.db $A7
	.db $5A
	.db $A7
	.db $7A
	.db $A7
	.db $FF
	.db $A1
	.db $A2
	.db $FF
	.db $FF
	.db $A3
	.db $A4
	.db $FF
	.db $FF
	.db $A5
	.db $80
	.db $B1
	.db $FF
	.db $A8
	.db $BF
	.db $B2
	.db $FF
	.db $A2
	.db $A1
	.db $FF
	.db $FF
	.db $A4
	.db $A3
	.db $FF
	.db $B1
	.db $80
	.db $A5
	.db $FF
	.db $B2
	.db $BF
	.db $A8
	.db $FF
	.db $FF
	.db $A1
	.db $A2
	.db $FF
	.db $FF
	.db $B3
	.db $B4
	.db $FF
	.db $B9
	.db $B5
	.db $80
	.db $B1
	.db $FF
	.db $B7
	.db $BF
	.db $B2
	.db $FF
	.db $A2
	.db $A1
	.db $FF
	.db $FF
	.db $B4
	.db $B3
	.db $FF
	.db $B1
	.db $80
	.db $B5
	.db $B9
	.db $B2
	.db $BF
	.db $B7
	.db $FF
	.db $FF
	.db $E1
	.db $E2
	.db $FF
	.db $FF
	.db $E3
	.db $E4
	.db $FF
	.db $FF
	.db $E5
	.db $F9
	.db $FB
	.db $FF
	.db $E7
	.db $FA
	.db $FC
	.db $FF
	.db $E2
	.db $E1
	.db $FF
	.db $FF
	.db $E4
	.db $E3
	.db $FF
	.db $FB
	.db $F9
	.db $E5
	.db $FF
	.db $FC
	.db $FA
	.db $E7
	.db $FF
	LDA PlayerPowerup
	CMP #$03
	BCS bra4_A8E6
	RTS
bra4_A8E6:
	LDA PlayerPowerupBuffer
	BMI bra4_A909_RTS
	BEQ bra4_A8F4
	LDA FrameCount
	AND #$04
	BEQ bra4_A90A
	RTS
bra4_A8F4:
	LDA #$02
	LDY InvincibilityTimer
	BEQ bra4_A90A
	CPY #$D0
	BCC bra4_A905
	CPY #$F6
	BCS bra4_A90A
	LDA #$01
bra4_A905:
	AND FrameCount
	BEQ bra4_A90A
bra4_A909_RTS:
	RTS
bra4_A90A:
	LDA PlayerSprYPos
	CMP #$E0
	BCS bra4_A93D_RTS
	LDY #$04
	LDX PlayerActionDup
	LDA Player1YoshiStatus
	CMP #$01
	BCC bra4_A929
	LDA PlayerXSpeed
	BNE bra4_A923
	LDA PlayerYSpeed
	BEQ bra4_A929
bra4_A923:
	LDA tbl4_ABE1,X
	JMP loc4_A92C
bra4_A929:
	LDA tbl4_ABD0,X
loc4_A92C:
	STA $34
	BMI bra4_A936
	STY PlayerPowerup
	JSR sub4_A14A
bra4_A936:
	LDY PlayerPowerup
	CPY #$04
	BEQ bra4_A93E
bra4_A93D_RTS:
	RTS
bra4_A93E:
	LDA $34
	AND #$0F
	BNE bra4_A947
	JMP loc4_AB16
bra4_A947:
	CMP #$01
	BNE bra4_A94E
	JMP loc4_AB3C
bra4_A94E:
	CMP #$02
	BNE bra4_A955
	JMP loc4_AB70
bra4_A955:
	CMP #$03
	BNE bra4_A95C
	JMP loc4_AB82
bra4_A95C:
	CMP #$04
	BNE bra4_A963
	JMP loc4_ABB0
bra4_A963:
	LDY $0627
	LDA tbl4_AB60,Y
	JMP loc4_AB42
loc4_A96C:
	LDX Player1YoshiStatus
	BEQ bra4_A974
	JMP loc4_AA45
bra4_A974:
	PHA
	LDA PlayerPowerup
	ASL
	TAY
	LDA tbl4_AC41,Y
	STA $34
	LDA tbl4_AC42,Y
	STA $35
	PLA
	PHA
	ASL
	TAY
	LDA ($34),Y
	STA $32
	INY
	LDA ($34),Y
	STA $33
	LDA #$00
	STA $2E
	PLA
	TAY
	LDA PlayerSprYPos
	SEC
	SBC tbl4_AC0B,Y
	LDX PlayerActionDup
	CLC
	ADC tbl4_ABF2,X
	LDX PlayerPowerup
	BNE bra4_A9AB
	SEC	;unlogged
	SBC #$03	;unlogged
bra4_A9AB:
	STA PlayerMetaspriteVAlign
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra4_A9D6
	LDA PlayerSprXPos
	CLC
	ADC tbl4_AC1D,Y
	STA PlayerMetaspriteHAlign
loc4_A9BD:
	LDA $2E
	CLC
	ADC #$04
	TAY
	LDX $3C
	LDA ($32),Y
	CMP #$FF
	BEQ bra4_AA31
	AND #$3F
	STA $0201,X
	PHA
	LDA #$40
	JMP loc4_A9F0
bra4_A9D6:
	LDA PlayerSprXPos
	CLC
	ADC tbl4_AC26,Y
	STA PlayerMetaspriteHAlign
bra4_A9DE:
	LDY $2E
	LDX $3C
	LDA ($32),Y
	CMP #$FF
	BEQ bra4_AA31
	AND #$3F
	STA $0201,X
	PHA
	LDA #$00
loc4_A9F0:
	STA $38
	LDA $03C7
	ASL
	TAY
	LDA #$2F
	STA M90_PRG2
	LDA $C000,Y
	STA $34
	LDA $C001,Y
	STA $35
	PLA
	TAY
	LDA ($34),Y
	ORA $38
	ORA $06E0
	STA $0202,X
	LDA #$24
	STA M90_PRG2
	LDY $2E
	LDA PlayerMetaspriteHAlign
	CLC
	ADC tbl4_AC03,Y
	STA $0203,X
	LDA PlayerMetaspriteVAlign
	CLC
	ADC tbl4_AC07,Y
	STA SpriteMem,X
	TXA
	CLC
	ADC #$04
	STA $3C
bra4_AA31:
	INC $2E
	LDA $2E
	CMP #$04
	BCS bra4_AA44_RTS
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra4_A9DE
	JMP loc4_A9BD
bra4_AA44_RTS:
	RTS
loc4_AA45:
	PHA
	LDA PlayerPowerup
	ASL
	TAY
	LDA tbl4_AC41,Y
	STA $34
	LDA tbl4_AC42,Y
	STA $35
	PLA
	PHA
	ASL
	TAY
	LDA ($34),Y
	STA $32
	INY
	LDA ($34),Y
	STA $33
	LDA #$00
	STA $2E
	PLA
	TAY
	LDA PlayerSprYPos
	SEC
	SBC tbl4_AC14,Y
	LDX PlayerActionDup
	CLC
	ADC tbl4_ABF2,X
	LDX PlayerPowerup
	BNE bra4_AA7C
	SEC	;unlogged
	SBC #$03	;unlogged
bra4_AA7C:
	STA PlayerMetaspriteVAlign
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra4_AAA7
	LDA PlayerSprXPos
	CLC
	ADC tbl4_AC2F,Y
	STA PlayerMetaspriteHAlign
loc4_AA8E:
	LDA $2E
	CLC
	ADC #$04
	TAY
	LDX $3C
	LDA ($32),Y
	CMP #$FF
	BEQ bra4_AB02
	AND #$3F
	STA $0201,X
	PHA
	LDA #$40
	JMP loc4_AAC1
bra4_AAA7:
	LDA PlayerSprXPos
	CLC
	ADC tbl4_AC38,Y
	STA PlayerMetaspriteHAlign
bra4_AAAF:
	LDY $2E
	LDX $3C
	LDA ($32),Y
	CMP #$FF
	BEQ bra4_AB02
	AND #$3F
	STA $0201,X
	PHA
	LDA #$00
loc4_AAC1:
	STA $38
	LDA $03C7
	ASL
	TAY
	LDA #$2F
	STA M90_PRG2
	LDA $C000,Y
	STA $34
	LDA $C001,Y
	STA $35
	PLA
	TAY
	LDA ($34),Y
	ORA $38
	ORA $06E0
	STA $0202,X
	LDA #$24
	STA M90_PRG2
	LDY $2E
	LDA PlayerMetaspriteHAlign
	CLC
	ADC tbl4_AC03,Y
	STA $0203,X
	LDA PlayerMetaspriteVAlign
	CLC
	ADC tbl4_AC07,Y
	STA SpriteMem,X
	TXA
	CLC
	ADC #$04
	STA $3C
bra4_AB02:
	INC $2E
	LDA $2E
	CMP #$04
	BCS bra4_AB15_RTS
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra4_AAAF
	JMP loc4_AA8E
bra4_AB15_RTS:
	RTS
loc4_AB16:
	LDY $0627
	LDA tbl4_AB30,Y
	BPL bra4_AB2D
	LDA #$00
	STA $0627
	LDA #$03
	STA PlayerPowerup
	JSR sub4_A14A
	LDA #$08
bra4_AB2D:
	JMP loc4_A96C
tbl4_AB30:
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $08
	.db $08
	.db $08
	.db $08
	.db $80
loc4_AB3C:
	LDY $0627
	LDA tbl4_AB55,Y
loc4_AB42:
	BPL bra4_AB52
	LDA #$00
	STA $0627
	LDA PlayerXSpeed
	BNE bra4_AB50
	STA $0628
bra4_AB50:
	LDA #$00
bra4_AB52:
	JMP loc4_A96C
tbl4_AB55:
	.db $08
	.db $08
	.db $07
	.db $07
	.db $01
	.db $01
	.db $02
	.db $02
	.db $00
	.db $00
	.db $80
tbl4_AB60:
	.db $08
	.db $08
	.db $08
	.db $07
	.db $07
	.db $07
	.db $01
	.db $01
	.db $01
	.db $02
	.db $02
	.db $02
	.db $00
	.db $00
	.db $00
	.db $80
loc4_AB70:
	LDA #$00
	STA $0627
	LDA #$03
	STA PlayerPowerup
	JSR sub4_A14A
	LDA #$00
	JMP loc4_A96C
loc4_AB82:
	LDY $0627
	LDA PlayerMovement
	AND #$04
	BEQ bra4_AB8E
	JMP loc4_AB3C
bra4_AB8E:
	LDA tbl4_ABA6,Y
	BPL bra4_ABA3
	LDA #$00
	STA $0627
	LDA PlayerYSpeed
	BNE bra4_ABA1
	LDA #$01
	STA $0628
bra4_ABA1:
	LDA #$03
bra4_ABA3:
	JMP loc4_A96C
tbl4_ABA6:
	.db $04
	.db $04
	.db $04
	.db $05
	.db $05
	.db $05
	.db $03
	.db $03
	.db $03
	.db $80
loc4_ABB0:
	LDA #$00
	STA $0627
	LDY #$02
	LDA $062B
	AND #$01
	BNE bra4_ABC0
	LDY #$07
bra4_ABC0:
	LDA PlayerYSpeed
	BEQ bra4_ABCC
	LDA PlayerMovement
	AND #$04
	BNE bra4_ABCC
	LDY #$06
bra4_ABCC:
	TYA
	JMP loc4_A96C
tbl4_ABD0:
	.db $80
	.db $05
	.db $01
	.db $01
	.db $03
	.db $04
	.db $80
	.db $80
	.db $80
	.db $01
	.db $03
	.db $03
	.db $01
	.db $82
	.db $82
	.db $01
	.db $80
tbl4_ABE1:
	.db $80
	.db $05
	.db $01
	.db $01
	.db $03
	.db $04
	.db $01
	.db $80
	.db $80
	.db $01
	.db $03
	.db $03
	.db $01
	.db $01
	.db $01
	.db $01
	.db $80
tbl4_ABF2:
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $06
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
tbl4_AC03:
	.db $00
	.db $08
	.db $00
	.db $08
tbl4_AC07:
	.db $00
	.db $00
	.db $08
	.db $08
tbl4_AC0B:
	.db $11
	.db $19
	.db $11
	.db $1E
	.db $1E
	.db $1E
	.db $1E
	.db $19
	.db $17
tbl4_AC14:
	.db $1B
	.db $23
	.db $1B
	.db $29
	.db $29
	.db $29
	.db $29
	.db $23
	.db $21
tbl4_AC1D:
	.db $EE
	.db $EE
	.db $EE
	.db $EF
	.db $EF
	.db $EF
	.db $EF
	.db $EE
	.db $EE
tbl4_AC26:
	.db $02
	.db $02
	.db $02
	.db $01
	.db $01
	.db $01
	.db $01
	.db $02
	.db $02
tbl4_AC2F:
	.db $EA
	.db $EA
	.db $EA
	.db $ED
	.db $ED
	.db $ED
	.db $ED
	.db $EA
	.db $EA
tbl4_AC38:
	.db $06
	.db $06
	.db $06
	.db $03
	.db $03
	.db $03
	.db $03
	.db $06
	.db $06
tbl4_AC41:
	.db $4B
tbl4_AC42:
	.db $AC
	.db $4B
	.db $AC
	.db $4B
	.db $AC
	.db $4B
	.db $AC
	.db $4B
	.db $AC
	.db $5D
	.db $AC
	.db $65
	.db $AC
	.db $6D
	.db $AC
	.db $75
	.db $AC
	.db $7D
	.db $AC
	.db $85
	.db $AC
	.db $8D
	.db $AC
	.db $95
	.db $AC
	.db $9D
	.db $AC
	.db $01
	.db $02
	.db $03
	.db $04
	.db $02
	.db $01
	.db $04
	.db $03
	.db $05
	.db $06
	.db $07
	.db $08
	.db $06
	.db $05
	.db $08
	.db $07
	.db $0B
	.db $0C
	.db $FF
	.db $FF
	.db $0C
	.db $0B
	.db $FF
	.db $FF
	.db $0D
	.db $0E
	.db $0F
	.db $10
	.db $0E
	.db $0D
	.db $10
	.db $0F
	.db $11
	.db $12
	.db $13
	.db $14
	.db $12
	.db $11
	.db $14
	.db $13
	.db $15
	.db $16
	.db $17
	.db $18
	.db $16
	.db $15
	.db $18
	.db $17
	.db $19
	.db $1A
	.db $1B
	.db $1C
	.db $1A
	.db $19
	.db $1C
	.db $1B
	.db $FF
	.db $1D
	.db $09
	.db $0A
	.db $1D
	.db $FF
	.db $0A
	.db $09
	.db $20
	.db $FF
	.db $1E
	.db $1F
	.db $FF
	.db $20
	.db $1F
	.db $1E
jmp_57_ACA5:
	LDA PlayerState
	CMP #$09
	BCS bra4_ACCF
	RTS
	LDA FreezeFlag
	BEQ bra4_ACBE
	LDA PlayerMovement
	AND #$04
	BNE bra4_ACBD_RTS
	LDA #$00
	STA PlayerAction
	STA PlayerAnimationFrame
bra4_ACBD_RTS:
	RTS
bra4_ACBE:
	JSR sub4_AD27
	JSR ItemBoxLogicSub
	JSR sub4_AD8C
	JSR sub4_ADB3
	JSR sub4_B0BC
	LDA PlayerState
bra4_ACCF:
	ASL
	TAY
	LDA tbl4_ACDE,Y
	STA $32
	LDA tbl4_ACDF,Y
	STA $33
	JMP ($32)
tbl4_ACDE:
	.db $4F
tbl4_ACDF:
	.db $AE
	.db $4F
	.db $AE
	.db $4F
	.db $AE
	.db $7C
	.db $B6
	.db $7C
	.db $B5
	.db $24
	.db $B7
	.db $DE
	.db $B8
	.db $DE
	.db $B8
	.db $0C
	.db $B9
	.db $24
	.db $B7
	.db $6A
	.db $B7
	.db $82
	.db $B7
	.db $94
	.db $B7
	.db $B5
	.db $B7
	.db $CD
	.db $B7
	.db $DF
	.db $B7
	.db $F7
	.db $B7
	.db $0F
	.db $B8
	.db $21
	.db $B8
	LDA PlayerPowerupBuffer
	BEQ bra4_AD1E
	INC PlayerPowerupBuffer
	LDA PlayerPowerupBuffer
	AND #$7F
	CMP #$20
	BCC bra4_AD1D_RTS
	LDA #$00
	STA PlayerPowerupBuffer
	JSR sub4_A14A
bra4_AD1D_RTS:
	RTS
bra4_AD1E:
	LDA #$02
	STA Event
	LDA #$00
	STA LevelTransitionFlag
	RTS
sub4_AD27:
	LDA DataBank2
	CMP #$26
	BEQ bra4_AD8B_RTS
	LDA WorldNumber
	CMP #$07
	BCC bra4_AD3E
	LDA #$00
	STA $036E
	STA $036F
	RTS
bra4_AD3E:
	LDA $0616
	CMP #$3B
	BCS bra4_AD49
	INC $0616
	RTS
bra4_AD49:
	LDA #$00
	STA $0616
	LDA $036E
	SEC
	SBC #$01
	STA $036E
	LDA $036F
	SBC #$00
	STA $036F
	BNE bra4_AD8B_RTS
	LDA $036E
	BNE bra4_AD8B_RTS
	STA PlayerPowerup
	LDA #$01
	STA $0398
	LDA Player1YoshiStatus
	BEQ bra4_AD76
	JSR sub4_B48B	;unlogged
bra4_AD76:
	LDA #$00
	STA LevelTransitionFlag
	STA PlayerState
	STA $06DC
	STA $06DD
	LDA #$04
	STA Event
	JSR sub4_A14A
	PLA
	PLA
bra4_AD8B_RTS:
	RTS
sub4_AD8C:
	LDA PlayerState
	CMP #$05
	BCS bra4_ADB4_RTS
	LDA UnderwaterFlag
	BEQ bra4_AD9F
	LDA PlayerState
	BNE bra4_ADB4_RTS
	LDX #$01
	BNE bra4_ADB0
bra4_AD9F:
			LDA PlayerState
			CMP #$03
			BEQ bra4_ADB4_RTS
			LDX #$00
			LDA PlayerPowerup	;
			CMP #$03			;if the player doesn't have a cape,
			BCC bra4_ADB0		;branch
			LDX #$04			;set cape state
bra4_ADB0:	STX $E1				;
bra4_ADB4_RTS:
	RTS
sub4_ADB3:
	LDA Player1YoshiStatus	;if player doesn't have a yoshi,
	BEQ bra4_ADE2			;branch
	LDA HurtFlag			;make sure hurt flag is set, if not,
	BEQ bra4_ADE2			;branch
	LDA #$00				;
	STA HurtFlag			;clear hurt flag
	LDA #$40				;
	STA PlayerYSpeed		;set player's y speed to $40
	LDA PlayerMovement		;
	ORA #$04				;
	STA PlayerMovement		;does OR operation to player's movement, effectively adding 4 to it
	LDA #sfxPowerDown		;
	STA SFXRegister			;play powerdown/hurt sound
	LDA #$03
	STA PlayerAction
	LDA #$00
	STA PlayerState
	JSR sub4_B48B
	LDA #$04
	STA YoshiXScreen
	STA $50
bra4_ADE2:
	LDA PlayerCarryFlag		;
	CMP PlayerCarryFlag2	;if the player's carry flag is equal to its duplicate,
	BEQ bra4_ADF0			;branch
	STA PlayerCarryFlag2	;if not, make it equal
	JSR sub4_A14A
bra4_ADF0:
	LDY InvincibilityTimer
	BEQ bra4_AE14_RTS
	LDA FrameCount
	AND #$03
	BNE bra4_AE14_RTS
	CPY #$01				;if 1 frame hasn't passed,
	BNE bra4_AE03			;branch
	LDX #musValleyofBowser	;if it has, continue
	STX MusicRegister		;play valley of bowser/starman theme
bra4_AE03:
	CPY #$F8
	BCC bra4_AE0F
	JSR sub4_A4CE
	LDA #$FF
	STA InvincibilityTimer
bra4_AE0F:
	INC InvincibilityTimer
bra4_AE14_RTS:
	RTS
ItemBoxLogicSub:
			LDA ButtonsPressed	;
			AND #buttonSelect	;branch if not pressed
			BEQ bra4_AE4A_RTS	;continue if not
			LDA #$07			;
			STA Event			;set to event 7 (using lesser powerup from item box)
			LDY PlayerPowerup	;load player's powerup into the y register
			CPY #$04			;if player's cape isn't moving,
			BNE bra4_AE27		;branch
			LDY #$03			;load feather item to y register
bra4_AE27:	LDX ItemBox			;load item box contents into x register
			BEQ bra4_AE4A_RTS	;if item box is empty, branch
			CPX #$02			;if there's a fire flower/feather in it,
			BCS bra4_AE34		;branch
			CPY #$00			;if its not empty,
			BNE bra4_AE45		;branch
bra4_AE34:	STY ItemBox			;stores the powerup in the y register in the item box
			LDA #$01
			STX PlayerPowerup	;use item box contents stored in the x register
			CPX #$03			;if the player doesn't have a cape,
			BNE bra4_AE42		;branch
			LDA #$81
bra4_AE42:	STA PlayerPowerupBuffer
bra4_AE45:	LDA ItemBoxSFX,X	;
			STA SFXRegister		;play corresponding sound effect for item
bra4_AE4A_RTS:
	RTS
ItemBoxSFX:
	.db $00			;empty
	.db sfxPowerup	;mushroom
	.db sfxPowerup	;flower
	.db sfxFeather	;feather

	LDA PlayerPowerup	;
	CMP #$03			;if the player doesn't have a cape,
	BCC bra4_AE59		;branch
	JSR SpinCapeRoutine	;jump
bra4_AE59:
	LDA PlayerActionDup
	ASL
	TAY
	LDA tbl4_AE6A,Y
	STA $32
	LDA tbl4_AE6B,Y
	STA $33
	JMP ($32)
tbl4_AE6A:	.db $92
tbl4_AE6B:	.db $AE
			.db $E5
			.db $AE
			.db $06
			.db $AF
			.db $E5
			.db $AE
			.db $33
			.db $AF
			.db $6A
			.db $AF
			.db $92
			.db $AE
			.db $BB
			.db $AE
			.db $92
			.db $AE
			.db $33
			.db $AF
			.db $33
			.db $AF
			.db $A2
			.db $B0
			.db $A2
			.db $B0
			.db $06
			.db $AF
			.db $33
			.db $AF
			.db $33
			.db $AF
			.db $33
			.db $AF
			.db $86
			.db $AF
			.db $A2
			.db $B0
			.db $92
			.db $AF
	LDA PlayerYSpeed
	BNE bra4_AEB0
	LDA PlayerMovement
	AND #$04
	BNE bra4_AEAF_RTS
	LDA ButtonsHeld
	BNE bra4_AEA3
	STA PlayerAction
bra4_AEA3:
	JSR sub4_B565
	JSR sub4_B34F
	JSR sub4_B3DF
	JSR ShootFireball
bra4_AEAF_RTS:
	RTS
bra4_AEB0:
	LDA PlayerMovement	;
	AND #$04			;if player is still jumping,
	BNE bra4_AEAF_RTS	;branch
	LDA #$0A			;
	STA PlayerAction	;set action to falling
	RTS

	LDA PlayerYSpeed	;if player's y speed isn't 0,
	BNE bra4_AEDA		;branch
	LDA PlayerMovement	;
	AND #$04			;if player is jumping,
	BNE bra4_AED9_RTS	;branch
	LDA ButtonsHeld		;
	AND #dirDown		;if down is pressed,
	BNE bra4_AED0		;branch
	LDA #$00			;
	STA PlayerAction	;clear action
bra4_AED0:
	JSR sub4_B565
	JSR sub4_B3DF
	JSR ShootFireball
bra4_AED9_RTS:
	RTS
bra4_AEDA:
	LDA PlayerMovement
	AND #$04
	BNE bra4_AED9_RTS
	LDA #$0A
	STA PlayerAction
	RTS
	JSR sub4_AF1F
	LDA PlayerXSpeed
	BNE bra4_AEEE
	STA PlayerAction
bra4_AEEE:
	JSR sub4_B34F
	JSR sub4_B509
	JSR sub4_B3DF
	JSR ShootFireball
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_AF05_RTS
	LDA #$07
	STA PlayerAction
bra4_AF05_RTS:
	RTS
	JSR sub4_AF1F
	LDA PlayerXSpeed
	BNE bra4_AF0F
	STA PlayerAction
bra4_AF0F:
	JSR sub4_B34F
	JSR sub4_B509
	JSR sub4_B3DF
	JSR sub4_B4F3
	JSR ShootFireball
	RTS
sub4_AF1F:
	LDA PlayerYSpeed
	CMP #$07
	BCC bra4_AF34_RTS
	LDX #$0A
	LDA UnderwaterFlag
	BEQ bra4_AF2E
	LDX #$0B
bra4_AF2E:
	STX PlayerAction
	PLA
	PLA
bra4_AF34_RTS:
	RTS
	LDA PlayerYSpeed
	BNE bra4_AF41
	LDA PlayerMovement
	AND #$04
	BNE bra4_AF41
	LDA #$01
	STA PlayerAction
bra4_AF41:
	JSR sub4_AF55
	JSR sub4_AFC6
	JSR sub4_B3A5
	LDA PlayerState
	BEQ bra4_AF51
	JSR sub4_B3DF
bra4_AF51:
	JSR sub4_B462
	RTS
sub4_AF55:
	LDA PlayerMovement
	AND #$04
	BEQ bra4_AF69_RTS
	LDA ButtonsHeld
	AND #$80
	BEQ bra4_AF69_RTS
	LDA PlayerYSpeed
	CLC
	ADC #$01
	STA PlayerYSpeed
bra4_AF69_RTS:
	RTS
	LDA PlayerYSpeed
	BNE bra4_AF78
	LDA PlayerMovement
	AND #$04
	BNE bra4_AF78
	LDA #$01
	STA PlayerAction
bra4_AF78:
	JSR sub4_AFF1
	JSR sub4_B3A5
	LDA PlayerState
	BEQ bra4_AF85_RTS
	JSR sub4_B3DF
bra4_AF85_RTS:
	RTS
	LDX #$00
	LDY #$10
	JSR sub4_B8A2
	LDA #$04
	STA PlayerAction
	RTS
	JSR sub4_B3DF
	LDX #$00
	LDY #$08
	JSR sub4_B8A2
	LDA #$00
	STA PlayerAction
	RTS
ShootFireball:
					LDA PlayerPowerup		;
					CMP #$02				;if player doesn't have fire power,
					BNE ShootFireballDone	;stop
					LDA FireballSlot		;
					AND FireballSlot2		;if fireball slots 1 and 2 are full,
					BNE ShootFireballDone	;stop
					LDA ButtonsHeld			;
					AND #dirDown			;make sure down is held
					BNE ShootFireballDone	;stop if it isn't
					LDA ButtonsPressed		;
					AND #buttonB			;if B is pressed,
					BEQ ShootFireballDone	;stop
					LDA #$13				;
					STA PlayerAction		;set action to shooting fireball
					JSR sub4_B00D			;jump
ShootFireballDone:	RTS

sub4_AFC6:
				LDA PlayerPowerup	;
				CMP #$02			;if player doesn't have fire power,
				BNE bra4_AFF0_RTS	;stop
				LDA FireballSlot	;
				AND FireballSlot2	;if fireball slots 1 and 2 are full,
				BNE bra4_AFF0_RTS	;stop
				LDA ButtonsHeld		;
				AND #dirDown		;make sure down is held
				BNE bra4_AFF0_RTS	;stop if it isn't
				LDA ButtonsPressed	;
				AND #buttonB		;if B is pressed,
				BEQ bra4_AFF0_RTS	;stop
				LDY #$11			;load action 11 to y reg
				LDA UnderwaterFlag	;if underwater,
				BEQ bra4_AFEB		;branch
				INY					;set loaded action to 12
bra4_AFEB:		STY PlayerAction	;store loaded action
				JSR sub4_B00D
bra4_AFF0_RTS:	RTS

sub4_AFF1:
				LDA PlayerPowerup	;
				CMP #$02			;if the player has a fire flower,
				BEQ bra4_AFF9		;branch
bra4_AFF8_RTS:	RTS
bra4_AFF9:
	LDX UsedFireballSlots
	LDA FireballSlot,X
	BNE bra4_AFF8_RTS
	LDA #$40
	CPX #$00
	BNE bra4_B008
	TXA
bra4_B008:
	STA $32
	JMP loc4_B01C
sub4_B00D:
	LDA PlayerMovement
	AND #$C0
	STA $32
	LDX UsedFireballSlots
	LDA FireballSlot,X
	BEQ bra4_B01C
	RTS
bra4_B01C:
loc4_B01C:
	INC FireballSlot,X
	LDY ObjectCount
	LDA $32
	STA ObjectState,Y
	TXA
	CLC
	ADC #$06
	STA ObjectSlot,Y
	LDA $32
	AND #$40
	BNE bra4_B042
	LDA PlayerXPosDup
	CLC
	ADC #$00
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc4_B04E
bra4_B042:
	LDA PlayerXPosDup
	SEC
	SBC #$08
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc4_B04E:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$EC
	BMI bra4_B075
	CLC	;unlogged
	ADC PlayerYPosDup	;unlogged
	STA ObjectYPos,Y	;unlogged
	BCS bra4_B066	;unlogged
	CMP #$F0	;unlogged
	BCC bra4_B08C	;unlogged
bra4_B066:
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,Y	;unlogged
	LDA ObjectYScreen,Y	;unlogged
	CLC	;unlogged
	ADC #$01	;unlogged
	JMP loc4_B089	;unlogged
bra4_B075:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra4_B08C
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc4_B089:
	STA ObjectYScreen,Y
bra4_B08C:
	LDA #$00
	STA $058C,Y
	STA $0578,Y
	STA GuidedObjStatus,Y
	INC ObjectCount
	LDA UsedFireballSlots
	EOR #$01
	STA UsedFireballSlots
	RTS
	LDA PlayerMovement
	AND #$04
	BNE bra4_B0B2
	LDX #$0B
	LDA PlayerYSpeed
	BNE bra4_B0B0
	LDX #$01
bra4_B0B0:
	STX PlayerAction
bra4_B0B2:
	JSR sub4_B37C
	JSR sub4_B3DF
	JSR sub4_AFC6
	RTS
sub4_B0BC:
	LDA Player1YoshiStatus
	BEQ bra4_B0D6_RTS
	CMP #$02
	BCS bra4_B0C8
	JMP loc4_B193
bra4_B0C8:
	CMP #$06
	BCS bra4_B0CF
	JMP loc4_B0D7
bra4_B0CF:
	CMP #$07
	BCS bra4_B0DA
	JMP loc4_B1C1
bra4_B0D6_RTS:
	RTS
loc4_B0D7:
	JSR sub4_B1DE
bra4_B0DA:
	LDA ButtonsPressed
	AND #$40
	BEQ bra4_B11D_RTS
	LDA #$00
	STA $0613
	STA $0614
	LDY #$0C
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_B0F4
	LDY #$0E
bra4_B0F4:
	LDA ButtonsHeld
	AND #$03
	BEQ bra4_B0FD
	LDY #$0D
bra4_B0FD:
	STY $E1
	LDA Player1YoshiStatus
	CMP #$07
	BCC bra4_B113
	SEC	;unlogged
	SBC #$05	;unlogged
	STA Player1YoshiStatus	;unlogged
	JSR sub4_A14A	;unlogged
	LDA #$00	;unlogged
	STA PlayerAnimationFrame	;unlogged
bra4_B113:
	LDA Player1YoshiStatus
	CMP #$04
	BNE bra4_B11E
	JSR sub4_B1F6
bra4_B11D_RTS:
	RTS
bra4_B11E:
	LDY ObjectCount
	STA ObjectSlot,Y
	LDA PlayerMovement
	AND #$40
	BNE bra4_B138
	LDA PlayerXPosDup
	CLC
	ADC #$10
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc4_B144
bra4_B138:
	LDA PlayerXPosDup
	SEC
	SBC #$20
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc4_B144:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E4
	BMI bra4_B16B
	CLC	;unlogged
	ADC PlayerYPosDup	;unlogged
	STA ObjectYPos,Y	;unlogged
	BCS bra4_B15C	;unlogged
	CMP #$F0	;unlogged
	BCC bra4_B182	;unlogged
bra4_B15C:
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,Y	;unlogged
	LDA ObjectYScreen,Y	;unlogged
	CLC	;unlogged
	ADC #$01	;unlogged
	JMP loc4_B17F	;unlogged
bra4_B16B:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra4_B182
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc4_B17F:
	STA ObjectYScreen,Y
bra4_B182:
	LDA #$00
	STA ObjectState,Y
	STA $0578,Y
	LDA $0632
	STA $058C,Y
	INC ObjectCount
	RTS
loc4_B193:
	LDA PlayerState
	CMP #$09
	BCS bra4_B1C0_RTS
	LDA ButtonsPressed
	AND #$40
	BEQ bra4_B1C0_RTS
	LDA #$19
	STA SFXRegister
	LDY #$09
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_B1AF
	LDY #$0B
bra4_B1AF:
	LDA ButtonsHeld
	AND #$03
	BEQ bra4_B1BE
	LDY #$09
	LDA PlayerYSpeed
	BNE bra4_B1BE
	LDY #$0A
bra4_B1BE:
	STY $E1
bra4_B1C0_RTS:
	RTS
loc4_B1C1:
	LDY #$0F
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_B1CC
	LDY #$11
bra4_B1CC:
	LDA ButtonsHeld
	AND #$03
	BEQ bra4_B1DB
	LDY #$0F
	LDA PlayerYSpeed
	BNE bra4_B1DB
	LDY #$10
bra4_B1DB:
	STY $E1
	RTS
sub4_B1DE:
	LDX #$1E
	LDY #$3B
	JSR sub4_B8C0
	LDA #$12
	STA PlayerState
	LDA Player1YoshiStatus
	CLC
	ADC #$05
	STA Player1YoshiStatus
	JSR sub4_A14A
	RTS
sub4_B1F6:
	LDY ObjectCount
	LDA #$08
	STA ObjectSlot,Y
	LDA #$09
	STA ObjectSlot2,Y
	LDA #$0A
	STA ObjectSlot3,Y
	LDA PlayerMovement
	STA ObjectState,Y
	STA ObjectState2,Y
	STA ObjectState3,Y
	AND #$40
	BNE bra4_B225
	LDA PlayerXPosDup
	CLC
	ADC #$08
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc4_B231
bra4_B225:
	LDA PlayerXPosDup
	SEC
	SBC #$10
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc4_B231:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E4
	BMI bra4_B258
	CLC	;unlogged
	ADC PlayerYPosDup	;unlogged
	STA ObjectYPos,Y	;unlogged
	BCS bra4_B249	;unlogged
	CMP #$F0	;unlogged
	BCC bra4_B26F	;unlogged
bra4_B249:
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,Y	;unlogged
	LDA ObjectYScreen,Y	;unlogged
	CLC	;unlogged
	ADC #$01	;unlogged
	JMP loc4_B26C	;unlogged
bra4_B258:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra4_B26F
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc4_B26C:
	STA ObjectYScreen,Y
bra4_B26F:
	LDA #$00
	STA $058C,Y
	STA GuidedObjStatus,Y
	INY
	LDA PlayerMovement
	AND #$40
	BNE bra4_B28D
	LDA PlayerXPosDup
	CLC
	ADC #$08
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc4_B299
bra4_B28D:
	LDA PlayerXPosDup
	SEC
	SBC #$10
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc4_B299:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E4
	BMI bra4_B2C0
	CLC	;unlogged
	ADC PlayerYPosDup	;unlogged
	STA ObjectYPos,Y	;unlogged
	BCS bra4_B2B1	;unlogged
	CMP #$F0	;unlogged
	BCC bra4_B2D7	;unlogged
bra4_B2B1:
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,Y	;unlogged
	LDA ObjectYScreen,Y	;unlogged
	CLC	;unlogged
	ADC #$01	;unlogged
	JMP loc4_B2D4	;unlogged
bra4_B2C0:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra4_B2D7
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc4_B2D4:
	STA ObjectYScreen,Y
bra4_B2D7:
	LDA #$00
	STA $058C,Y
	STA GuidedObjStatus,Y
	INY
	LDA PlayerMovement
	AND #$40
	BNE bra4_B2F5
	LDA PlayerXPosDup
	CLC
	ADC #$08
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc4_B301
bra4_B2F5:
	LDA PlayerXPosDup
	SEC
	SBC #$10
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc4_B301:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E4
	BMI bra4_B328
	CLC	;unlogged
	ADC PlayerYPosDup	;unlogged
	STA ObjectYPos,Y	;unlogged
	BCS bra4_B319	;unlogged
	CMP #$F0	;unlogged
	BCC bra4_B33F	;unlogged
bra4_B319:
	CLC	;unlogged
	ADC #$10	;unlogged
	STA ObjectYPos,Y	;unlogged
	LDA ObjectYScreen,Y	;unlogged
	CLC	;unlogged
	ADC #$01	;unlogged
	JMP loc4_B33C	;unlogged
bra4_B328:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra4_B33F
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc4_B33C:
	STA ObjectYScreen,Y
bra4_B33F:
	LDA #$00
	STA $058C,Y
	STA GuidedObjStatus,Y
	INY
	STY ObjectCount
	LDA #$1B
	STA SFXRegister
	RTS
sub4_B34F:
	LDA ButtonsHeld
	AND #$01
	BEQ bra4_B35D
	LDA PlayerMovement
	AND #$BE
	JMP loc4_B368
bra4_B35D:
	LDA ButtonsHeld
	AND #$02
	BEQ bra4_B37B_RTS
	LDA PlayerMovement
	ORA #$41
loc4_B368:
	STA PlayerMovement
	LDA PlayerXSpeed
	CMP #$10
	BCS bra4_B377
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra4_B377:
	LDA #$01
	STA PlayerAction
bra4_B37B_RTS:
	RTS
sub4_B37C:
	LDA ButtonsHeld
	AND #$01
	BEQ bra4_B38A
	LDA PlayerMovement
	AND #$BE
	JMP loc4_B395
bra4_B38A:
	LDA ButtonsHeld
	AND #$02
	BEQ bra4_B3A4_RTS
	LDA PlayerMovement
	ORA #$41
loc4_B395:
	STA PlayerMovement
	LDA PlayerXSpeed
	CMP #$10
	BCS bra4_B3A4_RTS
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra4_B3A4_RTS:
	RTS
sub4_B3A5:
	LDA PlayerMovement
	STA $26
	LDA ButtonsHeld
	AND #$01
	BEQ bra4_B3B7
	LDA PlayerMovement
	AND #$BE
	JMP loc4_B3C6
bra4_B3B7:
	LDA ButtonsHeld
	AND #$02
	BNE bra4_B3C2
	LDA #$01
	BNE bra4_B3D5
bra4_B3C2:
	LDA PlayerMovement
	ORA #$41
loc4_B3C6:
	STA PlayerMovement
	EOR $26
	AND #$40
	BEQ bra4_B3D3
	LDA #$00
	STA PlayerXSpeed
	RTS
bra4_B3D3:
	LDA #$03
bra4_B3D5:
	CLC
	ADC PlayerXSpeed
	CMP #$20
	BCS bra4_B3DE_RTS
	STA PlayerXSpeed
bra4_B3DE_RTS:
	RTS
sub4_B3DF:
	LDA UnderwaterFlag
	BEQ bra4_B426
	LDA PlayerCarryFlag
	BEQ bra4_B402
	LDA #$20
	STA PlayerYSpeed
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_B3FB
	LDA PlayerMovement
	AND #$FB
	STA PlayerMovement
	RTS
bra4_B3FB:
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	RTS
bra4_B402:
	LDA ButtonsPressed
	AND #$80
	BEQ bra4_B425_RTS
	LDA ButtonsHeld
	AND #$08
	BEQ bra4_B413
	JSR sub4_B48B
bra4_B413:
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA SFXRegister
	LDA #$0C
	STA PlayerAction
bra4_B425_RTS:
	RTS
bra4_B426:
	LDA ButtonsPressed
	AND #$80
	BEQ bra4_B425_RTS
	LDA PlayerYSpeed
	BNE bra4_B425_RTS
	LDA PlayerCarryFlag
	BNE bra4_B43D
	LDA ButtonsHeld
	AND #$08
	BNE bra4_B475
bra4_B43D:
	LDY #$48
	LDA ButtonsHeld
	AND #$40
	BEQ bra4_B448
	LDY #$58
bra4_B448:
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_B451
	LDY #$28
bra4_B451:
	STY PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA PlayerAction
	LDA #$03
	STA SFXRegister
	RTS
sub4_B462:
	LDA Player1YoshiStatus
	BEQ bra4_B48A_RTS
	LDA ButtonsPressed
	AND #$80
	BEQ bra4_B48A_RTS
	LDA ButtonsHeld
	AND #$08
	BEQ bra4_B48A_RTS
bra4_B475:
	JSR sub4_B48B
	LDA #$50
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$05
	STA PlayerAction
	LDA #$01
	STA SFXRegister
bra4_B48A_RTS:
	RTS
sub4_B48B:
	LDA Player1YoshiStatus
	BEQ bra4_B4F4_RTS
	LDA PlayerMovement
	STA $0622
	LDA Player1YoshiStatus
	STA $0621
	LDA #$00
	STA Player1YoshiStatus
	STA Player2YoshiStatus
	JSR sub4_A14A
	LDA #$04
	STA YoshiXScreen
	LDA PlayerYPosDup
	SEC
	SBC #$20
	STA $05F4
	LDA PlayerYScreenDup
	SBC #$00
	STA $05F5
	LDA $0622
	AND #$40
	BNE bra4_B4D2
	LDA PlayerMovement
	ORA #$01
	STA PlayerMovement
	LDA PlayerXPosDup
	SEC
	SBC #$08
	STA YoshiXPos
	JMP loc4_B4E0
bra4_B4D2:
	LDA PlayerMovement
	AND #$FE
	STA PlayerMovement
	LDA PlayerXPosDup
	SEC
	SBC #$18
	STA YoshiXPos
loc4_B4E0:
	LDA PlayerXScreenDup
	SBC #$00
	STA $05F3
	LDA #$00
	STA $05F6
	LDA #$30
	STA PlayerXSpeed
	INC ObjectCount
bra4_B4F4_RTS:
	RTS
sub4_B4F3:
	LDA PlayerAnimationFrame
	CMP #$10
	BCC bra4_B508_RTS
	LDA ButtonsPressed
	AND #$80
	BEQ bra4_B508_RTS
	LDA #$60
	STA PlayerYSpeed
	LDA #$09
	STA PlayerAction
bra4_B508_RTS:
	RTS
sub4_B509:
	LDA UnderwaterFlag
	BNE bra4_B55B_RTS
	LDA ButtonsHeld
	AND #$03
	BEQ bra4_B55C
	LDA ButtonsHeld
	AND #$40
	BNE bra4_B538
	STA $0314
	LDA PlayerXSpeed
	CMP #$10
	BCS bra4_B52C_RTS
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra4_B52C_RTS:
	RTS
	LDA $0314	;unlogged
	CMP #$30	;unlogged
	BCS bra4_B538	;unlogged
	INC $0314	;unlogged
	RTS	;unlogged
bra4_B538:
	LDA PlayerMovement
	AND #$01
	CMP $4F
	BEQ bra4_B54A
	STA $4F
	LDA #$10
	STA PlayerXSpeed
	LDA #$00
	STA PlayerAction
bra4_B54A:
	LDA #$02
	STA PlayerAction
	LDA PlayerXSpeed
	CMP #$40
	BCS bra4_B55B_RTS
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra4_B55B_RTS:
	RTS
bra4_B55C:
	LDA PlayerXSpeed
	BEQ bra4_B55B_RTS
	LDA #$01
	STA PlayerAction
	RTS
sub4_B565:
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_B570
	LDA #$07
	STA PlayerAction
bra4_B570:
	LDA ButtonsHeld
	AND #$08
	BEQ bra4_B57B_RTS
	LDA #$08
	STA PlayerAction
bra4_B57B_RTS:
	RTS
	JSR SpinCapeRoutine
	LDA PlayerActionDup	;load current animation
	ASL					;multiply it by 2
	TAY					;move it to y register
	LDA tbl4_B590,Y
	STA $32
	LDA tbl4_B591,Y
	STA $33
	JMP ($32)
tbl4_B590:
	.db $92
tbl4_B591:
	.db $AE
	.db $E5
	.db $AE
	.db $06
	.db $AF
	.db $E5
	.db $AE
	.db $33
	.db $AF
	.db $33
	.db $AF
	.db $92
	.db $AE
	.db $92
	.db $AE
	.db $92
	.db $AE
	.db $B0
	.db $B5
	.db $33
	.db $AF
	.db $A2
	.db $B0
	.db $A2
	.db $B0
	.db $06
	.db $AF
	.db $33
	.db $AF
	.db $DC
	.db $B5
	INC FlightTakeoffTimer		;increment takeoff timer
	LDA FlightTakeoffTimer		;
	CMP #$50					;if less than 80 frames have passed,
	BCC bra4_B5C4				;branch
	LDA #$00					;
	STA FlightTakeoffTimer		;clear takeoff timer
	LDA #$0F					;
	STA PlayerAction			;set action to flying
	RTS
bra4_B5C4:
	LDA PlayerYSpeed
	BNE bra4_B5D2
	LDA PlayerMovement
	AND #$04
	BNE bra4_B5D2
	LDA #$01
	STA PlayerAction
bra4_B5D2:
	JSR sub4_B37C
	JSR sub4_B616
	JSR sub4_B669
	RTS
	LDA Player1YoshiStatus
	BEQ bra4_B5E7
	JSR sub4_B37C
	JMP loc4_B5EA
bra4_B5E7:
	JSR sub4_B61B
loc4_B5EA:
	JSR sub4_B616
	LDA PlayerMovement
	AND #$04
	BNE bra4_B5FB_RTS
	LDA PlayerYSpeed
	BNE bra4_B5FB_RTS
	LDA #$01
	STA PlayerAction
bra4_B5FB_RTS:
	RTS
SpinCapeRoutine:
				LDA Player1YoshiStatus	;if riding yoshi,
				BNE bra4_B615_RTS		;branch
				LDA PlayerCarryFlag		;if carrying something,
				BNE bra4_B615_RTS		;branch
				LDA ButtonsPressed		;
				AND #buttonB			;if b not pressed,
				BEQ bra4_B615_RTS		;branch
				LDA #$08
				STA PlayerState
				LDA #sfxSpinJump
				STA SFXRegister
bra4_B615_RTS:	RTS
sub4_B616:
	LDA #$30
	STA PlayerXSpeed
	RTS
sub4_B61B:
	LDA ButtonsHeld		;
	AND #buttonB		;if b still held,
	BNE bra4_B627		;branch
	LDA #$0A		;
	STA PlayerAction;set action to falling
	RTS
bra4_B627:
	LDX #$00
	LDA PlayerMovement
	AND #$40
	BEQ bra4_B630
	INX
bra4_B630:
	TXA
	STA $32
	EOR #$01
	STA $34
	INC $32
	INC $34
	LDA PlayerMovement
	AND #$04
	BNE bra4_B653
	LDA ButtonsPressed
	AND $32
	BEQ bra4_B653
	INC PlayerYSpeed
	LDA #$50
	CMP PlayerYSpeed
	BCS bra4_B668_RTS
	STA PlayerYSpeed
	RTS
bra4_B653:
	LDA ButtonsPressed
	AND $34
	BEQ bra4_B668_RTS
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$50
	CMP PlayerYSpeed
	BCS bra4_B668_RTS
	STA PlayerYSpeed
bra4_B668_RTS:
	RTS
sub4_B669:
	LDA ButtonsHeld		;
	AND #buttonB		;if B not held,
	BEQ bra4_B67B_RTS	;branch
	LDA ButtonsHeld		;
	AND #buttonA		;if A not held,
	BEQ bra4_B67B_RTS	;branch
	LDA #$40			;
	STA PlayerYSpeed	;set Y speed to $40
bra4_B67B_RTS:
	RTS
	LDA ButtonsHeld	;
	AND #$0F		;if any direction is pressed,
	BNE bra4_B68D	;branch
	LDA #$00		;
	STA PlayerYSpeed;clear x and y speed
	STA PlayerXSpeed;
	LDA #$0D
	STA PlayerAction
bra4_B68D:
	JSR sub4_B6BF
	JSR sub4_B694
	RTS
sub4_B694:
	LDA ButtonsPressed
	AND #$80
	BEQ bra4_B6BE_RTS
	LDA ButtonsHeld
	AND #$08
	BNE bra4_B6BE_RTS
	LDA #$50
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA PlayerAction
	LDA #$03
	STA SFXRegister
	LDA #$00
	STA PlayerState
	STA $06DC
	STA $06DD
bra4_B6BE_RTS:
	RTS
sub4_B6BF:
	LDA ButtonsHeld	;
	AND #dirUp		;if up isn't held,
	BEQ bra4_B6D7	;branch
	LDA $06DD
	BEQ bra4_B6D1
	LDA #$00		;
	STA PlayerYSpeed;clear y speed
	BEQ bra4_B6D7	;branch
bra4_B6D1:
	LDA PlayerMovement
	ORA #$04
	BNE bra4_B6E7
bra4_B6D7:
	LDA ButtonsHeld	;
	AND #dirDown	;if down isn't held,
	BEQ bra4_B6EF	;branch
	LDA #$00
	STA $06DD
	LDA PlayerMovement
	AND #$7B
bra4_B6E7:
	STA PlayerMovement
	LDA #$10
	STA PlayerYSpeed
	BNE bra4_B71F
bra4_B6EF:
	LDA $06DE
	BNE bra4_B6FE
	LDA $06DC
	BEQ bra4_B6FE
	LDA #$00
	STA PlayerXSpeed
	RTS
bra4_B6FE:
	LDA ButtonsHeld	;
	AND #dirLeft	;if left isn't pressed,
	BEQ bra4_B70B	;branch
	LDA PlayerMovement
	ORA #$41
	BNE bra4_B716
bra4_B70B:
	LDA ButtonsHeld		;
	AND #dirRight		;if right isn't pressed,
	BEQ bra4_B71E_RTS	;branch
	LDA PlayerMovement
	AND #$BE
bra4_B716:
	STA PlayerMovement
	LDA #$10
	STA PlayerXSpeed
	BNE bra4_B71F
bra4_B71E_RTS:
	RTS
bra4_B71F:
	LDA #$0E
	STA PlayerAction
	RTS
	JSR sub4_B84B
	JSR SwimCheck
	LDX #$0D
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra4_B734
	LDY #$0A
bra4_B734:
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_B73D
	LDY #$07
bra4_B73D:
	LDA #$0D
	STA $32
sub4_B741:
	STX PlayerAction
	LDA PlayerAnimationFrame
	CMP $32
	BCC bra4_B769_RTS
	STY PlayerAction
	LDY #$01
	LDA Player1YoshiStatus	;
	CMP #$01				;if player 1 isn't riding yoshi,
	BNE bra4_B75C			;branch
	LDY YoshiTongueState
	LDA #$01
	STA YoshiTongueState
bra4_B75C:
	STY Player1YoshiStatus
	JSR sub4_A14A
	LDA #$00
	STA PlayerState
	STA $062E
bra4_B769_RTS:
	RTS
	JSR sub4_B84B
	JSR SwimCheck
	LDX #$0E
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra4_B77A
	LDY #$0A
bra4_B77A:
	LDA #$0D
	STA $32
	JSR sub4_B741
	RTS
	JSR sub4_B84B
	JSR SwimCheck
	LDX #$06
	LDY #$07
	LDA #$0D
	STA $32
	JSR sub4_B741
	RTS
	JSR sub4_B84B
	JSR SwimCheck
	LDX #$0D
	LDY #$00
	LDA ButtonsHeld
	AND #$04
	BEQ bra4_B7A7
	LDY #$07
bra4_B7A7:
	LDA PlayerYSpeed
	BEQ bra4_B7AD
	LDY #$0A
bra4_B7AD:
	LDA #$03
	STA $32
	JSR sub4_B741
	RTS
	JSR sub4_B84B
	JSR SwimCheck
	LDX #$0E
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra4_B7C5
	LDY #$0A
bra4_B7C5:
	LDA #$04
	STA $32
	JSR sub4_B741
	RTS
	JSR sub4_B84B
	JSR SwimCheck
	LDX #$06
	LDY #$07
	LDA #$01
	STA $32
	JSR sub4_B741
	RTS
	JSR sub4_B37C
	JSR SwimCheck
	LDX #$0D
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra4_B7EF
	LDY #$0A
bra4_B7EF:
	LDA #$03
	STA $32
	JSR sub4_B741
	RTS
	JSR sub4_B37C
	JSR SwimCheck
	LDX #$0E
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra4_B807
	LDY #$0A
bra4_B807:
	LDA #$07
	STA $32
	JSR sub4_B741
	RTS
	JSR sub4_B37C
	JSR SwimCheck
	LDX #$06
	LDY #$07
	LDA #$03
	STA $32
	JSR sub4_B741
	RTS
	JSR sub4_B37C
	JSR SwimCheck
	LDX #$00
	LDA ButtonsHeld
	AND #$03
	BEQ bra4_B835
	LDA PlayerYSpeed
	BNE $B835
	INX
bra4_B835:
	STX PlayerAction
	LDX #$00
	LDY #$40
	JSR sub4_B8C0
	LDA #$06
	STA Player1YoshiStatus
	JSR sub4_A14A
	LDA #sfxYoshiSwallow
	STA SFXRegister
	RTS
sub4_B84B:
	LDA ButtonsHeld
	AND #$01
	BEQ bra4_B859
	LDA PlayerMovement
	AND #$FE
	JMP loc4_B864
bra4_B859:
	LDA ButtonsHeld		;
	AND #dirLeft		;make sure left is pressed
	BEQ bra4_B873_RTS	;
	LDA PlayerMovement	;
	ORA #$01			;set movement to walking
loc4_B864:
	STA PlayerMovement
	LDA PlayerXSpeed	;
	CMP #$10			;branch if x speed exceeds decimal 16
	BCS bra4_B873_RTS	;
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra4_B873_RTS:
	RTS
SwimCheck:
				LDA ButtonsPressed	;
				AND #buttonA		;make sure the A button is pressed
				BEQ SwimCheckDone	;
				LDA UnderwaterFlag	;if not underwater,
				BEQ bra4_B886		;branch
				LDX #sfxSwim		;load swim sound in x reg
				LDY #$20			;
				BNE bra4_B897		;branch
bra4_B886:		LDX #sfxJump		;load jump sound into x reg
				LDA PlayerYSpeed	;if y speed has any y speed,
				BNE SwimCheckDone	;stop
				LDY #$60
				LDA ButtonsHeld		;
				AND #dirDown		;if down isn't held,
				BEQ bra4_B897		;branch
				LDY #$30
bra4_B897:		STY PlayerYSpeed
				STX SFXRegister		;play whatever sound was loaded into the x reg
				LDA PlayerMovement	;
				ORA #$04			;set movement to jumping/swimming
				STA PlayerMovement	;
SwimCheckDone:	RTS

sub4_B8A2:
	INC $0611
	CPY $0611
	BCS bra4_B8B7
	LDA #$00
	STA $0611
	INC $0612
	CPX $0612
	BCC bra4_B8BA
bra4_B8B7:
	PLA
	PLA
	RTS
bra4_B8BA:
	LDA #$00
	STA $0612
	RTS
sub4_B8C0:
	INC $0613
	CPY $0613
	BCS bra4_B8D5
	LDA #$00
	STA $0613
	INC $0614
	CPX $0614
	BCC bra4_B8D8
bra4_B8D5:
	PLA
	PLA
	RTS
bra4_B8D8:
	LDA #$00
	STA $0614
	RTS
	LDA PlayerYSpeed
	BNE bra4_B90B_RTS
	LDA #$07
	STA PlayerState
	LDX $A4
	DEX
	LDA $0622
	STA PlayerMovement
	LDA $0621
	STA Player1YoshiStatus
	LDA #$01
	STA Player2YoshiStatus
	LDA #$07
	STA PlayerAction
	JSR sub4_A14A
	LDX #$00
	LDY #$14
	JSR sub4_B8A2
	LDA #$00
	STA PlayerState
bra4_B90B_RTS:
	RTS
	JSR sub4_B37C
	JSR JumpingRoutine
	LDA #$05
	STA PlayerAction
	LDX #$00
	LDY #$14
	JSR sub4_B8A2
	LDA #$00
	STA PlayerState
	RTS
JumpingRoutine:
				LDA PlayerYSpeed	;if player's y speed isn't empty,
				BNE JumpingDone		;stop
				LDA ButtonsPressed	;
				AND #buttonA		;make sure A is pressed
				BEQ JumpingDone		;
				LDA #$60			;
				STA PlayerYSpeed	;set y speed to 60 (hex)
				LDA PlayerMovement	;
				ORA #$04			;set movement to jumping
				STA PlayerMovement	;
JumpingDone:	RTS
sub4_B938:
	LDA PlayerXSpeed	;
	CMP #$10			;if player's x speed exceeds 16 (decimal),
	BCS bra4_B945		;branch
	LDA FrameCount
	AND #$01
	JMP loc4_B94F
bra4_B945:
	ROR
	ROR
	ROR
	ROR
	AND #$0F
	TAY
	LDA tbl4_BAD1,Y
loc4_B94F:
	STA PlayerMetaspriteHAlign
	LDA PlayerXSpeed
	CMP #$03
	BCS bra4_B95B
	LDA #$00
	STA PlayerMetaspriteHAlign
bra4_B95B:
	LDA PlayerMetaspriteHAlign
	BNE bra4_B96A
	LDA PlayerXScreen
	STA PlayerXScreenDup
	LDA PlayerXPos
	STA PlayerXPosDup
	JMP loc4_B993
bra4_B96A:
	LDA PlayerMovement
	AND #$01
	BEQ bra4_B980
	LDA PlayerXPos
	SEC
	SBC PlayerMetaspriteHAlign
	STA PlayerXPosDup
	LDA PlayerXScreen
	SBC #$00
	STA PlayerXScreenDup
	JMP loc4_B993
bra4_B980:
	LDA PlayerSprXPos
	CMP #$F0
	BCS bra4_B993
	LDA PlayerXPos
	CLC
	ADC PlayerMetaspriteHAlign
	STA PlayerXPosDup
	LDA PlayerXScreen
	ADC #$00
	STA PlayerXScreenDup
bra4_B993:
loc4_B993:
	LDA PlayerYSpeed
	LSR					;
	LSR					;
	LSR					;
	LSR					;divide speed value by 16,
	TAX					;transfer to X reg
	LDA tbl4_BAE1,X
	STA PlayerMetaspriteVAlign
	LDA PlayerYSpeed
	CMP #$04
	BCS bra4_B9A9
	LDA #$00
	STA PlayerMetaspriteVAlign
bra4_B9A9:
	LDA PlayerMetaspriteVAlign
	BNE bra4_B9B8
	LDA PlayerYScreen
	STA PlayerYScreenDup
	LDA PlayerYPos
	STA PlayerYPosDup
	JMP loc4_BA24
bra4_B9B8:
	LDA PlayerMovement		;
	AND #$04				;if player isn't jumping,
	BEQ CliffDeathCheck		;branch
	LDA PlayerSprYPos		;
	CMP #$08				;if the player's sprite goes higher than the 8th line,
	BCC CliffDeathCheck		;branch
	LDA PlayerYPos
	SEC
	SBC PlayerMetaspriteVAlign
	STA PlayerYPosDup
	LDA PlayerYScreen
	SBC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra4_B9DC
	SEC
	SBC #$10
	STA PlayerYPosDup
bra4_B9DC:
	JMP loc4_BA24
CliffDeathCheck:
	LDA PlayerSprYPos		;
	CMP #$E0				;if player's sprite is above this,
	BCC bra4_BA0A			;branch
	LDA #musDeath			;
	STA MusicRegister		;play death music
	LDA #$00				;
	STA PlayerPowerup		;clear any powerups
	STA Player1YoshiStatus	;remove yoshi
	LDA LevelNumber			;
	CMP #$03				;if in a castle,
	BEQ DeathTrigger		;branch
	LDA #$00				;
	STA Player2YoshiStatus	;get remove 2nd player's yoshi
DeathTrigger:
	LDA #$04				;
	STA Event				;trigger death event
	LDA #$02				;
	STA LevelTransitionFlag	;set map transition
	LDA #$07				;
	STA PlayerAction		;make player duck
	RTS

bra4_BA0A:
	LDA PlayerYPos
	CLC
	ADC PlayerMetaspriteVAlign
	STA PlayerYPosDup
	LDA PlayerYScreen
	ADC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup	;
	CMP #$F0			;if player's y coords go below this,
	BCC bra4_BA24		;branch
	CLC
	ADC #$10
	STA PlayerYPosDup
	INC PlayerYScreenDup
bra4_BA24:
loc4_BA24:
	LDA PlayerSprYPos
	CMP #$D0
	BCS bra4_BA42
	LDA Event
	CMP #$04
	BEQ bra4_BA42
	CMP #$0B
	BEQ bra4_BA42
	CMP #$0D
	BCC bra4_BA3C
	CMP #$15
	BCC bra4_BA42
bra4_BA3C:
	JSR sub4_BAF1
	JSR sub4_BC50
bra4_BA42:
	LDA PlayerXPosDup
	SEC
	SBC PlayerXPos
	STA PlayerMetaspriteHAlign
	LDA PlayerXScreenDup
	SBC PlayerXScreen
	BPL bra4_BA6A
	LDA PlayerMetaspriteHAlign
	EOR #$FF
	SEC
	ADC #$00
	CMP #$07
	BCC bra4_BA67
	LDA PlayerXPos
	SEC
	SBC #$07
	STA PlayerXPosDup
	LDA PlayerXScreen
	SBC #$00
	STA PlayerXScreenDup
bra4_BA67:
	JMP loc4_BA7D
bra4_BA6A:
	LDA PlayerMetaspriteHAlign
	CMP #$07
	BCC bra4_BA7D
	LDA PlayerXPos
	CLC
	ADC #$07
	STA PlayerXPosDup
	LDA PlayerXScreen
	ADC #$00
	STA PlayerXScreenDup
bra4_BA7D:
loc4_BA7D:
	LDA PlayerYPosDup
	SEC
	SBC PlayerYPos
	STA PlayerMetaspriteHAlign
	LDA PlayerYScreenDup
	SBC PlayerYScreen
	BPL bra4_BAB0
	LDA PlayerMetaspriteHAlign
	EOR #$FF
	SEC
	ADC #$00
	CMP #$07
	BCC bra4_BAAD
	LDA PlayerYPos
	SEC
	SBC #$07
	STA PlayerYPosDup
	LDA PlayerYScreen
	SBC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra4_BAAD
	SEC
	SBC #$10
	STA PlayerYPosDup
bra4_BAAD:
	JMP loc4_BAD0_RTS
bra4_BAB0:
	LDA PlayerMetaspriteHAlign
	CMP #$07
	BCC bra4_BAD0_RTS
	LDA PlayerYPos
	CLC
	ADC #$07
	STA PlayerYPosDup
	LDA PlayerYScreen
	ADC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra4_BAD0_RTS
	CLC
	ADC #$10
	STA PlayerYPosDup
	INC PlayerYScreenDup
bra4_BAD0_RTS:
loc4_BAD0_RTS:
	RTS
tbl4_BAD1:
	.db $00
	.db $01
	.db $02
	.db $03
	.db $04
	.db $05
	.db $06
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
tbl4_BAE1:
	.db $01
	.db $01
	.db $02
	.db $03
	.db $04
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
sub4_BAF1:
	LDX PlayerAction
	LDA tbl4_BC2F,X
	CLC
	ADC PlayerXPosDup
	STA $65
	LDA PlayerXScreenDup
	ADC #$00
	STA PlayerWallColPos
	LDA PlayerYScreenDup
	STA $66
	LDA PlayerYPosDup
	STA $67
loc4_BB09:
	LDA #$00
	STA $26
	LDY $66
	LDA $04FA,Y
	CLC
	ADC $64
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($9F),Y
	STA $9E
	LDA ($8C),Y
	STA $99
	TAY
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	TYA
	AND #$20
	BNE bra4_BB3D
	LDA DataBank1
	STA M90_PRG0
	JMP loc4_BB43
bra4_BB3D:
	LDA $04F4		;
	STA M90_PRG0	;likely an unused function
loc4_BB43:
	LDY $65
	LDA $67
	AND #$F0
	ORA tbl4_BD6D,Y
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA $96
	LDA #39			;
	STA M90_PRG3	;load bank 39 into PC $E000
	JSR jmp_39_E000
	LDA #$3F		;
	STA M90_PRG3	;load bank 63 (irq) into PC $E000
	LDA $96
	CMP #$F8
	BNE bra4_BB73
	LDA $49
	ORA #$01
	BNE bra4_BB77
bra4_BB73:
	LDA $49
	AND #$FE
bra4_BB77:
	STA $49
	LDA $26
	BEQ bra4_BB80
	JMP loc4_BB09
bra4_BB80:
	LDX PlayerAction
	LDA tbl4_BC2F,X
	ASL
	STA $25
	LDA $65
	SEC
	SBC $25
	STA $65
	LDA PlayerWallColPos
	SBC #$00
	STA PlayerWallColPos
loc4_BB95:
	LDA #$00
	STA $26
	LDY $66
	LDA $04FA,Y
	CLC
	ADC $64
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($9F),Y
	STA $9E
	LDA ($8C),Y
	STA $99
	TAY
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	TYA
	AND #$20
	BNE bra4_BBC9
	LDA DataBank1
	STA M90_PRG0
	JMP loc4_BBCF
bra4_BBC9:
	LDA $04F4	;unlogged
	STA M90_PRG0	;unlogged
loc4_BBCF:
	LDY $65
	LDA $67
	AND #$F0
	ORA tbl4_BD6D,Y
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA $96
	LDA PlayerSprYPos
	CMP #$C8
	BCC bra4_BBF0
	LDA #$00
	STA $96
bra4_BBF0:
	LDA #$27
	STA M90_PRG3
	JSR $E000
	LDA #$3F
	STA M90_PRG3
	LDA $96
	CMP #$F8
	BNE bra4_BC09
	LDA $49
	ORA #$02
	BNE bra4_BC0D
bra4_BC09:
	LDA $49
	AND #$FD
bra4_BC0D:
	STA $49
	LDA $26
	BEQ bra4_BC16
	JMP loc4_BB95
bra4_BC16:
	LDX PlayerAction
	LDA $65
	CLC
	ADC tbl4_BC2F,X
	STA PlayerXPosDup
	LDA PlayerWallColPos
	ADC #$00
	STA PlayerXScreenDup
	LDA $67
	STA PlayerYPosDup
	LDA $66
	STA PlayerYScreenDup
	RTS
tbl4_BC2F:
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $00
	.db $05
	.db $05
	.db $05
	.db $05
	.db $08
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $05
	.db $0A
sub4_BC50:
	LDY #$10
	LDA PlayerPowerup	;if player is small,
	BEQ bra4_BC59		;branch
	LDY #$18
bra4_BC59:
	STY $2B
	LDX PlayerAction
	LDA tbl4_BC2F,X
	CLC
	ADC PlayerXPosDup
	STA $65
	LDA PlayerXScreenDup
	ADC #$00
	STA PlayerWallColPos
	LDA PlayerYPosDup
	SEC
	SBC PlayerMetaspriteVAlign
	STA $67
	BCS bra4_BC7E
	SEC
	SBC #$10
	STA $67
	LDY PlayerYScreenDup
	DEY
	STY $66
bra4_BC7E:
	LDA #$00
	STA $26
	LDY $66
	LDA $04FA,Y
	CLC
	ADC $64
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($9F),Y
	STA $9E
	LDA ($8C),Y
	STA $99
	TAY
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	TYA
	AND #$20
	BNE bra4_BCB2
	LDA DataBank1
	STA M90_PRG0
	JMP loc4_BCB8
bra4_BCB2:
	LDA $04F4
	STA M90_PRG0
loc4_BCB8:
	LDY $65
	LDA $67
	AND #$F0
	ORA tbl4_BD6D,Y
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA $96
	JSR sub4_BE6D
	LDX PlayerAction
	LDA tbl4_BC2F,X
	ASL
	STA $25
	LDA $65
	SEC
	SBC $25
	STA $65
	LDA PlayerWallColPos
	SBC #$00
	STA PlayerWallColPos
	LDY $66
	LDA $04FA,Y
	CLC
	ADC $64
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($9F),Y
	STA $9E
	LDA ($8C),Y
	STA $99
	TAY
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	TYA
	AND #$20
	BNE bra4_BD17
	LDA DataBank1
	STA M90_PRG0
	JMP loc4_BD1D
bra4_BD17:
	LDA $04F4
	STA M90_PRG0
loc4_BD1D:
	LDY $65
	LDA $67
	AND #$F0
	ORA tbl4_BD6D,Y
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2	;get 2nd data bank
	STA M90_PRG0	;swap into to first prg bank ($8000)
	LDA ($DA),Y
	STA $96
	JSR sub4_BE6D
	JSR sub4_BE91
	LDX PlayerAction
	LDA $65
	CLC
	ADC tbl4_BC2F,X
	STA PlayerXPosDup
	LDA PlayerWallColPos
	ADC #$00
	STA PlayerXScreenDup
	LDY #$10
	LDA PlayerPowerup	;if player is small,
	BEQ bra4_BD53		;branch
	LDY #$18
bra4_BD53:
	STY $2B
	LDA $67
	CLC
	ADC PlayerMetaspriteVAlign
	STA PlayerYPosDup
	BCS bra4_BD62
	CMP #$F0
	BCC bra4_BD6C_RTS
bra4_BD62:
	CLC
	ADC #$10
	STA PlayerYPosDup
	LDY $66
	INY
	STY PlayerYScreenDup
bra4_BD6C_RTS:
	RTS
tbl4_BD6D:
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $03
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $04
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $05
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $06
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $07
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $08
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $09
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0A
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0B
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0C
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0D
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0E
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
	.db $0F
sub4_BE6D:
	LDA $96
	CMP #$70
	BCS bra4_BE83
	CMP #$60
	BCC bra4_BE84_RTS
	AND #$0F
	TAY
	LDA tbl4_BEC5,Y
	BEQ bra4_BE84_RTS
	JMP loc4_BED5
bra4_BE84_RTS:
	RTS
bra4_BE83:
	LDA #$27
	STA M90_PRG3
	JSR $E000
	LDA #$3F
	STA M90_PRG3
	RTS
sub4_BE91:
	LDA $06DE
	BNE bra4_BEAD_RTS
	LDA $06DC
	BNE bra4_BEAD_RTS
	LDA PlayerState
	CMP #$03
	BNE bra4_BEAE
	LDY #$00
	LDA $96
	CMP #$F8
	BEQ bra4_BEAA
	INY
bra4_BEAA:
	STY $06DD
bra4_BEAD_RTS:
	RTS
bra4_BEAE:
	LDA PlayerActionDup
	CMP #$08
	BNE bra4_BEAD_RTS
	LDA $96
	CMP #$F8
	BNE bra4_BEAD_RTS
	.db $A9
	.db $00
	.db $85
	.db $15
	.db $85
	.db $14
	.db $A9
	.db $03
	.db $85
	.db $E1
	.db $60
tbl4_BEC5:
	.db $01
	.db $01
	.db $00
	.db $01
	.db $00
	.db $01
	.db $00
	.db $00
	.db $01
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
loc4_BED5:
	LDA PlayerMovement	;
	AND #$04			;if player isnt moving up,
	BEQ bra4_BF06		;branch
	LDA #$04
	EOR #$FF
	AND PlayerMovement
	STA PlayerMovement
	LDA #$10
	STA PlayerYSpeed
	LDA PlayerState
	CMP #$03
	BEQ bra4_BEF1
	LDA #sfxThud
	STA SFXRegister
bra4_BEF1:
	LDA $67
	CLC
	ADC #$10
	AND #$F0
	STA $67
	CMP #$F0
	BCC bra4_BF05_RTS
	CLC
	ADC #$10
	STA $67
	INC $66
bra4_BF05_RTS:
	RTS
bra4_BF06:
	LDA #$00
	STA PlayerXSpeed
	LDA PlayerXPosDup
	SEC
	SBC $65
	LDA PlayerXScreenDup
	SBC $64
	BMI bra4_BF25
	LDA $65
	CLC
	ADC #$10
	AND #$F0
	STA $65
	LDA PlayerWallColPos
	ADC #$00
	STA PlayerWallColPos
	RTS
bra4_BF25:
	LDA $65
	SEC
	SBC #$10
	ORA #$0F
	STA $65
	LDA PlayerWallColPos
	SBC #$00
bra4_BF32:
	STA PlayerWallColPos
	RTS
	LDA ($32),Y	;unused leftover routines ahead?
	STA PPUData
	DEC PlayerMetaspriteVAlign
	BNE bra4_BF32
	JSR sub4_BF59
	JMP $BF26
	STA PlayerMetaspriteVAlign
	JSR sub4_BF59
	LDA ($32),Y
bra4_BF4B:
	STA PPUData
	DEC PlayerMetaspriteVAlign
	BNE bra4_BF4B
	JSR sub4_BF59
	JMP $BF26
	RTS
sub4_BF59:
	INC $32
	BNE bra4_BF5F_RTS
	INC $33
bra4_BF5F_RTS:
	RTS
	TSX
	.db $AB
	.db $04
	STA ObjectState,X
	LDA #$00
	STA $0578,X
	PLA
	PLA
	RTS
	JSR sub4_BF7A
	PLA
	PLA
	RTS
	LDA InvincibilityTimer
	BEQ bra4_BF7A
	RTS
bra4_BF7A:
sub4_BF7A:
	LDX $A4
	LDA ObjectSlot,X
	CMP #$48
	BCC bra4_BF87
	CMP #$4C
	BCC bra4_BF9B
bra4_BF87:
	LDA $05B4,X
	BMI bra4_BF93
	LDA ObjectState,X
	ORA #$40
	BNE bra4_BF98
bra4_BF93:
	LDA ObjectState,X
	AND #$BF
bra4_BF98:
	STA ObjectState,X
bra4_BF9B:
	LDA #$00
	STA PlayerCarryFlag
	LDA Player1YoshiStatus
	BEQ bra4_BFAD
	LDA #$01
	STA HurtFlag
	JMP loc4_BFC0
bra4_BFAD:
	LDA PlayerPowerup
	BEQ bra4_BFD2
	LDA #$00
	STA PlayerPowerup
	LDA #$01
	STA PlayerPowerupBuffer
	LDA #$07
	STA Event
loc4_BFC0:
	LDA #$D0
	STA InvincibilityTimer
	LDA #sfxPowerDown
	STA SFXRegister
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	RTS
bra4_BFD2:
	LDA #$04
	STA Event
	LDA #$00
	STA LevelTransitionFlag
	STA PlayerState
	STA $06DC
	STA $06DD
	RTS	;unlogged code end
