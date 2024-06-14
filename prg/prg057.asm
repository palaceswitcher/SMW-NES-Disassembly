;disassembled by BZK 6502 Disassembler
jmp_57_A000:
	LDA PlayerAction
	CMP PlayerPrevAction
	BEQ bra4_A020 ;Branch here if the player's action stays the same
	BNE bra4_A014 ;If it doesn't, branch here
;Unused
	LDA PlayerXSpeed ;unlogged
	ROR ;unlogged
	ROR ;unlogged
	ROR ;unlogged
	ROR ;unlogged
	AND #$0F ;unlogged
	TAX ;unlogged
	LDA tbl4_A095,X ;unlogged
bra4_A014:
	STA PlayerAnimation ;Update the player's animation
	LDA #$00
	STA PlayerAnimationFrame ;Switch to first frame of animation
	JSR PlayerAnimationSub
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
	LDA tbl4_A095,X ;load animation from table
	TAY ;move it to the y reg
	JMP loc4_A035 ;jump
bra4_A034:
	TAY
loc4_A035:
	CPY PlayerAnimation ;compare current animation to frame loaded from table
	BEQ bra4_A03E ;branch if they're equal
	STY PlayerAnimation ;unlogged
	JSR PlayerAnimationSub ;unlogged
bra4_A03E:
loc4_A03E:
	LDA PlayerAction
	STA PlayerAction+1
	JSR DecPlayerFrameLength
	JSR LoadPlayerSprite
	LDA #$14 ;skip past first 5 sprites in OAM
	STA $3C ;store in player OAM tracker byte
	JSR sub3_F176
	LDA PlayerAction+1
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
tbl4_A095: ;Animation table 
	db $01 ;player walk cycle
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $02
	db $02
	db $02
	db $03
	db $03
	db $03
	db $04
	db $04
	db $05
	db $05
	db $05
	db $60
BubbleXMovement:
	db $01
	db $01
	db $01
	db $01
	db $FF
	db $FF
	db $FF
	db $FF
	
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
	LDA Event ;
	CMP #$04 ;if event is set to 04, death
	BEQ bra4_A0DC ;branch
	CMP #$07 ;if 07, using item box
	BEQ bra4_A118_RTS ;branch to end
	CMP #$08 ;if 08,
	BNE bra4_A0E0 ;branch
	RTS
bra4_A0DC:
	LDA EventPart
	BEQ bra4_A118_RTS
bra4_A0E0:
	LDA PlayerState
	CMP #$03
	BEQ bra4_A118_RTS ;Branch if player is climbing
	LDA #$03
	LDX UnderwaterFlag
	BEQ bra4_A0EF
	LDA #$01
bra4_A0EF:
	STA $32
	LDA PlayerMovement ;
	AND #$04 ;if player isn't jumping/swimming,
	BEQ bra4_A119 ;branch
	LDA PlayerXSpeed
	BEQ bra4_A101
	CMP #$20
	BCS bra4_A101
	INC PlayerXSpeed
bra4_A101:
	LDA PlayerYSpeed
	SEC ;set carry
	SBC #$03 ;
	STA PlayerYSpeed ;subtract 3 from the player's y speed
	LDA #$F8 ;
	CMP PlayerYSpeed ;if player's y speed exceeds #$F8,
	BCS bra4_A118_RTS ;branch
	LDA #$02 ;sets y speed
	STA PlayerYSpeed ;
	LDA PlayerMovement ;
	AND #$73 ;sets player to be standing (regardless of direction)
	STA PlayerMovement ;
bra4_A118_RTS:
	RTS
bra4_A119:
	LDA PlayerYSpeed
	CLC
	ADC $32
	STA PlayerYSpeed
	LDA #$F8 ;
	CMP PlayerYSpeed ;if player's y speed exceeds #$F8,
	BCS bra4_A118_RTS ;branch
	STA PlayerYSpeed
	RTS
;UNMARKED TABLE?
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $03
	db $02
	db $04
	db $05
	db $02
	db $01
	db $01
	db $01
	db $00
	db $00
	db $00
	db $01
	db $01
	db $01
	db $00
	db $02
	db $02
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
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;PLAYER SPRITES AND ANIMATION
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;The following code is poorly commented due to the animation bank having 3 sets of pointers and being extremely hard to follow.
sub4_A14A:	
	LDA Player1YoshiStatus
	ASL ;Multiply current yoshi status by 2
	TAX ;Move it to the x offset
	LDA #$24
	STA M90_PRG3 ;Load animation bank into 3rd slot
;Pick Animation table
	LDA lda_36_C000,X
	STA $32 ;Get lower pointer bytes
	LDA lda_36_C000+1,X
	STA $33 ;Get upper pointer bytes
	LDA PlayerPowerup 
	LDY Player1YoshiStatus
	BNE MakePlayerAnimPtr ;Branch if the player has Yoshi
	LDY PlayerHoldFlag
	BEQ MakePlayerAnimPtr ;Branch if the player isn't carrying anything
	CLC ;If they are
	ADC #$05 ;Make the player use the 2nd set of animations
	
MakePlayerAnimPtr: ;Select player animation set
	AND #$0F ;Mask out the lower 4 bits of the Powerup value
	ASL ;Multiply it by 2
	TAY ;Move it to y offset
	LDA ($32),Y ;Load lower byte of 2nd pointer
	STA PlayerAnimationPtr ;store it
	INY
	LDA ($32),Y ;Load upper byte of 2nd pointer
	STA PlayerAnimationPtr+1 ;Store it
	RTS ;End
;**********************************************************************************
DecPlayerFrameLength:
	LDA $18 ;get the current frame duration
	BMI AdvNextPlayerFrame ;if it's underflown(?), branch ahead
	DEC $18 ;else decrement frame length 
	RTS ;end
;**********************************************************************************
AdvNextPlayerFrame: ;if Player frame ended:
	INC PlayerAnimationFrame ;advance to next frame
PlayerAnimationSub:
	LDA PlayerAnimation ;Load player's animation value
	ASL ;multiply it by 2
	TAY ;copy to Y 
	LDA #$24 	
	STA M90_PRG3 ;Load the animation bank into the 3rd PRG slot
;Unsure exactly what pointer it's making here (pointer is later used to create the PlayerFramePtr									
	LDA (PlayerAnimationPtr),Y ;Load the low byte 
	STA $32 ;store it
	INY
	LDA (PlayerAnimationPtr),Y ;Load the high byte 
	STA $33 ;store it
;Make Player Frame Pointer
	LDA PlayerAnimationFrame ;Load player's current animation frame
	ASL
	ASL ;multiply it by 4
	TAY ;move it to the Y reg
	LDA ($32),Y ;Load the low byte of the player's mapping data pointer
	STA PlayerFramePtr	
	INY 
	LDA ($32),Y ;Load the high byte of the player's mapping data pointer
	STA PlayerFramePtr+1
;Get Frame duration
	INY	
	LDA ($32),Y ;if next byte is positive (below 7F)
	BPL StorePlayerFrameLength ;Check bit 7. If it's cleared, treat this byte like a frame length byte and branch.
	AND #$7F
	STA PlayerAnimationFrame ;If bit 7 is set, clear it and use the resulting value as the animation loop point.
	JMP PlayerAnimationSub ;Restart the routine to get the next frame 
StorePlayerFrameLength:
	STA $18 ;Store the animation frame length
	RTS ;end
;**********************************************************************************	
LoadPlayerSprite: ;loads the player sprite
;Prep 	
	LDY #$00 ;Clear Y index/set to read first byte of sprite format (sprite width)
	LDA #$24
	STA M90_PRG3 ;Load animation bank into 3rd PRG slot
;Get sprite object size
	LDA (PlayerFramePtr),Y ;get width byte
	AND #$3F ;Remove attribute bits (%00111111)
	STA PlayerWidth	
	LDA (PlayerFramePtr),Y ;reload width byte
	AND #$C0 ;remove width bits (%11000000) 
	STA PlayerSpriteAttributes ;get attributes from width mapping (This is used for sprites that mirror such as the front facing and climbing sprites)
	INY
	LDA (PlayerFramePtr),Y ;get height byte
	STA PlayerHeight	
	INY 
;Get attribute pointer for the sprite's CHR bank
	LDA (PlayerFramePtr),Y ;get CHR bank byte
	ASL 
	TAX ;double it and move it to X
	LDA #$2F
	STA M90_PRG3 ;load palette mapping bank into 3rd PRG slot
	LDA CHRSprBankAttrs,X
	STA PlayerPalMappingLo ;load low byte of palette mapping pointer
	LDA CHRSprBankAttrs+1,X
	STA PlayerPalMappingHi ;load high byte of palette mapping pointer
;Set base mirroring 
	LDA #$24
	STA M90_PRG3 ;load player animation bank (bank 36) back into 3rd PRG slot
	LDA PlayerMovement
	AND #$F0 ;get the direction the player is facing
	EOR #$40 ;reverse it
	STA PlayerSpriteMirror ;set it to player sprite mirroring
	LDA #$00
	STA $24 ;clear UNKNOWN
	INY ; advance to next byte of mapping (Horizontal offset)
;Get Horizontal Offset 
	LDA PlayerSpriteMirror
	AND #$40 ;if player's sprite is H mirrored (facing right)
	BNE bra4_A208 ;branch
;Else if sprite not mirrored (facing left)
	LDA PlayerSprXPos
	SEC
	SBC (PlayerFramePtr),Y ;subtract x position by mapping offset
	STA PlayerSprXPosOfs ;set it as sprite X offset
	LDA #$00
	SBC #$00 ;subtract carry if present
	STA $20 ;store it
	JMP loc4_A218 ;Skip past next section
	
bra4_A208: ;If Sprite H Mirrored
	LDA (PlayerFramePtr),Y
	SEC
	SBC #$08 ;subtract loaded mapping offset by 8
	CLC
	ADC PlayerSprXPos  ;add player X position to modified mapping offset
	STA PlayerSprXPosOfs ;set it as sprite X offset	
	LDA #$00
	ADC #$00 ;add carry if present
	STA $20 ;store it
;get Vertical Offset
loc4_A218:
	LDX #$00 ;set X to #$00
	LDY PlayerHeight ;Put player height into Y
	LDA PlayerSpriteVOffset,Y ;Load players vertical offset based on sprite height 
	BPL bra4_A223 ;branch if offset is positive (only happens if sprite height is 00, unsure when this would ever occur though)
	LDX #$FF ;else if offset negative, set X to #$FF
	
bra4_A223: ;offset player vertically
	CLC
	ADC PlayerSprYPos ;add player vertical position to loaded vertical offset
	STA PlayerSprYPosOfs ;set it as sprite Y offset 
	BCC bra4_A22B ;if carry clear (result less than 255) then branch to end of routine (leaves X untouched)
	INX ;increment X (Result: 00 or 01) (if X is #$FF this will underflow to be #$00) 
bra4_A22B:
	STX $22 ;Unknown purpose (possibly something to do with if the players V offset puts them off screen)
	RTS ;end
	
PlayerSpriteVOffset: ;This table adjusts the sprite offset based on the height of the player, listed next to the offsets are the respective heights
	db $00 ;00 (unsure when this one is used)
	db $F8 ;01 
	db $F0 ;02
	db $E8 ;03
	db $E0 ;04			
	db $D8 ;05
	db $D0 ;06
	db $C8 ;07
	db $C0 ;08
	db $B8 ;09
	db $B0 ;0A
	db $A8 ;0B
	db $A0 ;0C
	
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; Bubble spawning
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
	
jmp_57_A23B:
	LDA UnderwaterFlag ;
	BEQ bra4_A29E ;branch if not underwater
	LDA BubbleSpawnPoint ;
	CMP #$E8 ;if bubble spawn point is beyond vertical screen edge,
	BCC bra4_A25B ;branch
	LDA PlayerXPos ;
	STA BubbleXPos ;spawn bubble at same x position as the player
	LDA #$F0 ;load as bubble y spawn offset (if no yoshi)
	LDX Player1YoshiStatus ;if player doesn't have yoshi,
	BEQ bra4_A255 ;branch
	LDA #$E0 ;load as bubble y spawn offset (if yoshi)
bra4_A255:
	CLC ;
	ADC PlayerYPos ;add loaded bubble y offset to player position
	STA BubbleYPos ;store as bubble y position
bra4_A25B:
	LDA BubbleXPos
	SEC
	SBC $52
	STA $0203
	LDA BubbleYPos
	SEC
	SBC $54
	LDX PlayerYScreen
	BEQ bra4_A275
	LDX ScrollYPos
	BEQ bra4_A275
	SEC
	SBC #$10
bra4_A275:
	STA BubbleSpawnPoint
	STA SpriteMem ;$0200, Y position
	LDA #$3E ;TileID
	STA $0201 ;store tile ID/,mirroring 
	LDA #$00
	STA $0202 ;store palette
	DEC BubbleYPos
	DEC BubbleYPos
	JSR sub4_A0B0
	LSR
	LSR
	LSR
	AND #$07
	TAX
	LDA BubbleXMovement,X
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
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
;End of bubble spawning
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
	
bra4_A2AC:
	LDA #$02
	LDY InvincibilityTimer
	BEQ bra4_A2C2 ;branch if star/invincibility timer is cleared
	CPY #$D0 ;if timer is below #$D0,
	BCC bra4_A2BD ;branch
	CPY #$F6 ;if timer goes over #$F6,
	BCS bra4_A2C2 ;branch
	LDA #$01
bra4_A2BD:
	AND FrameCount	
	BEQ bra4_A2C2
bra4_A2C1_RTS:
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
;MARIO SPRITE LOADERS (Main player sprites and riding Yoshi)
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
;This section ONLY applies to the Mario object used when riding Yoshi
;It does not affect standard Mario, Yoshi is drawn using the PlayerSpriteBuilder routine
;for standard Mario, start at PlayerSpriteBuilder
bra4_A2C2:
	LDA Player1YoshiStatus ;if player doesn't have yoshi,
	BEQ bra4_A2CD ;branch to jump 
	LDA PlayerSprYPos		
	CMP #$E0 ;if player has Yoshi, check if player is in a pit 
	BCC GetPntrRidingSprite ;if they aren't, branch
bra4_A2CD: ;else jump
	JMP PlayerSpriteBuilder ;starts at X positioning of sprite tiles
;*******************************************************************************	
GetPntrRidingSprite: ;Only do this part if player sprite isn't in a pit
	LDA PlayerPowerup
	ASL ;double it
	TAX ;move it to X
	LDA tbl4_A5E7,X ;(This table only has one entry but is followed by another table)
	STA $38 ;store low byte
	LDA tbl4_A5E8,X ;load the high byte from the next table 
	STA $39  ;store high byte
	LDX PlayerAction+1 ;get the previous player action as an offset
	LDA PlayerRidingActionTable,X ;use that to select an action for the player whilst riding 
	BNE bra4_A2E9 ;if loaded value not 00, branch to next check
	JMP loc4_A4FC ;else, jump (checks Y speed and if down is held, unknown use)
bra4_A2E9:
	CMP #$01
	BNE bra4_A2F0 ;if value not 01, branch to next check
	JMP loc4_A50E ;if it is, jump (clears a variable and masks another for a check, unknown use)
bra4_A2F0:
	CMP #$02
	BNE bra4_A2F7 ;if value not 02, branch to next check
	JMP loc4_A523 ;if it is, jump
bra4_A2F7: 
	LDY #$08 ;Set Y offset to #$08 (adjusts offset for loading CHR bank)
;coderoll
;*******************************************************************************
LoadRidingSprite: ;Mario Riding sprite loader
	LDA ($38),Y ;load CHR bank from pointer (Y is set before the code gets here from one of 3 locations)
	STA SpriteBank1 ;Store in the first sprite bank slot (loads required CHR bank for player riding sprites)
	TYA
	PHA ;Push Y into the stack 
;Get next pointer (unsure of exact use)
	LDA PlayerPowerup ;Get player powerup
	ASL ; double it
	TAY ;Move it to Y for use as new offset 
	LDA tbl4_A60C,Y ;Load low byte from table
	STA $34 
	LDA tbl4_A60C+1,Y ;Load high byte from table
	STA $35 
	
	PLA ;retrive Y from earlier 
	PHA ;put it back in the stack
	ASL ;double it
	TAY ;move it to Y
;Make Mapping Pointer in scratch RAM
	LDA ($34),Y ;offset loaded address by Y 
	STA $32 ;store
	INY 
	LDA ($34),Y ;offset loaded address by Y
	STA $33 ;store
	
	LDA #$00
	STA $2E ;clear $2E, used as mapping offset later
	PLA ;retrive Y from earlier from stack 
	TAY ;Move it back to Y 
;Get Y offset	
	LDA PlayerSprYPos
	SEC
	SBC PlayerRidingSpriteYOffset,Y ;Load the players riding sprite offset and subtract it from the players sprite Y position
	LDX PlayerAction+1 ;get previous player action as X offset
	CLC
	ADC tbl4_A59B,X ;Get data from table and add it to the result of prior sum  (Unknown function, probably additional Y adjustment)
	LDX PlayerPowerup ;get player powerup
	BNE bra4_A336 ;Branch if the player has a powerup 
	SEC
	SBC #$03 ;else subtract 03 from the Y offset	

bra4_A336: 
	STA PlayerMetaspriteVAlign ;store results of sum as the vertical alignment for the sprite
	LDA PlayerMovement ;get current movement direction
	EOR PlayerSpriteAttributes ;flip bits against sprite attributes
	AND #$40 ;determine sprite mirror direction
	BNE bra4_A361 ;If player is facing left, branch
 ;else if sprite is mirrored (facing right)
	LDA PlayerSprXPos 
	CLC
	ADC RidingRightXoffset,Y ;using prior Y offset, get base X position and add to Player sprite X position 
	STA PlayerMetaspriteHAlign ;store it as the horizontal alignment for the sprite
	
loc4_A348: ;load/store tile ID (facing right)
	LDA $2E ;get mapping offset 
	CLC
	ADC #$10 ;Add #$10 to $2E (note that it doesn't store this in $2E)
	TAY ;move result to Y (selects reversed tile order for mirrored sprite)
	LDX $3C ;Set X to OAM tracker byte
	LDA ($32),Y ;Load tile ID from mapping
	CMP #$FF
	BEQ bra4_A3BC ;if loaded a null tile branch to end section of routine
	AND #$3F ;else, mask out attribute bits
	STA $0201,X ;Store tile ID
	PHA ;push A to stack
	LDA #$40 ;set A for mirrored sprite
	JMP loc4_A37B ;jump 
;********************************************************	
;If sprite not mirrored (facing left)
bra4_A361: 
	LDA PlayerSprXPos 
	CLC
	ADC RidingLeftXoffset,Y ;offset table by Y to get data and add to Player sprite X position
	STA PlayerMetaspriteHAlign ;store it as the horizontal alignment for the sprite

bra4_A369: ;load/store tile ID (facing left)
	LDY $2E ;Set Y to mapping offset
	LDX $3C ;Set X to OAM tracker byte
	LDA ($32),Y ;Load tile ID from mapping
	CMP #$FF
	BEQ bra4_A3BC ;if loaded a null tile branch to end section of routine
	AND #$3F ;else, mask out attribute bits
	STA $0201,X ;Store the tile ID
	PHA ;push A to stack
	LDA #$00 ;set A for unmirrored sprite
;********************************************************	
;Get Attributes 	
loc4_A37B:
	STA $38 ;Store sprite mirroring in temp byte (#$40 or #$00)
	LDA SpriteBank1
	ASL ;double value CHR bank in Spritebank1 (Mario bank x 2)
	TAY ;set as Y offset 
	LDA #$2F 
	STA M90_PRG3 ;load attribute bank into 2nd PRG slot
;get attribute pointer	
	LDA CHRSprBankAttrs,Y
	STA $34 ;get lowbyte
	LDA CHRSprBankAttrs+1,Y
	STA $35 ;get highbyte
	PLA ;retrieve A from earlier (tile ID)
	TAY ;move it to Y
	LDA ($34),Y ;use tile ID to select respective attribute data
	ORA $38 ;ORA against sprite mirroring 						 
	ORA $06E0 ;ORA again with UNKNOWN (This flips the tiles as needed)
	STA $0202,X ;store tile attributes
;********************************************************	
;Position Tiles X
	LDA #$24
	STA M90_PRG3 ;load player animation bank into 2nd PRG slot
	LDY $2E ;set Y offset to $2E (unknown use) Mapping offset?
	LDA PlayerMetaspriteHAlign
	CLC
	ADC PlayerRidingTileHorizPos,Y ;add tile H position to sprite H alignment 
	STA $0203,X ;store X position 
;********************************************************	
;Position Tiles Y	
	LDA PlayerMetaspriteVAlign
	CLC
	ADC PlayerRidingTileVertPos,Y ;add tile V position to sprite V alignment
	STA SpriteMem,X ;store Y position
;********************************************************		
	TXA ;move X ($3C) to A
	CLC
	ADC #$04
	STA $3C ;add one tile to OAM tracker byte
bra4_A3BC: 
	INC $2E ;increment Mapping offset
	LDA $2E
	CMP #$10 ;these sprites are forced to each have #$10 (16) tiles it would appear
	BCS bra4_A3CF ;If it exceeds #$10, branch to PlayerSpriteBuilder (build Yoshi sprite)
	LDA PlayerMovement ;get current movement direction
	EOR PlayerSpriteAttributes ;flip bits against sprite attributes
	AND #$40 ;determine sprite mirror direction
	BNE bra4_A369 ;If player facing left branch to respective get next tile ID
	JMP loc4_A348 ;else if facing right, branch to respective get next tile ID
;************************************************************************************************
;End of Mario Riding sprite builder
;************************************************************************************************	
;-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-===-=-=-=-==-=-=-=-=-=-=--
;MAIN PLAYER SPRITE BUILDER
;-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-===-=-=-=-==-=-=-=-=-=-=--
bra4_A3CF:
PlayerSpriteBuilder: ;creates standard Mario or Yoshi sprites (riding sprites have their own routine)
	LDA PlayerSpriteMirror
	AND #$40 ;determine player mirror direction
	BEQ bra4_A3F5 ; branch ahead if direction left
;**************************************************************************************	
;Else player facing RIGHT START (sprite mirrored as tiles face left)
	LDA PlayerSprXPosOfs ;get X position offset for player sprite
	LDX #$00 ;clear X (column storage buffer offset)
	BEQ bra4_A3E2 ; branch, always
;****************************************************
;Ok so there are a total of two writes to $20
;They store the carry bit when calculating the X offset for the sprite
;As far as I can tell $20 is always #$00
;Seems like a waste of a byte and I'm not sure of its use
;****************************************************
SpaceColumnNegative: ;This is for reversing sprite columns when facing right 
	SEC
	SBC #$08
	BCS bra4_A3E2 ;if PlayerSprXPosOfs exceed #$08, skip ahead (only space columns by 8 pixels)
	DEC $20 ;otherwise decrement $20 (unknown use)
;****************************************************
bra4_A3E2: ;if player facing right, it will jump here first
	LDY $20 ;load $20 into Y (unknown use)
	BEQ bra4_A3EC ;If #$00, branch to store column alignment
;Else $20 not 00
	LDY #$FF ;set Y to #$FF 
	STY $41,X ;store #$FF in MetaspriteColumnAlignment (unknown use, hide column??)
	BMI bra4_A3EE ;branch on minus, always (advance to next column)
	
bra4_A3EC: ;store column alignment
	STA $41,X ; store PlayerSprXPosOfs in MetaspriteColumnAlignment 
;****************************************************	
bra4_A3EE: 
	INX ;increment X (move to next column storage buffer byte)
	CPX PlayerWidth ;compare X to player width
	BCC SpaceColumnNegative  ;if X < Player width, branch to subtraction (reverse tile order for face right) (branch backwards)
	BCS bra4_A413 ;if X > player width, branch to Y positioning 	(branch ahead)
;****************************************************	
bra4_A3F5: ;if player facing LEFT else START here
	LDA PlayerSprXPosOfs ;get X position offset for player sprite
	LDX #$00 ;clear X (column storage buffer offset)
	BEQ bra4_A402 ;Always
;****************************************************	
SpaceColumnPositive: ;This is for spacing sprite columns when facing left ;not used on initialise of routine
	CLC
	ADC #$08
	BCC bra4_A402 ;if less than #$08, skip ahead (only space columns by 8 pixels)
	INC $20 ;otherwise increment $20 (unknown use)
;****************************************************		
bra4_A402:
	LDY $20 ;load $20 into Y (unknown use)
	BEQ bra4_A40C ;If #$00, branch ahead to store column alignment
;Else $20 not 00
	LDY #$FF ;set Y to #$FF 
	STY $41,X ;store #$FF in MetaspriteColumnAlignment (unknown use, hide column??)
	BMI bra4_A40E ;branch on minus, always (advance to next column)
	
bra4_A40C: ;store column alignment
	STA $41,X ; store PlayerSprXPosOfs in MetaspriteColumnAlignment 
;****************************************************
bra4_A40E:
	INX ;increment X (move to next column storage buffer byte)
	CPX PlayerWidth ;compare X to player width
	BCC SpaceColumnPositive ;if X < Player width, branch to addition (tile order for face left) (branch backwards)
;Else coderoll
;****************************	
; Position Y
;****************************	
;equivalent code for Y positioning		
bra4_A413:
	LDA PlayerSprYPosOfs ;get Y position offset for player sprite
	LDX #$00 ;clear X (row storage buffer offset)
	BEQ bra4_A422 ;always 
;****************************************************
SpaceRowsVertically: ;this spaces the rows of the sprite (starts from the top, adding moves the position downwards)
	CLC
	ADC #$08 ;lower row position by 8 pixels
	STA PlayerMetaspriteVAlign ;store PlayerSprYPosOfs as vertical tile alignment 
	BCC bra4_A422 ;branch on carry clear
	INC $22 ;else carry set, increment $22 (unknown use)
;****************************************************	
bra4_A422: ;START here
	LDY $22 ;load $22 (unknown use)
	BEQ bra4_A42C ;If #$00, branch ahead to immediate store
;Else $22 not 00	
	LDY #$FF ;set Y to #$FF 
	STY $B2,X ;store #$FF in MetaspriteRowAlignment (unknown use, hide row??)
	BMI bra4_A438 ;branch on minus, always (advance to next row)
	
bra4_A42C:
	STA PlayerMetaspriteVAlign ;store PlayerSprYPosOfs as vertical tile alignment 
	CMP #$C0 
	BCC bra4_A434 ;if it's less than #$C0, branch to store row 
	LDA #$00 ;else if exceed #$C0, set row position to 00 (might be for screen wrapping tiles?)
bra4_A434:
	STA $B2,X ;store in MetaspriteColumnAlignment 
	LDA PlayerMetaspriteVAlign ;get updated vertical tile alignment
;****************************************************
bra4_A438:
	INX ;increment X
	CPX PlayerHeight 
	BCC SpaceRowsVertically ;if X < Player height, repeat routine
;Else X >= PlayerHeight	
	LDA #$04 
	STA $40 ;set $40 to #$04 (unknown use)
	LDA #$00
	STA $3E ;clear $3E (width loop counter)
	STA $3F ;clear $3F (height loop counter)
	TAX ;set X to #$00
;****************************************************
;Align and store tiles
bra4_A448: ;load row alignment 
	LDA $B2,X ;get alignment for first row
	CMP #$FF
	BNE bra4_A458 ;if it's not #$FF, branch ahead
	LDA $40 ;else if it is FF, load $40 (unknown use)
	CLC
	ADC PlayerWidth ;add PlayerWidth to $40 
	STA $40 ;store result in $40 (unknown use)
	JMP loc4_A4B2 ; Jump to increment height loop counter
	
bra4_A458: ;if row alignment not #$FF
	STA PlayerMetaspriteVAlign ;store row aligment as metasprite V aligment
	LDA #$00
	STA $3E ;clear $3E (unknown use)
	TAX ;set X to #$00
;********************
bra4_A45F: ;load column spacing
	LDA $41,X ;load column spacing (X=0 first time we get here)
	CMP #$FF  ;if loaded value is #$FF
	BEQ bra4_A4A8 ;Branch to increment width loop counter
;else if column spacing not #$FF
	STA PlayerMetaspriteHAlign ;store column aligment as metasprite H aligment
	LDX $3C ;load OAM tracker byte into X
	LDY $40 ;load $40 (unknown use)
	LDA #$24
	STA M90_PRG3 ;load player animation bank into 3rd PRG slot
	LDA (PlayerFramePtr),Y ;Load tile ID from mapping
	CMP #$FF ;if loaded value is #$FF (null tile)
	BEQ bra4_A4A8 ;branch to increment width loop counter
	ORA $24 ;else set some bits against $24 (unknown use, might be for tile mirroring?)
	AND #$3F ;Mask out mirroring bits
	LDY Player1YoshiStatus ;put Yoshi status into Y
	BEQ PlayerOAMmanager ;branch to Player OAM manager if no Yoshi
	ORA #$40 ;else set H mirroring bit (%01000000) (why?)
	
PlayerOAMmanager: 
	STA $0201,X ;store tile ID(/mirroring bit, though it's useless here)
	AND #$3F ;Mask out mirroring bits
	TAY ;transfer masked tile ID to Y
	LDA #$2F
	STA M90_PRG3 ;load attribute bank into 3rd PRG slot
	LDA (PlayerPalMappingLo),Y
	ORA PlayerSpriteMirror ;set mirroring for whole sprite 
	EOR PlayerSpriteAttributes ;flip mirroring bits against sprite attributes
	ORA $06E0 ;set some bits against unknown
	STA $0202,X ;store attributes
	LDA PlayerMetaspriteHAlign
	STA $0203,X ;store horizontal position
	LDA PlayerMetaspriteVAlign
	STA SpriteMem,X ;store vertical position 
	TXA ;move X to A
	CLC
	ADC #$04 ;
	STA $3C ;add one tile to OAM tracker byte
;***********************************************	
bra4_A4A8: 
	INC $40 ;Increment $40 (unknown use)
	INC $3E ;Increment $3E (width loop counter)
	LDX $3E 
	CPX PlayerWidth ;Compare $3E with PlayerWidth
	BCC bra4_A45F ;if X < PlayerWidth, go to load column spacing (repeat routine to build sprite)

loc4_A4B2: ;else $3E >= PlayerWidth
	INC $3F ;increment $3F (height loop counter)
	LDX $3F
	CPX PlayerHeight ;compare $3F with PlayerHeight
	BCC bra4_A448 ;If X < PlayerHeight, got to load row alignment 
;Else
	LDY #$02 ;Offset for Mario's frame pointer (CHR bank byte)
	LDA #$24
	STA M90_PRG3 ;Load player Animation bank 
	LDA (PlayerFramePtr),Y ;load CHR bank from the mapping
	LDY Player1YoshiStatus
	BEQ bra4_A4CA ;if no Yoshi, skip to store bank
	LDY #$01 ;else if Yoshi, set to store in 2nd slot 
bra4_A4CA:
	STA SpriteBank1,Y ;Store selected CHR bank in slot 1 (Mario) or slot 2 (Yoshi)
	RTS ;end
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; END OF MARIO SPRITE LOADER
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
;-=-=-=-=-=-==-=-=-=--=-=
;Music to play after invincibility 
;-=-=-=-=-=-==-=-=-=--=-=	
sub4_A4CE:
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAX
	LDA LevelMusicQueue,X
	STA MusicRegister
	RTS
LevelMusicQueue:
	db musOverworld, musOverworld, musTitle, musCastle ;World 1
	db musOverworld, musTitle, musGhostHouse, musCastle ;World 2
	db musUnderground, musUnderwater, musGhostHouse, musCastle ;World 3
	db musOverworld, musForestofIllusion, musTitle, musCastle ;World 4
	db musOverworld, musGhostHouse, musUnderwater, musCastle ;World 5
	db musOverworld, musGhostHouse, musForestofIllusion, musCastle ;World 6
	db musOverworld, musForestofIllusion, musGhostHouse, musCastle ;World 7
	db musOverworld ;Yoshi's House
	db $60
;-=-=-=-=-=--=-=-=-=-=-=-
;END 
;-=-=-=-=-=-==-=-=-=--=-=
;**********************************
;Related to player riding sprite loader
;**********************************
loc4_A4FC: ;Unsure of purpose
	LDY #$00 ;clear Y
	LDA PlayerYSpeed ;if player is moving vertically,
	BNE bra4_A50B ;branch to jump (LoadRidingSprite)
	LDA zInputCurrentState ;else
	AND #dirDown ;if down not held,
	BEQ bra4_A50B ;branch to jump (LoadRidingSprite)
	LDY #$06 ;else if player isn't moving vertically and down is held set Y to #$06
bra4_A50B:	
	JMP LoadRidingSprite ;Jump to load Player riding sprite	
;**********************************	
loc4_A50E: ;Unsure of purpose
	LDA #$00
	STA $0629 ;clear Unknown
	LDA $062B ;get unknown2
	AND #$08 ;Mask it (%00001000)
	BEQ bra4_A51E ;if masked bit is 00, branch (set Y as 01)
	LDY #$00 ;else set Y as 00 (adjusts offset for loading CHR bank)
	BEQ bra4_A520 ;branch to jump (LoadRidingSprite)
bra4_A51E:
	LDY #$01 ;set Y as 01 (adjusts offset for loading CHR bank)
bra4_A520:
	JMP LoadRidingSprite  ;Jump to load Player riding sprite
;**********************************	
loc4_A523: ;Unsure of purpose
	LDA Player1YoshiStatus
	CMP #$02
	BCC bra4_A537 ;if Yoshi Status < #$02, branch ahead 
	LDY #$00 ;else clear Y
	LDA zInputCurrentState
	AND #dirDown
	BEQ bra4_A555 ;if down isn't held, branch 
	LDY #$07 ;if it is, set Y to 07 (adjusts offset for loading CHR bank)
	BNE bra4_A555 ;branch to jump, always (LoadRidingSprite)
	
bra4_A537: ;if Yoshi Status < #$02
	LDY $0629 ;load unknown into Y
	LDA zInputCurrentState
	AND #dirDown
	BEQ bra4_A547 ;if down isn't held, branch 
	LDX tbl4_A571,Y ;if it is, load from table (unknown use)
	JMP loc4_A54A ;skip next instruction
bra4_A547: ;if down isn't held
	LDX tbl4_A558,Y ;load from table (unknown use)
loc4_A54A: ;if down is held
	BPL bra4_A553 ;if value loaded was positive, branch ahead
	LDA #$00 ;else
	STA $0629 ;clear unknown
	LDX #$04 ;set X to #$04
bra4_A553:
	TXA ;move it to A
	TAY ;move it to Y (why do it this way??)
bra4_A555:
	JMP LoadRidingSprite
;**********************************	
tbl4_A558: ;loaded from by bra4_A547
	db $00
	db $00
	db $03
	db $03
	db $03
	db $03
	db $02
	db $02
	db $02
	db $02
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $80
tbl4_A571: ;loaded from by bra4_A537
	db $04
	db $04
	db $05
	db $05
	db $05
	db $05
	db $02
	db $02
	db $02
	db $02
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $80
PlayerRidingActionTable:
	db $00 ;standing
	db $01 ;walking
	db $01 ;running
	db $01 ;unused
	db $00 ;jump
	db $02 ;spinning (unused)
	db $02 ;unused
	db $00 ;ducking
	db $00 ;looking up (unused)
	db $00 ;leap
	db $00 ;falling
	db $00 ;falling (underwater)
	db $00 ;swimming
	db $02 ;yoshi tongue out
	db $02 ;yoshi tongue out (while moving)
	db $00 ;flying
	db $03 ;victory pose
tbl4_A59B:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $05
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
PlayerRidingTileHorizPos:
	db $00, $08, $10, $18 ;1st row
	db $00, $08, $10, $18 ;2nd row
	db $00, $08, $10, $18 ;3rd row
	db $00, $08, $10, $18 ;4th row
PlayerRidingTileVertPos:
	db $00, $00, $00, $00 ;1st column
	db $08, $08, $08, $08 ;2nd column
	db $10, $10, $10, $10 ;3rd column
	db $18, $18, $18, $18 ;4th column
PlayerRidingSpriteYOffset:
	db $28, $29 ;walking
	db $24, $28, $24, $24 ;pointing
	db $2A ;ducking
	db $25, $28 ;unknown
RidingRightXoffset:
	db $ED
	db $ED
	db $ED
	db $ED
	db $ED
	db $ED
	db $EF
	db $EF
	db $ED
RidingLeftXoffset:
	db $F3
	db $F3
	db $F3
	db $F3
	db $F3
	db $F3
	db $F1
	db $F1
	db $F3
tbl4_A5E7:
	db $F1
tbl4_A5E8
	db $A5
	db $FA
	db $A5
	db $03
	db $A6
	db $FA
	db $A5
	db $FA
	db $A5
	db $98
	db $98
	db $98
	db $99
	db $98
	db $99
	db $99
	db $99
	db $98
	db $8A
	db $8A
	db $8A
	db $8B
	db $8A
	db $8B
	db $86
	db $86
	db $8B
	db $81
	db $81
	db $81
	db $81
	db $81
	db $81
	db $81
	db $81
	db $81
tbl4_A60C:
	dw ofs_A616
	dw ofs_A6C8
	dw ofs_A79A
	dw ofs_A86C
	dw ofs_A6C8
ofs_A616:
	dw ofs_A628
	dw ofs_A628
	dw ofs_A648
	dw ofs_A668
	dw ofs_A628
	dw ofs_A668
	dw ofs_A688
	dw ofs_A688
	dw ofs_A6A8
ofs_A628:
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $01
	db $02
	db $FF
	db $FF
	db $03
	db $04
	db $FF
	db $FF
	db $05
	db $06
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $02
	db $01
	db $FF
	db $FF
	db $04
	db $03
	db $FF
	db $FF
	db $06
	db $05
	db $FF
ofs_A648:
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $07
	db $08
	db $FF
	db $FF
	db $09
	db $0A
	db $FF
	db $FF
	db $0B
	db $0C
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $08
	db $07
	db $FF
	db $FF
	db $0A
	db $09
	db $FF
	db $FF
	db $0C
	db $0B
	db $FF
ofs_A668:
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $64
	db $65
	db $FF
	db $FF
	db $66
	db $67
	db $FF
	db $FF
	db $54
	db $55
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $65
	db $64
	db $FF
	db $FF
	db $67
	db $66
	db $FF
	db $FF
	db $55
	db $54
	db $FF
ofs_A688:
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $44
	db $45
	db $FF
	db $FF
	db $46
	db $47
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
	db $45
	db $44
	db $FF
	db $FF
	db $47
	db $46
	db $FF
ofs_A6A8:
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $0E
	db $0D
	db $FF
	db $FF
	db $15
	db $16
	db $FF
	db $FF
	db $13
	db $14
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $0D
	db $0E
	db $FF
	db $FF
	db $16
	db $15
	db $FF
	db $FF
	db $14
	db $13
	db $FF
ofs_A6C8:
	dw ofs_A6DA
	dw ofs_A6FA
	dw ofs_A71A
	dw ofs_A73A
	dw ofs_A6DA
	dw ofs_A73A
	dw ofs_A75A
	dw ofs_A75A
	dw ofs_A77A
ofs_A6DA:
	db $FF
	db $A1
	db $A2
	db $FF
	db $FF
	db $A3
	db $A4
	db $FF
	db $FF
	db $A5
	db $A6
	db $FF
	db $FF
	db $A8
	db $A7
	db $FF
	db $FF
	db $A2
	db $A1
	db $FF
	db $FF
	db $A4
	db $A3
	db $FF
	db $FF
	db $A6
	db $A5
	db $FF
	db $FF
	db $A7
	db $A8
	db $FF
ofs_A6FA:
	db $FF
	db $A9
	db $AA
	db $FF
	db $FF
	db $AB
	db $AC
	db $FF
	db $FF
	db $AD
	db $AE
	db $FF
	db $FF
	db $AF
	db $B0
	db $FF
	db $FF
	db $AA
	db $A9
	db $FF
	db $FF
	db $AC
	db $AB
	db $FF
	db $FF
	db $AE
	db $AD
	db $FF
	db $FF
	db $B0
	db $AF
	db $FF
ofs_A71A:
	db $FF
	db $A1
	db $A2
	db $FF
	db $FF
	db $B3
	db $B4
	db $FF
	db $B9
	db $B5
	db $B6
	db $FF
	db $FF
	db $B7
	db $B8
	db $FF
	db $FF
	db $A2
	db $A1
	db $FF
	db $FF
	db $B4
	db $B3
	db $FF
	db $FF
	db $B6
	db $B5
	db $B9
	db $FF
	db $B8
	db $B7
	db $FF
ofs_A73A:
	db $FF
	db $E1
	db $E2
	db $FF
	db $FF
	db $E3
	db $E4
	db $FF
	db $FF
	db $E5
	db $E6
	db $FF
	db $FF
	db $E7
	db $E8
	db $FF
	db $FF
	db $E2
	db $E1
	db $FF
	db $FF
	db $E4
	db $E3
	db $FF
	db $FF
	db $E6
	db $E5
	db $FF
	db $FF
	db $E8
	db $E7
	db $FF
ofs_A75A:
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $B4
	db $B5
	db $FF
	db $FF
	db $B6
	db $B7
	db $FF
	db $FF
	db $B8
	db $B9
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $B5
	db $B4
	db $FF
	db $FF
	db $B7
	db $B6
	db $FF
	db $FF
	db $B9
	db $B8
	db $FF
ofs_A77A:
	db $FF
	db $F1
	db $F2
	db $FF
	db $FF
	db $F3
	db $F4
	db $FF
	db $FF
	db $F5
	db $F6
	db $FF
	db $FF
	db $F7
	db $F8
	db $FF
	db $FF
	db $F2
	db $F1
	db $FF
	db $FF
	db $F4
	db $F3
	db $FF
	db $FF
	db $F6
	db $F5
	db $FF
	db $FF
	db $F8
	db $F7
	db $FF
ofs_A79A:
	dw ofs_A7AC
	dw ofs_A7AC
	dw ofs_A7EC
	dw ofs_A80C
	dw ofs_A7AC
	dw ofs_A80C
	dw ofs_A82C
	dw ofs_A82C
	dw ofs_A84C
ofs_A7AC:
	db $FF
	db $48
	db $49
	db $FF
	db $FF
	db $4A
	db $4B
	db $FF
	db $FF
	db $4C
	db $4D
	db $FF
	db $FF
	db $4E
	db $4F
	db $FF
	db $FF
	db $49
	db $48
	db $FF
	db $FF
	db $4B
	db $4A
	db $FF
	db $FF
	db $4D
	db $4C
	db $FF
	db $FF
	db $4F
	db $4E
;ofs_A7CC: (Unused?)
	db $FF
	db $FF
	db $50
	db $51
	db $FF
	db $FF
	db $52
	db $53
	db $FF
	db $FF
	db $54
	db $55
	db $FF
	db $FF
	db $56
	db $3A
	db $FF
	db $FF
	db $51
	db $50
	db $FF
	db $FF
	db $53
	db $52
	db $FF
	db $FF
	db $55
	db $54
	db $FF
	db $FF
	db $3A
	db $56
	db $FF
ofs_A7EC:
	db $FF
	db $48
	db $59
	db $FF
	db $FF
	db $5A
	db $5B
	db $FF
	db $7F
	db $5C
	db $5D
	db $FF
	db $FF
	db $5E
	db $5F
	db $FF
	db $FF
	db $59
	db $48
	db $FF
	db $FF
	db $5B
	db $5A
	db $FF
	db $FF
	db $5D
	db $5C
	db $7F
	db $FF
	db $5F
	db $5E
	db $FF
ofs_A80C:
	db $FF
	db $60
	db $61
	db $FF
	db $FF
	db $62
	db $63
	db $FF
	db $FF
	db $64
	db $65
	db $FF
	db $FF
	db $66
	db $67
	db $FF
	db $FF
	db $61
	db $60
	db $FF
	db $FF
	db $63
	db $62
	db $FF
	db $FF
	db $65
	db $64
	db $FF
	db $FF
	db $67
	db $66
	db $FF
ofs_A82C:
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $78
	db $79
	db $FF
	db $FF
	db $7A
	db $7B
	db $FF
	db $FF
	db $7C
	db $7D
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $79
	db $78
	db $FF
	db $FF
	db $7B
	db $7A
	db $FF
	db $FF
	db $7D
	db $7C
	db $FF
ofs_A84C:
	db $FF
	db $70
	db $71
	db $FF
	db $FF
	db $72
	db $73
	db $FF
	db $FF
	db $74
	db $75
	db $FF
	db $FF
	db $76
	db $77
	db $FF
	db $FF
	db $71
	db $70
	db $FF
	db $FF
	db $73
	db $72
	db $FF
	db $FF
	db $75
	db $74
	db $FF
	db $FF
	db $77
	db $76
	db $FF
ofs_A86C:
	dw ofs_A87E
	dw ofs_A6FA
	dw ofs_A89E
	dw ofs_A8BE
	dw ofs_A87E
	dw ofs_A8BE
	dw ofs_A75A
	dw ofs_A75A
	dw ofs_A77A
ofs_A87E:
	db $FF
	db $A1
	db $A2
	db $FF
	db $FF
	db $A3
	db $A4
	db $FF
	db $FF
	db $A5
	db $80
	db $B1
	db $FF
	db $A8
	db $BF
	db $B2
	db $FF
	db $A2
	db $A1
	db $FF
	db $FF
	db $A4
	db $A3
	db $FF
	db $B1
	db $80
	db $A5
	db $FF
	db $B2
	db $BF
	db $A8
	db $FF
ofs_A89E:
	db $FF
	db $A1
	db $A2
	db $FF
	db $FF
	db $B3
	db $B4
	db $FF
	db $B9
	db $B5
	db $80
	db $B1
	db $FF
	db $B7
	db $BF
	db $B2
	db $FF
	db $A2
	db $A1
	db $FF
	db $FF
	db $B4
	db $B3
	db $FF
	db $B1
	db $80
	db $B5
	db $B9
	db $B2
	db $BF
	db $B7
	db $FF
ofs_A8BE:
	db $FF
	db $E1
	db $E2
	db $FF
	db $FF
	db $E3
	db $E4
	db $FF
	db $FF
	db $E5
	db $F9
	db $FB
	db $FF
	db $E7
	db $FA
	db $FC
	db $FF
	db $E2
	db $E1
	db $FF
	db $FF
	db $E4
	db $E3
	db $FF
	db $FB
	db $F9
	db $E5
	db $FF
	db $FC
	db $FA
	db $E7
	db $FF
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;CAPE CODE START
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-	
jmp_57_A8DE:
	LDA PlayerPowerup
	CMP #$03 
	BCS bra4_A8E6 ;if player has cape (static or moving), branch ahead
	RTS ;else, end
bra4_A8E6: ;if player has cape
	LDA PlayerPowerupBuffer
	BMI bra4_A909_RTS ;end if powerup buffer is negative (I think this prevents cape from appearing if the player is changing powerups)
	BEQ bra4_A8F4 ;if it's 00, branch ahead 
;else if it's positive but not 00	
	LDA FrameCount	
	AND #$04 ;Mask framecount %00000100
	BEQ bra4_A90A ;if 4 frames pass, branch ahead
	RTS ;else end
	
bra4_A8F4:;if powerup buffer 00
	LDA #$02 ;set bitmask to #$02
	LDY InvincibilityTimer 
	BEQ bra4_A90A ;if invincibility timer 00, go to pit check
;If invincibility timer not 00
	CPY #$D0 ;else compare timer to #$D0
	BCC bra4_A905 ;if it's less than #$D0, branch ahead to frame check
;else 
	CPY #$F6 ;if Y >= #$D0, compare to #$F6
	BCS bra4_A90A ;if Y >= to #$F6, branch to pit check
;else
	LDA #$01; else if Y < #$F6, set bitmask to #$01

bra4_A905:
	AND FrameCount ;mask #$02 or #$01 against the frame count
	BEQ bra4_A90A ;branch to pit check when they match (1 or 2 frames pass)
bra4_A909_RTS:
	RTS ;if they don't match, end
	
bra4_A90A: 
	LDA PlayerSprYPos ;
	CMP #$E0 ;if player goes below screen/pit,
	BCS bra4_A93D_RTS ;end
;Else
	LDY #$04 ;load "cape moving" state into y reg
	LDX PlayerAction+1 ;load previous player action into X reg 
	LDA Player1YoshiStatus ;
	CMP #$01 ;if player doesn't have yoshi (#$01= Yoshi with empty mouth)
	BCC bra4_A929 ;branch to load animation (essentially if it's equal to 00, why write it like that?)
;Else if Player has Yoshi
	LDA PlayerXSpeed		
	BNE bra4_A923 ;;if player has x speed, branch ahead
	LDA PlayerYSpeed ;
	BEQ bra4_A929 ;if player has no y speed, branch ahead
;if player has Y speed, coderoll	

bra4_A923: ;if player has Yoshi 
	LDA YoshiCapeAnimTable,X;load action from table
	JMP loc4_A92C ;jump to store animation value
	
bra4_A929: ;if no Yoshi or Yoshi with no X speed or Y speed
	LDA CapeAnimTable,X ;pick which cape animation to use

loc4_A92C: 
	STA $34 ;store loaded animation value
	BMI bra4_A936 ;branch ahead if a value above $7F is loaded
	STY PlayerPowerup ;else, set cape to moving (#$04 loaded earlier)
	JSR sub4_A14A ;jump to sub (check if Yoshi present or player carrying objects)
;coderoll on return
bra4_A936:
	LDY PlayerPowerup ;get player powerup
	CPY #$04 ;if cape is moving,
	BEQ CapeAnimCyclePick ;branch to pick which animation cycle to use
bra4_A93D_RTS:
	RTS ;else if cape static, end
	
;****************************************************	
;Pick cape animation cycle to use
CapeAnimCyclePick: ;CapeAnimCyclePick; If cape is moving
	LDA $34 ;get cape animation frame (loaded from respective animation table)
	AND #%00001111 ;mask out upper 4 bits
	BNE bra4_A947 ;branch if not zero
	JMP loc4_AB16 ;jump if it was (standing cape cycle code)
bra4_A947:
	CMP #$01 ;if #$01 wasn't loaded,
	BNE bra4_A94E ;branch
	JMP loc4_AB3C ;jump if it was (jumping cape cycle code)
bra4_A94E:
	CMP #$02 ;if #$02 wasn't loaded,
	BNE bra4_A955 ;branch
	JMP loc4_AB70 ;jump if it was (set cape to static?? code)
bra4_A955:
	CMP #$03 ;if #$03 wasn't loaded,
	BNE bra4_A95C ;branch
	JMP loc4_AB82 ;jump if it was (?? code)
bra4_A95C:
	CMP #$04 ;if #$04 wasn't loaded,
	BNE bra4_A963 ;branch
	JMP loc4_ABB0 ;jump if it was (?? code)
bra4_A963: ;
	LDY $0627 ;get cape frame picker for use as offset
	LDA WalkCapeCycle,Y ;select frame from WalkCycle
	JMP loc4_AB42 ;jump ahead (check if loaded value was positive like with the others)
;****************************************************
;(code returns to here from those above jumps using another jump)
loc4_A96C: ; check for Yoshi 
	LDX Player1YoshiStatus
	BEQ BuildCapeSprNoYoshi ;branch if no Yoshi
	JMP BuildCapeSprYoshiVer ;else, jump to Yoshi segment
;*********************************************************
;If Player Doesn't Have Yoshi START here
;;********************************************************	
BuildCapeSprNoYoshi: ;if player doesn't have Yoshi
	PHA ;push value from A to stack 
	LDA PlayerPowerup 
	ASL ; double player powerup (result should be 06 or 08 depending on cape state)
	TAY ;transfer it to Y
	LDA tbl4_AC41,Y ;this table has 5 identical entries, it simply points to the cape frame selection table   
	STA $34 ;store the low byte
	LDA tbl4_AC41+1,Y ;meaning this segment is probably redundant 
	STA $35 ;store the high byte
	
	PLA ;get value from stack
	PHA ;copy it back to the stack again
	ASL ;double it
	TAY ;transfer it to Y
	LDA ($34),Y ;get cape mapping pointer from table the above section pointed to
	STA $32 ;store low byte
	INY ;advance to next byte of mapping pointer
	LDA ($34),Y
	STA $33 ; ;store high byte
;**************************************************
;Position cape vertically
;**************************************************
	LDA #$00 
	STA $2E ;clear $2E UNKNOWN use
	PLA ;get value from stack again
	TAY ;move it to Y	
	LDA PlayerSprYPos  
	SEC
	SBC CapeVoffset,Y ;subtract value loaded from sprite Y position
	LDX PlayerAction+1 ;Load previous player action 
	CLC
	ADC CapeVoffset2,X  ;add secondary vertical offset??? to PlayerSprYPos (this table is mostly 00 except for one entry of 06)
;As far as I can tell both tables affect vertical position, I'm guessing this is a weird way of fixing something
	LDX PlayerPowerup
	BNE bra4_A9AB ;branch if the player has a powerup (?? not exactly sure the purpose of this)
	SEC ;unlogged ;if they dont,
	SBC #$03 ;unlogged  ;subtract 3 from the vertical offset
;**************************************************	
;Position Cape Horizontally
;**************************************************
bra4_A9AB: ;
	STA PlayerMetaspriteVAlign ;This is being reused for the capes alignment since this is calculated per frame for both
	LDA PlayerMovement
	EOR PlayerSpriteAttributes 
	AND #$40 ;determine mirror direction 
	BNE bra4_A9D6 ;if player isn't H mirrored (facing left), branch
;else player is mirrored (facing right)
	LDA PlayerSprXPos
	CLC
	ADC tbl4_AC1D,Y ;calculate cape X position
	STA PlayerMetaspriteHAlign ;store it 
;**************************************************
loc4_A9BD: ;If player H mirrored, (facing right) 
	LDA $2E ;mapping byte offset
	CLC
	ADC #$04 ;add 4 (select mirrored mappings)
	TAY ;move it to Y
	LDX $3C ;put OAM tracker byte into X
	LDA ($32),Y ;get tile ID from mapping
	CMP #$FF 
	BEQ bra4_AA31 ;branch if it's a null tile
;Load tile ID
	AND #$3F ;else strip attributes
	STA $0201,X ;store tile ID 
	PHA ;push masked tile ID to stack
	LDA #$40 ;set mirroring for tile (mirrored)
	JMP loc4_A9F0 ;go to Cape OAM manager 
;**************************************************
bra4_A9D6: ;If player not H mirrored (facing left)
	LDA PlayerSprXPos
	CLC
	ADC tbl4_AC26,Y ;calculate cape X position
	STA PlayerMetaspriteHAlign ;store it 
;coderoll into load tile ID
;**************************************************
;Cape object OAM manager
;**************************************************
bra4_A9DE: ;get unmirrored tile ID (code loops back to here but starts ahead of it)
	LDY $2E ;Unknown
	LDX $3C ;OAM tracker byte
	LDA ($32),Y ;get tile ID from mapping
	CMP #$FF
	BEQ bra4_AA31 ;branch if it's a null tile
	AND #$3F ;else strip attributes
	STA $0201,X ;store tile ID
	PHA ;push masked tile ID to stack
	LDA #$00 ;set mirroing for tile (unmirrored)
;**************************************************
;
;**************************************************
loc4_A9F0: ;START HERE for cape OAM manager
	STA $38 ;Store mirroring for tile in temp byte
;Select attribute bank 	
	LDA SpriteBank1	
	ASL ;double bank ID
	TAY ;move it to Y
	LDA #$2F
	STA M90_PRG3 ;put the attributes bank into the 2nd PRG slot
	LDA CHRSprBankAttrs,Y
	STA $34 ;lowbyte of attribute pointer
	LDA CHRSprBankAttrs+1,Y
	STA $35 ;highbyte of attribute pointer 
	PLA ;retrive masked tile ID from stack
	TAY ;move it to Y
	LDA ($34),Y ;load attributes 
;probably to do with mirroring, not sure what these values contain
	ORA $38 ; use tile mirroring temp byte as bitmask to set some bits (00/40 bitmask: 1=set 0=ignore)
	ORA $06E0 ; use ?? as bitmask to set some bits
	STA $0202,X ;store attributes
	
	LDA #$24
	STA M90_PRG3 ;load the player animation bank into the 2nd PRG slot
	LDY $2E  ;put $2E into Y
	LDA PlayerMetaspriteHAlign
	CLC
	ADC tbl4_AC03,Y ;add column spacing to horizontal alignment
	STA $0203,X ;store X position
	
	LDA PlayerMetaspriteVAlign
	CLC
	ADC tbl4_AC07,Y ;Add row spacing to vertical offset 
	STA SpriteMem,X ;store Y position
	TXA
	CLC
	ADC #$04
	STA $3C ;add one tile to the OAM tracker byte
	
bra4_AA31:
	INC $2E ;add one to $2E (loop counter for routine)
	LDA $2E
	CMP #$04 
	BCS bra4_AA44_RTS ;if $2E >= #$04, branch to end 
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40 ;determine sprite mirror
	BNE bra4_A9DE ;if not mirrored, branch to load unmirrored tile ID
	JMP loc4_A9BD ;if mirrored branch back to mirrored section
bra4_AA44_RTS:
	RTS
;*********************************************************
;If Player has Yoshi START here
;;********************************************************
;most of this literally matches the code for if you don't have Yoshi so that's some grade A space efficiency right there
BuildCapeSprYoshiVer: ;If the player has Yoshi 
	PHA ;push value from A to stack 
	LDA PlayerPowerup 
	ASL ; double player powerup (result should be 06 or 08 depending on cape state)
	TAY ;transfer it to Y
	LDA tbl4_AC41,Y ;this table has 5 identical entries, it simply points to the cape frame selection table   
	STA $34 ;store the low byte
	LDA tbl4_AC41+1,Y ;meaning this segment is probably redundant 
	STA $35 ;store the high byte
	
	PLA ;get value from stack
	PHA ;copy it back to the stack again
	ASL ;double it
	TAY ;transfer it to Y
	LDA ($34),Y ;get cape mapping pointer from table the above section pointed to
	STA $32 ;store low byte
	INY ;advance to next byte of mapping pointer
	LDA ($34),Y
	STA $33 ; ;store high byte
;**************************************************
;Position cape vertically
;**************************************************	
	LDA #$00
	STA $2E ;clear $2E UNKNOWN use
	PLA ;retrive value from the stack again
	TAY ;move it to Y
	LDA PlayerSprYPos
	SEC
	SBC CapeVoffsetYoshi,Y ;subtract Y offset 
	LDX PlayerAction+1 ;get previous player action
	CLC
	ADC CapeVoffset2,X ;add secondary vertical offset? to PlayerSprYPos (this table is mostly 00 except for one entry of 06)
	LDX PlayerPowerup
	BNE bra4_AA7C ;branch if the player has a powerup (?? not exactly sure the purpose of this)
	SEC ;unlogged ;if they dont,
	SBC #$03 ;unlogged  ;subtract 3 from the vertical offset	
;**************************************************	
;Position Cape Horizontally
;**************************************************
bra4_AA7C:
	STA PlayerMetaspriteVAlign ;This is being reused for the capes alignment since this is calculated per frame for both
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40 ;determine mirror direction 
	BNE bra4_AAA7 ;if player isn't H mirrored (facing left), branch
;else player is mirrored (facing right)
	LDA PlayerSprXPos
	CLC
	ADC tbl4_AC2F,Y ;calculate cape X position
	STA PlayerMetaspriteHAlign ;store it 
;**************************************************	
loc4_AA8E: ;If player H mirrored, (facing right) 
	LDA $2E ;mapping byte offset
	CLC
	ADC #$04 ;add 4 (select mirrored mappings)
	TAY ;move it to Y
	LDX $3C ;put OAM tracker byte into X
	LDA ($32),Y ;get tile ID from mapping
	CMP #$FF 
	BEQ bra4_AB02  ;branch if it's a null tile
;Load tile ID	
	AND #$3F ;else strip attributes
	STA $0201,X ;store tile ID 
	PHA ;push masked tile ID to stack
	LDA #$40 ;set mirroring for tile (mirrored)
	JMP loc4_AAC1 ;go to Yoshi Cape OAM manager
;**************************************************
bra4_AAA7: ;If player not H mirrored (facing left)
	LDA PlayerSprXPos
	CLC
	ADC tbl4_AC38,Y ;calculate cape X position
	STA PlayerMetaspriteHAlign ;store it 
;coderoll into load tile ID
;**************************************************
;Cape object OAM manager (Yoshi Version)
;**************************************************	
bra4_AAAF: ;get unmirrored tile ID (code loops back to here but starts ahead of it)
	LDY $2E  ;Unknown
	LDX $3C ;OAM tracker byte
	LDA ($32),Y ;get tile ID from mapping
	CMP #$FF
	BEQ bra4_AB02 ;branch if it's a null tile
	AND #$3F ;else strip attributes
	STA $0201,X ;store tile ID
	PHA ;push masked tile ID to stack
	LDA #$00 ;set mirroing for tile (unmirrored)
;**************************************************
;
;**************************************************
loc4_AAC1: ;START HERE for cape OAM manager
	STA $38 ;Store mirroring for tile in temp byte
;Select attribute bank 	
	LDA SpriteBank1	
	ASL ;double bank ID
	TAY ;move it to Y
	LDA #$2F
	STA M90_PRG3 ;put the attributes bank into the 2nd PRG slot
	LDA CHRSprBankAttrs,Y
	STA $34 ;lowbyte of attribute pointer
	LDA CHRSprBankAttrs+1,Y
	STA $35 ;highbyte of attribute pointer 
	PLA ;retrive masked tile ID from stack
	TAY ;move it to Y
	LDA ($34),Y ;load attributes 
;probably to do with mirroring, not sure what these values contain
	ORA $38 ; use tile mirroring temp byte as bitmask to set some bits (00/40 bitmask: 1=set 0=ignore)
	ORA $06E0 ; use ?? as bitmask to set some bits
	STA $0202,X ;store attributes
	
	LDA #$24
	STA M90_PRG3 ;load the player animation bank into the 2nd PRG slot
	LDY $2E  ;put $2E into Y
	LDA PlayerMetaspriteHAlign
	CLC
	ADC tbl4_AC03,Y ;add column spacing to horizontal alignment
	STA $0203,X ;store X position
	
	LDA PlayerMetaspriteVAlign
	CLC
	ADC tbl4_AC07,Y ;Add row spacing to vertical offset 
	STA SpriteMem,X ;store Y position
	TXA
	CLC
	ADC #$04
	STA $3C ;add one tile to the OAM tracker byte
	
bra4_AB02:
	INC $2E ;add one to $2E (loop counter for routine)
	LDA $2E
	CMP #$04 
	BCS bra4_AB15_RTS ;if $2E >= #$04, branch to end 
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40 ;determine sprite mirror
	BNE bra4_AAAF ;if not mirrored, branch to load unmirrored tile ID
	JMP loc4_AA8E ;if mirrored branch back to mirrored section
bra4_AB15_RTS:
	RTS
;******************************************************************
;Standing cape cycle code
loc4_AB16:
	LDY $0627 ;put current cape frame offset into Y
	LDA StandingCapeCycle,Y ;Use it to pick a frame of animation
	BPL bra4_AB2D ;branch to jump if it's positive
;Else if negative 
	LDA #$00
	STA $0627 ;Clear frame offset
	LDA #$03
	STA PlayerPowerup ;set cape to static 
	JSR sub4_A14A ;Select if Yoshi is present or if carrying object
	LDA #$08 ;load #$08 on return
bra4_AB2D:
	JMP loc4_A96C ;jump to check for Yoshi
StandingCapeCycle:
	db $07
	db $07
	db $07
	db $07
	db $07
	db $07
	db $07
	db $08
	db $08
	db $08
	db $08
	db $80 ;end of mapping (negative)
	
;******************************************************************
;Jumping cape cycle code
loc4_AB3C:
	LDY $0627 ;put current cape frame offset into Y
	LDA JumpCapeCycle,Y ;Use it to pick a frame of animation
loc4_AB42:
	BPL bra4_AB52 ;branch to jump if it's positive
;Else if negative (end of mapping)
	LDA #$00
	STA $0627 ;Clear frame offset
	LDA PlayerXSpeed
	BNE bra4_AB50 ;branch if the player has X speed
	STA $0628 ;if they don't, store X speed at $0628 (clear it)
bra4_AB50:
	LDA #$00 ;clear A
bra4_AB52:
	JMP loc4_A96C ;jump to check for Yoshi 
JumpCapeCycle:
	db $08
	db $08
	db $07
	db $07
	db $01
	db $01
	db $02
	db $02
	db $00
	db $00
	db $80
;******************************************************************	
WalkCapeCycle: 
	db $08
	db $08
	db $08
	db $07
	db $07
	db $07
	db $01
	db $01
	db $01
	db $02
	db $02
	db $02
	db $00
	db $00
	db $00
	db $80
;******************************************************************	
loc4_AB70:
	LDA #$00
	STA $0627 ;clear cape frame picker
	LDA #$03
	STA PlayerPowerup ;set cape to static
	JSR sub4_A14A ;;Select if Yoshi is present or if carrying object
	LDA #$00 ;clear A
	JMP loc4_A96C ;jump to check for Yoshi 
loc4_AB82:
	LDY $0627 ;Put frame picker into Y
	LDA PlayerMovement
	AND #$04 
	BEQ bra4_AB8E
	JMP loc4_AB3C
bra4_AB8E:
	LDA FallingCapeCycle,Y ;Pick a frame of animation
	BPL bra4_ABA3 ;if it's positive branch to jump
;Else if it's negative (end of mapping)
	LDA #$00
	STA $0627 ;clear frame picker
	LDA PlayerYSpeed
	BNE bra4_ABA1 ;branch if the player has Y speed
	LDA #$01 ;else,
	STA $0628 ;set $0628 to #$01
bra4_ABA1:
	LDA #$03 ;set A to 03
bra4_ABA3:
	JMP loc4_A96C ;jump to check for Yoshi 
FallingCapeCycle:
	db $04
	db $04
	db $04
	db $05
	db $05
	db $05
	db $03
	db $03
	db $03
	db $80
;******************************************************************	
loc4_ABB0:
	LDA #$00
	STA $0627 ;clear frame picker
	LDY #$02 ;set Y to 02
	LDA $062B ;load UNKNOWN 
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
	JMP loc4_A96C ;jump to check for Yoshi 
CapeAnimTable:
	db $80 ;standing
	db $05 ;walking
	db $01 ;running
	db $01 ;unused
	db $03 ;jump
	db $04 ;spinning
	db $80 ;unused
	db $80 ;ducking
	db $80 ;looking up
	db $01 ;leap
	db $03 ;falling	
	db $03 ;falling (underwater)
	db $01 ;swimming
	db $82	
	db $82
	db $01 ;flying
	db $80 ;victory pose
YoshiCapeAnimTable:
	db $80 ;standing
	db $05 ;walking
	db $01 ;running
	db $01 ;unused
	db $03 ;jump
	db $04 ;spinning
	db $01 ;unused
	db $80 ;ducking
	db $80 ;looking up
	db $01 ;leap
	db $03 ;falling
	db $03 ;falling (underwater)
	db $01 ;swimming
	db $01 ;yoshi tongue out
	db $01 ;yoshi tongue out (while moving)
	db $01 ;flying
	db $80 ;victory pose
CapeVoffset2:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $06
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
tbl4_AC03: ;Cape column spacing table
	db $00 ;tile 1
	db $08 ;tile 2
	db $00 ;tile 3
	db $08 ;tile 4
tbl4_AC07: ;Cape row spacing table
	db $00 ;tile 1
	db $00 ;tile 2
	db $08 ;tile 3
	db $08 ;tile 4
CapeVoffset: ;Cape vertical alignment table (Mario only)
	db $11
	db $19
	db $11
	db $1E
	db $1E
	db $1E
	db $1E
	db $19
	db $17
CapeVoffsetYoshi: ;Cape vertical alignment table (Mario riding Yoshi)
	db $1B
	db $23
	db $1B
	db $29
	db $29
	db $29
	db $29
	db $23
	db $21
tbl4_AC1D: ;Cape X position offset for face right
	db $EE
	db $EE
	db $EE
	db $EF
	db $EF
	db $EF
	db $EF
	db $EE
	db $EE
tbl4_AC26: ;Cape X position offset for face left
	db $02
	db $02
	db $02
	db $01
	db $01
	db $01
	db $01
	db $02
	db $02
tbl4_AC2F:
	db $EA
	db $EA
	db $EA
	db $ED
	db $ED
	db $ED
	db $ED
	db $EA
	db $EA
tbl4_AC38:
	db $06
	db $06
	db $06
	db $03
	db $03
	db $03
	db $03
	db $06
	db $06
tbl4_AC41: ;(Redundant?) table that just points to the cape mapping selection table
	dw CapeMappingTbl
	dw CapeMappingTbl
	dw CapeMappingTbl
	dw CapeMappingTbl
	dw CapeMappingTbl
CapeMappingTbl: ;Cape mapping selection table 1
	dw CapeFlap1
	dw CapeFlap2
	dw CapeFlap3
	dw CapeFall1
	dw CapeFall2
	dw CapeFall3
	dw CapeFall4
	dw CapeFlap4 ;also settle 1
	dw CapeSettle2
;Cape mappings 
CapeFlap1: ;flapping 1
	db $01
	db $02
	db $03
	db $04
;Mirrored version	
	db $02
	db $01
	db $04
	db $03
CapeFlap2: ;flapping 2
	db $05
	db $06
	db $07
	db $08
;Mirrored version	
	db $06
	db $05
	db $08
	db $07
CapeFlap3: ;flapping 3
	db $0B
	db $0C
	db $FF
	db $FF
;Mirrored version	
	db $0C
	db $0B
	db $FF
	db $FF
CapeFall1: ;Falling 1
	db $0D
	db $0E
	db $0F
	db $10
;Mirrored version	
	db $0E
	db $0D
	db $10
	db $0F
CapeFall2: ;Falling 2
	db $11
	db $12
	db $13
	db $14
;Mirrored version	
	db $12
	db $11
	db $14
	db $13
CapeFall3: ;Falling 3
	db $15
	db $16
	db $17
	db $18
;Mirrored version	
	db $16
	db $15
	db $18
	db $17
CapeFall4: ;Falling 4
	db $19
	db $1A
	db $1B
	db $1C
;Mirrored version	
	db $1A
	db $19
	db $1C
	db $1B
CapeFlap4: ;flapping 4 (frame 1 of settling)
	db $FF
	db $1D
	db $09
	db $0A
;Mirrored version	
	db $1D
	db $FF
	db $0A
	db $09
CapeSettle2: ;settle frame 2
	db $20
	db $FF
	db $1E
	db $1F
;Mirrored version		
	db $FF
	db $20
	db $1F
	db $1E
;***************************************
jmp_57_ACA5: 
	LDA PlayerState
	CMP #$09
	BCS bra4_ACCF
	RTS
jmp_57_ACAC: ;freeze flag
	LDA FreezeFlag
	BEQ bra4_ACBE ;Branch if the game isn't frozen
	LDA PlayerMovement
	AND #$04
	BNE bra4_ACBD_RTS ;Make sure the player isn't moving up
	LDA #$00
	STA PlayerAction
	STA PlayerAnimationFrame ;Reset the player's animation and action
bra4_ACBD_RTS:
	RTS
bra4_ACBE: ;If game not frozen, go through this list
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
	LDA tbl4_ACDE+1,Y
	STA $33
	JMP ($32) ;jump to pointer
tbl4_ACDE:
	dw ofs_AE4F
	dw ofs_AE4F
	dw ofs_AE4F
	dw ClimbingRoutines
	dw ofs_B57C
	dw ofs_B724 ;State 5 (currently unknown)
	dw ofs_B8DE
	dw ofs_B8DE
	dw ofs_B90C
	dw ofs_B724
	dw ofs_B76A
	dw ofs_B782
	dw ofs_B794
	dw ofs_B7B5
	dw ofs_B7CD
	dw ofs_B7DF
	dw ofs_B7F7
	dw ofs_B80F
	dw ofs_B821
jmp_57_AD04:
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
	STA EventPart
	RTS
sub4_AD27:
	LDA DataBank2
	CMP #$26
	BEQ bra4_AD8B_RTS
	LDA WorldNumber
	CMP #$07
	BCC bra4_AD3E
	LDA #$00
	STA LevelTimerLo
	STA LevelTimerHi
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
	LDA LevelTimerLo
	SEC
	SBC #$01
	STA LevelTimerLo
	LDA LevelTimerHi
	SBC #$00
	STA LevelTimerHi
	BNE bra4_AD8B_RTS
	LDA LevelTimerLo
	BNE bra4_AD8B_RTS
	STA PlayerPowerup
	LDA #$01
	STA $0398
	LDA Player1YoshiStatus
	BEQ bra4_AD76
	JSR DismountYoshiRoutine ;unlogged
bra4_AD76:
	LDA #$00
	STA EventPart
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
	LDA PlayerPowerup
	CMP #$03 ;if the player doesn't have a cape,
	BCC bra4_ADB0 ;branch
	LDX #$04 ;set cape state
bra4_ADB0:
	STX $E1
bra4_ADB4_RTS:
	RTS
sub4_ADB3:
	LDA Player1YoshiStatus
	BEQ bra4_ADE2 ;Branch if the player doesn't have Yoshi
	LDA HurtFlag
	BEQ bra4_ADE2 ;Branch if the damage flag isn't set
	LDA #$00
	STA HurtFlag ;Otherwise, clear the damage flag
	LDA #$40
	STA PlayerYSpeed ;Set player's vertical speed to 64
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Set vertical movement upwards
	LDA #sfxPowerDown
	STA SFXRegister ;Play damage sound
	LDA #$03
	STA PlayerAction ;Knock the player off Yoshi
	LDA #$00
	STA PlayerState ;Stop whatever the player was doing
	JSR DismountYoshiRoutine
	LDA #$04
	STA YoshiUnmountedState
	STA $50
bra4_ADE2:
	LDA PlayerHoldFlag	
	CMP PlayerHoldFlag2 ;if the player's carry flag is equal to its duplicate,
	BEQ bra4_ADF0 ;branch
	STA PlayerHoldFlag2 ;if not, make it equal
	JSR sub4_A14A
bra4_ADF0:
	LDY InvincibilityTimer
	BEQ bra4_AE14_RTS ;Stop if the timer is empty
	LDA FrameCount
	AND #$03
	BNE bra4_AE14_RTS ;Only do this every 4 frames
	CPY #$01
	BNE bra4_AE03
	LDX #musInvincibleStar
	STX MusicRegister ;Play the Valley of Bowser theme
	LDX #sfxPowerup
	STX SFXRegister
bra4_AE03:
	CPY #$F8
	BCC bra4_AE0F
	JSR sub4_A4CE ;Clear the timer if it goes over 248
	LDA #$FF
	STA InvincibilityTimer
bra4_AE0F:
	INC InvincibilityTimer ;Increment timer
bra4_AE14_RTS:
	RTS 
ItemBoxLogicSub: ;X: Itembox, Y: Player Power
	LDA zInputBottleNeck
	AND #buttonSelect ;Continue if select pressed
	BEQ ItemBoxLogicDone
	
	LDA #$07
	STA Event ;Set to event 7 (using lesser powerup from item box)
	
	LDY PlayerPowerup ;Load current powerup into Y register
	CPY #$04
	BNE bra4_AE27 ;Branch if player doesn't have cape
	LDY #$03 ;Load feather item to Y register
	
bra4_AE27:
	LDX ItemBox ;Load item box contents into x register
	BEQ ItemBoxLogicDone ;If item box is empty, stop
	CPX #$02
	BCS bra4_AE34 ;Branch if there's a flower in the item box
	CPY #$00
	BNE bra4_AE45 ;Branch if not empty nor flower
	
bra4_AE34:
	STY ItemBox ;Put powerup from from Y register in item box
	LDA #$01
	STX PlayerPowerup ;Use item box contents stored in the x register
	CPX #$03 ;if the player doesn't have a cape,
	BNE bra4_AE42 ;branch
	LDA #$81
	
bra4_AE42:
	STA PlayerPowerupBuffer
bra4_AE45:
	LDA ItemBoxSFX,X
	STA SFXRegister ;Play the corresponding sound effect for the item
ItemBoxLogicDone:
	RTS
ItemBoxSFX:
	db $00 ;Empty
	db sfxPowerup ;Mushroom
	db sfxPowerup ;Flower
	db sfxFeather ;Feather
ofs_AE4F:
	LDA PlayerPowerup
	CMP #$03
	BCC bra4_AE59 ;If the player doesn't have a cape, branch
	JSR SpinCapeRoutine ;If they do, jump
bra4_AE59:
	LDA PlayerAction+1
	ASL
	TAY ;Get pointer for player's action value
	LDA tbl4_AE6A,Y
	STA $32 ;Load low byte of pointer
	LDA tbl4_AE6A+1,Y
	STA $33 ;Load high byte of pointer
	JMP ($32) ;Jump to loaded pointer location
tbl4_AE6A:
	dw PAct_Idle ;Idle
	dw PAct_Walk ;Walking
	dw PAct_Run ;Running
	dw PAct_Walk ;Unused
	dw PAct_Jump ;Jumping
	dw PAct_Spin ;Spinning/Spin Jump
	dw PAct_Idle ;Unused, likely meant for turning around
	dw PAct_Duck ;Ducking
	dw PAct_Idle ;Looking up
	dw PAct_Jump ;Leaping (Run Jump)
	dw PAct_Jump ;Falling
	dw PAct_Swim ;Sinking
	dw PAct_Swim ;Swimming up
	dw PAct_Run ;Climbing/Yoshi Tongue (Idle)
	dw PAct_Jump ;Climbing/Yoshi Tongue (Moving)
	dw PAct_Jump ;Flying
	dw PAct_Jump ;Victory Pose
	dw pnt_AF86
	dw PAct_Swim
	dw pnt_AF92
	
PAct_Idle:
	LDA PlayerYSpeed
	BNE PlayerIdleFallChk ;Branch if player is moving vertically
	LDA PlayerMovement
	AND #$04
	BNE PAct_IdleDone ;Make sure the player isn't moving up
	LDA zInputCurrentState
	BNE PAct_IdleChecks ;Branch if any button is held
	STA PlayerAction ;Make the player stand still if none are held
PAct_IdleChecks:
	JSR LookUpDuckRoutine ;Check for ducking and looking up
	JSR PlayerWalkRoutine ;Check for walking
	JSR SwimHoldRoutine ;Check for swimming
	JSR ShootFireball ;Check for shooting fireballs
PAct_IdleDone:
	RTS
PlayerIdleFallChk:
	LDA PlayerMovement
	AND #$04
	BNE PAct_IdleDone ;Branch if the player is already moving up
	LDA #$0A
	STA PlayerAction ;Trigger the "falling" action
	RTS
PAct_Duck:
	LDA PlayerYSpeed
	BNE PlayerDuckFallChk ;Branch if the player is moving vertically
	LDA PlayerMovement ;Continue if they aren't
	AND #$04
	BNE PAct_DuckDone ;Branch if the player is moving up
	LDA zInputCurrentState ;Otherwise, continue
	AND #dirDown
	BNE bra4_AED0 ;Branch if down is held
	LDA #$00
	STA PlayerAction ;If not, set action to standing still
bra4_AED0:
	JSR LookUpDuckRoutine
	JSR SwimHoldRoutine
	JSR ShootFireball
PAct_DuckDone:
	RTS
PlayerDuckFallChk:
	LDA PlayerMovement
	AND #$04
	BNE PAct_DuckDone ;If player not moving up,
	LDA #$0A
	STA PlayerAction ;Set action to falling
	RTS
PAct_Walk:
	JSR PlayerWalkFallRout ;Make sure player is on solid ground
	LDA PlayerXSpeed
	BNE bra4_AEEE
	STA PlayerAction ;Make the player stop when their horizontal speed reaches 0
bra4_AEEE:
	JSR PlayerWalkRoutine
	JSR PlayerRunRoutine
	JSR SwimHoldRoutine
	JSR ShootFireball
	LDA zInputCurrentState
	AND #dirDown
	BEQ bra4_AF05_RTS ;Make sure down is held
	LDA #$07
	STA PlayerAction ;Set action to ducking
bra4_AF05_RTS:
	RTS
PAct_Run:
	JSR PlayerWalkFallRout ;Make sure the player is on solid ground
	LDA PlayerXSpeed
	BNE bra4_AF0F
	STA PlayerAction ;Make the player stop when their horizontal speed reaches 0
bra4_AF0F:
	JSR PlayerWalkRoutine
	JSR PlayerRunRoutine
	JSR SwimHoldRoutine
	JSR LeapRoutine
	JSR ShootFireball
	RTS
PlayerWalkFallRout:
	LDA PlayerYSpeed
	CMP #$07
	BCC FallingChkDone ;Make sure the player's Y speed is greater than 7
	LDX #$0A ;If it is, make the player fall
	LDA UnderwaterFlag
	BEQ SetPlayerFallingAct
	LDX #$0B ;If underwater, make the player sink instead
SetPlayerFallingAct:
	STX PlayerAction ;Store loaded action
	PLA
	PLA
FallingChkDone:
	RTS
PAct_Jump:
	LDA PlayerYSpeed
	BNE bra4_AF41 ;Branch if the player is already moving vertically
	LDA PlayerMovement
	AND #$04
	BNE bra4_AF41 ;Branch if the player is moving up
	LDA #$01
	STA PlayerAction ;Set action to walking
bra4_AF41:
	JSR JumpYSpdRoutine ;Extend Y height if A is held
	JSR MidAirFireShoot ;Shoot fire in mid air
	JSR JumpXSpdRoutine ;X movement in mid air
	LDA PlayerState
	BEQ bra4_AF51 ;Skip the underwater object grab if the player isn't underwater
	JSR SwimHoldRoutine
bra4_AF51:
	JSR SpinJumpRoutine
	RTS
	
JumpYSpdRoutine:
	LDA PlayerMovement
	AND #$04
	BEQ JumpYSpdRtDone ;Make sure the player is moving up
	LDA zInputCurrentState
	AND #buttonA
	BEQ JumpYSpdRtDone ;Make sure the A button is held
	LDA PlayerYSpeed
	CLC
	ADC #$01
	STA PlayerYSpeed ;Increase the player's vertical speed by 1
JumpYSpdRtDone:
	RTS
PAct_Spin:
	LDA PlayerYSpeed
	BNE bra4_AF78 ;Branch if the player is already moving vertically
	LDA PlayerMovement
	AND #$04
	BNE bra4_AF78 ;Branch if the player is moving up
	LDA #$01
	STA PlayerAction ;Set action to walking
bra4_AF78:
	JSR FireFlowerChk
	JSR JumpXSpdRoutine
	LDA PlayerState
	BEQ bra4_AF85_RTS ;Skip the underwater object grab if the player isn't underwater
	JSR SwimHoldRoutine
bra4_AF85_RTS:
	RTS
pnt_AF86:
	LDX #$00
	LDY #$10
	JSR ActionTimerRoutine ;Wait for one 10 frame tick
	LDA #$04
	STA PlayerAction
	RTS
pnt_AF92:
	JSR SwimHoldRoutine
	LDX #$00
	LDY #$08
	JSR ActionTimerRoutine ;Wait for one 8 frame tick
	LDA #$00
	STA PlayerAction ;set player action to nothing
	RTS
;-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-==-=-=-=-=-=-=-=-
;FIREBALL SPAWNING
;-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-==-=-=-=-=-=-=-=-	
ShootFireball:
	LDA PlayerPowerup
	CMP #$02
	BNE ShootFireballDone ;Make sure the player has fire power
	LDA FireballSlot
	AND FireballSlot2
	BNE ShootFireballDone ;Make sure there's an open fireball slot
	LDA zInputCurrentState	
	AND #dirDown
	BNE ShootFireballDone ;Stop if down is held
	LDA zInputBottleNeck
	AND #buttonB
	BEQ ShootFireballDone ;Wait until B is pressed
	LDA #$13 ;norm fireball 
	STA PlayerAction ;Set PAct to throwing fireball
	JSR SetFireballDir ;Jump to set fireball direction
ShootFireballDone:
	RTS		
MidAirFireShoot:
	LDA PlayerPowerup
	CMP #$02
	BNE MidAirFireShootDone ;Make sure the player has fire power
	LDA FireballSlot
	AND FireballSlot2
	BNE MidAirFireShootDone ;Stop if there aren't any open fireball slots
	LDA zInputCurrentState
	AND #dirDown
	BNE MidAirFireShootDone ;Stop if down is held
	LDA zInputBottleNeck
	AND #buttonB
	BEQ MidAirFireShootDone ;Wait until B is pressed
	LDY #$11 ;Make the player shoot a mid-air fireball
	LDA UnderwaterFlag
	BEQ bra4_AFEB ;If not underwater, skip
	INY ;If underwater, make the player shoot an underwater fireball instead
bra4_AFEB:
	STY PlayerAction ;Store loaded action (type of fire to throw)
	JSR SetFireballDir ;Jump
MidAirFireShootDone:
	RTS
;-=-=--=-=		
FireFlowerChk: ;START HERE if spin jumping
	LDA PlayerPowerup
	CMP #$02
	BEQ bra4_AFF9 ;Branch if the player has fire power
FlowerChkDone:
	RTS ;Otherwise, end the check
bra4_AFF9:
	LDX UsedFireballSlots ;Load the current fireball slot number into the X register
	LDA FireballSlot,X
	BNE FlowerChkDone ;Branch if the current slot is occupied
	LDA #$40 ;Make fireball move left
	CPX #$00
	BNE SetSpinFireDir ;Branch if currently on fireball slot 1, this sets the direction of the fireball in the second slot
	TXA ;If the slot is zero, make fireball face right, sets the direction of the fireball in the first slot
SetSpinFireDir:
	STA $32 ;Store loaded fireball direction
	JMP SpawnFireball
;-=-=-=-=-=-=	
SetFireballDir:  ;Go here for normal or mid air fire
	LDA PlayerMovement
	AND #$C0 ;Get the player's direction
	STA $32 ;Use it for the fireball's direction
	LDX UsedFireballSlots
	LDA FireballSlot,X
	BEQ SpawnFireball ;If the fireball slot is open, branch
	RTS ;end and check other slot on next frame
	
SpawnFireball:
	INC FireballSlot,X ;Set selected fire slot to occupied
	LDY ObjectCount ;Load next open object slot
	LDA $32
	STA ObjectState,Y ;Store the fireball direction in object memory
	TXA ;set A to UsedFireballSlots
	CLC
	ADC #$06 ;add 6 to A (Used slots +6)
	STA ObjectSlot,Y ;Spawn the selected type of fireball (norm, mid-air, underwater)
	LDA $32
	AND #$40
	BNE FireSpawnLeft ;Branch if the fireball set to facing left
	LDA PlayerXPosDup
	CLC
	ADC #$00 ;clear carry of PlayerXPosDup
	STA ObjectXPos,Y ;Spawn at player's x position
	LDA PlayerXScreenDup
	ADC #$00 ;add carry if present 
	JMP FireSpawnY ;jump
FireSpawnLeft: ;if player facing left
	LDA PlayerXPosDup
	SEC
	SBC #$08
	STA ObjectXPos,Y ;Spawn it 1 tile to the left of the player
	LDA PlayerXScreenDup
	SBC #$00 ;subtract carry
FireSpawnY: ;set Y position of fireball 
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y ;Spawn it at same vertical screen as player
	LDA #$EC
	BMI bra4_B075 ;Branch
;unused code:
	CLC ;unlogged
	ADC PlayerYPosDup ;unlogged
	STA ObjectYPos,Y ;unlogged
	BCS bra4_B066 ;unlogged
	CMP #$F0 ;unlogged
	BCC bra4_B08C ;unlogged
bra4_B066:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,Y ;unlogged
	LDA ObjectYScreen,Y ;unlogged
	CLC ;unlogged
	ADC #$01 ;unlogged
	JMP loc4_B089 ;unlogged
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
	STA ObjectVariables,Y
	STA ObjectAction,Y
	INC ObjectCount ;Add it to the total object count
	LDA UsedFireballSlots
	EOR #$01
	STA UsedFireballSlots
	RTS
;----------------------------------------
;END OF FIREBALL SPAWNING
;----------------------------------------
PAct_Swim: ;0C
	LDA PlayerMovement
	AND #$04
	BNE bra4_B0B2 ;Branch if the player is moving up
	LDX #$0B ;Set action to sinking
	LDA PlayerYSpeed
	BNE bra4_B0B0 ;If the player has vertical speed, keep the previous action and branch
	LDX #$01 ;If they don't, make them walk instead
bra4_B0B0:
	STX PlayerAction ;Store action value
bra4_B0B2: ;swimming action list
	JSR SwimMove
	JSR SwimHoldRoutine
	JSR MidAirFireShoot
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
	LDA zInputBottleNeck
	AND #buttonB
	BEQ bra4_B11D_RTS ;Make sure B is pressed
	LDA #$00
	STA SwallowFrameCount
	STA YoshiSwallowTimer ;Clear Yoshi's swallow timer
	LDY #$0C ;Set player state
	LDA zInputCurrentState
	AND #dirDown
	BEQ bra4_B0F4 ;Branch if down isn't held
	LDY #$0E ;If down is held, set the player's state
bra4_B0F4:
	LDA zInputCurrentState
	AND #dirRight+dirLeft
	BEQ bra4_B0FD ;Branch if left or right aren't held
	LDY #$0D ;If left are right are held, set the player's state
bra4_B0FD:
	STY PlayerState ;Store the player's state
	LDA Player1YoshiStatus
	CMP #$07
	BCC bra4_B113 ;Branch if not about to swallow stored item
	SEC ;If about to swallow item, continue
	SBC #$05
	STA Player1YoshiStatus
	JSR sub4_A14A
	LDA #$00
	STA PlayerAnimationFrame
bra4_B113:
	LDA Player1YoshiStatus
	CMP #$04
	BNE bra4_B11E
	JSR SpawnYoshiFire
bra4_B11D_RTS:
	RTS
bra4_B11E:
	LDY ObjectCount
	STA ObjectSlot,Y
	LDA PlayerMovement
	AND #buttonB
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
	CLC ;unlogged
	ADC PlayerYPosDup ;unlogged
	STA ObjectYPos,Y ;unlogged
	BCS bra4_B15C ;unlogged
	CMP #$F0 ;unlogged
	BCC bra4_B182 ;unlogged
bra4_B15C:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,Y ;unlogged
	LDA ObjectYScreen,Y ;unlogged
	CLC ;unlogged
	ADC #$01 ;unlogged
	JMP loc4_B17F ;unlogged
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
	STA ObjectVariables,Y
	LDA $0632
	STA $058C,Y
	INC ObjectCount
	RTS
loc4_B193:
	LDA PlayerState
	CMP #$09
	BCS bra4_B1C0_RTS
	LDA zInputBottleNeck
	AND #buttonB
	BEQ bra4_B1C0_RTS
	LDA #sfxYoshiTongue
	STA SFXRegister
	LDY #$09
	LDA zInputCurrentState
	AND #dirDown
	BEQ bra4_B1AF
	LDY #$0B
bra4_B1AF:
	LDA zInputCurrentState
	AND #dirRight+dirLeft
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
	LDA zInputCurrentState
	AND #dirDown
	BEQ bra4_B1CC
	LDY #$11
bra4_B1CC:
	LDA zInputCurrentState
	AND #dirRight+dirLeft
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
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
;YOSHI FIRE SPAWN
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
;This is unoptimised, it duplicates the code for calculating the exact same offsets for all 3 fireballs 
SpawnYoshiFire:
	LDY ObjectCount ;Get slot index based on object count
	LDA #$08
	STA ObjectSlot,Y ;Load middle fireball
	LDA #$09
	STA ObjectSlot+1,Y ;Load bottom fireball
	LDA #$0A
	STA ObjectSlot+2,Y ;Load top fireball
	LDA PlayerMovement
	STA ObjectState,Y
	STA ObjectState+1,Y
	STA ObjectState+2,Y ;Set fireballs to the player's direction
	
	AND #$40 ;bitmask playermovement 
	BNE bra4_B225
	LDA PlayerXPosDup
	CLC
	ADC #$08 ;add 08 to duplicate player X position
	STA ObjectXPos,Y ;store it as the object X position offset by object count (set spawn location)
	LDA PlayerXScreenDup
	ADC #$00 ;apply carry if present to X screen duplicate (unknown function)
	JMP loc4_B231 ;Jump ahead
	
bra4_B225: ;set X spawn offset for middle fireball for left facing (the other 2 seem to adjust in some other way)
	LDA PlayerXPosDup
	SEC
	SBC #$10 ;subtract 10 from duplicate player X position
	STA ObjectXPos,Y ;store it as the X position for the middle fireball
	LDA PlayerXScreenDup 
	SBC #$00 ;subtract carry from duplicate player X screen (unknown function)
	
loc4_B231:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E4
	BMI bra4_B258
	CLC ;unlogged
	ADC PlayerYPosDup ;unlogged
	STA ObjectYPos,Y ;unlogged
	BCS bra4_B249 ;unlogged
	CMP #$F0 ;unlogged
	BCC bra4_B26F ;unlogged
bra4_B249:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,Y ;unlogged
	LDA ObjectYScreen,Y ;unlogged
	CLC ;unlogged
	ADC #$01 ;unlogged
	JMP loc4_B26C ;unlogged
bra4_B258:
	CLC
	ADC PlayerYPosDup ;add #$E4 to duplicate Y pos
	STA ObjectYPos,Y ; store it as Y position for middle fireball (final position)

	BCS bra4_B26F ;Branch on carry set
	SEC ;else, set carry
	SBC #$10 ;subtract 10
	STA ObjectYPos,Y ;store it as the Y pos for middle fireball
	LDA ObjectYScreen,Y 
	SEC
	SBC #$01 ;subtract 1 from (middle fireball) object Y screen 
loc4_B26C:
	STA ObjectYScreen,Y ;store it
	
bra4_B26F: ;Bottom Fireball
	LDA #$00 
	STA $058C,Y ;clear UNKNOWN offset by Object count 
	STA ObjectAction,Y ; clear object action of middle firebaall
	INY ;increment Y offset (select bottom fireball)
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
	CLC ;unlogged
	ADC PlayerYPosDup ;unlogged
	STA ObjectYPos,Y ;unlogged
	BCS bra4_B2B1 ;unlogged
	CMP #$F0 ;unlogged
	BCC bra4_B2D7 ;unlogged
bra4_B2B1:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,Y ;unlogged
	LDA ObjectYScreen,Y ;unlogged
	CLC ;unlogged
	ADC #$01 ;unlogged
	JMP loc4_B2D4 ;unlogged
	
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
	
bra4_B2D7: ;Top fireball
	LDA #$00
	STA $058C,Y
	STA ObjectAction,Y
	INY ;select top fireball
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
	CLC ;unlogged
	ADC PlayerYPosDup ;unlogged
	STA ObjectYPos,Y ;unlogged
	BCS bra4_B319 ;unlogged
	CMP #$F0 ;unlogged
	BCC bra4_B33F ;unlogged
bra4_B319:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,Y ;unlogged
	LDA ObjectYScreen,Y ;unlogged
	CLC ;unlogged
	ADC #$01 ;unlogged
	JMP loc4_B33C ;unlogged
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
	STA ObjectAction,Y
	INY ;increment Y
	STY ObjectCount ;Update object count
	LDA #sfxYoshiFireSpit
	STA SFXRegister ;Play Yoshi fire sound
	RTS ;end
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
;END OF YOSHI FIRE SPAWN
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
	
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
;WALKING AND RUNNING
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
PlayerWalkRoutine:
	LDA zInputCurrentState
	AND #dirRight
	BEQ PlayerWalkLeft ;Branch if right isn't held
	LDA PlayerMovement ;If it is, continue
	AND #$BE ;Make the player face right
	JMP loc4_B368 ;Jump
PlayerWalkLeft:
	LDA zInputCurrentState
	AND #dirLeft
	BEQ PlayerWalkDone ;Make sure left is held
	LDA PlayerMovement
	ORA #$41 ;Make the player face left
loc4_B368:
	STA PlayerMovement ;Store movement value
	LDA PlayerXSpeed
	CMP #$10
	BCS SetWalking ;Set walking speed at #$10, or 16 decimal
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed ;Accelerate the player's speed by 4
SetWalking:
	LDA #$01
	STA PlayerAction ;Trigger "walking" action
PlayerWalkDone:
	RTS
SwimMove:
	LDA zInputCurrentState	
	AND #dirRight
	BEQ SwimLeft ;If right is held,
	LDA PlayerMovement
	AND #$BE ;Make the player face right
	JMP loc4_B395 ;Jump
SwimLeft:
	LDA zInputCurrentState
	AND #dirLeft
	BEQ SwimMoveDone ;If left is held,
	LDA PlayerMovement
	ORA #$41 ;Make the player face left
loc4_B395:
	STA PlayerMovement ;Store movement value
	LDA PlayerXSpeed
	CMP #$10
	BCS SwimMoveDone ;If X speed < 16,
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed ;Increase the player's X speed by 4
SwimMoveDone:
	RTS
JumpXSpdRoutine:
	LDA PlayerMovement
	STA $26 ;Copy movement value
	LDA zInputCurrentState
	AND #dirRight
	BEQ DoLeftJump ;Branch if the player isn't holding right
	LDA PlayerMovement
	AND #$BE ;Set player's direction to right
	JMP JumpDirectnChk ;Jump
DoLeftJump:
	LDA zInputCurrentState
	AND #dirLeft
	BNE PlayerSetLeft ;Branch if left is held
	LDA #$01 ;Set acceleration
	BNE JumpXSpdCap ;Branch
PlayerSetLeft:
	LDA PlayerMovement
	ORA #$41 ;Set player's direction to left
JumpDirectnChk:
	STA PlayerMovement ;Store loaded direction
	EOR $26	
	AND #$40
	BEQ SetJumpXAccel ;If the player stays in the same direction while jumping, branch
	LDA #$00
	STA PlayerXSpeed ;Clear X speed
	RTS
SetJumpXAccel:
	LDA #$03 ;Set acceleration
JumpXSpdCap:
	CLC
	ADC PlayerXSpeed ;Acceleration + Speed
	CMP #$20
	BCS JumpXSpdRtDone ;Keep adding it until the cap is reached
	STA PlayerXSpeed ;Store the sum
JumpXSpdRtDone:
	RTS
SwimHoldRoutine:
	LDA UnderwaterFlag
	BEQ JumpingRoutine ;If player isn't underwater, branch
	LDA PlayerHoldFlag
	BEQ SwimChk ;If player isn't carrying anything, branch
	LDA #$20
	STA PlayerYSpeed ;Set vertical speed to 32
	LDA zInputCurrentState	
	AND #dirDown
	BEQ HoldFloatUp ;Make the player float if down isn't held
	LDA PlayerMovement
	AND #$FB
	STA PlayerMovement ;If it is held, make player swim down
	RTS
HoldFloatUp:
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Make player float up
	RTS
SwimChk:
	LDA zInputBottleNeck
	AND #buttonA
	BEQ SwimmingDone ;Make sure A is pressed
	LDA zInputCurrentState
	AND #dirUp
	BEQ DoSwim ;Dismount Yoshi if up is held 
	JSR DismountYoshiRoutine
DoSwim:
	LDA #$30
	STA PlayerYSpeed ;Set vertical speed to 48
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Set movement to moving up
	LDA #sfxSwim
	STA SFXRegister ;Play swim sound
	LDA #$0C
	STA PlayerAction ;Set action to swimming up
SwimmingDone:
	RTS
JumpingRoutine:
	LDA zInputBottleNeck
	AND #buttonA
	BEQ SwimmingDone ;Make sure the A button is pressed
	LDA PlayerYSpeed
	BNE SwimmingDone ;Make sure that the player has no leftover vertical speed
	LDA PlayerHoldFlag
	BNE DoBJump ;Branch if the player is carrying something
	LDA zInputCurrentState
	AND #dirUp
	BNE ExecuteSpinJump ;If up is held, do a spin jump instead
DoBJump:
	LDY #$48 ;Set vertical speed to $48
	LDA zInputCurrentState
	AND #buttonB
	BEQ DoLowJump
	LDY #$58 ;If B is held, set vertical speed to $58
DoLowJump:
	LDA zInputCurrentState
	AND #dirDown
	BEQ ExecuteJump
	LDY #$28 ;If down is held, set vertical speed to $28
ExecuteJump:
	STY PlayerYSpeed ;Store the jump height
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Set vertical movement upwards
	LDA #$04
	STA PlayerAction ;Trigger jumping animation/action
	LDA #sfxJump
	STA SFXRegister ;Play the jump sound
	RTS
SpinJumpRoutine:
	LDA Player1YoshiStatus
	BEQ SpinJumpDone ;Make sure the player isn't riding Yoshi
	LDA zInputBottleNeck
	AND #buttonA
	BEQ SpinJumpDone ;Make sure A is held
	LDA zInputCurrentState
	AND #dirUp
	BEQ SpinJumpDone ;Make sure up is held
ExecuteSpinJump:
	JSR DismountYoshiRoutine
	LDA #$50
	STA PlayerYSpeed ;Set vertical speed to $50
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Set vertical movement upwards
	LDA #$05
	STA PlayerAction ;Trigger spinning action
	LDA #sfxSpinJump
	STA SFXRegister ;Play the spin sound
SpinJumpDone:
	RTS
DismountYoshiRoutine:
	LDA Player1YoshiStatus ;if player isn't riding yoshi,
	BEQ DismountYoshiRtDone ;stop
	LDA PlayerMovement
	STA YoshiIdleMovement
	LDA Player1YoshiStatus
	STA YoshiIdleStorage ;backup whatever yoshi had in his mouth
	LDA #$00
	STA Player1YoshiStatus ;get off yoshi
	STA YoshiExitStatus
	JSR sub4_A14A
	LDA #$04
	STA YoshiUnmountedState
	LDA PlayerYPosDup ;get player y position
	SEC
	SBC #$20 ;subtract it by $20
	STA YoshiYPos ;store result as yoshi's y position
	LDA PlayerYScreenDup
	SBC #$00 ;subtract player y screen by nothing (why?)
	STA YoshiYScreen ;store result as yoshi's y screen
	LDA YoshiIdleMovement
	AND #$40 ;if yoshi is facing left,
	BNE bra4_B4D2 ;branch
	LDA PlayerMovement
	ORA #$01
	STA PlayerMovement
	LDA PlayerXPosDup ;get player x position
	SEC
	SBC #$08 ;subtract it by 8
	STA YoshiXPos ;store result as yoshi's x position
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
	LDA PlayerXScreenDup ;Get player X screen
	SBC #$00 ;subtract carry if present
	STA YoshiXScreen ;Set as Yoshi's X screen
	LDA #$00
	STA $05F6
	LDA #$30
	STA PlayerXSpeed
	INC ObjectCount
DismountYoshiRtDone:
	RTS
LeapRoutine:
	LDA PlayerAnimationFrame
	CMP #$10 ;if animation frame is lower than 10,
	BCC LeapingDone ;branch
	LDA zInputBottleNeck ;
	AND #buttonA ;if A not pressed,
	BEQ LeapingDone ;branch
	LDA #$60 ;
	STA PlayerYSpeed ;set y speed to $60
	LDA #$09 ;
	STA PlayerAction ;set action to leap
LeapingDone:
	RTS
PlayerRunRoutine:
	LDA UnderwaterFlag
	BNE bra4_B55B_RTS ;Make sure the player isn't underwater
	LDA zInputCurrentState
	AND #$03
	BEQ bra4_B55C ;Make sure either left or right are held. If they aren't, skip ahead.
	LDA zInputCurrentState ;Otherwise, continue
	AND #buttonB
	BNE SetupPlayerRun ;Switch to running if B is held
	STA $0314 ;Likely an unused or residual opcode. Does nothing.
	LDA PlayerXSpeed
	CMP #$10
	BCS PlayerWalk2Done ;Limit the player's X speed to #$10, or 16 decimal
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed ;Increment the player's X speed by 4
PlayerWalk2Done:
	RTS
unused_func1:
	LDA $0314 ;unlogged
	CMP #$30 ;unlogged
	BCS SetupPlayerRun ;unlogged
	INC $0314 ;unlogged
	RTS ;unlogged
SetupPlayerRun:
	LDA PlayerMovement ;Load the player's movement info
	AND #$01 ;Test the horizontal movement bit
	CMP $4F ;Compare with the previous direction
	BEQ DoPlayerRun ;If the player stays in the same direction, have them run like normal
	STA $4F ;Otherwise, make the player turn around
	LDA #$10
	STA PlayerXSpeed ;Set their horizontal speed to #$10
	LDA #$00
	STA PlayerAction ;Reset their action to standing still
DoPlayerRun:
	LDA #$02
	STA PlayerAction ;Set action to running
	LDA PlayerXSpeed
	CMP #$40
	BCS bra4_B55B_RTS ;Set running speed cap at #$40, or 64 decimal
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed ;Accelerate the player's speed by 4 until the cap is reached
bra4_B55B_RTS:
	RTS
bra4_B55C:
	LDA PlayerXSpeed
	BEQ bra4_B55B_RTS ;Make sure the player is moving horizontally
	LDA #$01
	STA PlayerAction ;Set action to walking
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
;END OF WALKING AND RUNNING
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
LookUpDuckRoutine:
	LDA zInputCurrentState
	AND #dirDown
	BEQ DoLookUp ;If down isn't held, move to the next check
	LDA #$07
	STA PlayerAction ;Otherwise, set the player's action to ducking
DoLookUp:
	LDA zInputCurrentState
	AND #dirUp
	BEQ LookupDuckDone ;Make sure up is held
	LDA #$08
	STA PlayerAction ;Set the player's action to looking up
LookupDuckDone:
	RTS
ofs_B57C:
	JSR SpinCapeRoutine
	LDA PlayerAction+1
	ASL
	TAY ;Get the pointer for player's action value
	LDA tbl4_B590,Y
	STA $32 ;Load lower byte of pointer
	LDA tbl4_B590+1,Y
	STA $33 ;Load upper byte of pointer
	JMP ($32) ;Jump to loaded pointer
tbl4_B590:
	dw PAct_Idle
	dw PAct_Walk
	dw PAct_Run
	dw PAct_Walk
	dw PAct_Jump
	dw PAct_Jump
	dw PAct_Idle
	dw PAct_Idle
	dw PAct_Idle
	dw PSpeedTimer
	dw PAct_Jump
	dw PAct_Swim
	dw PAct_Swim
	dw PAct_Run
	dw PAct_Jump
	dw pnt_B5DC
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;P SPEED ROUTINE
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
PSpeedTimer:
	INC FlightTakeoffTimer ;Increment takeoff timer
	LDA FlightTakeoffTimer
	CMP #$50
	BCC bra4_B5C4 ;Branch if less than 80 frames have passed
	LDA #$00
	STA FlightTakeoffTimer ;Clear takeoff timer
	LDA #$0F
	STA PlayerAction ;Set action to flying
	RTS
bra4_B5C4: ;if P speed timer not reached
	LDA PlayerYSpeed
	BNE bra4_B5D2 ;Branch if Y speed isn't empty
	LDA PlayerMovement
	AND #$04
	BNE bra4_B5D2 ;Branch if moving upwards
	LDA #$01
	STA PlayerAction ;Set action to walking
bra4_B5D2:
	JSR SwimMove
	JSR sub4_B616
	JSR sub4_B669
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=	
;END OF P SPEED ROUTINE
;--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=		
pnt_B5DC:
	LDA Player1YoshiStatus
	BEQ bra4_B5E7
	JSR SwimMove
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
	STA PlayerAction ;Set player action to walking
bra4_B5FB_RTS:
	RTS
	
SpinCapeRoutine:
	LDA Player1YoshiStatus
	BNE SpinCapeDone ;Make sure the player isn't riding Yoshi
	LDA PlayerHoldFlag
	BNE SpinCapeDone ;Make sure the player isn't carrying anything
	LDA zInputBottleNeck
	AND #buttonB
	BEQ SpinCapeDone ;Make sure B is pressed
	LDA #$08
	STA PlayerState ;Set player state
	LDA #sfxSpinJump
	STA SFXRegister ;Play spin sound
SpinCapeDone:
	RTS
sub4_B616:
	LDA #$30
	STA PlayerXSpeed
	RTS
sub4_B61B:
	LDA zInputCurrentState ;
	AND #buttonB ;if b still held,
	BNE bra4_B627 ;branch
	LDA #$0A ;
	STA PlayerAction ;set action to falling
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
	LDA zInputBottleNeck
	AND $32
	BEQ bra4_B653
	INC PlayerYSpeed
	LDA #$50
	CMP PlayerYSpeed
	BCS bra4_B668_RTS
	STA PlayerYSpeed
	RTS
bra4_B653:
	LDA zInputBottleNeck
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
	LDA zInputCurrentState ;
	AND #buttonB ;if B not held,
	BEQ bra4_B67B_RTS ;branch
	LDA zInputCurrentState ;
	AND #buttonA ;if A not held,
	BEQ bra4_B67B_RTS ;branch
	LDA #$40 ;
	STA PlayerYSpeed ;set Y speed to $40
bra4_B67B_RTS:
	RTS
;-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;Climbing 
;-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-	
ClimbingRoutines: ;This section locks the player in place if no directions are held (suspend player in mid air)
	LDA zInputCurrentState
	AND #$0F
	BNE ClimbingActionList ;If a direction is held, branch
	LDA #$00 ;else
	STA PlayerYSpeed
	STA PlayerXSpeed ;Stop the player's movement
	LDA #$0D
	STA PlayerAction ;Make the player climb
;************************************************************
ClimbingActionList:
	JSR ClimbJoyUpChk
	JSR PlayerClimbJump
	RTS
PlayerClimbJump: ;Jump from climbing
	LDA zInputBottleNeck
	AND #buttonA
	BEQ PlayerClimbJumpRTS ;If A button not pressed, branch
	LDA zInputCurrentState ;else
	AND #dirUp
	BNE PlayerClimbJumpRTS ;Make sure that up isn't being held
	LDA #$50
	STA PlayerYSpeed ;Set Y speed to $50
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Set vertical movement to up
	LDA #$04
	STA PlayerAction ;Make the player jump
	LDA #sfxJump
	STA SFXRegister ;Play the jump sound
	LDA #$00
	STA PlayerState ;Make the player stop climbing
	STA $06DC ;Clear Unknown 1
	STA $06DD ;Clear Unknown 2
PlayerClimbJumpRTS:
	RTS
;********************
ClimbJoyUpChk:
	LDA zInputCurrentState
	AND #dirUp ;if up isn't held,
	BEQ ClimbJoyDownChk ;branch ahead to down Dpad check
;Else
	LDA $06DD; load Unknown 2
	BEQ bra4_B6D1 ;if Unknown2 empty, branch ahead
	LDA #$00 ;else
	STA PlayerYSpeed;clear y speed
	BEQ ClimbJoyDownChk ;branch ahead, always
	
bra4_B6D1: ;unknown, mirroring related maybe?
	LDA PlayerMovement
	ORA #$04 ;flip some bits
	BNE bra4_B6E7 ;If result non zero, branch
	
ClimbJoyDownChk:
	LDA zInputCurrentState
	AND #dirDown ;if down isn't held,
	BEQ bra4_B6EF ;branch
	LDA #$00
	STA $06DD ;Clear Unknown 2
	LDA PlayerMovement
	AND #$7B
	
bra4_B6E7: ;Move player Up/Down
	STA PlayerMovement
	LDA #$10
	STA PlayerYSpeed ;set Y speed to #$10
	BNE PlayerClimbDone
	
bra4_B6EF:
	LDA $06DE
	BNE ClimbJoyLeftChk
	LDA $06DC
	BEQ ClimbJoyLeftChk
	LDA #$00
	STA PlayerXSpeed
	RTS
	
ClimbJoyLeftChk:
	LDA zInputCurrentState ;
	AND #dirLeft ;if left isn't pressed,
	BEQ ClimbJoyRightChk ;branch to check right
	LDA PlayerMovement
	ORA #$41
	BNE bra4_B716
	
ClimbJoyRightChk:
	LDA zInputCurrentState ;
	AND #dirRight ;if right isn't pressed,
	BEQ bra4_B71E_RTS ;branch to RTS
	LDA PlayerMovement
	AND #$BE
	
bra4_B716: ;Move player Left/Right
	STA PlayerMovement  ;Store it
	LDA #$10
	STA PlayerXSpeed ;set Player X speed to #$10
	BNE PlayerClimbDone
	
bra4_B71E_RTS:
	RTS
	
PlayerClimbDone:
	LDA #$0E
	STA PlayerAction
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-		
ofs_B724:
	JSR TongueSpeedBoost
	JSR TongueSwimChk
	LDX #$0D
	LDY #$00
	LDA PlayerYSpeed ;If player not moving
	BEQ bra4_B734 ;branch
	LDY #$0A
bra4_B734:
	LDA zInputCurrentState
	AND #dirDown
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
	LDA Player1YoshiStatus
	CMP #$01
	BNE bra4_B75C ;Branch if the player isn't riding Yoshi
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
ofs_B76A:
	JSR TongueSpeedBoost
	JSR TongueSwimChk
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
ofs_B782:
	JSR TongueSpeedBoost
	JSR TongueSwimChk
	LDX #$06
	LDY #$07
	LDA #$0D
	STA $32
	JSR sub4_B741
	RTS
ofs_B794:
	JSR TongueSpeedBoost
	JSR TongueSwimChk
	LDX #$0D
	LDY #$00
	LDA zInputCurrentState
	AND #dirDown
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
ofs_B7B5:
	JSR TongueSpeedBoost
	JSR TongueSwimChk
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
ofs_B7CD:
	JSR TongueSpeedBoost
	JSR TongueSwimChk
	LDX #$06
	LDY #$07
	LDA #$01
	STA $32
	JSR sub4_B741
	RTS
ofs_B7DF:
	JSR SwimMove
	JSR TongueSwimChk
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
ofs_B7F7:
	JSR SwimMove
	JSR TongueSwimChk
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
ofs_B80F:
	JSR SwimMove
	JSR TongueSwimChk
	LDX #$06
	LDY #$07
	LDA #$03
	STA $32
	JSR sub4_B741
	RTS
ofs_B821:
	JSR SwimMove
	JSR TongueSwimChk
	LDX #$00
	LDA zInputCurrentState
	AND #$03
	BEQ bra4_B835 ;Branch if left/right aren't held
	LDA PlayerYSpeed
	BNE bra4_B835
	INX
bra4_B835:
	STX PlayerAction
	LDX #$00
	LDY #$40
	JSR sub4_B8C0
	LDA #$06
	STA Player1YoshiStatus ;Make Yoshi swallow
	JSR sub4_A14A
	LDA #sfxYoshiSwallow
	STA SFXRegister ;Play swallow sound
	RTS
TongueSpeedBoost:
	LDA zInputCurrentState
	AND #dirRight ;Make sure right is held
	BEQ bra4_B859
	LDA PlayerMovement
	AND #$FE ;Make the player face right
	JMP loc4_B864
bra4_B859:
	LDA zInputCurrentState
	AND #dirLeft ;Make sure left is held
	BEQ TongueSpdBoostDone
	LDA PlayerMovement
	ORA #$01 ;Set movement leftwards
loc4_B864:
	STA PlayerMovement
	LDA PlayerXSpeed
	CMP #$10 ;caps speed for when Yoshi sticks his tongue out
	BCS TongueSpdBoostDone ;Branch if x speed goes over 16 (this is basically a speed cap)
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
TongueSpdBoostDone:
	RTS
TongueSwimChk:
	LDA zInputBottleNeck
	AND #buttonA
	BEQ TongueSwimChkDone ;Make sure the A button is pressed
	LDA UnderwaterFlag
	BEQ bra4_B886 ;Branch if not underwater
	LDX #sfxSwim ;Load swim sound in x reg
	LDY #$20
	BNE bra4_B897 ;Branch
bra4_B886:	
	LDX #sfxJump ;Load jump sound into X reg
	LDA PlayerYSpeed
	BNE TongueSwimChkDone ;Make sure the player has vertical speed
	LDY #$60
	LDA zInputCurrentState	
	AND #dirDown
	BEQ bra4_B897 ;Branch if down isn't held
	LDY #$30
bra4_B897:
	STY PlayerYSpeed
	STX SFXRegister ;Play whatever sound was loaded into the X reg
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Set movement to jumping/swimming
TongueSwimChkDone:
	RTS
ActionTimerRoutine:
	INC ActionFrameCount ;Increase action timer
	CPY ActionFrameCount
	BCS bra4_B8B7 ;Wait until the set tick length (in frames) is reached
	LDA #$00
	STA ActionFrameCount ;Clear timer
	INC PlayerActionTicks ;Increase by one tick
	CPX PlayerActionTicks
	BCC bra4_B8BA ;Branch when the set tick number is reached
bra4_B8B7:
	PLA
	PLA
	RTS
bra4_B8BA:
	LDA #$00
	STA PlayerActionTicks
	RTS
sub4_B8C0:
	INC SwallowFrameCount
	CPY SwallowFrameCount
	BCS bra4_B8D5
	LDA #$00
	STA SwallowFrameCount
	INC YoshiSwallowTimer
	CPX YoshiSwallowTimer
	BCC bra4_B8D8
bra4_B8D5:
	PLA
	PLA
	RTS
bra4_B8D8:
	LDA #$00
	STA YoshiSwallowTimer
	RTS
ofs_B8DE:
	LDA PlayerYSpeed
	BNE bra4_B90B_RTS
	LDA #$07
	STA PlayerState
	LDX $A4
	DEX
	LDA YoshiIdleMovement
	STA PlayerMovement
	LDA YoshiIdleStorage
	STA Player1YoshiStatus
	LDA #$01
	STA YoshiExitStatus
	LDA #$07
	STA PlayerAction ;set to ducking
	JSR sub4_A14A
	LDX #$00
	LDY #$14
	JSR ActionTimerRoutine ;Wait one 20 frame tick
	LDA #$00
	STA PlayerState
bra4_B90B_RTS:
	RTS
ofs_B90C:
	JSR SwimMove
	JSR unknownrout1
	LDA #$05
	STA PlayerAction ;set player action to spinning
	LDX #$00
	LDY #$14
	JSR ActionTimerRoutine ;Wait one 20 frame tick
	LDA #$00
	STA PlayerState
	RTS
unknownrout1:
		LDA PlayerYSpeed ;if player's y speed isn't empty,
		BNE rout1done ;stop
		LDA zInputBottleNeck ;
		AND #buttonA ;make sure A is pressed
		BEQ rout1done ;
		LDA #$60 ;
		STA PlayerYSpeed ;set y speed to 60 (hex)
		LDA PlayerMovement ;
		ORA #$04 ;set movement to jumping
		STA PlayerMovement ;
rout1done:		RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;SPEED SCALING AND SPRITE ALIGNMENT 
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
sub4_B938: ;determine if player is walking or running 
	LDA PlayerXSpeed	
	CMP #$10	
	BCS GetPlayerTrueXSpd ;if player's x speed exceeds #$10 (walking speed), branch
	LDA FrameCount ;else
	AND #$01 ;bitmask the frame count and use it as the scaled speed instead 
	JMP loc4_B94F ;skip ahead to walking section
	
GetPlayerTrueXSpd: ; this is used when the player is moving faster than #$10, reads from a running speed table
	ROR
	ROR
	ROR
	ROR ;rotate bits right 4 times to divide speed
	AND #$0F ;mask out the upper 4 bits of the result
	TAY ;move it to Y as an offset
	LDA PlayerXSpdTbl,Y ;use that to load a movement speed for the player
	
loc4_B94F: ;Decide if player should start walking
	STA PlayerMetaspriteHAlign ;store the loaded scaled speed value
	LDA PlayerXSpeed
	CMP #$03
	BCS bra4_B95B ;if player X speed exceeds 3, branch (exits static/standing state)
	LDA #$00
	STA PlayerMetaspriteHAlign ;else set scaled speed to 00 (Standing speed)
	
bra4_B95B:
	LDA ScaledPlayerXSpd
	BNE MovePlayerLeft ;if scaled speed isn't zero, branch
;else if player is static
	LDA PlayerXScreen
	STA PlayerXScreenDup ;copy the players X screen
	LDA PlayerXPos
	STA PlayerXPosDup ;copy the players X position
	JMP loc4_B993 ;skip ahead to Y speed section
;***************************************************************
;Ok, so this next part is for if the player is moving
;It handles left and right movements as well as screen positions 
;It converts the speed to a vector
;If the player positioning sum creates a carry that is used to update the screen ID
;***************************************************************
MovePlayerLeft: ;If metasprite alignment not 00 (player moving)
	LDA PlayerMovement
	AND #$01 ;if Player movement set to right (0=right 1=left)
	BEQ MovePlayerRight ;go to rightward movement section
;Move Player Left	
	LDA PlayerXPos
	SEC
	SBC ScaledPlayerXSpd ;Subtract scaled speed from X position
	STA PlayerXPosDup ;store it in duplicate X position
;Move player between X screens if necessary (left)
	LDA PlayerXScreen
	SBC #$00 ;subtract carry if present
	STA PlayerXScreenDup ;set as new X screen
	JMP loc4_B993 ;go to Y speed section
	
MovePlayerRight: ;X position check (prevents player from wrapping around from the right side of the screen in scroll locked areas)
	LDA PlayerSprXPos
	CMP #$F0
	BCS bra4_B993 ;If player's X sprite position exceeds #$F0, go to Y speed
;Move player Right	
	LDA PlayerXPos
	CLC
	ADC ScaledPlayerXSpd ;Add scaled speed to X position
	STA PlayerXPosDup ;store it in duplicate X position
;Move player between X screens if necessary (right)
	LDA PlayerXScreen
	ADC #$00 ;add carry if present
	STA PlayerXScreenDup ;set as new X screen
;***************************************************************
;Now for the Y speed 
;***************************************************************	
bra4_B993: 
loc4_B993:
	LDA PlayerYSpeed
	LSR			
	LSR			
	LSR			
	LSR ;divide Y speed value by 16,
	TAX ;transfer modified Y speed to X reg
	LDA tbl4_BAE1,X ;Load a Y speed value from table
	STA ScaledPlayerYSpd ;Store the scaled speed
;decide if player should start moving
	LDA PlayerYSpeed
	CMP #$04
	BCS bra4_B9A9 ;If Y speed exceeds #$04, branch ahead
	LDA #$00 
	STA ScaledPlayerYSpd ; else set Y speed to #$00 (static)
	
bra4_B9A9: ;Make player move vertically
	LDA ScaledPlayerYSpd
	BNE MovePlayerUp ;If player isn't static, branch ahead
;else if player vertically static
	LDA PlayerYScreen 
	STA PlayerYScreenDup ;copy Y screen
	LDA PlayerYPos
	STA PlayerYPosDup ;copy Y position 
	JMP loc4_BA24 ;go to check current event
	
MovePlayerUp: ;Go here if player has Y speed 
	LDA PlayerMovement		
	AND #$04 ;if player isn't jumping
	BEQ CliffDeathCheck ;branch to check if they're dying 
;If player jumping	
	LDA PlayerSprYPos		
	CMP #$08 ;if the player's sprite Y position is less than #$08
	BCC CliffDeathCheck ;branch
;else if it's higher 
;Move player vertically upwards
	LDA PlayerYPos
	SEC
	SBC ScaledPlayerYSpd ;subtract scaled Y speed from Y position
	STA PlayerYPosDup ;store it in the duplicate
;Move player between vertical screens if necessary (upwards)
	LDA PlayerYScreen
	SBC #$00 ;subtract carry if present 
	STA PlayerYScreenDup ;set as new Y screen
;Unsure on exact purpose of this part
	LDA PlayerYPosDup
	CMP #$F0 ;if Y position is < #$F0 (top of the screen)
	BCC bra4_B9DC ;branch to a jump (go to check current event)
;else
;***************************************************************	
;Ok, this seems to be subtracting distance from the player when moving between vertical screens
;Not exactly sure why, my guess is that it doesn't like you sitting on screen boarders
;Lowering the value to be subtracted prevents the player from moving between screens
;Increasing it largely does nothing unless you overflow the math
;***************************************************************	
	SEC
	SBC #$10 ;subtract #$10 from new Y position (move player upwards)
	STA PlayerYPosDup  ;Update duplicate position 
bra4_B9DC:
	JMP loc4_BA24 ;go to check current event
;*******************************
;Check if player dying from pit
;*******************************	
CliffDeathCheck:
	LDA PlayerSprYPos		
	CMP #$E0 ;If player's sprite is below this (or above it, basically not going off screen in a pit)
	BCC MovePlayerDown ;If above this point, continue falling as normal
	;Otherwise, kill the player
	LDA #musDeath	
	STA MusicRegister ;Play death music
	LDA #$00		
	STA PlayerPowerup ;Remove any powerups
	STA Player1YoshiStatus ;Remove yoshi
	LDA LevelNumber	
	CMP #$03
	BEQ DeathTrigger ;Skip ahead and don't kill Yoshi if in a castle
	LDA #$00
	STA YoshiExitStatus ;Otherwise, remove him completely
DeathTrigger:
	LDA #$04		
	STA Event ;Trigger death event
	LDA #$02		
	STA EventPart ;Set map transition
	LDA #$07		
	STA PlayerAction ;Make player duck
	RTS
;************************************************
MovePlayerDown: ;If player not dying in pit (IE player falling but not dead)
;Move player vertically downwards
	LDA PlayerYPos
	CLC
	ADC PlayerMetaspriteVAlign ;add scaled Y speed to Y position
	STA PlayerYPosDup ;store it in the duplicate
;Move between Y screens if necessary (downwards)
	LDA PlayerYScreen
	ADC #$00 ;add carry if present
	STA PlayerYScreenDup ;set it as new Y screen
;Again unsure of the exact purpose here	
	LDA PlayerYPosDup
	CMP #$F0 ;if player's y coords are below this (pit)
	BCC bra4_BA24 ;branch to check current event
;else add some distance when moving between V screens (seems to prevent player screen wrapping in pits)
	CLC
	ADC #$10
	STA PlayerYPosDup ;add #$10 to new Y position 
;Not really sure why it only does this for moving downwards
	INC PlayerYScreenDup ;increment the new Y screen

;***************************************************************
;Check event	
;***************************************************************
bra4_BA24:
loc4_BA24:
	LDA PlayerSprYPos
	CMP #$D0
	BCS bra4_BA42 ;if exceed this, branch to X positioning
	LDA Event
	CMP #$04 ;death 
	BEQ bra4_BA42 ;if player dying, branch to X positioning 
	CMP #$0B ;going down pipe
	BEQ bra4_BA42 ;else if going down pipe, branch to X positioning
	CMP #$0D ;(event range: 0C: walk out pipe, 0D: enter level from pipe)
	BCC bra4_BA3C ;else if event > 0B but < than or == to #$0D, skip last event check, go to JSRs 
	CMP #$15 ;(event range: a whole bunch of pipe related things)
	BCC bra4_BA42 ;else if event > #$0D but < or == to #$15, branch to X Positioning
bra4_BA3C: ;if event > #$15, jump to these routines 
	JSR sub4_BAF1
	JSR sub4_BC50
;***************************************************************
;Player Sprite Positioning?
;***************************************************************	
bra4_BA42:
	LDA PlayerXPosDup
	SEC
	SBC PlayerXPos ;Subtract previous X position from new X position
	STA PlayerMetaspriteHAlign ;store result
;
	LDA PlayerXScreenDup
	SBC PlayerXScreen ;subtract previous screen value from current screen value 
	BPL bra4_BA6A ;if result positive, branch (moved forward one screen)
;else player moved back a screen
	LDA PlayerMetaspriteHAlign ;get result of positioning sum
	EOR #$FF ;Flip all the bits 
	SEC ; set carry
	ADC #$00 ;add the carry
	CMP #$07
	BCC bra4_BA67 ;if result < #$07, branch to jump (go to Y positioning)
;if it's > 7
	LDA PlayerXPos 
	SEC
	SBC #$07 ;subtract #$07 from previous X position
	STA PlayerXPosDup ;set it as new X position
;move between X screens if necessary (left)
	LDA PlayerXScreen
	SBC #$00 ;subtract carry if present  
	STA PlayerXScreenDup ;Set as new X screen
bra4_BA67:
	JMP loc4_BA7D ;go to Y positioning 
;***************************************************************	
bra4_BA6A: ;Go here if X screen sum result postive
	LDA PlayerMetaspriteHAlign ;get result of positoning sum
	CMP #$07 ;If < 7
	BCC bra4_BA7D ;branch to Y positioning 
;if it's > 7
	LDA PlayerXPos
	CLC
	ADC #$07 ;Add #$07 to previous X position
	STA PlayerXPosDup ;set it as new X position
; Move between X screens if necessary (right)
	LDA PlayerXScreen
	ADC #$00 ;add carry if present 
	STA PlayerXScreenDup ;set as new X screen
;***************************************************************	
bra4_BA7D: ;Y positioning
loc4_BA7D:
	LDA PlayerYPosDup
	SEC
	SBC PlayerYPos ;subtract old Y position from new Y position
	STA PlayerMetaspriteHAlign ;Store result 
;check if screen is positive
	LDA PlayerYScreenDup
	SBC PlayerYScreen ;subtract old Y screen from new Y screen
	BPL bra4_BAB0 ;if result positive, branch ahead (moved down one screen)
;else player moved up a screen
	LDA PlayerMetaspriteHAlign ;get result of positioning sum
	EOR #$FF ;flip all bits
	SEC ;set carry
	ADC #$00 ;apply carry
	CMP #$07
	BCC bra4_BAAD ;if result less than #$07, branch to jump (go to RTS)
;else, Subtract a value from Y position
	LDA PlayerYPos
	SEC
	SBC #$07 ;subtract #$07 from old Y position
	STA PlayerYPosDup ;set it as new Y position 
;Move player between Y screens if necessary (upwards)
	LDA PlayerYScreen
	SBC #$00 ;subtract carry if present 
	STA PlayerYScreenDup ;store result as new Y screen
;
	LDA PlayerYPosDup
	CMP #$F0 ;If duplicate Y position less than #$F0 (pit)
	BCC bra4_BAAD ;branch to RTS
;if greater than #$F0 (in pit)	
	SEC
	SBC #$10 ;subtract #$10 from duplicate Y position
	STA PlayerYPosDup ;update new position
bra4_BAAD:
	JMP loc4_BAD0_RTS ;go to RTS
;***************************************************************
bra4_BAB0: ;Go here if Y screen sum result positive 
	LDA PlayerMetaspriteHAlign ;get result of positioning sum
	CMP #$07 ;If it's < #$07 
	BCC bra4_BAD0_RTS ;branch to RTS
;Else > #$07
	LDA PlayerYPos
	CLC
	ADC #$07 ;Add #$07 to old Y position
	STA PlayerYPosDup ;set it as new Y position
;move between vertical screens if necessary (downwards)
	LDA PlayerYScreen
	ADC #$00 ;add carry if present 
	STA PlayerYScreenDup ;store result as new Y screen
;
	LDA PlayerYPosDup
	CMP #$F0 ;If new Y position less than #$F0 (pit)
	BCC bra4_BAD0_RTS ;end 
;else if player in pit
	CLC
	ADC #$10 
	STA PlayerYPosDup ;add #$10 to new Y position
;
	INC PlayerYScreenDup ;increment new Y screen
bra4_BAD0_RTS:
loc4_BAD0_RTS:
	RTS ;end
;***************************************************************
;Tables
;***************************************************************
PlayerXSpdTbl: ;X speed table
;the higher the PlayerXspeed, the further through the table you can move
	db $00
	db $01
	db $02
	db $03
	db $04
	db $05
	db $06
	db $07
	db $07
	db $07
	db $07
	db $07
	db $07
	db $07
	db $07
	db $07
tbl4_BAE1: ;Mid Air hang time table?? might affect Y speed in general
	db $01
	db $01
	db $02
	db $03
	db $04
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;***************************************************************
;Collision stuff 
;***************************************************************	
sub4_BAF1:
	LDX PlayerAction
	LDA tbl4_BC2F,X ;Load the player's horizontal collision offset based on their current action
	CLC
	ADC PlayerXPosDup ;add collision offset to new X position
	STA PlayerColXPos ;set as colision X postion
	LDA PlayerXScreenDup ;get new X screen
	ADC #$00 ;if prior sum made a carry, apply it
	STA PlayerColXScreen ;store as collision X screen
	LDA PlayerYScreenDup ;get new Y screen
	STA PlayerColYScreen ;set as collision Y screen
	LDA PlayerYPosDup ;get new Y position
	STA PlayerColYPos ;Set the player's vertical collision position
loc4_BB09:
	LDA #$00
	STA $26 ;clear $26
	LDY PlayerColYScreen
	LDA LevelTopScreenOffset,Y ;Get screen offset for the vertical hitbox screen
	CLC
	ADC PlayerColXScreen ;Add hitbox X screen to get total screen number (Y screen offset + X screen = total screen)
	TAY ;move result to Y
	LDA DataBank2
	STA M90_PRG0 ;Load tileset bank in
	LDA ($9F),Y ;load UNKNOWN offset by X collision offset
	STA $9E ;store loaded value
	LDA (LevelScreenOrderPtr),Y
	STA PlayerScreenID ;Get the ID of the screen the player is on
	TAY ;Back up in Y register
	AND #%00011111
	ORA #%10000000 ;Clear lower 5 bits and add 80 to determine the address
	STA $33
	LDA #$00
	STA $32 ;Zero page high byte
	TYA ;Get screen ID the player is on
	AND #%00100000
	BNE bra4_BB3D ;Branch if bit 5 is set for the screen ID (this is seemingly unused)
	LDA DataBank1
	STA M90_PRG0
	JMP loc4_BB43
bra4_BB3D:
	LDA $04F4
	STA M90_PRG0 ;Likely an unused function
loc4_BB43:
	LDY PlayerColXPos ;Get the horizontal hitbox position (will be reused soon)
	LDA PlayerColYPos
	AND #%11110000 ;Get the vertical metatile number of the player's hitbox
	ORA UpperNybbleShiftTable,Y ;Pack the horizontal and vertical metatile numbers into one byte, with the horizontal metatile being in the lower nybble and the vertical metatile in the upper nybble
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2
	STA M90_PRG0 ;Swap in tileset PRG bank
	LDA ($DA),Y ;Get current metatile's behavior
	STA PlayerBackColl
	LDA #$27
	STA M90_PRG3 ;Swap the collision bank into the 4th PRG slot
	JSR jmp_39_E000 ;Jump
	LDA #$3F	
	STA M90_PRG3 ;Swap the IRQ bank back in
	LDA PlayerBackColl
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
	LDA PlayerColXPos
	SEC
	SBC $25
	STA PlayerColXPos
	LDA PlayerColXScreen
	SBC #$00
	STA PlayerColXScreen
loc4_BB95:
	LDA #$00
	STA $26
	LDY PlayerColYScreen
	LDA LevelTopScreenOffset,Y
	CLC
	ADC PlayerColXScreen
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($9F),Y
	STA $9E
	LDA (LevelScreenOrderPtr),Y
	STA PlayerScreenID
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
	LDA $04F4 ;unlogged
	STA M90_PRG0 ;unlogged
loc4_BBCF:
	LDY PlayerColXPos
	LDA PlayerColYPos
	AND #$F0
	ORA UpperNybbleShiftTable,Y
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA PlayerBackColl
	LDA PlayerSprYPos
	CMP #$C8
	BCC bra4_BBF0
	LDA #$00
	STA PlayerBackColl
bra4_BBF0:
	LDA #$27
	STA M90_PRG3 ;Swap bank 39 into 4th PRG slot
	JSR jmp_39_E000 ;Jump
	LDA #$3F
	STA M90_PRG3 ;Swap the IRQ bank back in
	LDA PlayerBackColl
	CMP #$F8
	BNE bra4_BC09 ;Branch if the player isn't in front of a fence tile
	LDA $49
	ORA #$02 ;Set bit 1 of the player's climbing state??
	BNE bra4_BC0D ;Branch ahead (always)
bra4_BC09:
	LDA $49
	AND #$FD ;Clear bit 1 of the player's climbing state??
bra4_BC0D:
	STA $49
	LDA $26
	BEQ bra4_BC16
	JMP loc4_BB95
bra4_BC16: ;affects movement between horizontal screens
	LDX PlayerAction
	LDA PlayerColXPos
	CLC
	ADC tbl4_BC2F,X
	STA PlayerXPosDup
	LDA PlayerColXScreen
	ADC #$00
	STA PlayerXScreenDup
	LDA PlayerColYPos
	STA PlayerYPosDup
	LDA PlayerColYScreen
	STA PlayerYScreenDup
	RTS
tbl4_BC2F:
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $00
	db $05
	db $05
	db $05
	db $05
	db $08
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $05
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $05
	db $0A
sub4_BC50:
	LDY #$10
	LDA PlayerPowerup ;if player is small,
	BEQ bra4_BC59 ;branch
	LDY #$18
bra4_BC59:
	STY $2B
	LDX PlayerAction
	LDA tbl4_BC2F,X
	CLC
	ADC PlayerXPosDup
	STA PlayerColXPos
	LDA PlayerXScreenDup
	ADC #$00
	STA PlayerColXScreen
	LDA PlayerYPosDup
	SEC
	SBC PlayerMetaspriteVAlign
	STA PlayerColYPos
	BCS bra4_BC7E
	SEC
	SBC #$10
	STA PlayerColYPos
	LDY PlayerYScreenDup
	DEY
	STY PlayerColYScreen
bra4_BC7E:
	LDA #$00
	STA $26
	LDY PlayerColYScreen ;Use the vertical screen of the player's collision as the index
	LDA LevelTopScreenOffset,Y ;Determines what to offset the player's collision X screen number based on what vertical screen they're on. If they're on the top screen, offset it by #$12. If they're on the bottom, don't offset it.
	CLC
	ADC PlayerColXScreen ;Player X Screen + Offset = Absolute Screen
	TAY ;Set the ordered screen value as the index
	LDA DataBank2
	STA M90_PRG0 ;Move the second bank into the first bank slot ($8000-$9FFF)
	LDA ($9F),Y ;(This value is seemingly always zero anyways)
	STA $9E ;(This is stored but doesn't seem to be used anywhere)
	LDA (LevelScreenOrderPtr),Y ;Find the screen the player is on from the screen order table
	STA PlayerScreenID ;Set the player's current screen ID
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
	LDY PlayerColXPos
	LDA PlayerColYPos
	AND #$F0
	ORA UpperNybbleShiftTable,Y
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA PlayerBackColl
	JSR sub4_BE6D
	LDX PlayerAction
	LDA tbl4_BC2F,X
	ASL
	STA $25
	LDA PlayerColXPos
	SEC
	SBC $25
	STA PlayerColXPos
	LDA PlayerColXScreen
	SBC #$00
	STA PlayerColXScreen
	LDY PlayerColYScreen
	LDA LevelTopScreenOffset,Y
	CLC
	ADC PlayerColXScreen
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($9F),Y
	STA $9E
	LDA (LevelScreenOrderPtr),Y
	STA PlayerScreenID
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
	STA M90_PRG0 ;swap data bank into $8000
	JMP loc4_BD1D
bra4_BD17:
	LDA $04F4
	STA M90_PRG0
loc4_BD1D:
	LDY PlayerColXPos
	LDA PlayerColYPos
	AND #$F0
	ORA UpperNybbleShiftTable,Y
	TAY
	LDA ($32),Y
	TAY
	LDA DataBank2 ;get 2nd data bank
	STA M90_PRG0 ;swap into to first prg bank ($8000)
	LDA ($DA),Y
	STA PlayerBackColl
	JSR sub4_BE6D
	JSR sub4_BE91
	LDX PlayerAction
	LDA PlayerColXPos
	CLC
	ADC tbl4_BC2F,X
	STA PlayerXPosDup
	LDA PlayerColXScreen
	ADC #$00
	STA PlayerXScreenDup
	LDY #$10
	LDA PlayerPowerup ;if player is small,
	BEQ bra4_BD53 ;branch
	LDY #$18
bra4_BD53:
	STY $2B
	LDA PlayerColYPos
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
	LDY PlayerColYScreen
	INY
	STY PlayerYScreenDup
bra4_BD6C_RTS:
	RTS
;Contains the high nybble shifted to the low nybble for every possible 8-bit value. This is technically faster than bit shifting right 4 times.
UpperNybbleShiftTable:
	.dsb 16, $00
	.dsb 16, $01
	.dsb 16, $02
	.dsb 16, $03
	.dsb 16, $04
	.dsb 16, $05
	.dsb 16, $06
	.dsb 16, $07
	.dsb 16, $08
	.dsb 16, $09
	.dsb 16, $0A
	.dsb 16, $0B
	.dsb 16, $0C
	.dsb 16, $0D
	.dsb 16, $0E
	.dsb 16, $0F
sub4_BE6D:
	LDA PlayerBackColl
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
	STA M90_PRG3 ;Swap bank 39 into the 4th PRG slot ($E000-$FFFF)
	JSR jmp_39_E000
	LDA #$3F
	STA M90_PRG3 ;Swap bank 63 into the 4th PRG slot ($E000-$FFFF)
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
	LDA PlayerBackColl
	CMP #$F8
	BEQ bra4_BEAA
	INY
bra4_BEAA:
	STY $06DD
bra4_BEAD_RTS:
	RTS
bra4_BEAE:
	LDA PlayerAction+1
	CMP #$08 ;if player not spinning cape,
	BNE bra4_BEAD_RTS ;stop
	LDA PlayerBackColl
	CMP #$F8
	BNE bra4_BEAD_RTS
	LDA #$00
	STA PlayerYSpeed ;clear player's y speed
	STA PlayerXSpeed ;clear player's x speed
	LDA #$03
	STA PlayerState ;set action to 'climbing'
	RTS
tbl4_BEC5: ;Vertical collision table for stage objects?? seems to affect collision with objects from below when jumping
	db $01
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $00
	db $01
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
loc4_BED5: ;Player bumped head on ceiling
	LDA PlayerMovement ;
	AND #$04 ;if player isn't moving up,
	BEQ bra4_BF06 ;branch
	LDA #$04
	EOR #$FF ;XOR #$04 by #$FF to get #$FB
	AND PlayerMovement ;do AND operation
	STA PlayerMovement ;store result (player stops moving up)
	LDA #$10 ;downward force
	STA PlayerYSpeed ;set y speed to 16
	LDA PlayerState
	CMP #$03 ;if player is climbing,
	BEQ bra4_BEF1 ;branch
	LDA #sfxThud
	STA SFXRegister ;play "thud" sound
bra4_BEF1: ;If player bumps head whilst climbing
	LDA PlayerColYPos
	CLC
	ADC #$10
	AND #$F0
	STA PlayerColYPos
	CMP #$F0
	BCC bra4_BF05_RTS
	CLC
	ADC #$10
	STA PlayerColYPos
	INC PlayerColYScreen
bra4_BF05_RTS:
	RTS
bra4_BF06:
	LDA #$00
	STA PlayerXSpeed ;Clear player X Speed
	LDA PlayerXPosDup
	SEC
	SBC PlayerColXPos ;Subtract from duplicate X position
	LDA PlayerXScreenDup
	SBC PlayerColXScreen ;Subtract value from duplicate X screen
	BMI bra4_BF25 ;if result negative, branch
	LDA PlayerColXPos  ;otherwise get player X collision position
	CLC
	ADC #$10 ;add #$10
	AND #$F0 ;mask it
	STA PlayerColXPos ;update player X collision position
	LDA PlayerColXScreen
	ADC #$00 ;apply carry if present 
	STA PlayerColXScreen ;update player X collision screen
	RTS
bra4_BF25:
	LDA PlayerColXPos
	SEC
	SBC #$10
	ORA #$0F
	STA PlayerColXPos
	LDA PlayerColXScreen
	SBC #$00
bra4_BF32:
	STA PlayerColXScreen
	RTS
	LDA ($32),Y ;everything below here is useless/leftover
	STA PPUData
	DEC PlayerMetaspriteVAlign
	BNE bra4_BF32
	JSR sub4_BF59
	JMP bra4_BF25+1
	STA PlayerMetaspriteVAlign
	JSR sub4_BF59
	LDA ($32),Y
bra4_BF4B:
	STA PPUData
	DEC PlayerMetaspriteVAlign
	BNE bra4_BF4B
	JSR sub4_BF59
	JMP bra4_BF25+1
	RTS
sub4_BF59:
	INC $32
	BNE bra4_BF5F_RTS
	INC $33
bra4_BF5F_RTS:
	RTS
	TSX
	db $AB
	db $04
	STA ObjectState,X
	LDA #$00
	STA ObjectVariables,X
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
	LDA ObjXScreenDistance,X
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
	STA PlayerHoldFlag
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
	STA EventPart
	STA PlayerState
	STA $06DC
	STA $06DD
	RTS ;unlogged code end
