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
	.byte $11, $30, $2A, $0E
	.byte $11, $38, $26, $0E
	.byte $11, $37, $2A, $1A
	.byte $11, $39, $29, $1A
	
	.byte $11, $30, $2A, $0E
	.byte $11, $38, $26, $0E
	.byte $11, $37, $2A, $1A
	.byte $11, $39, $29, $1A
	
	.byte $0E, $20, $35, $1A
	.byte $0E, $21, $11, $14
	.byte $0E, $20, $35, $38
	.byte $0E, $20, $24, $14
	
	.byte $0E, $20, $35, $1A
	.byte $0E, $21, $11, $14
	.byte $0E, $20, $35, $38
	.byte $0E, $20, $24, $14
	
	.byte $0E, $2A, $2C, $36
	.byte $0E, $37, $27, $38
	.byte $0E, $2A, $37, $30
	.byte $0E, $1C, $2C, $30
	
	.byte $0E, $2A, $2C, $36
	.byte $0E, $37, $27, $38
	.byte $0E, $2A, $37, $30
	.byte $0E, $1C, $2C, $30
	
	.byte $0E, $11, $2C, $30
	.byte $0E, $37, $27, $38
	.byte $0E, $2A, $37, $30
	.byte $0E, $1C, $2C, $30
	
	.byte $0E, $2A, $2C, $36
	.byte $0E, $37, $27, $38
	.byte $0E, $2A, $37, $30
	.byte $0E, $1C, $2C, $30
	
	.byte $60
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
	.byte $00
	.byte $00
	.byte $A0, $80 ; 1/2 Player Text X/Y Position
	.byte $90, $80 ; Cursor X/Y Position
	.byte $40 ; Unknown
	.byte $20 ; Unknown
	.byte $50
	.byte $AA
	.byte $50
	.byte $AA
	.byte $50
	.byte $AA
	.byte $50
	.byte $AA
	.byte $50
	.byte $AA

;----------------------------------------
; Title Screen Sprites
TitleSpriteFrameTypes:
	.byte $00, $00
	.byte $00, $00
	.byte $00, $00
	.byte $01, $0B
	.byte $01, $03
	.byte $01, $03
	.byte $01, $03 ; Koopa Walk 1
	.byte $01, $01 ; Koopa Walk 2
	.byte $01, $01 ; Rex Walk 1
	.byte $01, $05 ; Rex Walk 2
	.byte $01, $05
	.byte $01, $07
	.byte $01, $07 ; Super Koopa Fly 1
	.byte $01, $02 ; Super Koopa Fly 2
	.byte $01, $02
	.byte $01, $06
	.byte $01, $06 ; Mario Walk 1
	.byte $01, $08 ; Mario Walk 2
	.byte $01, $08 ; Yoshi Walk 1
	.byte $01, $09 ; Yoshi Walk 2
	.byte $01, $0A
	.byte $01, $0A
	.byte $01, $0A
	.byte $01, $0A
	.byte $01, $0A

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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
SprMap_TitleKoopaAnim:
	.byte $07
	.byte $08
	.byte $94
	.byte $0F
	.byte $80
SprMap_TitleSuperKoopaAnim:
	.byte $0D
	.byte $0E
	.byte $96
	.byte $07
	.byte $C0
TitlePopEffectAnim:
	.byte $04
	.byte $04
	.byte $FF
	.byte $0F
	.byte $00
pnt3_8A80:
	.byte $01
	.byte $01
	.byte $FA
	.byte $0F
	.byte $80
SprMap_TitleRexAnim:
	.byte $09
	.byte $0A
	.byte $95
	.byte $0F
	.byte $80
pnt3_8A8A:
	.byte $0F
	.byte $10
	.byte $95
	.byte $0F
	.byte $C0
pnt3_8A8F:
	.byte $0B
	.byte $0C
	.byte $94
	.byte $0F
	.byte $C0
SprMap_TitleMarioAnim:
	.byte $11
	.byte $12
	.byte $FF
	.byte $0F
	.byte $00
SprMap_TitleYoshi_WalkAnim:
	.byte $13
	.byte $14
	.byte $FF
	.byte $0F
	.byte $00
pnt3_8A9E:
	.byte $13
	.byte $14
	.byte $FF
	.byte $0F
	.byte $00
pnt3_8AA3:
	.byte $03
	.byte $03
	.byte $FF
	.byte $0F
	.byte $00
pnt3_8AA8:
	.byte $0B
	.byte $0C
	.byte $94
	.byte $0F
	.byte $C0
pnt3_8AAD:
	.byte $0B
	.byte $0C
	.byte $94
	.byte $0F
	.byte $C0
SprMap_PlayerText:
	.byte $08
	.byte $03
	.byte $8F
	.byte $FF
	.byte $90
	.byte $91
	.byte $92
	.byte $93
	.byte $94
	.byte $95
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $98
	.byte $FF
	.byte $90
	.byte $91
	.byte $92
	.byte $93
	.byte $94
	.byte $95
pnt3_8ACC:
	.byte $08
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

; =====Mapping Format=====
; Width, Height, [data]
; 	Width - Width in 8x8 tiles
; 	Height - Height in 8x8 tiles
; 	[data] - Mapping data. Size is height times width.
SprMap_PlayerCursor:
	.byte $01
	.byte $01
	.byte $8E
pnt3_8AE9:
	.byte $01
	.byte $01
	.byte $03
SprMap_TitleCloud:
	.byte $04
	.byte $02
	.byte $38, $39, $3A, $3B
	.byte $3C, $3D, $3D, $3E
pnt3_8AF6:
	.byte $04
	.byte $02
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
SprMap_TitleEnemyPop:
	.byte $02
	.byte $02
	.byte $00
	.byte $01
	.byte $02
	.byte $03
pnt3_8B06:
	.byte $02
	.byte $02
	.byte $01
	.byte $01
	.byte $01
	.byte $01
pnt3_8B0C:
	.byte $02
	.byte $04
	.byte $0C
	.byte $0A
	.byte $0D
	.byte $0B
	.byte $28
	.byte $0E
	.byte $29
	.byte $0F
pnt3_8B16:
	.byte $02
	.byte $04
	.byte $2E
	.byte $2C
	.byte $2F
	.byte $2D
	.byte $1A
	.byte $18
	.byte $1B
	.byte $19
SprMap_TitleKoopa1:
	.byte $03
	.byte $04
	.byte $0E
	.byte $0F
	.byte $FF
	.byte $18
	.byte $19
	.byte $FF
	.byte $27
	.byte $28
	.byte $22
	.byte $35
	.byte $36
	.byte $2E
pnt3_8B2E:
	.byte $03
	.byte $04
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
SprMap_TitleKoopa2:
	.byte $03
	.byte $04
	.byte $10
	.byte $11
	.byte $FF
	.byte $1A
	.byte $1B
	.byte $FF
	.byte $29
	.byte $2A
	.byte $2B
	.byte $37
	.byte $38
	.byte $2E
SprMap_TitleRex1:
	.byte $03
	.byte $04
	.byte $21
	.byte $22
	.byte $FF
	.byte $25
	.byte $26
	.byte $FF
	.byte $29
	.byte $2A
	.byte $2B
	.byte $33
	.byte $34
	.byte $35
pnt3_8B58:
	.byte $03
	.byte $04
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
SprMap_TitleRex2:
	.byte $03
	.byte $04
	.byte $23
	.byte $24
	.byte $FF
	.byte $27
	.byte $28
	.byte $FF
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $36
	.byte $37
	.byte $38
pnt3_8B74:
	.byte $02
	.byte $02
	.byte $38
	.byte $39
	.byte $3A
	.byte $3B
pnt3_8B7A:
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
pnt3_8B80:
	.byte $02
	.byte $02
	.byte $3C
	.byte $3D
	.byte $3E
	.byte $3F
SprMap_TitleSuperKoopa1:
	.byte $03
	.byte $02
	.byte $06
	.byte $0C
	.byte $0D
	.byte $14
	.byte $15
	.byte $16
pnt3_8B8E:
	.byte $03
	.byte $02
	.byte $02
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
SprMap_TitleSuperKoopa2:
	.byte $03
	.byte $02
	.byte $06
	.byte $0E
	.byte $0F
	.byte $14
	.byte $17
	.byte $18
pnt3_8B9E:
	.byte $04
	.byte $04
	.byte $00
	.byte $01
	.byte $02
	.byte $FF
	.byte $03
	.byte $04
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $09
	.byte $0A
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $FF
pnt3_8BB0:
	.byte $04
	.byte $04
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
pnt3_8BC2:
	.byte $04
	.byte $04
	.byte $FF
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
	.byte $FF
pnt3_8BD4:
	.byte $04
	.byte $04
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $02
	.byte $00
	.byte $00
	.byte $02
	.byte $02
	.byte $00
	.byte $00
	.byte $00
	.byte $00
SprMap_TitleMario1:
	.byte $02
	.byte $04
	.byte $21
	.byte $20
	.byte $23
	.byte $22
	.byte $25
	.byte $24
	.byte $26
	.byte $27
pnt3_8BF0:
	.byte $02
	.byte $04
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $41
	.byte $41
	.byte $41
	.byte $41
SprMap_TitleMario2:
	.byte $02
	.byte $04
	.byte $29
	.byte $28
	.byte $2B
	.byte $2A
	.byte $2D
	.byte $2C
	.byte $2F
	.byte $2E
SprMap_TitleYoshi_Walk1:
	.byte $04
	.byte $04
	.byte $FF
	.byte $05
	.byte $04
	.byte $FF
	.byte $FF
	.byte $08
	.byte $07
	.byte $06
	.byte $0B
	.byte $0A
	.byte $09
	.byte $FF
	.byte $0D
	.byte $0C
	.byte $FF
	.byte $FF
pnt3_8C16:
	.byte $04
	.byte $04
	.byte $42
	.byte $42
	.byte $42
	.byte $42
	.byte $42
	.byte $42
	.byte $42
	.byte $42
	.byte $43
	.byte $42
	.byte $42
	.byte $42
	.byte $43
	.byte $43
	.byte $42
	.byte $42
SprMap_TitleYoshi_Walk2:
	.byte $04
	.byte $04
	.byte $FF
	.byte $0F
	.byte $0E
	.byte $FF
	.byte $FF
	.byte $12
	.byte $11
	.byte $10
	.byte $15
	.byte $14
	.byte $13
	.byte $FF
	.byte $17
	.byte $16
	.byte $FF
	.byte $FF
SprMap_TitleYoshi_Jump:
	.byte $04
	.byte $04
	.byte $FF
	.byte $1A
	.byte $19
	.byte $18
	.byte $FF
	.byte $1C
	.byte $1B
	.byte $FF
	.byte $0B
	.byte $1D
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $1E
	.byte $FF
	.byte $FF
pnt3_8C4C:
	.byte $02
	.byte $02
	.byte $00
	.byte $00
	.byte $01
	.byte $01
SprMap_MapplayerDown1:
	.byte $02
	.byte $02
	.byte $05
	.byte $06
	.byte $0D
	.byte $0E
SprMap_MapplayerDown2:
	.byte $02
	.byte $02
	.byte $07
	.byte $08
	.byte $0F
	.byte $10
SprMap_MapplayerDown3:
	.byte $02
	.byte $02
	.byte $05
	.byte $06
	.byte $11
	.byte $12
SprMap_MapplayerLeft1:
	.byte $02
	.byte $02
	.byte $50
	.byte $51
	.byte $60
	.byte $61
SprMap_MapplayerLeft2:
	.byte $02
	.byte $02
	.byte $52
	.byte $53
	.byte $62
	.byte $63
SprMap_MapplayerClimb1:
	.byte $02
	.byte $02
	.byte $2A
	.byte $2B
	.byte $36
	.byte $37
SprMap_MapplayerClimb2:
	.byte $02
	.byte $02
	.byte $2C
	.byte $2D
	.byte $38
	.byte $39
SprMap_MapplayerUp1:
	.byte $02
	.byte $02
	.byte $44
	.byte $45
	.byte $54
	.byte $55
SprMap_MapplayerUp2:
	.byte $02
	.byte $02
	.byte $46
	.byte $47
	.byte $56
	.byte $57
SprMap_MapplayerUp3:
	.byte $02
	.byte $02
	.byte $48
	.byte $49
	.byte $58
	.byte $59
pnt3_8C8E:
	.byte $02
	.byte $02
	.byte $00
	.byte $00
	.byte $02
	.byte $02
SprMap_MapplayerSwimDown1:
	.byte $02
	.byte $02
	.byte $07
	.byte $08
	.byte $13
	.byte $14
SprMap_MapplayerSwimDown2:
	.byte $02
	.byte $02
	.byte $05
	.byte $06
	.byte $15
	.byte $16
SprMap_MapplayerSwimLeft1:
	.byte $02
	.byte $02
	.byte $50
	.byte $51
	.byte $64
	.byte $65
SprMap_MapplayerSwimLeft2:
	.byte $02
	.byte $02
	.byte $52
	.byte $53
	.byte $66
	.byte $67
SprMap_MapplayerSwimUp1:
	.byte $02
	.byte $02
	.byte $24
	.byte $25
	.byte $13
	.byte $14
SprMap_MapplayerSwimUp2:
	.byte $02
	.byte $02
	.byte $22
	.byte $23
	.byte $15
	.byte $16
pnt3_8CB8:
	.byte $01
	.byte $01
	.byte $02
pnt3_8CBB:
	.byte $02
	.byte $01
	.byte $03
	.byte $03
SprMap_MapBoo:
	.byte $01
	.byte $01
	.byte $6E
SprMap_MapHalo:
	.byte $02
	.byte $01
	.byte $71
	.byte $72
pnt3_8CC6:
	.byte $02
	.byte $03
	.byte $00
	.byte $00
	.byte $02
	.byte $01
	.byte $02
	.byte $02
pnt3_8CCE:
	.byte $02
	.byte $03
	.byte $00
	.byte $00
	.byte $01
	.byte $02
	.byte $02
	.byte $02
SprMap_MapYoshi_Down1:
	.byte $02
	.byte $03
	.byte $01
	.byte $02
	.byte $09
	.byte $0A
	.byte $17
	.byte $18
SprMap_MapYoshi_Down2:
	.byte $02
	.byte $03
	.byte $03
	.byte $04
	.byte $0B
	.byte $0C
	.byte $19
	.byte $1A
pnt3_8CE6:
	.byte $03
	.byte $03
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
SprMap_MapYoshi_Left1:
	.byte $03
	.byte $03
	.byte $00
	.byte $40
	.byte $41
	.byte $4A
	.byte $4B
	.byte $4C
	.byte $5A
	.byte $5B
	.byte $5C
SprMap_MapYoshi_Left2:
	.byte $03
	.byte $03
	.byte $00
	.byte $42
	.byte $43
	.byte $4D
	.byte $4E
	.byte $4F
	.byte $5D
	.byte $5E
	.byte $5F
pnt3_8D07:
	.byte $02
	.byte $03
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $02
	.byte $02
SprMap_MapYoshi_Up1:
	.byte $02
	.byte $03
	.byte $22
	.byte $23
	.byte $2E
	.byte $2F
	.byte $3A
	.byte $3B
SprMap_MapYoshi_Up2:
	.byte $02
	.byte $03
	.byte $24
	.byte $25
	.byte $30
	.byte $31
	.byte $3C
	.byte $3D
SprMap_MapYoshi_SwimDown1:
	.byte $02
	.byte $03
	.byte $01
	.byte $02
	.byte $09
	.byte $0A
	.byte $13
	.byte $14
SprMap_MapYoshi_SwimDown2:
	.byte $02
	.byte $03
	.byte $03
	.byte $04
	.byte $0B
	.byte $0C
	.byte $15
	.byte $16
pnt3_8D2F:
	.byte $03
	.byte $03
	.byte $02
	.byte $00
	.byte $00
	.byte $02
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
SprMap_MapYoshi_SwimLeft1:
	.byte $03
	.byte $03
	.byte $00
	.byte $40
	.byte $41
	.byte $4A
	.byte $4B
	.byte $4C
	.byte $68
	.byte $69
	.byte $6A
SprMap_MapYoshi_SwimLeft2:
	.byte $03
	.byte $03
	.byte $00
	.byte $42
	.byte $43
	.byte $4D
	.byte $4E
	.byte $4F
	.byte $6B
	.byte $6C
	.byte $6D
SprMap_MapYoshi_SwimUp1:
	.byte $02
	.byte $03
	.byte $26
	.byte $27
	.byte $32
	.byte $33
	.byte $13
	.byte $14
SprMap_MapYoshi_SwimUp2:
	.byte $02
	.byte $03
	.byte $28
	.byte $29
	.byte $34
	.byte $35
	.byte $15
	.byte $16
SprMap_MapplayerStart:
	.byte $02
	.byte $02
	.byte $1D
	.byte $06
	.byte $20
	.byte $21
SprMap_MapYoshi_Start1:
	.byte $02
	.byte $03
	.byte $1B
	.byte $02
	.byte $09
	.byte $0A
	.byte $17
	.byte $18
SprMap_MapYoshi_Start2:
	.byte $02
	.byte $03
	.byte $1C
	.byte $04
	.byte $1E
	.byte $0C
	.byte $19
	.byte $1A
SprMap_MapYoshi_SwimStart1:
	.byte $02
	.byte $03
	.byte $1B
	.byte $02
	.byte $09
	.byte $0A
	.byte $13
	.byte $14
SprMap_MapYoshi_SwimStart2:
	.byte $02
	.byte $03
	.byte $1C
	.byte $04
	.byte $1E
	.byte $0C
	.byte $15
	.byte $16
SprMap_MapplayerSwimStart1:
	.byte $02
	.byte $02
	.byte $1F
	.byte $08
	.byte $13
	.byte $14
SprMap_MapplayerSwimStart2:
	.byte $02
	.byte $02
	.byte $1D
	.byte $06
	.byte $15
	.byte $16
pnt3_8D92:
	.byte $02
	.byte $02
	.byte $40
	.byte $40
	.byte $41
	.byte $41
SprMap_MapplayerRight1:
	.byte $02
	.byte $02
	.byte $51
	.byte $50
	.byte $61
	.byte $60
SprMap_MapplayerRight2:
	.byte $02
	.byte $02
	.byte $53
	.byte $52
	.byte $63
	.byte $62
pnt3_8DA4:
	.byte $02
	.byte $02
	.byte $40
	.byte $40
	.byte $42
	.byte $42
SprMap_MapplayerSwimRight1:
	.byte $02
	.byte $02
	.byte $51
	.byte $50
	.byte $65
	.byte $64
SprMap_MapplayerSwimRight2:
	.byte $02
	.byte $02
	.byte $53
	.byte $52
	.byte $67
	.byte $66
pnt3_8DB6:
	.byte $03
	.byte $03
	.byte $40
	.byte $40
	.byte $42
	.byte $41
	.byte $41
	.byte $42
	.byte $42
	.byte $42
	.byte $42
SprMap_MapYoshi_Right1:
	.byte $03
	.byte $03
	.byte $41
	.byte $40
	.byte $00
	.byte $4C
	.byte $4B
	.byte $4A
	.byte $5C
	.byte $5B
	.byte $5A
SprMap_MapYoshi_Right2:
	.byte $03
	.byte $03
	.byte $43
	.byte $42
	.byte $00
	.byte $4F
	.byte $4E
	.byte $4D
	.byte $5F
	.byte $5E
	.byte $5D
pnt3_8DD7:
	.byte $03
	.byte $03
	.byte $40
	.byte $40
	.byte $42
	.byte $41
	.byte $41
	.byte $42
	.byte $42
	.byte $42
	.byte $42
SprMap_MapYoshi_SwimRight1:
	.byte $03
	.byte $03
	.byte $41
	.byte $40
	.byte $00
	.byte $4C
	.byte $4B
	.byte $4A
	.byte $6A
	.byte $69
	.byte $68
SprMap_MapYoshi_SwimRight2:
	.byte $03
	.byte $03
	.byte $43
	.byte $42
	.byte $00
	.byte $4F
	.byte $4E
	.byte $4D
	.byte $6D
	.byte $6C
	.byte $6B

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
	.byte $80
	.byte $40
	.byte $40
	.byte $40
	.byte $40
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
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
ofs_8EFB:
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
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $FF
	.byte $FF
	.byte $06
	.byte $07
	.byte $08
	.byte $09
	.byte $0A
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
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $FF
	.byte $FF
	.byte $10
	.byte $11
	.byte $12
	.byte $13
	.byte $14
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
ofs_8F3B:
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $15
	.byte $16
	.byte $17
	.byte $18
	.byte $19
	.byte $1A
	.byte $FF
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $1E
	.byte $1F
	.byte $20
	.byte $21
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
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $23
	.byte $24
	.byte $25
	.byte $26
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
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
ofs_8F7B:
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $16
	.byte $17
	.byte $18
	.byte $19
	.byte $1A
	.byte $FF
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $1E
	.byte $1F
	.byte $20
	.byte $21
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
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $24
	.byte $25
	.byte $26
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
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
ofs_8FBB:
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
	.byte $30
	.byte $31
	.byte $32
	.byte $33
	.byte $34
	.byte $FF
	.byte $35
	.byte $36
	.byte $FF
	.byte $37
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
	.byte $2B
	.byte $38
	.byte $39
	.byte $3A
	.byte $3B
	.byte $FF
	.byte $3C
	.byte $3D
	.byte $FF
	.byte $3E
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
	.byte $25 ; overworld map music settings
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $28
	.byte $28
	.byte $28
	.byte $28
	.byte $28
	.byte $27
	.byte $27
	.byte $27
	.byte $27
	.byte $27
	.byte $27
	.byte $26
	.byte $26
	.byte $00
tbl2_9091:
	.byte $07
	.byte $08
	.byte $09
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
	.byte $04
	.byte $08
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
	.byte $13
	.byte $14
	.byte $15
	.byte $16
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
	.byte $00
	.byte $04
	.byte $07
	.byte $00
	.byte $00
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
	.byte $01
	.byte $04
	.byte $30
	.byte $00
	.byte $FF
ofs_9282:
	.byte $01
	.byte $00
	.byte $30
	.byte $03
	.byte $FF
ofs_9287:
	.byte $01
	.byte $03
	.byte $10
	.byte $11
	.byte $01
	.byte $02
	.byte $20
	.byte $11
	.byte $FF
ofs_9290:
	.byte $01
	.byte $00
	.byte $30
	.byte $03
	.byte $FF
ofs_9295:
	.byte $01
	.byte $02
	.byte $10
	.byte $11
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $FF
ofs_929E:
	.byte $01
	.byte $06
	.byte $20
	.byte $01
	.byte $01
	.byte $07
	.byte $10
	.byte $01
	.byte $FF
ofs_92A7:
	.byte $00
	.byte $00
	.byte $30
	.byte $03
	.byte $FF
ofs_92AC:
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $01
	.byte $06
	.byte $10
	.byte $01
	.byte $FF
ofs_92B5:
	.byte $00
	.byte $00
	.byte $70
	.byte $03
	.byte $FF
ofs_92BA:
	.byte $00
	.byte $04
	.byte $30
	.byte $00
	.byte $FF
ofs_92BF:
	.byte $01
	.byte $06
	.byte $40
	.byte $01
	.byte $FF
ofs_92C4:
	.byte $00
	.byte $04
	.byte $70
	.byte $00
	.byte $FF
ofs_92C9:
	.byte $01
	.byte $07
	.byte $10
	.byte $01
	.byte $01
	.byte $00
	.byte $10
	.byte $03
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $01
	.byte $02
	.byte $20
	.byte $11
	.byte $01
	.byte $03
	.byte $10
	.byte $11
	.byte $FF
ofs_92DE:
	.byte $01
	.byte $02
	.byte $40
	.byte $11
	.byte $FF
ofs_92E3:
	.byte $00
	.byte $00
	.byte $4F
	.byte $03
	.byte $01
	.byte $08
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $00
	.byte $20
	.byte $03
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $20
	.byte $11
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $FF
ofs_930C:
	.byte $01
	.byte $07
	.byte $10
	.byte $01
	.byte $01
	.byte $06
	.byte $20
	.byte $01
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $01
	.byte $04
	.byte $10
	.byte $00
	.byte $01
	.byte $03
	.byte $10
	.byte $11
	.byte $FF
ofs_9321:
	.byte $01
	.byte $04
	.byte $10
	.byte $00
	.byte $01
	.byte $03
	.byte $10
	.byte $11
	.byte $01
	.byte $02
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $40
	.byte $11
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $FF
ofs_933E:
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $20
	.byte $01
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $04
	.byte $20
	.byte $00
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $00
	.byte $04
	.byte $10
	.byte $00
	.byte $01
	.byte $0A
	.byte $00
	.byte $00
	.byte $00
	.byte $04
	.byte $4F
	.byte $00
	.byte $FF
ofs_9367:
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $00
	.byte $00
	.byte $20
	.byte $02
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $FF
ofs_9378:
	.byte $00
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $40
	.byte $01
	.byte $01
	.byte $06
	.byte $10
	.byte $01
	.byte $01
	.byte $07
	.byte $10
	.byte $01
	.byte $01
	.byte $00
	.byte $10
	.byte $03
	.byte $FF
ofs_9395:
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $00
	.byte $20
	.byte $02
	.byte $01
	.byte $00
	.byte $10
	.byte $03
	.byte $01
	.byte $00
	.byte $10
	.byte $04
	.byte $FF
ofs_93A6:
	.byte $00
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $04
	.byte $20
	.byte $02
	.byte $00
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $FF
ofs_93B7:
	.byte $01
	.byte $01
	.byte $08
	.byte $04
	.byte $01
	.byte $01
	.byte $08
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $01
	.byte $03
	.byte $10
	.byte $11
	.byte $FF
ofs_93C8:
	.byte $01
	.byte $04
	.byte $10
	.byte $04
	.byte $01
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $04
	.byte $20
	.byte $02
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $FF
ofs_93D9:
	.byte $01
	.byte $04
	.byte $10
	.byte $00
	.byte $01
	.byte $04
	.byte $30
	.byte $02
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $01
	.byte $00
	.byte $10
	.byte $03
	.byte $FF
ofs_93EE:
	.byte $01
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $01
	.byte $05
	.byte $08
	.byte $01
	.byte $01
	.byte $05
	.byte $08
	.byte $04
	.byte $FF
ofs_93FF:
	.byte $00
	.byte $02
	.byte $60
	.byte $11
	.byte $FF
ofs_9404:
	.byte $01
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $01
	.byte $00
	.byte $30
	.byte $02
	.byte $01
	.byte $00
	.byte $10
	.byte $03
	.byte $FF
ofs_9419:
	.byte $00
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $00
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $04
	.byte $40
	.byte $02
	.byte $00
	.byte $02
	.byte $20
	.byte $11
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $20
	.byte $11
	.byte $FF
ofs_9436:
	.byte $00
	.byte $06
	.byte $60
	.byte $01
	.byte $FF
ofs_943B:
	.byte $00
	.byte $02
	.byte $20
	.byte $11
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $00
	.byte $28
	.byte $02
	.byte $01
	.byte $06
	.byte $10
	.byte $01
	.byte $01
	.byte $00
	.byte $28
	.byte $02
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $FF
ofs_9458:
	.byte $00
	.byte $06
	.byte $20
	.byte $01
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $20
	.byte $01
	.byte $00
	.byte $00
	.byte $40
	.byte $02
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $FF
ofs_9475:
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $FF
ofs_9486:
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $01
	.byte $04
	.byte $28
	.byte $02
	.byte $01
	.byte $02
	.byte $10
	.byte $11
	.byte $00
	.byte $04
	.byte $28
	.byte $02
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $20
	.byte $01
	.byte $FF
ofs_94A3:
	.byte $00
	.byte $04
	.byte $20
	.byte $00
	.byte $00
	.byte $04
	.byte $50
	.byte $02
	.byte $00
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $03
	.byte $10
	.byte $00
	.byte $FF
ofs_94B4:
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $FF
ofs_94C5:
	.byte $01
	.byte $04
	.byte $28
	.byte $00
	.byte $00
	.byte $04
	.byte $38
	.byte $00
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $01
	.byte $06
	.byte $20
	.byte $01
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $FF
ofs_94DA:
	.byte $00
	.byte $07
	.byte $10
	.byte $03
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $00
	.byte $00
	.byte $50
	.byte $02
	.byte $00
	.byte $00
	.byte $20
	.byte $03
	.byte $FF
ofs_94EB:
	.byte $01
	.byte $09
	.byte $00
	.byte $00
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $70
	.byte $11
	.byte $FF
ofs_9500:
	.byte $01
	.byte $0B
	.byte $00
	.byte $03
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $01
	.byte $02
	.byte $20
	.byte $11
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $00
	.byte $38
	.byte $03
	.byte $01
	.byte $00
	.byte $28
	.byte $03
	.byte $FF
ofs_9519:
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $50
	.byte $01
	.byte $00
	.byte $05
	.byte $08
	.byte $01
	.byte $00
	.byte $05
	.byte $08
	.byte $04
	.byte $FF
ofs_9532:
	.byte $00
	.byte $06
	.byte $70
	.byte $01
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $FF
ofs_9543:
	.byte $00
	.byte $03
	.byte $08
	.byte $04
	.byte $00
	.byte $03
	.byte $08
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $FF
ofs_9554:
	.byte $00
	.byte $01
	.byte $08
	.byte $04
	.byte $00
	.byte $01
	.byte $08
	.byte $11
	.byte $00
	.byte $02
	.byte $50
	.byte $11
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $FF
ofs_956D:
	.byte $00
	.byte $04
	.byte $70
	.byte $00
	.byte $01
	.byte $04
	.byte $10
	.byte $00
	.byte $FF
ofs_9576:
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $00
	.byte $07
	.byte $08
	.byte $05
	.byte $00
	.byte $07
	.byte $08
	.byte $04
	.byte $FF
ofs_9587:
	.byte $01
	.byte $03
	.byte $10
	.byte $11
	.byte $01
	.byte $02
	.byte $10
	.byte $11
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $01
	.byte $02
	.byte $20
	.byte $11
	.byte $01
	.byte $03
	.byte $10
	.byte $11
	.byte $FF
ofs_959C:
	.byte $01
	.byte $00
	.byte $10
	.byte $03
	.byte $00
	.byte $00
	.byte $70
	.byte $03
	.byte $FF
ofs_95A5:
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $20
	.byte $01
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $50
	.byte $01
	.byte $FF
ofs_95B6:
	.byte $01
	.byte $07
	.byte $10
	.byte $01
	.byte $01
	.byte $06
	.byte $20
	.byte $01
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $01
	.byte $06
	.byte $10
	.byte $01
	.byte $01
	.byte $07
	.byte $10
	.byte $01
	.byte $FF
ofs_95CB:
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $01
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $40
	.byte $01
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $01
	.byte $07
	.byte $10
	.byte $01
	.byte $01
	.byte $00
	.byte $10
	.byte $03
	.byte $FF
ofs_95E8:
	.byte $00
	.byte $02
	.byte $50
	.byte $11
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $20
	.byte $11
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $FF
ofs_95F9:
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $50
	.byte $01
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $30
	.byte $01
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $FF
ofs_9612:
	.byte $01
	.byte $04
	.byte $10
	.byte $00
	.byte $01
	.byte $03
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $40
	.byte $11
	.byte $01
	.byte $03
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $FF
ofs_962F:
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $01
	.byte $00
	.byte $10
	.byte $03
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $01
	.byte $00
	.byte $30
	.byte $03
	.byte $00
	.byte $00
	.byte $30
	.byte $03
	.byte $00
	.byte $01
	.byte $20
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $FF
ofs_9650:
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $30
	.byte $11
	.byte $01
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $50
	.byte $11
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $FF
ofs_9669:
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $00
	.byte $01
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $60
	.byte $11
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $00
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $02
	.byte $20
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $FF
ofs_9686:
	.byte $00
	.byte $06
	.byte $10
	.byte $01
	.byte $00
	.byte $05
	.byte $20
	.byte $01
	.byte $00
	.byte $04
	.byte $30
	.byte $00
	.byte $01
	.byte $04
	.byte $30
	.byte $00
	.byte $01
	.byte $05
	.byte $10
	.byte $01
	.byte $01
	.byte $04
	.byte $10
	.byte $00
	.byte $00
	.byte $03
	.byte $10
	.byte $11
	.byte $00
	.byte $02
	.byte $10
	.byte $11
	.byte $FF
ofs_96A7:
	.byte $00
	.byte $00
	.byte $30
	.byte $03
	.byte $00
	.byte $00
	.byte $28
	.byte $06
	.byte $00
	.byte $00
	.byte $08
	.byte $03
	.byte $FF
ofs_96B4:
	.byte $00
	.byte $06
	.byte $30
	.byte $01
	.byte $00
	.byte $00
	.byte $10
	.byte $03
	.byte $00
	.byte $07
	.byte $10
	.byte $01
	.byte $00
	.byte $06
	.byte $60
	.byte $01
	.byte $00
	.byte $05
	.byte $10
	.byte $01
	.byte $00
	.byte $04
	.byte $10
	.byte $00
ofs_96CC:
	.byte $FF
ofs_96CD:
	.byte $00
	.byte $04
	.byte $08
	.byte $00
	.byte $00
	.byte $04
	.byte $28
	.byte $04
	.byte $00
	.byte $04
	.byte $30
	.byte $00
	.byte $FF
ofs_96DA:
	.byte $FF
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
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
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
	.byte $16
	.byte $17
	.byte $18
	.byte $17
	.byte $FF
ofs_9792:
	.byte $19
	.byte $1A
	.byte $FF
ofs_9795:
	.byte $1B
	.byte $1C
	.byte $FF
ofs_9798:
	.byte $1D
	.byte $1E
	.byte $1F
	.byte $1E
	.byte $FF
ofs_979D:
	.byte $20
	.byte $21
	.byte $FF
ofs_97A0:
	.byte $22
	.byte $23
	.byte $FF
ofs_97A3:
	.byte $24
	.byte $25
	.byte $FF
ofs_97A6:
	.byte $28
	.byte $29
	.byte $FF
ofs_97A9:
	.byte $2A
	.byte $2B
	.byte $FF
ofs_97AC:
	.byte $2C
	.byte $2D
	.byte $FF
ofs_97AF:
	.byte $2E
	.byte $2F
	.byte $FF
ofs_97B2:
	.byte $30
	.byte $31
	.byte $FF
ofs_97B5:
	.byte $32
	.byte $33
	.byte $FF
ofs_97B8:
	.byte $34
	.byte $34
	.byte $FF
ofs_97BB:
	.byte $35
	.byte $36
	.byte $FF
ofs_97BE:
	.byte $37
	.byte $38
	.byte $FF
ofs_97C1:
	.byte $39
	.byte $3A
	.byte $FF
ofs_97C4:
	.byte $3B
	.byte $3C
	.byte $FF
ofs_97C7:
	.byte $3D
	.byte $3E
	.byte $FF
ofs_97CA:
	.byte $3F
	.byte $40
	.byte $FF
ofs_97CD:
	.byte $41
	.byte $42
	.byte $FF
ofs_97D0:
	.byte $00
	.byte $00
	.byte $FF
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
	.byte $71
	.byte $71
	.byte $71
	.byte $71
	.byte $71
	.byte $71
	.byte $71
	.byte $71
	.byte $71
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $00
	.byte $9F
	.byte $A0
	.byte $A1
	.byte $A2
	.byte $00
	.byte $00
	.byte $07
	.byte $08
	.byte $09
	.byte $00
	.byte $00
	.byte $00
	.byte $06
	.byte $0A
	.byte $13
	.byte $71
	.byte $71
	.byte $71
	.byte $00
	.byte $00
	.byte $00
	.byte $0A
	.byte $0F
	.byte $0F
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $A3
	.byte $00
	.byte $00
	.byte $AA
	.byte $00
	.byte $00
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $00
	.byte $16
	.byte $17
	.byte $18
	.byte $18
	.byte $19
	.byte $15
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $A4
	.byte $00
	.byte $00
	.byte $A9
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $A5
	.byte $A6
	.byte $A7
	.byte $A8
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $00
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
	.byte $00
	.byte $00
	.byte $06
	.byte $07
	.byte $08
	.byte $09
	.byte $0A
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $0B
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $00
	.byte $00
	.byte $10
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
; "MARIO START!" Tilemap
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $15
	.byte $16
	.byte $17
	.byte $18
	.byte $19
	.byte $1A
	.byte $00
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $17
	.byte $1E
	.byte $1F
	.byte $00
	.byte $20
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $21
	.byte $22
	.byte $23
	.byte $24
	.byte $25
	.byte $26
	.byte $00
	.byte $27
	.byte $28
	.byte $29
	.byte $2A
	.byte $2B
	.byte $2C
	.byte $00
	.byte $2D
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
; "TIME UP!" Tilemap
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $2E
	.byte $2F
	.byte $30
	.byte $31
	.byte $32
	.byte $00
	.byte $33
	.byte $34
	.byte $00
	.byte $35
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $36
	.byte $37
	.byte $38
	.byte $39
	.byte $3A
	.byte $00
	.byte $3B
	.byte $3C
	.byte $00
	.byte $3D
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
; "LUIGI START!" Tilemap
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $35
	.byte $3E
	.byte $3F
	.byte $40
	.byte $41
	.byte $00
	.byte $00
	.byte $42
	.byte $43
	.byte $44
	.byte $45
	.byte $46
	.byte $47
	.byte $00
	.byte $48
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $49
	.byte $4A
	.byte $4B
	.byte $4C
	.byte $4D
	.byte $00
	.byte $00
	.byte $4E
	.byte $4F
	.byte $0C
	.byte $50
	.byte $51
	.byte $52
	.byte $00
	.byte $53
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	LDA tbl2_9A8D+1,X
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
	LDA tbl2_9A2E+1,X
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
	.word ofs2_9A30

ofs2_9A30:
	.byte $3F
	.byte $10
	.byte $01
	.byte $10
	.byte $11
	.byte $0E
	.byte $26
	.byte $30
	.byte $11
	.byte $0E
	.byte $26
	.byte $30
	.byte $11
	.byte $0E
	.byte $26
	.byte $30
	.byte $11
	.byte $0E
	.byte $26
	.byte $30
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
	.byte $FC ; 1st+2nd BG Bank
	.byte $FE ; 3rd+4th BG Bank
	.byte $80 ; 1st Sprite Bank
	.byte $81 ; 2nd Sprite Bank
	.byte $94 ; 3rd Sprite Bank
	.byte $95 ; 4th Sprite Bank
EndingBanks:
	.byte $F8
	.byte $FA
	.byte $F8
	.byte $F9
	.byte $FA
	.byte $FB
ThankYouBanks:
	.byte $F4
	.byte $F6
	.byte $80
	.byte $81
	.byte $82
	.byte $83
CopyrightBanks:
	.byte $F8
	.byte $FA
	.byte $80
	.byte $81
	.byte $82
	.byte $83
OverworldBanks:
	.byte $E8
	.byte $EA
	.byte $80
	.byte $81
	.byte $82
	.byte $83
TransitionBanks:
	.byte $F2
	.byte $EC
	.byte $00
	.byte $00
	.byte $00
	.byte $00

tbl2_9A8D:
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
	.byte $00
	.byte $60
	.byte $30
	.byte $00
	.byte $00
	.byte $60
	.byte $60
	.byte $00
	.byte $00
	.byte $90
	.byte $70
	.byte $00
	.byte $00
	.byte $B0
	.byte $60
	.byte $00
	.byte $00
	.byte $B0
	.byte $60
	.byte $00
	.byte $00
	.byte $B0
	.byte $60
	.byte $00
	.byte $00
	.byte $70
	.byte $60
	.byte $00
	.byte $00
	.byte $A0
	.byte $40
	.byte $00
	.byte $00
	.byte $A0
	.byte $40
	.byte $00
	.byte $00
	.byte $C0
	.byte $60
	.byte $00
	.byte $00
	.byte $C0
	.byte $60
	.byte $00
	.byte $00
	.byte $C0
	.byte $40
	.byte $00
	.byte $00
	.byte $E0
	.byte $40
	.byte $00
	.byte $00
	.byte $E0
	.byte $70
	.byte $00
	.byte $00
	.byte $E0
	.byte $70
	.byte $00
	.byte $00
	.byte $E0
	.byte $70
	.byte $00
	.byte $00
	.byte $D0
	.byte $48
	.byte $00
	.byte $00
	.byte $E0
	.byte $38
	.byte $00
	.byte $00
	.byte $E0
	.byte $38
	.byte $00
	.byte $00
	.byte $A0
	.byte $80
	.byte $00
	.byte $00
	.byte $A0
	.byte $80
	.byte $00
	.byte $00
	.byte $A0
	.byte $80
	.byte $00
	.byte $00
	.byte $A0
	.byte $80
	.byte $00
	.byte $00
	.byte $A0
	.byte $90
	.byte $00
	.byte $01
	.byte $00
	.byte $A0
	.byte $00
	.byte $00
	.byte $E0
	.byte $C0
	.byte $00
	.byte $00
	.byte $B0
	.byte $A0
	.byte $00
	.byte $00
	.byte $90
	.byte $C0
	.byte $00
	.byte $00
	.byte $A0
	.byte $70
	.byte $00
	.byte $00
	.byte $A0
	.byte $70
	.byte $00
	.byte $00
	.byte $A0
	.byte $70
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
MapDirections:
; 1-Yoshi House
	.byte BTN_DOWN ; Next level
	.byte $00 ; Previous level
; 1-1
	.byte BTN_DOWN
	.byte BTN_UP
; 1-2
	.byte BTN_RIGHT
	.byte BTN_LEFT
; 1-3
	.byte BTN_UP
	.byte BTN_DOWN
; 1-4
	.byte BTN_UP
	.byte BTN_DOWN
; 2-1
	.byte BTN_LEFT
	.byte BTN_DOWN
; 2-Yoshi House
	.byte BTN_LEFT
	.byte BTN_RIGHT
; 2-2
	.byte BTN_UP
	.byte BTN_LEFT
; 2-3
	.byte BTN_DOWN
	.byte BTN_UP
; 2-4
	.byte BTN_UP
	.byte BTN_DOWN
; 3-1
	.byte BTN_RIGHT
	.byte BTN_DOWN
; 3-2
	.byte BTN_UP
	.byte BTN_DOWN
; 3-3
	.byte BTN_DOWN
	.byte BTN_UP
; 3-4
	.byte BTN_RIGHT
	.byte BTN_DOWN
; 4-1
	.byte BTN_DOWN
	.byte BTN_LEFT
; 4-2
	.byte BTN_RIGHT
	.byte BTN_LEFT
; 4-3
	.byte BTN_RIGHT
	.byte BTN_LEFT
; 4-4
	.byte BTN_DOWN
	.byte BTN_UP
; 5-1
	.byte BTN_DOWN
	.byte BTN_LEFT
; 5-2
	.byte BTN_DOWN
	.byte BTN_UP
; 5-Yoshi House
	.byte BTN_DOWN
	.byte BTN_LEFT
; 5-3
	.byte BTN_DOWN
	.byte BTN_UP
; 5-4
	.byte BTN_DOWN
	.byte BTN_UP
; 6-1
	.byte BTN_DOWN
	.byte BTN_UP
; 6-2
	.byte BTN_DOWN
	.byte BTN_UP
; 6-3
	.byte BTN_LEFT
	.byte BTN_RIGHT
; 6-4
	.byte BTN_UP
	.byte BTN_DOWN
; 7-1
	.byte BTN_LEFT
	.byte BTN_UP
; 7-2
	.byte BTN_UP
	.byte BTN_LEFT
; 7-3
	.byte BTN_UP
	.byte BTN_LEFT
; 7-4
	.byte $00
	.byte BTN_DOWN
; Unused
	.byte $00
	.byte $00
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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $00
	.byte $0A
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
tbl2_9D78:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $2F
	.byte $00
	.byte $0A
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $05 ; X Screen
	.byte $70 ; X Position
	.byte $01 ; Y Screen
	.byte $1F ; Y Position
; Castle #2
	.byte $09
	.byte $F0
	.byte $00
	.byte $EF
; Castle #3
	.byte $0A
	.byte $40
	.byte $00
	.byte $6F
; Castle #4
	.byte $0B
	.byte $80
	.byte $00
	.byte $5F
; Castle #5
	.byte $07
	.byte $60
	.byte $00
	.byte $FF
; Castle #6
	.byte $06
	.byte $A0
	.byte $01
	.byte $8F
DestroyedCastleAttr:
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
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
