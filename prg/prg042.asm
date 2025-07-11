; disassembled with BZK 6502 Disassembler
TilemapPointers:
	.word TitleLogo
	.word EndingScreen
	.word ThankYouScreen
	.word CopyrightScreen
	.word YoshiHouse ; Unused
TitleLogo:
	.incbin screens/TitleLogo.bin
EndingScreen:
	.incbin screens/EndingScreen.bin
ThankYouScreen:
	.incbin screens/ThankYouScreen.bin
CopyrightScreen:
	.incbin screens/CopyrightScreen.bin
YoshiHouse:
	.incbin screens/YoshiHouse.bin ; Unused
	db $11, $30, $2A, $0E
	db $11, $38, $26, $0E
	db $11, $37, $2A, $1A
	db $11, $39, $29, $1A
	
	db $11, $30, $2A, $0E
	db $11, $38, $26, $0E
	db $11, $37, $2A, $1A
	db $11, $39, $29, $1A
	
	db $0E, $20, $35, $1A
	db $0E, $21, $11, $14
	db $0E, $20, $35, $38
	db $0E, $20, $24, $14
	
	db $0E, $20, $35, $1A
	db $0E, $21, $11, $14
	db $0E, $20, $35, $38
	db $0E, $20, $24, $14
	
	db $0E, $2A, $2C, $36
	db $0E, $37, $27, $38
	db $0E, $2A, $37, $30
	db $0E, $1C, $2C, $30
	
	db $0E, $2A, $2C, $36
	db $0E, $37, $27, $38
	db $0E, $2A, $37, $30
	db $0E, $1C, $2C, $30
	
	db $0E, $11, $2C, $30
	db $0E, $37, $27, $38
	db $0E, $2A, $37, $30
	db $0E, $1C, $2C, $30
	
	db $0E, $2A, $2C, $36
	db $0E, $37, $27, $38
	db $0E, $2A, $37, $30
	db $0E, $1C, $2C, $30
	
	db $60
TilemapDecompSub:
	LDA #$00
	STA PPUMASK ; Clear PPU mask, disabling rendering
	STA PPUCTRL ; Clear PPU control, disabling NMI
	TAY ; Clear Y register
	LDA PPUSTATUS ; Clear PPU address latch
	LDA curRleTilemap ; Get current tilemap
	ASL
	TAX ; Get the pointer for it
	LDA TilemapPointers,X
	STA $38 ; Load lower byte of pointer
	LDA TilemapPointers+1,X
	STA $39 ; Load upper byte of pointer
	LDA ($38),Y
	STA PPUADDR ; Get upper byte of PPU address from tilemap header
	JSR GoToNextByte
	LDA ($38),Y
	STA PPUADDR ; Get lower byte of PPU address from tilemap header
ByteTypeCheck:
	JSR GoToNextByte
	LDA ($38),Y ; Read next byte
	BPL bra2_87F1 ; Branch if it isn't a byte count (aka bit 7 cleared)
	CMP #$FF
	BEQ bra2_8801_RTS ; Stop if a null byte is reached
	AND #%01111111
	STA rleRepeatBytesLeft ; Mask out bit 7 and get the amount of bytes until the next repeat
bra2_87E3:
	JSR GoToNextByte
	LDA ($38),Y ; Read next byte
	STA PPUDATA ; Store tile data
	DEC rleRepeatBytesLeft ; Decrement byte count
	BNE bra2_87E3 ; Keep looping until byte count reached
	BEQ ByteTypeCheck ; Branch once it is reached
bra2_87F1:
	STA rleRepeatCount ; Store repeat count
	JSR GoToNextByte
	LDA ($38),Y ; Read next byte
RepeatTileRender:
	STA PPUDATA ; Store tile data
	DEC rleRepeatCount
	BNE RepeatTileRender ; Repeatedly render that tile until the repeat count is reached
	BEQ ByteTypeCheck ; Branch once the repeat count is reached
bra2_8801_RTS:
	RTS
GoToNextByte:
	INC $38 ; Go to next byte of data
	BNE NextByteDone
	INC $39 ; Go to next memory page if needed
NextByteDone:
	RTS

	LDX #$00 ; Clear X offset
	LDA #$00
bra2_880D:
	STA metaspriteRowAlignment,X ; Clear metasprite row position
	INX
	CPX #$09 ; Keep clearing all 9 of them
	BCC bra2_880D
	RTS
	LDX #$00 ; Clear X index
	LDA #$F8 ; Set off-screen Y position
bra2_8819:
	STA spriteMem,X ; Put sprite at off-screen Y position
	INX
	INX
	INX
	INX ; Go to next sprite
	BNE bra2_8819 ; Keep going until all sprites are off-screen
	RTS
ClearOtherSprites:
	LDX #$10 ; Set the X index to $10 and ignore the first 4 sprites
	LDA #$F8
bra2_8827:
	STA spriteMem,X
	INX
	INX
	INX
	INX
	BNE bra2_8827 ; Hide all sprites (excluding the player)
	LDX #$00
	STX $2C
	LDA #$00
	STA $2B
bra2_8838:
	LDA gs0SpriteFrame,X
	BEQ bra2_883F
	JSR sub2_8848
bra2_883F:
	INC $2C
	LDX $2C
	CPX #$07
	BCC bra2_8838
	RTS
sub2_8848:
	LDY #$04
	LDX $2C
	LDA gs0SpriteSlot,X
	ASL
	TAX
	LDA TitleSpriteAnimations,X
	STA gs0SpriteAnimPtr
	LDA TitleSpriteAnimations+1,X
	STA gs0SpriteAnimPtr+1
	LDA (gs0SpriteAnimPtr),Y
	STA scratchRam+3
	LDA $2C
	TAY
	TAX
	LDA gs0SpriteFrame,X
	ASL
	TAX
	LDA tbl2_8900,X
	STA $32
	LDA tbl2_8900+1,X
	STA $33
	LDA tbl2_8986,X
	STA $38
	LDA tbl2_8986+1,X
	STA $39
	LDA a:$41,Y
	STA $25
	STA $27
	LDA gs0SpriteFlags,Y
	STA $2E
	STA $2F
	LDA gs0SpriteY,Y
	STA $26
	LDY #$00
	LDA ($32),Y
	STA $28
	STA $29
	INY
	LDA ($32),Y
	STA $2A
	INY
bra2_889C:
loc2_889C:
	LDA $2B
	ASL
	ASL
	TAX
	LDA ($32),Y
	CMP #$FF
	BEQ bra2_88D5
	ORA $31
	STA spriteMem+1,X
	LDA $26
	STA spriteMem,X
	LDA $2E
	BEQ bra2_88BD
	LDA $27
	CMP #$40
	BCS bra2_88C3
	BCC bra2_88C7
bra2_88BD:
	LDA $27
	CMP #$40
	BCS bra2_88C7
bra2_88C3:
	LDA #$FE
	BNE bra2_88CB
bra2_88C7:
	LDA $27
	SBC #$40
bra2_88CB:
	STA spriteMem+3,X
	LDA ($38),Y
	STA spriteMem+2,X
	INC $2B
bra2_88D5:
	INY
	LDA $27
	CLC
	ADC #$08
	STA $27
	BCC bra2_88E1
	INC $2E
bra2_88E1:
	DEC $29
	BNE bra2_889C
	DEC $2A
	BEQ bra2_88FF_RTS
	LDA $28
	STA $29
	LDA $26
	CLC
	ADC #$08
	STA $26
	LDA $25
	STA $27
	LDA $2F
	STA $2E
	JMP loc2_889C
bra2_88FF_RTS:
	RTS
tbl2_8900:
	.word SprMap_PlayerText
	.word SprMap_PlayerText
	.word SprMap_PlayerCursor
	.word SprMap_TitleCloud
	.word SprMap_TitleEnemyPop
	.word pnt3_8B0C ; unused 05
	.word pnt3_8B16 ; unused 06
	.word SprMap_TitleKoopa1
	.word SprMap_TitleKoopa2
	.word SprMap_TitleRex1
	.word SprMap_TitleRex2
	.word pnt3_8B74 ; unused 0B
	.word pnt3_8B80 ; unused 0C
	.word SprMap_TitleSuperKoopa1
	.word SprMap_TitleSuperKoopa2
	.word pnt3_8B9E ; unused 0F
	.word pnt3_8BC2 ; unused 10
	.word SprMap_TitleMario1
	.word SprMap_TitleMario2
	.word SprMap_TitleYoshi_Walk1
	.word SprMap_TitleYoshi_Walk2
	.word SprMap_TitleYoshi_Jump
; Map sprites (starts at hex 16)
	.word SprMap_MapplayerDown1
	.word SprMap_MapplayerDown2
	.word SprMap_MapplayerDown3
	.word SprMap_MapplayerLeft1
	.word SprMap_MapplayerLeft2
	.word SprMap_MapplayerClimb1
	.word SprMap_MapplayerClimb2
	.word SprMap_MapplayerUp1
	.word SprMap_MapplayerUp2
	.word SprMap_MapplayerUp3
	.word SprMap_MapplayerSwimDown1
	.word SprMap_MapplayerSwimDown2
	.word SprMap_MapplayerSwimLeft1
	.word SprMap_MapplayerSwimLeft2 ; unused
	.word SprMap_MapplayerSwimUp1
	.word SprMap_MapplayerSwimUp2
	.word SprMap_MapBoo ; unused
	.word SprMap_MapHalo ; unused
	.word SprMap_MapYoshi_Down1
	.word SprMap_MapYoshi_Down2
	.word SprMap_MapYoshi_Left1
	.word SprMap_MapYoshi_Left2
	.word SprMap_MapYoshi_Up1
	.word SprMap_MapYoshi_Up2
	.word SprMap_MapYoshi_SwimDown1
	.word SprMap_MapYoshi_SwimDown2
	.word SprMap_MapYoshi_SwimLeft1
	.word SprMap_MapYoshi_SwimLeft2 ; unused
	.word SprMap_MapYoshi_SwimUp1
	.word SprMap_MapYoshi_SwimUp2
	.word SprMap_MapplayerStart
	.word SprMap_MapYoshi_Start1
	.word SprMap_MapYoshi_Start2
	.word SprMap_MapYoshi_SwimStart1
	.word SprMap_MapYoshi_SwimStart2
	.word SprMap_MapplayerSwimStart1
	.word SprMap_MapplayerSwimStart2
	.word SprMap_MapplayerRight1
	.word SprMap_MapplayerRight2
	.word SprMap_MapplayerSwimRight1 ; unused
	.word SprMap_MapplayerSwimRight2 ; unused
	.word SprMap_MapYoshi_Right1
	.word SprMap_MapYoshi_Right2
	.word SprMap_MapYoshi_SwimRight1 ; unused
	.word SprMap_MapYoshi_SwimRight2 ; unused
tbl2_8986:
	.word pnt3_8ACC
	.word pnt3_8ACC
	.word pnt3_8AE9
	.word pnt3_8AF6
	.word pnt3_8B06
	.word pnt3_8B06
	.word pnt3_8B06
	.word pnt3_8B2E
	.word pnt3_8B2E
	.word pnt3_8B58
	.word pnt3_8B58
	.word pnt3_8B7A
	.word pnt3_8B7A
	.word pnt3_8B8E
	.word pnt3_8B8E
	.word pnt3_8BB0
	.word pnt3_8BD4
	.word pnt3_8BF0
	.word pnt3_8BF0
	.word pnt3_8C16
	.word pnt3_8C16
	.word pnt3_8C16
	.word pnt3_8C4C
	.word pnt3_8C4C
	.word pnt3_8C4C
	.word pnt3_8C4C
	.word pnt3_8C4C
	.word pnt3_8C4C
	.word pnt3_8C4C
	.word pnt3_8C4C
	.word pnt3_8C4C
	.word pnt3_8C4C
	.word pnt3_8C8E
	.word pnt3_8C8E
	.word pnt3_8C8E
	.word pnt3_8C8E
	.word pnt3_8C8E
	.word pnt3_8C8E
	.word pnt3_8CB8
	.word pnt3_8CBB
	.word pnt3_8CC6
	.word pnt3_8CCE
	.word pnt3_8CE6
	.word pnt3_8CE6
	.word pnt3_8D07
	.word pnt3_8D07
	.word pnt3_8CC6
	.word pnt3_8CCE
	.word pnt3_8D2F
	.word pnt3_8D2F
	.word pnt3_8D07
	.word pnt3_8D07
	.word pnt3_8C4C
	.word pnt3_8CC6
	.word pnt3_8CCE
	.word pnt3_8CC6
	.word pnt3_8CCE
	.word pnt3_8C8E
	.word pnt3_8C8E
	.word pnt3_8D92
	.word pnt3_8D92
	.word pnt3_8DA4
	.word pnt3_8DA4
	.word pnt3_8DB6
	.word pnt3_8DB6
	.word pnt3_8DD7
	.word pnt3_8DD7
tbl2_8A0C:
	db $00
	db $00
	db $A0, $80 ; 1/2 Player Text X/Y Position
	db $90, $80 ; Cursor X/Y Position
	db $40 ; Unknown
	db $20 ; Unknown
	db $50
	db $AA
	db $50
	db $AA
	db $50
	db $AA
	db $50
	db $AA
	db $50
	db $AA

;----------------------------------------
; Title Screen Sprites
TitleSpriteFrameTypes:
	db $00, $00
	db $00, $00
	db $00, $00
	db $01, $0B
	db $01, $03
	db $01, $03
	db $01, $03 ; Koopa Walk 1
	db $01, $01 ; Koopa Walk 2
	db $01, $01 ; Rex Walk 1
	db $01, $05 ; Rex Walk 2
	db $01, $05
	db $01, $07
	db $01, $07 ; Super Koopa Fly 1
	db $01, $02 ; Super Koopa Fly 2
	db $01, $02
	db $01, $06
	db $01, $06 ; Mario Walk 1
	db $01, $08 ; Mario Walk 2
	db $01, $08 ; Yoshi Walk 1
	db $01, $09 ; Yoshi Walk 2
	db $01, $0A
	db $01, $0A
	db $01, $0A
	db $01, $0A
	db $01, $0A

;----------------------------------------
; Animation Format
; Sprite1, Sprite2, Bank, Speed, Index
; Sprite1 - 1st frame of animation
; Sprite2 - 2nd frame of animation 
; Bank - 1K CHR bank
; Speed - Animation speed in frames
; Index - 1K CHR slot used. Can be $00, $40, $80, or $C0 for slots 1 through 4 respectively.
TitleSpriteAnimations:
	.word pnt3_8A6C
	.word SprMap_TitleKoopaAnim
	.word SprMap_TitleSuperKoopaAnim
	.word TitlePopEffectAnim
	.word pnt3_8A80 ; Unknown
	.word SprMap_TitleRexAnim
	.word pnt3_8A8A ; Unknown
	.word pnt3_8A8F
	.word SprMap_TitleMarioAnim ; Useless, hardcoded
	.word SprMap_TitleYoshi_WalkAnim ; Useless, hardcoded
	.word pnt3_8A9E ; Yoshi duplicate
	.word pnt3_8AA3
	.word pnt3_8AA8
	.word pnt3_8AAD
pnt3_8A6C:
	db $00
	db $00
	db $00
	db $00
	db $00
SprMap_TitleKoopaAnim:
	db $07
	db $08
	db $94
	db $0F
	db $80
SprMap_TitleSuperKoopaAnim:
	db $0D
	db $0E
	db $96
	db $07
	db $C0
TitlePopEffectAnim:
	db $04
	db $04
	db $FF
	db $0F
	db $00
pnt3_8A80:
	db $01
	db $01
	db $FA
	db $0F
	db $80
SprMap_TitleRexAnim:
	db $09
	db $0A
	db $95
	db $0F
	db $80
pnt3_8A8A:
	db $0F
	db $10
	db $95
	db $0F
	db $C0
pnt3_8A8F:
	db $0B
	db $0C
	db $94
	db $0F
	db $C0
SprMap_TitleMarioAnim:
	db $11
	db $12
	db $FF
	db $0F
	db $00
SprMap_TitleYoshi_WalkAnim:
	db $13
	db $14
	db $FF
	db $0F
	db $00
pnt3_8A9E:
	db $13
	db $14
	db $FF
	db $0F
	db $00
pnt3_8AA3:
	db $03
	db $03
	db $FF
	db $0F
	db $00
pnt3_8AA8:
	db $0B
	db $0C
	db $94
	db $0F
	db $C0
pnt3_8AAD:
	db $0B
	db $0C
	db $94
	db $0F
	db $C0
SprMap_PlayerText:
	db $08
	db $03
	db $8F
	db $FF
	db $90
	db $91
	db $92
	db $93
	db $94
	db $95
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $98
	db $FF
	db $90
	db $91
	db $92
	db $93
	db $94
	db $95
pnt3_8ACC:
	db $08
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03

; =====Mapping Format=====
; Width, Height, [data]
; 	Width - Width in 8x8 tiles
; 	Height - Height in 8x8 tiles
; 	[data] - Mapping data. Size is height times width.
SprMap_PlayerCursor:
	db $01
	db $01
	db $8E
pnt3_8AE9:
	db $01
	db $01
	db $03
SprMap_TitleCloud:
	db $04
	db $02
	db $38, $39, $3A, $3B
	db $3C, $3D, $3D, $3E
pnt3_8AF6:
	db $04
	db $02
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
	db $21
SprMap_TitleEnemyPop:
	db $02
	db $02
	db $00
	db $01
	db $02
	db $03
pnt3_8B06:
	db $02
	db $02
	db $01
	db $01
	db $01
	db $01
pnt3_8B0C:
	db $02
	db $04
	db $0C
	db $0A
	db $0D
	db $0B
	db $28
	db $0E
	db $29
	db $0F
pnt3_8B16:
	db $02
	db $04
	db $2E
	db $2C
	db $2F
	db $2D
	db $1A
	db $18
	db $1B
	db $19
SprMap_TitleKoopa1:
	db $03
	db $04
	db $0E
	db $0F
	db $FF
	db $18
	db $19
	db $FF
	db $27
	db $28
	db $22
	db $35
	db $36
	db $2E
pnt3_8B2E:
	db $03
	db $04
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
SprMap_TitleKoopa2:
	db $03
	db $04
	db $10
	db $11
	db $FF
	db $1A
	db $1B
	db $FF
	db $29
	db $2A
	db $2B
	db $37
	db $38
	db $2E
SprMap_TitleRex1:
	db $03
	db $04
	db $21
	db $22
	db $FF
	db $25
	db $26
	db $FF
	db $29
	db $2A
	db $2B
	db $33
	db $34
	db $35
pnt3_8B58:
	db $03
	db $04
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
SprMap_TitleRex2:
	db $03
	db $04
	db $23
	db $24
	db $FF
	db $27
	db $28
	db $FF
	db $2C
	db $2D
	db $2E
	db $36
	db $37
	db $38
pnt3_8B74:
	db $02
	db $02
	db $38
	db $39
	db $3A
	db $3B
pnt3_8B7A:
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
pnt3_8B80:
	db $02
	db $02
	db $3C
	db $3D
	db $3E
	db $3F
SprMap_TitleSuperKoopa1:
	db $03
	db $02
	db $06
	db $0C
	db $0D
	db $14
	db $15
	db $16
pnt3_8B8E:
	db $03
	db $02
	db $02
	db $00
	db $00
	db $00
	db $00
	db $00
SprMap_TitleSuperKoopa2:
	db $03
	db $02
	db $06
	db $0E
	db $0F
	db $14
	db $17
	db $18
pnt3_8B9E:
	db $04
	db $04
	db $00
	db $01
	db $02
	db $FF
	db $03
	db $04
	db $05
	db $06
	db $07
	db $08
	db $09
	db $0A
	db $FF
	db $0B
	db $0C
	db $FF
pnt3_8BB0:
	db $04
	db $04
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $02
	db $00
	db $00
	db $00
	db $02
	db $00
	db $00
	db $00
	db $00
	db $00
pnt3_8BC2:
	db $04
	db $04
	db $FF
	db $0D
	db $0E
	db $0F
	db $10
	db $11
	db $12
	db $13
	db $14
	db $15
	db $16
	db $17
	db $18
	db $19
	db $1A
	db $FF
pnt3_8BD4:
	db $04
	db $04
	db $00
	db $00
	db $02
	db $00
	db $00
	db $00
	db $02
	db $02
	db $00
	db $00
	db $02
	db $02
	db $00
	db $00
	db $00
	db $00
SprMap_TitleMario1:
	db $02
	db $04
	db $21
	db $20
	db $23
	db $22
	db $25
	db $24
	db $26
	db $27
pnt3_8BF0:
	db $02
	db $04
	db $40
	db $40
	db $40
	db $40
	db $41
	db $41
	db $41
	db $41
SprMap_TitleMario2:
	db $02
	db $04
	db $29
	db $28
	db $2B
	db $2A
	db $2D
	db $2C
	db $2F
	db $2E
SprMap_TitleYoshi_Walk1:
	db $04
	db $04
	db $FF
	db $05
	db $04
	db $FF
	db $FF
	db $08
	db $07
	db $06
	db $0B
	db $0A
	db $09
	db $FF
	db $0D
	db $0C
	db $FF
	db $FF
pnt3_8C16:
	db $04
	db $04
	db $42
	db $42
	db $42
	db $42
	db $42
	db $42
	db $42
	db $42
	db $43
	db $42
	db $42
	db $42
	db $43
	db $43
	db $42
	db $42
SprMap_TitleYoshi_Walk2:
	db $04
	db $04
	db $FF
	db $0F
	db $0E
	db $FF
	db $FF
	db $12
	db $11
	db $10
	db $15
	db $14
	db $13
	db $FF
	db $17
	db $16
	db $FF
	db $FF
SprMap_TitleYoshi_Jump:
	db $04
	db $04
	db $FF
	db $1A
	db $19
	db $18
	db $FF
	db $1C
	db $1B
	db $FF
	db $0B
	db $1D
	db $FF
	db $FF
	db $1F
	db $1E
	db $FF
	db $FF
pnt3_8C4C:
	db $02
	db $02
	db $00
	db $00
	db $01
	db $01
SprMap_MapplayerDown1:
	db $02
	db $02
	db $05
	db $06
	db $0D
	db $0E
SprMap_MapplayerDown2:
	db $02
	db $02
	db $07
	db $08
	db $0F
	db $10
SprMap_MapplayerDown3:
	db $02
	db $02
	db $05
	db $06
	db $11
	db $12
SprMap_MapplayerLeft1:
	db $02
	db $02
	db $50
	db $51
	db $60
	db $61
SprMap_MapplayerLeft2:
	db $02
	db $02
	db $52
	db $53
	db $62
	db $63
SprMap_MapplayerClimb1:
	db $02
	db $02
	db $2A
	db $2B
	db $36
	db $37
SprMap_MapplayerClimb2:
	db $02
	db $02
	db $2C
	db $2D
	db $38
	db $39
SprMap_MapplayerUp1:
	db $02
	db $02
	db $44
	db $45
	db $54
	db $55
SprMap_MapplayerUp2:
	db $02
	db $02
	db $46
	db $47
	db $56
	db $57
SprMap_MapplayerUp3:
	db $02
	db $02
	db $48
	db $49
	db $58
	db $59
pnt3_8C8E:
	db $02
	db $02
	db $00
	db $00
	db $02
	db $02
SprMap_MapplayerSwimDown1:
	db $02
	db $02
	db $07
	db $08
	db $13
	db $14
SprMap_MapplayerSwimDown2:
	db $02
	db $02
	db $05
	db $06
	db $15
	db $16
SprMap_MapplayerSwimLeft1:
	db $02
	db $02
	db $50
	db $51
	db $64
	db $65
SprMap_MapplayerSwimLeft2:
	db $02
	db $02
	db $52
	db $53
	db $66
	db $67
SprMap_MapplayerSwimUp1:
	db $02
	db $02
	db $24
	db $25
	db $13
	db $14
SprMap_MapplayerSwimUp2:
	db $02
	db $02
	db $22
	db $23
	db $15
	db $16
pnt3_8CB8:
	db $01
	db $01
	db $02
pnt3_8CBB:
	db $02
	db $01
	db $03
	db $03
SprMap_MapBoo:
	db $01
	db $01
	db $6E
SprMap_MapHalo:
	db $02
	db $01
	db $71
	db $72
pnt3_8CC6:
	db $02
	db $03
	db $00
	db $00
	db $02
	db $01
	db $02
	db $02
pnt3_8CCE:
	db $02
	db $03
	db $00
	db $00
	db $01
	db $02
	db $02
	db $02
SprMap_MapYoshi_Down1:
	db $02
	db $03
	db $01
	db $02
	db $09
	db $0A
	db $17
	db $18
SprMap_MapYoshi_Down2:
	db $02
	db $03
	db $03
	db $04
	db $0B
	db $0C
	db $19
	db $1A
pnt3_8CE6:
	db $03
	db $03
	db $00
	db $00
	db $00
	db $02
	db $00
	db $00
	db $01
	db $01
	db $01
SprMap_MapYoshi_Left1:
	db $03
	db $03
	db $00
	db $40
	db $41
	db $4A
	db $4B
	db $4C
	db $5A
	db $5B
	db $5C
SprMap_MapYoshi_Left2:
	db $03
	db $03
	db $00
	db $42
	db $43
	db $4D
	db $4E
	db $4F
	db $5D
	db $5E
	db $5F
pnt3_8D07:
	db $02
	db $03
	db $00
	db $00
	db $01
	db $01
	db $02
	db $02
SprMap_MapYoshi_Up1:
	db $02
	db $03
	db $22
	db $23
	db $2E
	db $2F
	db $3A
	db $3B
SprMap_MapYoshi_Up2:
	db $02
	db $03
	db $24
	db $25
	db $30
	db $31
	db $3C
	db $3D
SprMap_MapYoshi_SwimDown1:
	db $02
	db $03
	db $01
	db $02
	db $09
	db $0A
	db $13
	db $14
SprMap_MapYoshi_SwimDown2:
	db $02
	db $03
	db $03
	db $04
	db $0B
	db $0C
	db $15
	db $16
pnt3_8D2F:
	db $03
	db $03
	db $02
	db $00
	db $00
	db $02
	db $01
	db $01
	db $02
	db $02
	db $02
SprMap_MapYoshi_SwimLeft1:
	db $03
	db $03
	db $00
	db $40
	db $41
	db $4A
	db $4B
	db $4C
	db $68
	db $69
	db $6A
SprMap_MapYoshi_SwimLeft2:
	db $03
	db $03
	db $00
	db $42
	db $43
	db $4D
	db $4E
	db $4F
	db $6B
	db $6C
	db $6D
SprMap_MapYoshi_SwimUp1:
	db $02
	db $03
	db $26
	db $27
	db $32
	db $33
	db $13
	db $14
SprMap_MapYoshi_SwimUp2:
	db $02
	db $03
	db $28
	db $29
	db $34
	db $35
	db $15
	db $16
SprMap_MapplayerStart:
	db $02
	db $02
	db $1D
	db $06
	db $20
	db $21
SprMap_MapYoshi_Start1:
	db $02
	db $03
	db $1B
	db $02
	db $09
	db $0A
	db $17
	db $18
SprMap_MapYoshi_Start2:
	db $02
	db $03
	db $1C
	db $04
	db $1E
	db $0C
	db $19
	db $1A
SprMap_MapYoshi_SwimStart1:
	db $02
	db $03
	db $1B
	db $02
	db $09
	db $0A
	db $13
	db $14
SprMap_MapYoshi_SwimStart2:
	db $02
	db $03
	db $1C
	db $04
	db $1E
	db $0C
	db $15
	db $16
SprMap_MapplayerSwimStart1:
	db $02
	db $02
	db $1F
	db $08
	db $13
	db $14
SprMap_MapplayerSwimStart2:
	db $02
	db $02
	db $1D
	db $06
	db $15
	db $16
pnt3_8D92:
	db $02
	db $02
	db $40
	db $40
	db $41
	db $41
SprMap_MapplayerRight1:
	db $02
	db $02
	db $51
	db $50
	db $61
	db $60
SprMap_MapplayerRight2:
	db $02
	db $02
	db $53
	db $52
	db $63
	db $62
pnt3_8DA4:
	db $02
	db $02
	db $40
	db $40
	db $42
	db $42
SprMap_MapplayerSwimRight1:
	db $02
	db $02
	db $51
	db $50
	db $65
	db $64
SprMap_MapplayerSwimRight2:
	db $02
	db $02
	db $53
	db $52
	db $67
	db $66
pnt3_8DB6:
	db $03
	db $03
	db $40
	db $40
	db $42
	db $41
	db $41
	db $42
	db $42
	db $42
	db $42
SprMap_MapYoshi_Right1:
	db $03
	db $03
	db $41
	db $40
	db $00
	db $4C
	db $4B
	db $4A
	db $5C
	db $5B
	db $5A
SprMap_MapYoshi_Right2:
	db $03
	db $03
	db $43
	db $42
	db $00
	db $4F
	db $4E
	db $4D
	db $5F
	db $5E
	db $5D
pnt3_8DD7:
	db $03
	db $03
	db $40
	db $40
	db $42
	db $41
	db $41
	db $42
	db $42
	db $42
	db $42
SprMap_MapYoshi_SwimRight1:
	db $03
	db $03
	db $41
	db $40
	db $00
	db $4C
	db $4B
	db $4A
	db $6A
	db $69
	db $68
SprMap_MapYoshi_SwimRight2:
	db $03
	db $03
	db $43
	db $42
	db $00
	db $4F
	db $4E
	db $4D
	db $6D
	db $6C
	db $6B

;----------------------------------------
; SUBROUTINE ($8DF8)
;----------------------------------------
sub_42_8DF8:
; Load sprite into memory
	STA gs0SpriteFrame,X ; Load sprite frame
	ASL
	TAY ; Get pointer for it
	LDA tbl2_8A0C,Y
	STA gs0SpriteX,X ; Set X position for sprite (only works for menu?)
	LDA tbl2_8A0C+1,Y
	STA gs0SpriteY,X ; Set Y position for sprite (only used for menu?)
	LDA TitleSpriteFrameTypes,Y
	STA gs0SpriteFlags,X ; Store flags for animation frame (useless/unknown?)
	LDA TitleSpriteFrameTypes+1,Y
	STA gs0SpriteSlot,X ; Load sprite
	
; Load sprite animation and bank
	ASL
	TAX ; Get index for current sprite
	; Load sprite animation pointer
	LDA TitleSpriteAnimations,X
	STA gs0SpriteAnimPtr
	LDA TitleSpriteAnimations+1,X
	STA gs0SpriteAnimPtr+1
	; Load sprite's bank
	LDY #$02
	LDA (gs0SpriteAnimPtr),Y
	STA gs0chrSpriteBank ; Load sprite bank
	; Account for sprite's CHR bank
	LDY #$04
	LDA (gs0SpriteAnimPtr),Y ; Load 5th byte of animation data
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR ; Shift out 6 bits to get sprite bank index
	TAX ; Set 1K bank to swap
	LDA gs0chrSpriteBank
	STA chrSpriteBank1,X ; Swap the bank out in the set bank
	RTS

;----------------------------------------
; Unused code
; Seems to be an earlier, more robust version of the transition screen code, plus a blank HUD. The first screen is identical to the "GAME OVER" tilemap, although the rest are pretty garbled.
	TAX
	LDA tbl2_8E62,X
	STA $32 ; Get length of each table
	TXA
	ASL
	TAX
	LDA tbl2_8E67,X
	STA PPUADDR
	LDA tbl2_8E67+1,X
	STA PPUADDR
	LDA tbl2_8E71,X
	STA $2E
	LDA tbl2_8E71+1,X
	STA $2F
	LDY #$00
bra2_8E57:
	LDA ($2E),Y
	STA PPUDATA
	INY
	CPY $32
	BCC bra2_8E57
	RTS
tbl2_8E62:
	db $80
	db $40
	db $40
	db $40
	db $40
tbl2_8E67:
	hex 2B40
	hex 2140
	hex 2140
	hex 2140
	hex 2140
tbl2_8E71:
	.word ofs_8E7B
	.word ofs_8EFB
	.word ofs_8F3B
	.word ofs_8F7B
	.word ofs_8FBB
ofs_8E7B:
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
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
ofs_8EFB:
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
	db $01
	db $02
	db $03
	db $04
	db $05
	db $FF
	db $FF
	db $06
	db $07
	db $08
	db $09
	db $0A
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
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $0B
	db $0C
	db $0D
	db $0E
	db $0F
	db $FF
	db $FF
	db $10
	db $11
	db $12
	db $13
	db $14
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
ofs_8F3B:
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $15
	db $16
	db $17
	db $18
	db $19
	db $1A
	db $FF
	db $1B
	db $1C
	db $1D
	db $1E
	db $1F
	db $20
	db $21
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
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $23
	db $24
	db $25
	db $26
	db $27
	db $28
	db $FF
	db $29
	db $2A
	db $2B
	db $2C
	db $2D
	db $2E
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
ofs_8F7B:
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $00
	db $16
	db $17
	db $18
	db $19
	db $1A
	db $FF
	db $1B
	db $1C
	db $1D
	db $1E
	db $1F
	db $20
	db $21
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
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $00
	db $24
	db $25
	db $26
	db $27
	db $28
	db $FF
	db $29
	db $2A
	db $2B
	db $2C
	db $2D
	db $2E
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
ofs_8FBB:
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
	db $30
	db $31
	db $32
	db $33
	db $34
	db $FF
	db $35
	db $36
	db $FF
	db $37
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
	db $2B
	db $38
	db $39
	db $3A
	db $3B
	db $FF
	db $3C
	db $3D
	db $FF
	db $3E
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
sub_42_8FFB:
	LDA $0391
	ASL
	TAX
	LDA tbl2_91FD,X
	STA $2E
	LDA tbl2_91FD+1,X
	STA $2F
	LDA $0360
	ASL
	ASL
	TAY
	LDA ($2E),Y
	CMP #$FF
	BEQ bra2_905B
	STA $30
	INY
	LDA ($2E),Y
	STA $0392
	INY
	LDA ($2E),Y
	STA $037B
	INY
	LDA ($2E),Y
	STA $0361
	LDX $0399
	LDA playerStoredYoshi,X
	BEQ bra2_903B
	LDX $0361
	LDA tbl2_9091,X
	STA $0361
bra2_903B:
	LDA $037C
	BNE bra2_904F
	LDA frameCount
	AND #$F8
	LDA #$00
	STA $0378
	STA $037A
	INC $037C
bra2_904F:
	LDA $30
	BEQ bra2_9057
	JSR sub2_9151
	RTS
bra2_9057:
	JSR sub2_90B1
	RTS
bra2_905B:
	LDA #$00
	STA $0379
	JSR sub2_90D3
	LDA #$05
	STA sndSfx
	LDA $037F
	TAX
	LDA tbl2_9071,X
	STA sndMusic
	RTS
tbl2_9071:
	db $25 ; overworld map music settings
	db $25
	db $25
	db $25
	db $25
	db $24
	db $24
	db $24
	db $24
	db $24
	db $24
	db $24
	db $24
	db $24
	db $24
	db $24
	db $24
	db $24
	db $28
	db $28
	db $28
	db $28
	db $28
	db $27
	db $27
	db $27
	db $27
	db $27
	db $27
	db $26
	db $26
	db $00
tbl2_9091:
	db $07
	db $08
	db $09
	db $09
	db $0A
	db $0B
	db $0C
	db $04
	db $08
	db $09
	db $0A
	db $0B
	db $0C
	db $0D
	db $0E
	db $0F
	db $10
	db $13
	db $14
	db $13
	db $14
	db $15
	db $16
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
sub2_90B1:
	LDA $0392
	ASL
	TAY
	LDA tbl2_90C3,Y
	STA $32
	LDA tbl2_90C3+1,Y
	STA $33
	JMP ($32)
tbl2_90C3:
	.word ptr9_90F3
	.word ptr9_90F9
	.word ptr9_9102
	.word ptr9_9108
	.word ptr9_9111
	.word ptr9_9117
	.word ptr9_9120
	.word ptr9_9126
sub2_90D3:
	LDX $0361
	LDA tbl2_90DD,X
	STA $0361
	RTS
tbl2_90DD:
	db $00
	db $00
	db $00
	db $00
	db $04
	db $04
	db $04
	db $07
	db $07
	db $07
	db $0A
	db $0A
	db $0A
	db $0D
	db $0E
	db $0F
	db $10
	db $00
	db $04
	db $07
	db $00
	db $00
ptr9_90F3:
	JSR sub2_9138
	JMP loc2_91E9
ptr9_90F9:
	JSR sub2_9138
	JSR sub2_913F
	JMP loc2_91E9
ptr9_9102:
	JSR sub2_913F
	JMP loc2_91E9
ptr9_9108:
	JSR sub2_913F
	JSR sub2_912F
	JMP loc2_91E9
ptr9_9111:
	JSR sub2_912F
	JMP loc2_91E9
ptr9_9117:
	JSR sub2_9146
	JSR sub2_912F
	JMP loc2_91E9
ptr9_9120:
	JSR sub2_9146
	JMP loc2_91E9
ptr9_9126:
	JSR sub2_9146
	JSR sub2_9138
	JMP loc2_91E9
sub2_912F:
	LDA $03
	CMP #$EF
	BCS bra2_9137_RTS
	INC $03
bra2_9137_RTS:
	RTS
sub2_9138:
	LDA $03
	BEQ bra2_913E_RTS
	DEC $03
bra2_913E_RTS:
	RTS
sub2_913F:
	INC playerXLoDup
	BNE bra2_9145_RTS
	INC playerXHiDup
bra2_9145_RTS:
	RTS
sub2_9146:
	DEC playerXLoDup
	LDA playerXLoDup
	CMP #$FF
	BNE bra2_9150_RTS
	DEC playerXHiDup
bra2_9150_RTS:
	RTS
sub2_9151:
	LDA $0392
	ASL
	TAY
	LDA tbl2_9163,Y
	STA $32
	LDA tbl2_9163+1,Y
	STA $33
	JMP ($32)
tbl2_9163:
	.word ptr9_91A1
	.word ptr9_91A7
	.word ptr9_91B2
	.word ptr9_91BA
	.word ptr9_91C5
	.word ptr9_91CB
	.word ptr9_91D6
	.word ptr9_91DE
	.word ptr9_917B
	.word ptr9_9183
	.word ptr9_918B
	.word ptr9_9193
ptr9_917B:
	LDA #$00
	STA mapScreen
	JMP loc2_919B
ptr9_9183:
	LDA #$01
	STA mapScreen
	JMP loc2_919B
ptr9_918B:
	LDA #$02
	STA mapScreen
	JMP loc2_919B
ptr9_9193:
	LDA #$03
	STA mapScreen
	JMP loc2_919B
loc2_919B:
	LDA #$0C
	STA a:gameState
	RTS
ptr9_91A1:
	DEC $0356
	JMP loc2_91E9
ptr9_91A7:
	LDX #$00
	JSR sub2_96F6
	DEC $0356
	JMP loc2_91E9
ptr9_91B2:
	LDX #$00
	JSR sub2_96F6
	JMP loc2_91E9
ptr9_91BA:
	LDX #$00
	JSR sub2_96F6
	INC $0356
	JMP loc2_91E9
ptr9_91C5:
	INC $0356
	JMP loc2_91E9
ptr9_91CB:
	LDX #$00
	JSR sub2_96DB
	INC $0356
	JMP loc2_91E9
ptr9_91D6:
	LDX #$00
	JSR sub2_96DB
	JMP loc2_91E9
ptr9_91DE:
	DEC $0356
	LDX #$00
	JSR sub2_96DB
	JMP loc2_91E9
loc2_91E9:
	INC $037A
	LDA $037A
	CMP $037B
	BNE bra2_91FC_RTS
	INC $0360
	LDA #$00
	STA $037C
bra2_91FC_RTS:
	RTS
tbl2_91FD:
	.word ofs_927D
	.word ofs_9282
	.word ofs_9287
	.word ofs_9290
	.word ofs_9295
	.word ofs_929E
	.word ofs_92A7
	.word ofs_92AC
	.word ofs_92B5
	.word ofs_92BA
	.word ofs_92BF
	.word ofs_92C4
	.word ofs_92C9
	.word ofs_92DE
	.word ofs_92E3
	.word ofs_930C
	.word ofs_9321
	.word ofs_933E
	.word ofs_9367
	.word ofs_9378
	.word ofs_9395
	.word ofs_93A6
	.word ofs_93B7
	.word ofs_93C8
	.word ofs_93D9
	.word ofs_93EE
	.word ofs_93FF
	.word ofs_9404
	.word ofs_9419
	.word ofs_9436
	.word ofs_943B
	.word ofs_9458
	.word ofs_9475
	.word ofs_9486
	.word ofs_94A3
	.word ofs_94B4
	.word ofs_94C5
	.word ofs_94DA
	.word ofs_94EB
	.word ofs_9500
	.word ofs_9519
	.word ofs_9532
	.word ofs_9543
	.word ofs_9554
	.word ofs_956D
	.word ofs_9576
	.word ofs_9587
	.word ofs_959C
	.word ofs_95A5
	.word ofs_95B6
	.word ofs_95CB
	.word ofs_95E8
	.word ofs_95F9
	.word ofs_9612
	.word ofs_962F
	.word ofs_9650
	.word ofs_9669
	.word ofs_9686
	.word ofs_96A7
	.word ofs_96B4
	.word ofs_96CC
	.word ofs_96CD
	.word ofs_96DA
	.word ofs_96DA
ofs_927D:
	db $01
	db $04
	db $30
	db $00
	db $FF
ofs_9282:
	db $01
	db $00
	db $30
	db $03
	db $FF
ofs_9287:
	db $01
	db $03
	db $10
	db $11
	db $01
	db $02
	db $20
	db $11
	db $FF
ofs_9290:
	db $01
	db $00
	db $30
	db $03
	db $FF
ofs_9295:
	db $01
	db $02
	db $10
	db $11
	db $01
	db $01
	db $10
	db $11
	db $FF
ofs_929E:
	db $01
	db $06
	db $20
	db $01
	db $01
	db $07
	db $10
	db $01
	db $FF
ofs_92A7:
	db $00
	db $00
	db $30
	db $03
	db $FF
ofs_92AC:
	db $01
	db $05
	db $10
	db $01
	db $01
	db $06
	db $10
	db $01
	db $FF
ofs_92B5:
	db $00
	db $00
	db $70
	db $03
	db $FF
ofs_92BA:
	db $00
	db $04
	db $30
	db $00
	db $FF
ofs_92BF:
	db $01
	db $06
	db $40
	db $01
	db $FF
ofs_92C4:
	db $00
	db $04
	db $70
	db $00
	db $FF
ofs_92C9:
	db $01
	db $07
	db $10
	db $01
	db $01
	db $00
	db $10
	db $03
	db $01
	db $01
	db $10
	db $11
	db $01
	db $02
	db $20
	db $11
	db $01
	db $03
	db $10
	db $11
	db $FF
ofs_92DE:
	db $01
	db $02
	db $40
	db $11
	db $FF
ofs_92E3:
	db $00
	db $00
	db $4F
	db $03
	db $01
	db $08
	db $00
	db $00
	db $00
	db $00
	db $10
	db $03
	db $00
	db $07
	db $10
	db $01
	db $00
	db $06
	db $10
	db $01
	db $00
	db $07
	db $10
	db $01
	db $00
	db $00
	db $20
	db $03
	db $00
	db $01
	db $10
	db $11
	db $00
	db $02
	db $20
	db $11
	db $00
	db $03
	db $10
	db $11
	db $FF
ofs_930C:
	db $01
	db $07
	db $10
	db $01
	db $01
	db $06
	db $20
	db $01
	db $01
	db $05
	db $10
	db $01
	db $01
	db $04
	db $10
	db $00
	db $01
	db $03
	db $10
	db $11
	db $FF
ofs_9321:
	db $01
	db $04
	db $10
	db $00
	db $01
	db $03
	db $10
	db $11
	db $01
	db $02
	db $10
	db $11
	db $00
	db $02
	db $40
	db $11
	db $00
	db $03
	db $10
	db $11
	db $00
	db $01
	db $10
	db $11
	db $00
	db $00
	db $10
	db $03
	db $FF
ofs_933E:
	db $00
	db $07
	db $10
	db $01
	db $00
	db $06
	db $20
	db $01
	db $00
	db $05
	db $10
	db $01
	db $00
	db $04
	db $20
	db $00
	db $00
	db $03
	db $10
	db $11
	db $00
	db $02
	db $10
	db $11
	db $00
	db $03
	db $10
	db $11
	db $00
	db $04
	db $10
	db $00
	db $01
	db $0A
	db $00
	db $00
	db $00
	db $04
	db $4F
	db $00
	db $FF
ofs_9367:
	db $00
	db $07
	db $10
	db $01
	db $00
	db $00
	db $10
	db $03
	db $00
	db $00
	db $20
	db $02
	db $00
	db $00
	db $10
	db $03
	db $FF
ofs_9378:
	db $00
	db $04
	db $10
	db $00
	db $00
	db $05
	db $10
	db $01
	db $00
	db $07
	db $10
	db $01
	db $00
	db $06
	db $40
	db $01
	db $01
	db $06
	db $10
	db $01
	db $01
	db $07
	db $10
	db $01
	db $01
	db $00
	db $10
	db $03
	db $FF
ofs_9395:
	db $00
	db $01
	db $10
	db $11
	db $00
	db $00
	db $20
	db $02
	db $01
	db $00
	db $10
	db $03
	db $01
	db $00
	db $10
	db $04
	db $FF
ofs_93A6:
	db $00
	db $04
	db $10
	db $00
	db $00
	db $04
	db $20
	db $02
	db $00
	db $04
	db $10
	db $00
	db $00
	db $03
	db $10
	db $11
	db $FF
ofs_93B7:
	db $01
	db $01
	db $08
	db $04
	db $01
	db $01
	db $08
	db $11
	db $00
	db $02
	db $10
	db $11
	db $01
	db $03
	db $10
	db $11
	db $FF
ofs_93C8:
	db $01
	db $04
	db $10
	db $04
	db $01
	db $04
	db $10
	db $00
	db $00
	db $04
	db $20
	db $02
	db $00
	db $05
	db $10
	db $01
	db $FF
ofs_93D9:
	db $01
	db $04
	db $10
	db $00
	db $01
	db $04
	db $30
	db $02
	db $00
	db $02
	db $10
	db $11
	db $00
	db $01
	db $10
	db $11
	db $01
	db $00
	db $10
	db $03
	db $FF
ofs_93EE:
	db $01
	db $07
	db $10
	db $01
	db $00
	db $06
	db $10
	db $01
	db $01
	db $05
	db $08
	db $01
	db $01
	db $05
	db $08
	db $04
	db $FF
ofs_93FF:
	db $00
	db $02
	db $60
	db $11
	db $FF
ofs_9404:
	db $01
	db $04
	db $10
	db $00
	db $00
	db $05
	db $10
	db $01
	db $00
	db $06
	db $10
	db $01
	db $01
	db $00
	db $30
	db $02
	db $01
	db $00
	db $10
	db $03
	db $FF
ofs_9419:
	db $00
	db $04
	db $10
	db $00
	db $00
	db $03
	db $10
	db $11
	db $00
	db $04
	db $10
	db $00
	db $00
	db $04
	db $40
	db $02
	db $00
	db $02
	db $20
	db $11
	db $00
	db $01
	db $10
	db $11
	db $00
	db $02
	db $20
	db $11
	db $FF
ofs_9436:
	db $00
	db $06
	db $60
	db $01
	db $FF
ofs_943B:
	db $00
	db $02
	db $20
	db $11
	db $00
	db $01
	db $10
	db $11
	db $00
	db $00
	db $28
	db $02
	db $01
	db $06
	db $10
	db $01
	db $01
	db $00
	db $28
	db $02
	db $00
	db $01
	db $10
	db $11
	db $00
	db $02
	db $10
	db $11
	db $FF
ofs_9458:
	db $00
	db $06
	db $20
	db $01
	db $00
	db $05
	db $10
	db $01
	db $00
	db $06
	db $20
	db $01
	db $00
	db $00
	db $40
	db $02
	db $00
	db $00
	db $10
	db $03
	db $00
	db $07
	db $10
	db $01
	db $00
	db $00
	db $10
	db $03
	db $FF
ofs_9475:
	db $00
	db $02
	db $10
	db $11
	db $01
	db $01
	db $10
	db $11
	db $00
	db $02
	db $10
	db $11
	db $00
	db $03
	db $10
	db $11
	db $FF
ofs_9486:
	db $00
	db $06
	db $10
	db $01
	db $00
	db $05
	db $10
	db $01
	db $01
	db $04
	db $28
	db $02
	db $01
	db $02
	db $10
	db $11
	db $00
	db $04
	db $28
	db $02
	db $00
	db $05
	db $10
	db $01
	db $00
	db $06
	db $20
	db $01
	db $FF
ofs_94A3:
	db $00
	db $04
	db $20
	db $00
	db $00
	db $04
	db $50
	db $02
	db $00
	db $04
	db $10
	db $00
	db $00
	db $03
	db $10
	db $00
	db $FF
ofs_94B4:
	db $00
	db $07
	db $10
	db $01
	db $00
	db $06
	db $10
	db $01
	db $01
	db $05
	db $10
	db $01
	db $00
	db $06
	db $10
	db $01
	db $FF
ofs_94C5:
	db $01
	db $04
	db $28
	db $00
	db $00
	db $04
	db $38
	db $00
	db $01
	db $05
	db $10
	db $01
	db $01
	db $06
	db $20
	db $01
	db $01
	db $05
	db $10
	db $01
	db $FF
ofs_94DA:
	db $00
	db $07
	db $10
	db $03
	db $00
	db $00
	db $10
	db $03
	db $00
	db $00
	db $50
	db $02
	db $00
	db $00
	db $20
	db $03
	db $FF
ofs_94EB:
	db $01
	db $09
	db $00
	db $00
	db $00
	db $05
	db $10
	db $01
	db $00
	db $04
	db $10
	db $00
	db $00
	db $03
	db $10
	db $11
	db $00
	db $02
	db $70
	db $11
	db $FF
ofs_9500:
	db $01
	db $0B
	db $00
	db $03
	db $01
	db $01
	db $10
	db $11
	db $01
	db $02
	db $20
	db $11
	db $01
	db $01
	db $10
	db $11
	db $00
	db $00
	db $38
	db $03
	db $01
	db $00
	db $28
	db $03
	db $FF
ofs_9519:
	db $00
	db $05
	db $10
	db $01
	db $00
	db $06
	db $10
	db $01
	db $00
	db $05
	db $10
	db $01
	db $00
	db $06
	db $50
	db $01
	db $00
	db $05
	db $08
	db $01
	db $00
	db $05
	db $08
	db $04
	db $FF
ofs_9532:
	db $00
	db $06
	db $70
	db $01
	db $00
	db $07
	db $10
	db $01
	db $00
	db $00
	db $10
	db $03
	db $00
	db $01
	db $10
	db $11
	db $FF
ofs_9543:
	db $00
	db $03
	db $08
	db $04
	db $00
	db $03
	db $08
	db $11
	db $00
	db $02
	db $10
	db $11
	db $00
	db $03
	db $10
	db $11
	db $FF
ofs_9554:
	db $00
	db $01
	db $08
	db $04
	db $00
	db $01
	db $08
	db $11
	db $00
	db $02
	db $50
	db $11
	db $00
	db $01
	db $10
	db $11
	db $00
	db $02
	db $10
	db $11
	db $00
	db $01
	db $10
	db $11
	db $FF
ofs_956D:
	db $00
	db $04
	db $70
	db $00
	db $01
	db $04
	db $10
	db $00
	db $FF
ofs_9576:
	db $00
	db $07
	db $10
	db $01
	db $00
	db $06
	db $10
	db $01
	db $00
	db $07
	db $08
	db $05
	db $00
	db $07
	db $08
	db $04
	db $FF
ofs_9587:
	db $01
	db $03
	db $10
	db $11
	db $01
	db $02
	db $10
	db $11
	db $01
	db $01
	db $10
	db $11
	db $01
	db $02
	db $20
	db $11
	db $01
	db $03
	db $10
	db $11
	db $FF
ofs_959C:
	db $01
	db $00
	db $10
	db $03
	db $00
	db $00
	db $70
	db $03
	db $FF
ofs_95A5:
	db $01
	db $05
	db $10
	db $01
	db $00
	db $06
	db $20
	db $01
	db $01
	db $05
	db $10
	db $01
	db $00
	db $06
	db $50
	db $01
	db $FF
ofs_95B6:
	db $01
	db $07
	db $10
	db $01
	db $01
	db $06
	db $20
	db $01
	db $01
	db $05
	db $10
	db $01
	db $01
	db $06
	db $10
	db $01
	db $01
	db $07
	db $10
	db $01
	db $FF
ofs_95CB:
	db $00
	db $06
	db $10
	db $01
	db $01
	db $07
	db $10
	db $01
	db $00
	db $06
	db $40
	db $01
	db $01
	db $05
	db $10
	db $01
	db $00
	db $06
	db $10
	db $01
	db $01
	db $07
	db $10
	db $01
	db $01
	db $00
	db $10
	db $03
	db $FF
ofs_95E8:
	db $00
	db $02
	db $50
	db $11
	db $01
	db $01
	db $10
	db $11
	db $00
	db $02
	db $20
	db $11
	db $01
	db $01
	db $10
	db $11
	db $FF
ofs_95F9:
	db $00
	db $07
	db $10
	db $01
	db $00
	db $06
	db $50
	db $01
	db $00
	db $05
	db $10
	db $01
	db $01
	db $05
	db $10
	db $01
	db $00
	db $06
	db $30
	db $01
	db $01
	db $05
	db $10
	db $01
	db $FF
ofs_9612:
	db $01
	db $04
	db $10
	db $00
	db $01
	db $03
	db $10
	db $11
	db $00
	db $02
	db $10
	db $11
	db $01
	db $01
	db $10
	db $11
	db $00
	db $02
	db $40
	db $11
	db $01
	db $03
	db $10
	db $11
	db $00
	db $02
	db $10
	db $11
	db $FF
ofs_962F:
	db $00
	db $06
	db $10
	db $01
	db $00
	db $07
	db $10
	db $01
	db $01
	db $00
	db $10
	db $03
	db $01
	db $01
	db $10
	db $11
	db $01
	db $00
	db $30
	db $03
	db $00
	db $00
	db $30
	db $03
	db $00
	db $01
	db $20
	db $11
	db $00
	db $02
	db $10
	db $11
	db $FF
ofs_9650:
	db $01
	db $01
	db $10
	db $11
	db $00
	db $02
	db $30
	db $11
	db $01
	db $01
	db $10
	db $11
	db $00
	db $01
	db $10
	db $11
	db $00
	db $02
	db $50
	db $11
	db $00
	db $03
	db $10
	db $11
	db $FF
ofs_9669:
	db $00
	db $00
	db $10
	db $03
	db $00
	db $01
	db $10
	db $11
	db $00
	db $02
	db $60
	db $11
	db $00
	db $03
	db $10
	db $11
	db $00
	db $04
	db $10
	db $00
	db $00
	db $02
	db $20
	db $11
	db $00
	db $02
	db $10
	db $11
	db $FF
ofs_9686:
	db $00
	db $06
	db $10
	db $01
	db $00
	db $05
	db $20
	db $01
	db $00
	db $04
	db $30
	db $00
	db $01
	db $04
	db $30
	db $00
	db $01
	db $05
	db $10
	db $01
	db $01
	db $04
	db $10
	db $00
	db $00
	db $03
	db $10
	db $11
	db $00
	db $02
	db $10
	db $11
	db $FF
ofs_96A7:
	db $00
	db $00
	db $30
	db $03
	db $00
	db $00
	db $28
	db $06
	db $00
	db $00
	db $08
	db $03
	db $FF
ofs_96B4:
	db $00
	db $06
	db $30
	db $01
	db $00
	db $00
	db $10
	db $03
	db $00
	db $07
	db $10
	db $01
	db $00
	db $06
	db $60
	db $01
	db $00
	db $05
	db $10
	db $01
	db $00
	db $04
	db $10
	db $00
ofs_96CC:
	db $FF
ofs_96CD:
	db $00
	db $04
	db $08
	db $00
	db $00
	db $04
	db $28
	db $04
	db $00
	db $04
	db $30
	db $00
	db $FF
ofs_96DA:
	db $FF
sub2_96DB:
	DEC gs0SpriteX,X
	LDA gs0SpriteX,X
	CMP #$FF
	BNE bra2_96E6
	DEC gs0SpriteFlags,X
bra2_96E6:
	LDA gs0SpriteFlags,X
	BNE bra2_96F5_RTS
	LDA gs0SpriteX,X
	CMP #$20
	BCS bra2_96F5_RTS
	LDA #$00
	STA $B2,X
bra2_96F5_RTS:
	RTS
sub2_96F6:
	INC gs0SpriteX,X ; Move sprite one pixel ahead
	BNE bra2_96FD_RTS
	INC gs0SpriteFlags,X ; Make sprite visible?
bra2_96FD_RTS:
	RTS
sub_42_96FE:
	LDX $0395
	LDA $030C
	BEQ bra2_9720_RTS
	CMP tbl2_9721,X
	BNE bra2_971B
	INC $0395
	LDA $0395
	CMP #$07
	BCC bra2_9720_RTS
	LDA #$01
	STA $0396
	RTS
bra2_971B:
	LDA #$00
	STA $0395
bra2_9720_RTS:
	RTS
tbl2_9721:
	db $20
	db $20
	db $20
	db $20
	db $20
	db $40
	db $40
AnimateMapPlayer:
	LDA frameCount
	AND #$07
	BNE bra2_9752_RTS ; Only do this every 8th frame
	LDA playerMapAnim
	ASL
	TAX ; Get pointer for the player's map animation
	LDA tbl2_9753,X
	STA scratchRam
	LDA tbl2_9753+1,X
	STA scratchRam+1 ; Load pointer
	LDY playerMapFrame
bra2_9740:
	LDA (scratchRam),Y
	CMP #$FF
	BNE bra2_974D ; Continue until terminating byte is reached
	LDY #$00
	STY playerMapFrame
	BEQ bra2_9740 ; Loop back to the start of the animation
bra2_974D:
	STA gs0SpriteFrame ; Update the player's sprite
	INC playerMapFrame ; Go to the next animation frame
bra2_9752_RTS:
	RTS
tbl2_9753:
	.word ofs_978D
	.word ofs_9792
	.word ofs_9795
	.word ofs_9798
	.word ofs_979D
	.word ofs_97A0
	.word ofs_97A3
	.word ofs_97A6
	.word ofs_97A9
	.word ofs_97AC
	.word ofs_97AF
	.word ofs_97B2
	.word ofs_97B5
	.word ofs_97B8
	.word ofs_97BB
	.word ofs_97BE
	.word ofs_97C1
	.word ofs_97C4
	.word ofs_97C7
	.word ofs_97CA
	.word ofs_97CD
	.word ofs_97D0
	.word ofs_97D0
	.word ofs_97D0
	.word ofs_97D0
	.word ofs_97D0
	.word ofs_97D0
	.word ofs_97D0
	.word ofs_97D0
ofs_978D:
	db $16
	db $17
	db $18
	db $17
	db $FF
ofs_9792:
	db $19
	db $1A
	db $FF
ofs_9795:
	db $1B
	db $1C
	db $FF
ofs_9798:
	db $1D
	db $1E
	db $1F
	db $1E
	db $FF
ofs_979D:
	db $20
	db $21
	db $FF
ofs_97A0:
	db $22
	db $23
	db $FF
ofs_97A3:
	db $24
	db $25
	db $FF
ofs_97A6:
	db $28
	db $29
	db $FF
ofs_97A9:
	db $2A
	db $2B
	db $FF
ofs_97AC:
	db $2C
	db $2D
	db $FF
ofs_97AF:
	db $2E
	db $2F
	db $FF
ofs_97B2:
	db $30
	db $31
	db $FF
ofs_97B5:
	db $32
	db $33
	db $FF
ofs_97B8:
	db $34
	db $34
	db $FF
ofs_97BB:
	db $35
	db $36
	db $FF
ofs_97BE:
	db $37
	db $38
	db $FF
ofs_97C1:
	db $39
	db $3A
	db $FF
ofs_97C4:
	db $3B
	db $3C
	db $FF
ofs_97C7:
	db $3D
	db $3E
	db $FF
ofs_97CA:
	db $3F
	db $40
	db $FF
ofs_97CD:
	db $41
	db $42
	db $FF
ofs_97D0:
	db $00
	db $00
	db $FF
sub_42_97D3:
	LDA #$2B
	STA PPUADDR
	LDA #$40
	STA PPUADDR
	LDX #$00
bra2_97DF:
	LDA #$71
	STA PPUDATA
	INX
	CPX #$80
	BCC bra2_97DF
	RTS
	db $71
	db $71
	db $71
	db $71
	db $71
	db $71
	db $71
	db $71
	db $71
	db $06
	db $06
	db $06
	db $06
	db $00
	db $9F
	db $A0
	db $A1
	db $A2
	db $00
	db $00
	db $07
	db $08
	db $09
	db $00
	db $00
	db $00
	db $06
	db $0A
	db $13
	db $71
	db $71
	db $71
	db $00
	db $00
	db $00
	db $0A
	db $0F
	db $0F
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $A3
	db $00
	db $00
	db $AA
	db $00
	db $00
	db $0C
	db $0D
	db $0E
	db $00
	db $16
	db $17
	db $18
	db $18
	db $19
	db $15
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
	db $A4
	db $00
	db $00
	db $A9
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
	db $A5
	db $A6
	db $A7
	db $A8
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
TransitionScreenSub:
	LDX #$21
	STX PPUADDR ; Set upper byte of address
	LDX #$80
	STX PPUADDR ; Set lower byte of address
	LDY #$00 ; Clear Y register
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL ; Get index for transition screen
	TAX
RenderTransitionScreen:
	LDA TransitionScreenData,X
	STA PPUDATA
	INX
	INY
	CPY #$40 ; Render 2 rows of tiles
	BCC RenderTransitionScreen
	RTS
TransitionScreenData:
; "GAME OVER" Tilemap
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
	db $02
	db $03
	db $04
	db $05
	db $00
	db $00
	db $06
	db $07
	db $08
	db $09
	db $0A
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
	db $0B
	db $0C
	db $0D
	db $0E
	db $0F
	db $00
	db $00
	db $10
	db $11
	db $12
	db $13
	db $14
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
; "MARIO START!" Tilemap
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $15
	db $16
	db $17
	db $18
	db $19
	db $1A
	db $00
	db $1B
	db $1C
	db $1D
	db $17
	db $1E
	db $1F
	db $00
	db $20
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
	db $21
	db $22
	db $23
	db $24
	db $25
	db $26
	db $00
	db $27
	db $28
	db $29
	db $2A
	db $2B
	db $2C
	db $00
	db $2D
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
; "TIME UP!" Tilemap
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
	db $2E
	db $2F
	db $30
	db $31
	db $32
	db $00
	db $33
	db $34
	db $00
	db $35
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
	db $36
	db $37
	db $38
	db $39
	db $3A
	db $00
	db $3B
	db $3C
	db $00
	db $3D
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
; "LUIGI START!" Tilemap
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $35
	db $3E
	db $3F
	db $40
	db $41
	db $00
	db $00
	db $42
	db $43
	db $44
	db $45
	db $46
	db $47
	db $00
	db $48
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
	db $49
	db $4A
	db $4B
	db $4C
	db $4D
	db $00
	db $00
	db $4E
	db $4F
	db $0C
	db $50
	db $51
	db $52
	db $00
	db $53
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
pnt5_998A:
	LDA frameCount
	AND #$07
	BNE bra2_999F
	INC $032F
	LDA $032F
	CMP #$03
	BCC bra2_999F
	LDA #$00
	STA $032F
bra2_999F:
	LDX #$00
	LDA $032F
	AND #$03
bra2_99A6:
	STA spriteMem+2,X
	INX
	INX
	INX
	INX
	CPX #$40
	BCC bra2_99A6
	RTS
sub_42_99B2:
	LDA frameCount
	AND #$07
	BNE bra2_99BB
	INC $032F
bra2_99BB:
	LDA $032F
	AND #$01
	BNE bra2_99CC
	LDA #$00
	STA $034E
	LDA #$90
	STA $42
	RTS
bra2_99CC:
	LDA #$01
	STA $034E
	LDA #$40
	STA $42
	RTS
sub_42_99D6:
	LDA $037F
	ASL
	ASL
	TAX
	LDA tbl2_9A8D,X
	STA cameraXHi
	STA playerCollXHi
	STA playerXHi
	LDA tbl2_9A8E,X
	STA $52
	STA $65
	STA $02
	CLC
	ADC playerXLo
	STA playerXLo
	LDA playerXHi
	ADC #$00
	STA playerXHi
	RTS
sub_42_99FA:
	ASL
	TAX
	LDA tbl2_9A2E,X
	STA $25
	LDA tbl2_9A2F,X
	STA $26
	LDY #$00
	LDA ($25),Y
	STA ppuUpdatePtr
	INY
	LDA ($25),Y
	STA ppuUpdatePtr+1
	INY
	LDA ($25),Y
	STA $03A3
	INY
	LDA ($25),Y
	STA ppuBufSize
	INY
	LDX #$00
bra2_9A22:
	LDA ($25),Y
	STA ppuDataBuf,X
	INY
	INX
	CPX #$20
	BCC bra2_9A22
	RTS
tbl2_9A2E:
	db $30
tbl2_9A2F:
	db $9A
	db $3F
	db $10
	db $01
	db $10
	db $11
	db $0E
	db $26
	db $30
	db $11
	db $0E
	db $26
	db $30
	db $11
	db $0E
	db $26
	db $30
	db $11
	db $0E
	db $26
	db $30
CHRBankSub:
	ASL
	TAY ; Get pointer for value
	LDA BankPointers,Y
	STA $32 ; Load lower byte of pointer
	LDA BankPointers+1,Y
	STA $33 ; Load upper byte of pointer
	LDY #$00
bra2_9A52:
	LDA ($32),Y ; Load banks from pointer location
	STA chrBgBank1,Y ; Set CHR banks
	INY
	CPY #$06
	BCC bra2_9A52
	RTS
BankPointers:
	.word TitleLogoBanks
	.word EndingBanks
	.word ThankYouBanks
	.word CopyrightBanks
	.word OverworldBanks
	.word TransitionBanks
TitleLogoBanks: ; Format:
	db $FC ; 1st+2nd BG Bank
	db $FE ; 3rd+4th BG Bank
	db $80 ; 1st Sprite Bank
	db $81 ; 2nd Sprite Bank
	db $94 ; 3rd Sprite Bank
	db $95 ; 4th Sprite Bank
EndingBanks:
	db $F8
	db $FA
	db $F8
	db $F9
	db $FA
	db $FB
ThankYouBanks:
	db $F4
	db $F6
	db $80
	db $81
	db $82
	db $83
CopyrightBanks:
	db $F8
	db $FA
	db $80
	db $81
	db $82
	db $83
OverworldBanks:
	db $E8
	db $EA
	db $80
	db $81
	db $82
	db $83
TransitionBanks:
	db $F2
	db $EC
	db $00
	db $00
	db $00
	db $00
tbl2_9A8D:
	db $05
tbl2_9A8E:
	db $00
	db $EF
	db $00
	db $05
	db $00
	db $EF
	db $00
	db $05
	db $00
	db $EF
	db $00
	db $05
	db $00
	db $EF
	db $00
	db $05
	db $00
	db $BF
	db $00
	db $05
	db $00
	db $4F
	db $00
	db $05
	db $00
	db $4F
	db $00
	db $05
	db $00
	db $4F
	db $00
	db $09
	db $10
	db $9F
	db $00
	db $09
	db $70
	db $8F
	db $00
	db $09
	db $60
	db $3F
	db $00
	db $09
	db $70
	db $0F
	db $00
	db $09
	db $80
	db $0F
	db $00
	db $09
	db $A0
	db $00
	db $00
	db $0A
	db $00
	db $00
	db $00
	db $0A
	db $60
	db $60
	db $00
	db $0A
	db $B0
	db $18
	db $00
	db $0A
	db $E0
	db $28
	db $00
	db $0A
	db $F0
	db $B8
	db $00
	db $0A
	db $F0
	db $EF
	db $00
	db $07
	db $60
	db $30
	db $00
	db $06
	db $D0
	db $60
	db $00
	db $07
	db $00
	db $80
	db $00
	db $07
	db $00
	db $EF
	db $00
	db $07
	db $00
	db $EF
	db $00
	db $06
	db $90
	db $EF
	db $00
	db $06
	db $30
	db $EF
	db $00
	db $05
	db $90
	db $EF
	db $00
	db $05
	db $A0
	db $8F
	db $00
	db $06
	db $50
	db $8F
	db $00
	db $06
	db $50
	db $2F
	db $00
	db $05
	db $00
	db $00
	db $00
ClearNametable:
	ASL
	ASL
	CLC
	ADC #$20 ; Add $20 to upper byte
	LDX #$00 ; Set lower byte of address and nametable size
	STA PPUADDR
	STX PPUADDR
	LDY #$03 ; Set upper byte of nametable size (in tiles)
	LDA #$FF
ClearNTLoop:
	STA PPUDATA
	DEX
	BNE ClearNTLoop
	DEY
	BPL ClearNTLoop ; Clear the entire screen
	RTS
pnt5_9B28:
	LDA #$00
	STA $032F
	INC a:gameState
	LDA $037F
	ASL
	TAX
	LDA $0397
	BNE bra2_9B3E
	STA $0379
	RTS
bra2_9B3E:
	INC $037F
	JMP loc2_9B4C
	LDA $037F
	BEQ bra2_9B4C
	DEC $037F
bra2_9B4C:
loc2_9B4C:
	STX $0391
	LDA #$FF
	STA $0379
	LDA #$00
	STA $0360
	STA $037C
	LDX #$01
	LDA $0399
	BNE bra2_9B65
	LDX #$00
bra2_9B65:
	INC $039C,X
	RTS
	CLC
	ADC gs0SpriteX,X
	STA gs0SpriteX,X
	BCC bra2_9B73_RTS
	INC gs0SpriteFlags,X
bra2_9B73_RTS:
	RTS
	STA $25
	SEC
	LDA gs0SpriteX,X
	SBC $25
	STA gs0SpriteX,X
	BCS bra2_9B82_RTS
	DEC gs0SpriteFlags,X
bra2_9B82_RTS:
	RTS
tbl_9B83:
	db $00
	db $60
	db $30
	db $00
	db $00
	db $60
	db $60
	db $00
	db $00
	db $90
	db $70
	db $00
	db $00
	db $B0
	db $60
	db $00
	db $00
	db $B0
	db $60
	db $00
	db $00
	db $B0
	db $60
	db $00
	db $00
	db $70
	db $60
	db $00
	db $00
	db $A0
	db $40
	db $00
	db $00
	db $A0
	db $40
	db $00
	db $00
	db $C0
	db $60
	db $00
	db $00
	db $C0
	db $60
	db $00
	db $00
	db $C0
	db $40
	db $00
	db $00
	db $E0
	db $40
	db $00
	db $00
	db $E0
	db $70
	db $00
	db $00
	db $E0
	db $70
	db $00
	db $00
	db $E0
	db $70
	db $00
	db $00
	db $D0
	db $48
	db $00
	db $00
	db $E0
	db $38
	db $00
	db $00
	db $E0
	db $38
	db $00
	db $00
	db $A0
	db $80
	db $00
	db $00
	db $A0
	db $80
	db $00
	db $00
	db $A0
	db $80
	db $00
	db $00
	db $A0
	db $80
	db $00
	db $00
	db $A0
	db $90
	db $00
	db $01
	db $00
	db $A0
	db $00
	db $00
	db $E0
	db $C0
	db $00
	db $00
	db $B0
	db $A0
	db $00
	db $00
	db $90
	db $C0
	db $00
	db $00
	db $A0
	db $70
	db $00
	db $00
	db $A0
	db $70
	db $00
	db $00
	db $A0
	db $70
	db $00
	db $00
	db $00
	db $00
	db $00
MapDirections:
; 1-Yoshi House
	db BTN_DOWN ; Next level
	db $00 ; Previous level
; 1-1
	db BTN_DOWN
	db BTN_UP
; 1-2
	db BTN_RIGHT
	db BTN_LEFT
; 1-3
	db BTN_UP
	db BTN_DOWN
; 1-4
	db BTN_UP
	db BTN_DOWN
; 2-1
	db BTN_LEFT
	db BTN_DOWN
; 2-Yoshi House
	db BTN_LEFT
	db BTN_RIGHT
; 2-2
	db BTN_UP
	db BTN_LEFT
; 2-3
	db BTN_DOWN
	db BTN_UP
; 2-4
	db BTN_UP
	db BTN_DOWN
; 3-1
	db BTN_RIGHT
	db BTN_DOWN
; 3-2
	db BTN_UP
	db BTN_DOWN
; 3-3
	db BTN_DOWN
	db BTN_UP
; 3-4
	db BTN_RIGHT
	db BTN_DOWN
; 4-1
	db BTN_DOWN
	db BTN_LEFT
; 4-2
	db BTN_RIGHT
	db BTN_LEFT
; 4-3
	db BTN_RIGHT
	db BTN_LEFT
; 4-4
	db BTN_DOWN
	db BTN_UP
; 5-1
	db BTN_DOWN
	db BTN_LEFT
; 5-2
	db BTN_DOWN
	db BTN_UP
; 5-Yoshi House
	db BTN_DOWN
	db BTN_LEFT
; 5-3
	db BTN_DOWN
	db BTN_UP
; 5-4
	db BTN_DOWN
	db BTN_UP
; 6-1
	db BTN_DOWN
	db BTN_UP
; 6-2
	db BTN_DOWN
	db BTN_UP
; 6-3
	db BTN_LEFT
	db BTN_RIGHT
; 6-4
	db BTN_UP
	db BTN_DOWN
; 7-1
	db BTN_LEFT
	db BTN_UP
; 7-2
	db BTN_UP
	db BTN_LEFT
; 7-3
	db BTN_UP
	db BTN_LEFT
; 7-4
	db $00
	db BTN_DOWN
; Unused
	db $00
	db $00
sub_42_9C43:
	JSR sub2_9CCF
	LDX #$00
	LDA $0399
	BEQ bra2_9C4F
	LDX #$01
bra2_9C4F:
	LDA $036A,X
	STA $34
	LDA #$00
	STA $35
	LDA #$0B
	STA $26
	JSR sub2_9C78
	LDA #$2B
	STA PPUADDR
	LDA #$69
	STA PPUADDR
	LDY #$01
	LDX #$01
bra2_9C6D:
	LDA $0378,Y
	STA PPUDATA
	DEY
	DEX
	BPL bra2_9C6D
	RTS
sub2_9C78:
	LDA #$00
	STA $39
	STA $25
	LDA #$0A
	STA $38
bra2_9C82:
	JSR sub2_9CA9
	LDA $32
	CLC
	ADC $26
	LDY $25
	STA $0378,Y
	INC $25
	LDA $25
	CMP #$05
	BCC bra2_9C82
	LDY #$04
bra2_9C99:
	LDA $0378,Y
	CMP $26
	BNE bra2_9CA8_RTS
	LDA #$00
	STA $0378,Y
	DEY
	BNE bra2_9C99
bra2_9CA8_RTS:
	RTS
sub2_9CA9:
	LDA #$00
	STA $32
	STA $33
	LDX #$10
bra2_9CB1:
	ASL $34
	ROL $35
	ROL $32
	ROL $33
	LDA $32
	SEC
	SBC $38
	TAY
	LDA $33
	SBC $39
	BCC bra2_9CCB
	INC $34
	STA $33
	STY $32
bra2_9CCB:
	DEX
	BNE bra2_9CB1
	RTS
sub2_9CCF:
	LDA #$2B
	STA PPUADDR
	LDA #$40
	STA PPUADDR
	LDX #$00
	LDA $0399
	BNE bra2_9CEC
bra2_9CE0:
	LDA tbl2_9CF8,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra2_9CE0
	RTS
bra2_9CEC:
	LDA tbl2_9D78,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra2_9CEC
	RTS
tbl2_9CF8:
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
	db $01
	db $02
	db $03
	db $04
	db $05
	db $00
	db $0A
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
	db $00
	db $00
	db $00
	db $00
tbl2_9D78:
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
	db $2B
	db $2C
	db $2D
	db $2E
	db $2F
	db $00
	db $0A
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
	db $00
	db $00
	db $00
	db $00
DrawDestroyedCastle:
	LDA #$00
	STA $25 ; Set castle number/index
bra2_9DFC:
	LDA $25
	TAX
	INX ; Set index for player #1
	LDA curPlayer
	BEQ bra2_9E0B ; Branch if player #1 is playing
	LDA $25 ; Otherwise, continue
	CLC
	ADC #$09
	TAX ; Set index for player #2
bra2_9E0B:
	LDA castlesDestroyed,X
	BEQ bra2_9E53 ; Branch if the castle isn't destroyed
	LDA $25 ; Otherwise, continue
	TAX
	LDA DestroyedCastleAttr,X
	STA $29 ; Assign attributes to the destroyed castle sprite
	LDA $25
	ASL
	ASL
	TAX ; Get table index for castle
	ASL
	ASL
	TAY
	LDA tbl2_9E5C,X
	STA $32 ; Set the horizontal screen
	SEC
	LDA tbl2_9E5C+1,X
	SBC $52
	STA scratchRam+8 ; Location - camera position = screen position
	BCS bra2_9E31
	DEC $32
bra2_9E31:
	LDA $32
	CMP $51
	BNE bra2_9E4C ; If the sprite is off-screen, stop rendering it
	LDA tbl2_9E5C+2,X
	STA $32 ; Set the sprite's vertical screen
	SEC
	LDA tbl2_9E5C+3,X
	SBC scrollY
	STA $38 ; Location - camera position = screen position
	BCS bra2_9E48
	DEC $32
bra2_9E48:
	LDA $32
	BEQ bra2_9E50
bra2_9E4C:
	LDA #$F8
	STA $38 ; Hide the castle sprite
bra2_9E50:
	JSR sub2_9E7A
bra2_9E53:
	INC $25
	LDA $25
	CMP #$06
	BCC bra2_9DFC
	RTS
tbl2_9E5C:
; Castle #1
	db $05 ; X Screen
	db $70 ; X Position
	db $01 ; Y Screen
	db $1F ; Y Position
; Castle #2
	db $09
	db $F0
	db $00
	db $EF
; Castle #3
	db $0A
	db $40
	db $00
	db $6F
; Castle #4
	db $0B
	db $80
	db $00
	db $5F
; Castle #5
	db $07
	db $60
	db $00
	db $FF
; Castle #6
	db $06
	db $A0
	db $01
	db $8F
DestroyedCastleAttr:
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
sub2_9E7A:
	LDA $25
	ASL
	ASL
	ORA #$80
	STA $28
	CLC
	LDA $38
	STA $0280,Y
	LDA $28
	STA $0281,Y
	LDA $29
	STA $0282,Y
	LDA $36
	STA $0283,Y
	LDA $38
	STA $0284,Y
	INC $28
	LDA $28
	STA $0285,Y
	LDA $29
	STA $0286,Y
	LDA $36
	ADC #$08
	STA $0287,Y
	LDA $38
	ADC #$08
	STA $0288,Y
	INC $28
	LDA $28
	STA $0289,Y
	LDA $29
	STA $028A,Y
	LDA $36
	STA $028B,Y
	LDA $38
	ADC #$08
	STA $028C,Y
	INC $28
	LDA $28
	STA $028D,Y
	LDA $29
	STA $028E,Y
	LDA $36
	ADC #$08
	STA $028F,Y
	RTS
