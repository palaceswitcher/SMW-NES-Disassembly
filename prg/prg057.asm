; disassembled by BZK 6502 Disassembler
;----------------------------------------
; SUBROUTINE ($A000)
;----------------------------------------
jmp_57_A000:
	LDA playerAction
	CMP playerPrevAction
	BEQ bra4_A020 ; Branch here if the player's action stays the same
	BNE bra4_A014 ; Continue if the player's action has changed

; Unused duplicate snippet
	LDA playerXSpd
	ROR
	ROR
	ROR
	ROR
	AND #$0F
	TAX
	LDA tbl4_A095,X
;--------------------

	; If player action has changed
	bra4_A014:
		STA playerAnim ; Set animation to the player's action
		LDA #0
		STA playerAnimFrame ; Switch to first frame of animation
		JSR playerAnimGetFrame ; Process the animation frame
		JMP loc4_A03E

	; If player action hasn't changed
	bra4_A020:
		CMP #PACT_WALK
		BNE bra4_A034 ; No transition animation is needed if the player is just walking
			LDA playerXSpd
			ROR
			ROR
			ROR
			ROR
			AND #%00001111
			TAX
			LDA tbl4_A095,X
			TAY ; Load animation for given frame
			JMP loc4_A035 ; Skip ahead

		bra4_A034:
			TAY ; Keep walking animation

	loc4_A035:
		CPY playerAnim
		BEQ loc4_A03E ; Branch if the player has changed animations at all
			STY playerAnim
			JSR playerAnimGetFrame ; Get new animation's frame

loc4_A03E:
	LDA playerAction
	STA playerAction+1
	JSR decPlayerFrameLength ; Advance one frame for the current animation frame
	JSR loadPlayerSprite
	LDA #4*5 ; Spare the first 5 sprites in OAM
	STA $3C
	JSR sub3_F176 ; Clear sprites (initialize)
	LDA playerAction+1
	CMP playerCapeAction
	BEQ bra4_A061
	; Change player cape animation if their action changes
		STA playerCapeAction ; Update cape action
		LDA #0
		STA $0629
		STA $0627

bra4_A061:
	JSR playerMoveDeath
	LDA gameState
	CMP #$01
	BEQ bra4_A06D
		JSR sub4_B938

	bra4_A06D:
		LDA freezeFlag
		BNE bra4_A094_RTS ; Stop if the game is frozen
		LDA objFrameCount
		AND #$01
		BNE bra4_A07F
		; If on an even frame
			INC $0629
			INC $0627

	bra4_A07F:
		INC objFrameCount
		LDA shellHitCount
		BEQ bra4_A094_RTS
			INC shellHitTimer
			LDA shellHitTimer
			CMP #32
			BCC bra4_A094_RTS ; Clear the amount of hits after 32 frames
				LDA #0
				STA shellHitCount
				STA shellHitTimer

bra4_A094_RTS:
	RTS

; Animations to switch to when transitioning between actions
tbl4_A095:
	db $01
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

bubbleXMovement:
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

;----------------------------------------
; SUBROUTINE ($A0CD)
; Moves the player's sprite during death.
;----------------------------------------
playerMoveDeath:
	LDA gameState
	CMP #GAMESTATE_DEATH
	BEQ bra4_A0DC
		CMP #$07
		BEQ bra4_A118_RTS
		CMP #$08
		BNE bra4_A0E0
		RTS

; If player is dying
bra4_A0DC:
	LDA gameSubstate
	BEQ bra4_A118_RTS ; Stop if in the beginning phase of dying

bra4_A0E0:
	LDA playerState
	CMP #$03
	BEQ bra4_A118_RTS ; Stop if the player is climbing
	LDA #3 ; Default acceleration
	LDX levelWaterFlag
	BEQ bra4_A0EF
		LDA #1 ; Accelerate downwards more slowly underwater

bra4_A0EF:
	STA $32
	LDA playerMoveFlags
	AND #%00000100
	BEQ bra4_A119

	; While player is moving up:
		LDA playerXSpd
		BEQ bra4_A101
		CMP #32
		BCS bra4_A101
			INC playerXSpd ; Accelerate until the player's speed is 32

	bra4_A101:
		LDA playerYSpd
		SEC
		SBC #3
		STA playerYSpd ; Constant deceleration rate (possibly a bug)
		LDA #248
		CMP playerYSpd
		BCS bra4_A118_RTS ; Cap vertical speed at 248
			LDA #$02
			STA playerYSpd
			LDA playerMoveFlags
			AND #%01110011 ; Make player move down
			STA playerMoveFlags

	bra4_A118_RTS:
		RTS

	; While player is moving down:
	bra4_A119:
		LDA playerYSpd
		CLC
		ADC $32
		STA playerYSpd ; Decelerate vertical speed
		LDA #248
		CMP playerYSpd
		BCS bra4_A118_RTS ; Cap vertical speed at 248
			STA playerYSpd
			RTS

; UNMARKED TABLE?
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
; PLAYER SPRITES AND ANIMATION
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

;----------------------------------------
; SUBROUTINE ($A14A)
;----------------------------------------
sub4_A14A:	
	LDA playerYoshiState
	ASL
	TAX ; Index animation table based on the Yoshi state
	LDA #36
	STA M90_PRG2 ; Load animation bank into 3rd PRG slot

	LDA lda_36_C000,X
	STA $32
	LDA lda_36_C000+1,X
	STA $33 ; Load the animation table for the current Yoshi state

	LDA playerPowerup 
	LDY playerYoshiState
	BNE MakePlayerAnimPtr
	LDY playerHoldFlag
	BEQ MakePlayerAnimPtr
	; If the player isn't on Yoshi and is carrying something
		CLC
		ADC #$05 ; Make the player use the 2nd set of animations

; Select player animation set
MakePlayerAnimPtr:
	AND #$0F ; Mask out the lower 4 bits of the Powerup value
	ASL
	TAY
	LDA ($32),Y
	STA playerAnimPtr
	INY
	LDA ($32),Y
	STA playerAnimPtr+1 ; Load player animation pointer
	RTS

;----------------------------------------
; SUBROUTINE ($A17C)
; Advances the animation one display frame, advancing to the next animation frame if needed.
;----------------------------------------
decPlayerFrameLength:
	LDA $18
	BMI advNextPlayerFrame ; Go to next frame if this frame is over
		DEC $18 ; Otherwise, decrement until the current frame is over
		RTS

advNextPlayerFrame:
	INC playerAnimFrame ; Advance to next frame

;----------------------------------------
; SUBROUTINE ($A185)
; Loads the player's current animation frame and advance to the next frame.
;----------------------------------------
playerAnimGetFrame:
	LDA playerAnim ; Load player's animation value
	ASL
	TAY
	LDA #36
	STA M90_PRG2 ; Load the animation bank into the 3rd PRG slot

; Unsure exactly what pointer it's making here (pointer is later used to create the playerFramePtr									
	LDA (playerAnimPtr),Y
	STA $32
	INY
	LDA (playerAnimPtr),Y
	STA $33 ; Load pointer

; Load player frame pointer
	LDA playerAnimFrame ; Load player's current animation frame
	ASL
	ASL
	TAY
	LDA ($32),Y
	STA playerFramePtr	
	INY 
	LDA ($32),Y ; Load player mapping data pointer
	STA playerFramePtr+1

; Get frame metadata
	INY	
	LDA ($32),Y
	BPL storePlayerFrameLength ; If bit 7 is clear, treat this byte as a frame length byte
	
	; Set the current byte to be the loop point if bit 7 is set
		AND #%01111111
		STA playerAnimFrame
		JMP playerAnimGetFrame ; Restart the routine to get the next frame

	; Otherwise, load set duration for next frame
	storePlayerFrameLength:
		STA $18 ; Store the animation frame length
		RTS

;----------------------------------------
; SUBROUTINE ($A1B4)
; Loads the player sprite
;----------------------------------------
loadPlayerSprite:
	LDY #$00 ; Clear Y index/set to read first byte of sprite format (sprite width)
	LDA #36
	STA M90_PRG2 ; Load animation bank into 3rd PRG slot

; Load width and mirroring flags
	LDA (playerFramePtr),Y 
	AND #%00111111 ; Ignore mirroring bits
	STA playerWidth	; Load width

	LDA (playerFramePtr),Y
	AND #%11000000 ; Filter out mirroring bits
	STA playerSprAttrs ; Load mirroring flags

; Load height
	INY
	LDA (playerFramePtr),Y
	STA playerHeight
	INY

; Get attribute pointer for the sprite's CHR bank
	LDA (playerFramePtr),Y
	ASL 
	TAX ; Get index for current mapping's CHR bank
	LDA #47
	STA M90_PRG2 ; Load palette mapping bank into 3rd PRG slot
	LDA CHRSprBankAttrs,X
	STA playerPalMappingLo
	LDA CHRSprBankAttrs+1,X
	STA playerPalMappingHi ; Load palette mappings for this sprite's CHR bank

; Set base mirroring 
	LDA #36
	STA M90_PRG2 ; Swap player animation bank in
	LDA playerMoveFlags
	AND #%11110000
	EOR #%01000000
	STA playerSpriteFlags ; Reverse the player's current direction if needed
	LDA #$00
	STA $24
	INY ; Advance to next byte of mapping data

; Apply horizontal offset 
	LDA playerSpriteFlags
	AND #$40
	BNE bra4_A208 ; Branch if player sprite is facing right

	; If sprite is facing left (not mirrored)
		LDA playerSprX
		SEC
		SBC (playerFramePtr),Y
		STA playerSprXOfs ; Subtract player's position by mapping offset
		LDA #0
		SBC #0
		STA $20
		JMP loc4_A218 ; Skip past next section

	; If sprite is facing right (mirrored)
	bra4_A208:
		LDA (playerFramePtr),Y
		SEC
		SBC #8 ; Subtract mapping offset by 8 to account for mirroring
		CLC
		ADC playerSprX
		STA playerSprXOfs ; Add adjusted mapping offset to player's X position
		LDA #0
		ADC #0
		STA $20

; Apply vertical offset
loc4_A218:
	LDX #0
	LDY playerHeight
	LDA PlayerSpriteVOffset,Y ; Offset player based on their sprite's height in tiles
	BPL bra4_A223
	; If offset is negative (it always is)		
		LDX #$FF ; Sets 
	
bra4_A223:
	CLC
	ADC playerSprY
	STA playerSprYOfs ; Add player vertical position to loaded vertical offset
	BCC bra4_A22B
	; Handle carry if needed?
		INX ; Increment X (Result: 00 or 01) (if X is #$FF this will underflow to be #$00)

bra4_A22B:
	STX $22 ; Unknown purpose (possibly something to do with if the players V offset puts them off screen)
	RTS

; This table adjusts the sprite offset based on the height of the player, listed next to the offsets are the respective heights
PlayerSpriteVOffset:
	db $00 ; 00 (unsure when this one is used)
	db $F8 ; 01 
	db $F0 ; 02
	db $E8 ; 03
	db $E0 ; 04
	db $D8 ; 05
	db $D0 ; 06
	db $C8 ; 07
	db $C0 ; 08
	db $B8 ; 09
	db $B0 ; 0A
	db $A8 ; 0B
	db $A0 ; 0C
	
;--------------------
; Bubble spawning
;--------------------
jmp_57_A23B:
	LDA levelWaterFlag
	BEQ bra4_A29E ; Branch if not underwater
	LDA bubbleSpawnPoint
	CMP #$E8
	BCC bra4_A25B ; Branch if bubble spawn point is beyond vertical screen edge
	LDA playerXLo
	STA bubbleX ; Spawn bubble at same X position as the player
	LDA #-16 ; Bubble Y spawn offset (without Yoshi)
	LDX playerYoshiState ; if player doesn't have yoshi,
	BEQ bra4_A255 ; branch
		LDA #-32 ; Use different vertical bubble offset if the player doesn't have Yoshi
bra4_A255:
	CLC
	ADC playerYLo
	STA bubbleY ; Vertically offset the bubble from the player's position
bra4_A25B:
	LDA bubbleX
	SEC
	SBC $52
	STA spriteMem+3
	LDA bubbleY
	SEC
	SBC $54
	LDX playerYHi
	BEQ bra4_A275
	LDX scrollY
	BEQ bra4_A275
	SEC
	SBC #$10
bra4_A275:
	STA bubbleSpawnPoint
	STA spriteMem ; spriteMem+0, Y position
	LDA #$3E
	STA spriteMem+1 ; Set bubble tile
	LDA #$00
	STA spriteMem+2 ; Set bubble sprite attributes
	DEC bubbleY
	DEC bubbleY
	JSR sub4_A0B0
	LSR
	LSR
	LSR
	AND #$07
	TAX
	LDA bubbleXMovement,X
	CLC
	ADC bubbleX
	STA bubbleX
bra4_A29E:
	LDA playerPowerupBuffer
	BMI bra4_A2C1_RTS
	BEQ bra4_A2AC
	LDA frameCount
	AND #$04
	BEQ bra4_A2C2
	RTS

bra4_A2AC:
	LDA #$02
	LDY invincibilityTimer
	BEQ bra4_A2C2 ; branch if star/invincibility timer is cleared
	CPY #$D0 ; if timer is below #$D0,
	BCC bra4_A2BD ; branch
	CPY #$F6 ; if timer goes over #$F6,
	BCS bra4_A2C2 ; branch
	LDA #$01
bra4_A2BD:
	AND frameCount	
	BEQ bra4_A2C2
bra4_A2C1_RTS:
	RTS

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; MARIO SPRITE LOADERS (Main player sprites and riding Yoshi)
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
; This section ONLY applies to the Mario object used when riding Yoshi
; It does not affect standard Mario, Yoshi is drawn using the PlayerSpriteBuilder routine
; for standard Mario, start at PlayerSpriteBuilder
bra4_A2C2:
	LDA playerYoshiState ; if player doesn't have yoshi,
	BEQ bra4_A2CD ; branch to jump 
	LDA playerSprY		
	CMP #$E0 ; if player has Yoshi, check if player is in a pit 
	BCC GetPntrRidingSprite ; if they aren't, branch
bra4_A2CD: ; else jump
	JMP PlayerSpriteBuilder ; starts at X positioning of sprite tiles
; *******************************************************************************	
GetPntrRidingSprite: ; Only do this part if player sprite isn't in a pit
	LDA playerPowerup
	ASL ; double it
	TAX ; move it to X
	LDA tbl4_A5E7,X ; (This table only has one entry but is followed by another table)
	STA $38 ; store low byte
	LDA tbl4_A5E7+1,X ; load the high byte from the next table 
	STA $39  ; store high byte
	LDX playerAction+1 ; get the previous player action as an offset
	LDA playerRidingActionTable,X ; use that to select an action for the player whilst riding 
	BNE bra4_A2E9 ; if loaded value not 00, branch to next check
	JMP loc4_A4FC ; else, jump (checks Y speed and if down is held, unknown use)
bra4_A2E9:
	CMP #$01
	BNE bra4_A2F0 ; if value not 01, branch to next check
	JMP loc4_A50E ; if it is, jump (clears a variable and masks another for a check, unknown use)
bra4_A2F0:
	CMP #$02
	BNE bra4_A2F7 ; if value not 02, branch to next check
	JMP loc4_A523 ; if it is, jump
bra4_A2F7: 
	LDY #$08 ; Set Y offset to #$08 (adjusts offset for loading CHR bank)
; coderoll
; *******************************************************************************
LoadRidingSprite: ; Mario Riding sprite loader
	LDA ($38),Y ; load CHR bank from pointer (Y is set before the code gets here from one of 3 locations)
	STA chrSpriteBank1 ; Store in the first sprite bank slot (loads required CHR bank for player riding sprites)
	TYA
	PHA ; Push Y into the stack 
; Get next pointer (unsure of exact use)
	LDA playerPowerup ; Get player powerup
	ASL ; double it
	TAY ; Move it to Y for use as new offset 
	LDA tbl4_A60C,Y ; Load low byte from table
	STA $34 
	LDA tbl4_A60C+1,Y ; Load high byte from table
	STA $35 
	
	PLA ; retrive Y from earlier 
	PHA ; put it back in the stack
	ASL ; double it
	TAY ; move it to Y
; Make Mapping Pointer in scratch RAM
	LDA ($34),Y ; offset loaded address by Y 
	STA $32 ; store
	INY 
	LDA ($34),Y ; offset loaded address by Y
	STA $33 ; store
	
	LDA #$00
	STA $2E ; clear $2E, used as mapping offset later
	PLA ; retrive Y from earlier from stack 
	TAY ; Move it back to Y 
; Get Y offset	
	LDA playerSprY
	SEC
	SBC playerRidingSpriteYOffset,Y ; Load the players riding sprite offset and subtract it from the players sprite Y position
	LDX playerAction+1 ; get previous player action as X offset
	CLC
	ADC tbl4_A59B,X ; Get data from table and add it to the result of prior sum  (Unknown function, probably additional Y adjustment)
	LDX playerPowerup ; get player powerup
	BNE bra4_A336 ; Branch if the player has a powerup 
	SEC
	SBC #$03 ; else subtract 03 from the Y offset	

bra4_A336: 
	STA playerMetaspriteVAlign ; store results of sum as the vertical alignment for the sprite
	LDA playerMoveFlags ; get current movement direction
	EOR playerSprAttrs ; flip bits against sprite attributes
	AND #$40 ; determine sprite mirror direction
	BNE bra4_A361 ; If player is facing left, branch
 ; else if sprite is mirrored (facing right)
	LDA playerSprX 
	CLC
	ADC ridingRightXoffset,Y ; using prior Y offset, get base X position and add to Player sprite X position 
	STA playerMetaspriteHAlign ; store it as the horizontal alignment for the sprite
	
loc4_A348: ; load/store tile ID (facing right)
	LDA $2E ; get mapping offset 
	CLC
	ADC #$10 ; Add #$10 to $2E (note that it doesn't store this in $2E)
	TAY ; move result to Y (selects reversed tile order for mirrored sprite)
	LDX $3C ; Set X to OAM tracker byte
	LDA ($32),Y ; Load tile ID from mapping
	CMP #$FF
	BEQ bra4_A3BC ; if loaded a null tile branch to end section of routine
	AND #$3F ; else, mask out attribute bits
	STA spriteMem+1,X ; Store tile ID
	PHA ; push A to stack
	LDA #$40 ; set A for mirrored sprite
	JMP loc4_A37B ; jump 
; ********************************************************	
; If sprite not mirrored (facing left)
bra4_A361: 
	LDA playerSprX 
	CLC
	ADC ridingLeftXoffset,Y ; offset table by Y to get data and add to Player sprite X position
	STA playerMetaspriteHAlign ; store it as the horizontal alignment for the sprite

bra4_A369: ; load/store tile ID (facing left)
	LDY $2E ; Set Y to mapping offset
	LDX $3C ; Set X to OAM tracker byte
	LDA ($32),Y ; Load tile ID from mapping
	CMP #$FF
	BEQ bra4_A3BC ; if loaded a null tile branch to end section of routine
	AND #$3F ; else, mask out attribute bits
	STA spriteMem+1,X ; Store the tile ID
	PHA ; push A to stack
	LDA #$00 ; set A for unmirrored sprite
; ********************************************************	
; Get Attributes 	
loc4_A37B:
	STA $38 ; Store sprite mirroring in temp byte (#$40 or #$00)
	LDA chrSpriteBank1
	ASL ; double value CHR bank in Spritebank1 (Mario bank x 2)
	TAY ; set as Y offset 
	LDA #$2F 
	STA M90_PRG2 ; load attribute bank into 2nd PRG slot
; get attribute pointer	
	LDA CHRSprBankAttrs,Y
	STA $34 ; get lowbyte
	LDA CHRSprBankAttrs+1,Y
	STA $35 ; get highbyte
	PLA ; retrieve A from earlier (tile ID)
	TAY ; move it to Y
	LDA ($34),Y ; use tile ID to select respective attribute data
	ORA $38 ; ORA against sprite mirroring 						 
	ORA $06E0 ; ORA again with UNKNOWN (This flips the tiles as needed)
	STA spriteMem+2,X ; store tile attributes
; ********************************************************	
; Position Tiles X
	LDA #$24
	STA M90_PRG2 ; load player animation bank into 2nd PRG slot
	LDY $2E ; set Y offset to $2E (unknown use) Mapping offset?
	LDA playerMetaspriteHAlign
	CLC
	ADC playerRidingTileHorizPos,Y ; add tile H position to sprite H alignment 
	STA spriteMem+3,X ; store X position 
; ********************************************************	
; Position Tiles Y	
	LDA playerMetaspriteVAlign
	CLC
	ADC playerRidingTileVertPos,Y ; add tile V position to sprite V alignment
	STA spriteMem,X ; store Y position
; ********************************************************		
	TXA ; move X ($3C) to A
	CLC
	ADC #$04
	STA $3C ; add one tile to OAM tracker byte
bra4_A3BC: 
	INC $2E ; increment Mapping offset
	LDA $2E
	CMP #$10 ; these sprites are forced to each have #$10 (16) tiles it would appear
	BCS bra4_A3CF ; If it exceeds #$10, branch to PlayerSpriteBuilder (build Yoshi sprite)
	LDA playerMoveFlags ; get current movement direction
	EOR playerSprAttrs ; flip bits against sprite attributes
	AND #$40 ; determine sprite mirror direction
	BNE bra4_A369 ; If player facing left branch to respective get next tile ID
	JMP loc4_A348 ; else if facing right, branch to respective get next tile ID
; ************************************************************************************************
; End of Mario Riding sprite builder
; ************************************************************************************************	
;-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-===-=-=-=-==-=-=-=-=-=-=--
; MAIN PLAYER SPRITE BUILDER
;-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-===-=-=-=-==-=-=-=-=-=-=--
bra4_A3CF:
PlayerSpriteBuilder: ; creates standard Mario or Yoshi sprites (riding sprites have their own routine)
	LDA playerSpriteFlags
	AND #$40 ; determine player mirror direction
	BEQ bra4_A3F5 ; branch ahead if direction left
; **************************************************************************************	
; Else player facing RIGHT START (sprite mirrored as tiles face left)
	LDA playerSprXOfs ; get X position offset for player sprite
	LDX #$00 ; clear X (column storage buffer offset)
	BEQ bra4_A3E2 ; branch, always
; ****************************************************
; Ok so there are a total of two writes to $20
; They store the carry bit when calculating the X offset for the sprite
; As far as I can tell $20 is always #$00
; Seems like a waste of a byte and I'm not sure of its use
; ****************************************************
SpaceColumnNegative: ; This is for reversing sprite columns when facing right 
	SEC
	SBC #$08
	BCS bra4_A3E2 ; if playerSprXOfs exceed #$08, skip ahead (only space columns by 8 pixels)
	DEC $20 ; otherwise decrement $20 (unknown use)
; ****************************************************
bra4_A3E2: ; if player facing right, it will jump here first
	LDY $20 ; load $20 into Y (unknown use)
	BEQ bra4_A3EC ; If #$00, branch to store column alignment
; Else $20 not 00
	LDY #$FF ; set Y to #$FF 
	STY $41,X ; store #$FF in metaspriteColumnumnAlignment (unknown use, hide column??)
	BMI bra4_A3EE ; branch on minus, always (advance to next column)
	
bra4_A3EC: ; store column alignment
	STA $41,X ; store playerSprXOfs in metaspriteColumnumnAlignment 
; ****************************************************	
bra4_A3EE: 
	INX ; increment X (move to next column storage buffer byte)
	CPX playerWidth ; compare X to player width
	BCC SpaceColumnNegative  ; if X < Player width, branch to subtraction (reverse tile order for face right) (branch backwards)
	BCS bra4_A413 ; if X > player width, branch to Y positioning 	(branch ahead)
; ****************************************************	
bra4_A3F5: ; if player facing LEFT else START here
	LDA playerSprXOfs ; get X position offset for player sprite
	LDX #$00 ; clear X (column storage buffer offset)
	BEQ bra4_A402 ; Always
; ****************************************************	
SpaceColumnPositive: ; This is for spacing sprite columns when facing left ; not used on initialise of routine
	CLC
	ADC #$08
	BCC bra4_A402 ; if less than #$08, skip ahead (only space columns by 8 pixels)
	INC $20 ; otherwise increment $20 (unknown use)
; ****************************************************		
bra4_A402:
	LDY $20 ; load $20 into Y (unknown use)
	BEQ bra4_A40C ; If #$00, branch ahead to store column alignment
; Else $20 not 00
	LDY #$FF ; set Y to #$FF 
	STY $41,X ; store #$FF in metaspriteColumnumnAlignment (unknown use, hide column??)
	BMI bra4_A40E ; branch on minus, always (advance to next column)
	
bra4_A40C: ; store column alignment
	STA $41,X ; store playerSprXOfs in metaspriteColumnumnAlignment 
; ****************************************************
bra4_A40E:
	INX ; increment X (move to next column storage buffer byte)
	CPX playerWidth ; compare X to player width
	BCC SpaceColumnPositive ; if X < Player width, branch to addition (tile order for face left) (branch backwards)
; Else coderoll
; ****************************	
; Position Y
; ****************************	
; equivalent code for Y positioning		
bra4_A413:
	LDA playerSprYOfs ; get Y position offset for player sprite
	LDX #$00 ; clear X (row storage buffer offset)
	BEQ bra4_A422 ; always 
; ****************************************************
SpaceRowsVertically: ; this spaces the rows of the sprite (starts from the top, adding moves the position downwards)
	CLC
	ADC #$08 ; lower row position by 8 pixels
	STA playerMetaspriteVAlign ; store playerSprYOfs as vertical tile alignment 
	BCC bra4_A422 ; branch on carry clear
	INC $22 ; else carry set, increment $22 (unknown use)
; ****************************************************	
bra4_A422: ; START here
	LDY $22 ; load $22 (unknown use)
	BEQ bra4_A42C ; If #$00, branch ahead to immediate store
; Else $22 not 00	
	LDY #$FF ; set Y to #$FF 
	STY $B2,X ; store #$FF in metaspriteRowAlignment (unknown use, hide row??)
	BMI bra4_A438 ; branch on minus, always (advance to next row)
	
bra4_A42C:
	STA playerMetaspriteVAlign ; store playerSprYOfs as vertical tile alignment 
	CMP #$C0 
	BCC bra4_A434 ; if it's less than #$C0, branch to store row 
	LDA #$00 ; else if exceed #$C0, set row position to 00 (might be for screen wrapping tiles?)
bra4_A434:
	STA $B2,X ; store in metaspriteColumnumnAlignment 
	LDA playerMetaspriteVAlign ; get updated vertical tile alignment
; ****************************************************
bra4_A438:
	INX ; increment X
	CPX playerHeight 
	BCC SpaceRowsVertically ; if X < Player height, repeat routine
; Else X >= playerHeight	
	LDA #$04 
	STA $40 ; set $40 to #$04 (unknown use)
	LDA #$00
	STA $3E ; clear $3E (width loop counter)
	STA $3F ; clear $3F (height loop counter)
	TAX ; set X to #$00
; ****************************************************
; Align and store tiles
bra4_A448: ; load row alignment 
	LDA $B2,X ; get alignment for first row
	CMP #$FF
	BNE bra4_A458 ; if it's not #$FF, branch ahead
	LDA $40 ; else if it is FF, load $40 (unknown use)
	CLC
	ADC playerWidth ; add playerWidth to $40 
	STA $40 ; store result in $40 (unknown use)
	JMP loc4_A4B2 ; Jump to increment height loop counter
	
bra4_A458: ; if row alignment not #$FF
	STA playerMetaspriteVAlign ; store row aligment as metasprite V aligment
	LDA #$00
	STA $3E ; clear $3E (unknown use)
	TAX ; set X to #$00
; ********************
bra4_A45F: ; load column spacing
	LDA $41,X ; load column spacing (X=0 first time we get here)
	CMP #$FF  ; if loaded value is #$FF
	BEQ bra4_A4A8 ; Branch to increment width loop counter
; else if column spacing not #$FF
	STA playerMetaspriteHAlign ; store column aligment as metasprite H aligment
	LDX $3C ; load OAM tracker byte into X
	LDY $40 ; load $40 (unknown use)
	LDA #$24
	STA M90_PRG2 ; load player animation bank into 3rd PRG slot
	LDA (playerFramePtr),Y ; Load tile ID from mapping
	CMP #$FF ; if loaded value is #$FF (null tile)
	BEQ bra4_A4A8 ; branch to increment width loop counter
	ORA $24 ; else set some bits against $24 (unknown use, might be for tile mirroring?)
	AND #$3F ; Mask out mirroring bits
	LDY playerYoshiState ; put Yoshi status into Y
	BEQ playerOamManager ; branch to Player OAM manager if no Yoshi
	ORA #$40 ; else set H mirroring bit (%01000000) (why?)
	
playerOamManager: 
	STA spriteMem+1,X ; store tile ID(/mirroring bit, though it's useless here)
	AND #$3F ; Mask out mirroring bits
	TAY ; transfer masked tile ID to Y
	LDA #$2F
	STA M90_PRG2 ; load attribute bank into 3rd PRG slot
	LDA (playerPalMappingLo),Y
	ORA playerSpriteFlags ; set mirroring for whole sprite 
	EOR playerSprAttrs ; flip mirroring bits against sprite attributes
	ORA $06E0 ; set some bits against unknown
	STA spriteMem+2,X ; store attributes
	LDA playerMetaspriteHAlign
	STA spriteMem+3,X ; store horizontal position
	LDA playerMetaspriteVAlign
	STA spriteMem,X ; store vertical position 
	TXA ; move X to A
	CLC
	ADC #$04 ; 
	STA $3C ; add one tile to OAM tracker byte
; ***********************************************	
bra4_A4A8: 
	INC $40 ; Increment $40 (unknown use)
	INC $3E ; Increment $3E (width loop counter)
	LDX $3E 
	CPX playerWidth ; Compare $3E with playerWidth
	BCC bra4_A45F ; if X < playerWidth, go to load column spacing (repeat routine to build sprite)

loc4_A4B2: ; else $3E >= playerWidth
	INC $3F ; increment $3F (height loop counter)
	LDX $3F
	CPX playerHeight ; compare $3F with playerHeight
	BCC bra4_A448 ; If X < playerHeight, got to load row alignment 
; Else
	LDY #$02 ; Offset for Mario's frame pointer (CHR bank byte)
	LDA #$24
	STA M90_PRG2 ; Load player Animation bank 
	LDA (playerFramePtr),Y ; load CHR bank from the mapping
	LDY playerYoshiState
	BEQ bra4_A4CA ; if no Yoshi, skip to store bank
	LDY #$01 ; else if Yoshi, set to store in 2nd slot 
bra4_A4CA:
	STA chrSpriteBank1,Y ; Store selected CHR bank in slot 1 (Mario) or slot 2 (Yoshi)
	RTS ; end
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; END OF MARIO SPRITE LOADER
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
;-=-=-=-=-=-==-=-=-=--=-=
; Music to play after invincibility 
;-=-=-=-=-=-==-=-=-=--=-=	
sub4_A4CE:
	LDA worldNumber
	ASL
	ASL
	CLC
	ADC levelNumber
	TAX
	LDA levelMusicQueue,X
	STA sndMusic
	RTS
levelMusicQueue:
	db MUS_OVERWORLD, MUS_FORESTOFILLUSION, MUS_TITLE, MUS_CASTLE ; World 1
	db MUS_OVERWORLD, MUS_FORESTOFILLUSION, MUS_GHOSTHOUSE, MUS_CASTLE ; World 2
	db MUS_UNDERGROUND, MUS_UNDERWATER, MUS_GHOSTHOUSE, MUS_CASTLE ; World 3
	db MUS_OVERWORLD, MUS_FORESTOFILLUSION, MUS_TITLE, MUS_CASTLE ; World 4
	db MUS_OVERWORLD, MUS_GHOSTHOUSE, MUS_UNDERWATER, MUS_CASTLE ; World 5
	db MUS_OVERWORLD, MUS_GHOSTHOUSE, MUS_FORESTOFILLUSION, MUS_CASTLE ; World 6
	db MUS_OVERWORLD, MUS_FORESTOFILLUSION, MUS_GHOSTHOUSE, MUS_CASTLE ; World 7
	db MUS_OVERWORLD ; Yoshi's House
	db $60
;-=-=-=-=-=--=-=-=-=-=-=-
; END 
;-=-=-=-=-=-==-=-=-=--=-=
; **********************************
; Related to player riding sprite loader
; **********************************
loc4_A4FC: ; Unsure of purpose
	LDY #$00 ; clear Y
	LDA playerYSpd ; if player is moving vertically,
	BNE bra4_A50B ; branch to jump (LoadRidingSprite)
	LDA btnHeld ; else
	AND #BTN_DOWN ; if down not held,
	BEQ bra4_A50B ; branch to jump (LoadRidingSprite)
	LDY #$06 ; else if player isn't moving vertically and down is held set Y to #$06
bra4_A50B:	
	JMP LoadRidingSprite ; Jump to load Player riding sprite	
; **********************************	
loc4_A50E: ; Unsure of purpose
	LDA #$00
	STA $0629 ; clear Unknown
	LDA objFrameCount ; get unknown2
	AND #$08 ; Mask it (%00001000)
	BEQ bra4_A51E ; if masked bit is 00, branch (set Y as 01)
	LDY #$00 ; else set Y as 00 (adjusts offset for loading CHR bank)
	BEQ bra4_A520 ; branch to jump (LoadRidingSprite)
bra4_A51E:
	LDY #$01 ; set Y as 01 (adjusts offset for loading CHR bank)
bra4_A520:
	JMP LoadRidingSprite  ; Jump to load Player riding sprite
; **********************************	
loc4_A523: ; Unsure of purpose
	LDA playerYoshiState
	CMP #$02
	BCC bra4_A537 ; if Yoshi Status < #$02, branch ahead 
	LDY #$00 ; else clear Y
	LDA btnHeld
	AND #BTN_DOWN
	BEQ bra4_A555 ; if down isn't held, branch 
	LDY #$07 ; if it is, set Y to 07 (adjusts offset for loading CHR bank)
	BNE bra4_A555 ; branch to jump, always (LoadRidingSprite)
	
bra4_A537: ; if Yoshi Status < #$02
	LDY $0629 ; load unknown into Y
	LDA btnHeld
	AND #BTN_DOWN
	BEQ bra4_A547 ; if down isn't held, branch 
	LDX tbl4_A571,Y ; if it is, load from table (unknown use)
	JMP loc4_A54A ; skip next instruction
bra4_A547: ; if down isn't held
	LDX tbl4_A558,Y ; load from table (unknown use)
loc4_A54A: ; if down is held
	BPL bra4_A553 ; if value loaded was positive, branch ahead
	LDA #$00 ; else
	STA $0629 ; clear unknown
	LDX #$04 ; set X to #$04
bra4_A553:
	TXA ; move it to A
	TAY ; move it to Y (why do it this way??)
bra4_A555:
	JMP LoadRidingSprite
; **********************************	
tbl4_A558: ; loaded from by bra4_A547
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
tbl4_A571: ; loaded from by bra4_A537
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
playerRidingActionTable:
	db $00 ; standing
	db $01 ; walking
	db $01 ; running
	db $01 ; unused
	db $00 ; jump
	db $02 ; spinning (unused)
	db $02 ; unused
	db $00 ; ducking
	db $00 ; looking up (unused)
	db $00 ; leap
	db $00 ; falling
	db $00 ; falling (underwater)
	db $00 ; swimming
	db $02 ; yoshi tongue out
	db $02 ; yoshi tongue out (while moving)
	db $00 ; flying
	db $03 ; victory pose
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
playerRidingTileHorizPos:
	db $00, $08, $10, $18 ; 1st row
	db $00, $08, $10, $18 ; 2nd row
	db $00, $08, $10, $18 ; 3rd row
	db $00, $08, $10, $18 ; 4th row
playerRidingTileVertPos:
	db $00, $00, $00, $00 ; 1st column
	db $08, $08, $08, $08 ; 2nd column
	db $10, $10, $10, $10 ; 3rd column
	db $18, $18, $18, $18 ; 4th column
playerRidingSpriteYOffset:
	db $28, $29 ; walking
	db $24, $28, $24, $24 ; pointing
	db $2A ; ducking
	db $25, $28 ; unknown
ridingRightXoffset:
	db $ED
	db $ED
	db $ED
	db $ED
	db $ED
	db $ED
	db $EF
	db $EF
	db $ED
ridingLeftXoffset:
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
	.word ptr4_A5F1
	.word ptr4_A5FA
	.word ptr4_A603
	.word ptr4_A5FA
	.word ptr4_A5FA
ptr4_A5F1:
	db $98
	db $98
	db $98
	db $99
	db $98
	db $99
	db $99
	db $99
	db $98
ptr4_A5FA:
	db $8A
	db $8A
	db $8A
	db $8B
	db $8A
	db $8B
	db $86
	db $86
	db $8B
ptr4_A603:
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
	.word ofs_A616
	.word ofs_A6C8
	.word ofs_A79A
	.word ofs_A86C
	.word ofs_A6C8
ofs_A616:
	.word ofs_A628
	.word ofs_A628
	.word ofs_A648
	.word ofs_A668
	.word ofs_A628
	.word ofs_A668
	.word ofs_A688
	.word ofs_A688
	.word ofs_A6A8
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
	.word ofs_A6DA
	.word ofs_A6FA
	.word ofs_A71A
	.word ofs_A73A
	.word ofs_A6DA
	.word ofs_A73A
	.word ofs_A75A
	.word ofs_A75A
	.word ofs_A77A
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
	.word ofs_A7AC
	.word ofs_A7AC
	.word ofs_A7EC
	.word ofs_A80C
	.word ofs_A7AC
	.word ofs_A80C
	.word ofs_A82C
	.word ofs_A82C
	.word ofs_A84C
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
; ofs_A7CC: (Unused?)
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
	.word ofs_A87E
	.word ofs_A6FA
	.word ofs_A89E
	.word ofs_A8BE
	.word ofs_A87E
	.word ofs_A8BE
	.word ofs_A75A
	.word ofs_A75A
	.word ofs_A77A
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
; CAPE CODE START
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-	
jmp_57_A8DE:
	LDA playerPowerup
	CMP #$03 
	BCS bra4_A8E6 ; if player has cape (static or moving), branch ahead
	RTS ; else, end
bra4_A8E6: ; if player has cape
	LDA playerPowerupBuffer
	BMI bra4_A909_RTS ; end if powerup buffer is negative (I think this prevents cape from appearing if the player is changing powerups)
	BEQ bra4_A8F4 ; if it's 00, branch ahead 
; else if it's positive but not 00	
	LDA frameCount	
	AND #$04 ; Mask framecount %00000100
	BEQ bra4_A90A ; if 4 frames pass, branch ahead
	RTS ; else end
	
bra4_A8F4:; if powerup buffer 00
	LDA #$02 ; set bitmask to #$02
	LDY invincibilityTimer 
	BEQ bra4_A90A ; if invincibility timer 00, go to pit check
; If invincibility timer not 00
	CPY #$D0 ; else compare timer to #$D0
	BCC bra4_A905 ; if it's less than #$D0, branch ahead to frame check
; else 
	CPY #$F6 ; if Y >= #$D0, compare to #$F6
	BCS bra4_A90A ; if Y >= to #$F6, branch to pit check
; else
	LDA #$01; else if Y < #$F6, set bitmask to #$01

bra4_A905:
	AND frameCount ; mask #$02 or #$01 against the frame count
	BEQ bra4_A90A ; branch to pit check when they match (1 or 2 frames pass)
bra4_A909_RTS:
	RTS ; if they don't match, end
	
bra4_A90A: 
	LDA playerSprY ; 
	CMP #$E0 ; if player goes below screen/pit,
	BCS bra4_A93D_RTS ; end
; Else
	LDY #$04 ; load "cape moving" state into y reg
	LDX playerAction+1 ; load previous player action into X reg 
	LDA playerYoshiState ; 
	CMP #$01 ; if player doesn't have yoshi (#$01= Yoshi with empty mouth)
	BCC bra4_A929 ; branch to load animation (essentially if it's equal to 00, why write it like that?)
; Else if Player has Yoshi
	LDA playerXSpd		
	BNE bra4_A923 ; ; if player has x speed, branch ahead
	LDA playerYSpd ; 
	BEQ bra4_A929 ; if player has no y speed, branch ahead
; if player has Y speed, coderoll	

bra4_A923: ; if player has Yoshi 
	LDA YoshicapeAnimTable,X; load action from table
	JMP loc4_A92C ; jump to store animation value
	
bra4_A929: ; if no Yoshi or Yoshi with no X speed or Y speed
	LDA capeAnimTable,X ; pick which cape animation to use

loc4_A92C: 
	STA $34 ; store loaded animation value
	BMI bra4_A936 ; branch ahead if a value above $7F is loaded
	STY playerPowerup ; else, set cape to moving (#$04 loaded earlier)
	JSR sub4_A14A ; jump to sub (check if Yoshi present or player carrying objects)
; coderoll on return
bra4_A936:
	LDY playerPowerup ; get player powerup
	CPY #$04 ; if cape is moving,
	BEQ CapeAnimCyclePick ; branch to pick which animation cycle to use
bra4_A93D_RTS:
	RTS ; else if cape static, end
	
; ****************************************************	
; Pick cape animation cycle to use
CapeAnimCyclePick: ; CapeAnimCyclePick; If cape is moving
	LDA $34 ; get cape animation frame (loaded from respective animation table)
	AND #%00001111 ; mask out upper 4 bits
	BNE bra4_A947 ; branch if not zero
	JMP loc4_AB16 ; jump if it was (standing cape cycle code)
bra4_A947:
	CMP #$01 ; if #$01 wasn't loaded,
	BNE bra4_A94E ; branch
	JMP loc4_AB3C ; jump if it was (jumping cape cycle code)
bra4_A94E:
	CMP #$02 ; if #$02 wasn't loaded,
	BNE bra4_A955 ; branch
	JMP loc4_AB70 ; jump if it was (set cape to static?? code)
bra4_A955:
	CMP #$03 ; if #$03 wasn't loaded,
	BNE bra4_A95C ; branch
	JMP loc4_AB82 ; jump if it was (?? code)
bra4_A95C:
	CMP #$04 ; if #$04 wasn't loaded,
	BNE bra4_A963 ; branch
	JMP loc4_ABB0 ; jump if it was (?? code)
bra4_A963: ; 
	LDY $0627 ; get cape frame picker for use as offset
	LDA walkCapeCycle,Y ; select frame from WalkCycle
	JMP loc4_AB42 ; jump ahead (check if loaded value was positive like with the others)
; ****************************************************
; (code returns to here from those above jumps using another jump)
loc4_A96C: ; check for Yoshi 
	LDX playerYoshiState
	BEQ BuildCapeSprNoYoshi ; branch if no Yoshi
	JMP BuildCapeSprYoshiVer ; else, jump to Yoshi segment
; *********************************************************
; If Player Doesn't Have Yoshi START here
; ; ********************************************************	
BuildCapeSprNoYoshi: ; if player doesn't have Yoshi
	PHA ; push value from A to stack 
	LDA playerPowerup 
	ASL ; double player powerup (result should be 06 or 08 depending on cape state)
	TAY ; transfer it to Y
	LDA tbl4_AC41,Y ; this table has 5 identical entries, it simply points to the cape frame selection table   
	STA $34 ; store the low byte
	LDA tbl4_AC41+1,Y ; meaning this segment is probably redundant 
	STA $35 ; store the high byte
	
	PLA ; get value from stack
	PHA ; copy it back to the stack again
	ASL ; double it
	TAY ; transfer it to Y
	LDA ($34),Y ; get cape mapping pointer from table the above section pointed to
	STA $32 ; store low byte
	INY ; advance to next byte of mapping pointer
	LDA ($34),Y
	STA $33 ; ; store high byte
; **************************************************
; Position cape vertically
; **************************************************
	LDA #$00 
	STA $2E ; clear $2E UNKNOWN use
	PLA ; get value from stack again
	TAY ; move it to Y	
	LDA playerSprY  
	SEC
	SBC CapeVoffset,Y ; subtract value loaded from sprite Y position
	LDX playerAction+1 ; Load previous player action 
	CLC
	ADC capeVoffset2,X  ; add secondary vertical offset??? to playerSprY (this table is mostly 00 except for one entry of 06)
; As far as I can tell both tables affect vertical position, I'm guessing this is a weird way of fixing something
	LDX playerPowerup
	BNE bra4_A9AB ; branch if the player has a powerup (?? not exactly sure the purpose of this)
	SEC ; unlogged ; if they dont,
	SBC #$03 ; unlogged  ; subtract 3 from the vertical offset
; **************************************************	
; Position Cape Horizontally
; **************************************************
bra4_A9AB: ; 
	STA playerMetaspriteVAlign ; This is being reused for the capes alignment since this is calculated per frame for both
	LDA playerMoveFlags
	EOR playerSprAttrs 
	AND #$40 ; determine mirror direction 
	BNE bra4_A9D6 ; if player isn't H mirrored (facing left), branch
; else player is mirrored (facing right)
	LDA playerSprX
	CLC
	ADC tbl4_AC1D,Y ; calculate cape X position
	STA playerMetaspriteHAlign ; store it 
; **************************************************
loc4_A9BD: ; If player H mirrored, (facing right) 
	LDA $2E ; mapping byte offset
	CLC
	ADC #$04 ; add 4 (select mirrored mappings)
	TAY ; move it to Y
	LDX $3C ; put OAM tracker byte into X
	LDA ($32),Y ; get tile ID from mapping
	CMP #$FF 
	BEQ bra4_AA31 ; branch if it's a null tile
; Load tile ID
	AND #$3F ; else strip attributes
	STA spriteMem+1,X ; store tile ID 
	PHA ; push masked tile ID to stack
	LDA #$40 ; set mirroring for tile (mirrored)
	JMP loc4_A9F0 ; go to Cape OAM manager 
; **************************************************
bra4_A9D6: ; If player not H mirrored (facing left)
	LDA playerSprX
	CLC
	ADC tbl4_AC26,Y ; calculate cape X position
	STA playerMetaspriteHAlign ; store it 
; coderoll into load tile ID
; **************************************************
; Cape object OAM manager
; **************************************************
bra4_A9DE: ; get unmirrored tile ID (code loops back to here but starts ahead of it)
	LDY $2E ; Unknown
	LDX $3C ; OAM tracker byte
	LDA ($32),Y ; get tile ID from mapping
	CMP #$FF
	BEQ bra4_AA31 ; branch if it's a null tile
	AND #$3F ; else strip attributes
	STA spriteMem+1,X ; store tile ID
	PHA ; push masked tile ID to stack
	LDA #$00 ; set mirroing for tile (unmirrored)
; **************************************************
; 
; **************************************************
loc4_A9F0: ; START HERE for cape OAM manager
	STA $38 ; Store mirroring for tile in temp byte
; Select attribute bank 	
	LDA chrSpriteBank1	
	ASL ; double bank ID
	TAY ; move it to Y
	LDA #$2F
	STA M90_PRG2 ; put the attributes bank into the 2nd PRG slot
	LDA CHRSprBankAttrs,Y
	STA $34 ; lowbyte of attribute pointer
	LDA CHRSprBankAttrs+1,Y
	STA $35 ; highbyte of attribute pointer 
	PLA ; retrive masked tile ID from stack
	TAY ; move it to Y
	LDA ($34),Y ; load attributes 
; probably to do with mirroring, not sure what these values contain
	ORA $38 ; use tile mirroring temp byte as bitmask to set some bits (00/40 bitmask: 1=set 0=ignore)
	ORA $06E0 ; use ?? as bitmask to set some bits
	STA spriteMem+2,X ; store attributes
	
	LDA #$24
	STA M90_PRG2 ; load the player animation bank into the 2nd PRG slot
	LDY $2E  ; put $2E into Y
	LDA playerMetaspriteHAlign
	CLC
	ADC tbl4_AC03,Y ; add column spacing to horizontal alignment
	STA spriteMem+3,X ; store X position
	
	LDA playerMetaspriteVAlign
	CLC
	ADC tbl4_AC07,Y ; Add row spacing to vertical offset 
	STA spriteMem,X ; store Y position
	TXA
	CLC
	ADC #$04
	STA $3C ; add one tile to the OAM tracker byte
	
bra4_AA31:
	INC $2E ; add one to $2E (loop counter for routine)
	LDA $2E
	CMP #$04 
	BCS bra4_AA44_RTS ; if $2E >= #$04, branch to end 
	LDA playerMoveFlags
	EOR playerSprAttrs
	AND #$40 ; determine sprite mirror
	BNE bra4_A9DE ; if not mirrored, branch to load unmirrored tile ID
	JMP loc4_A9BD ; if mirrored branch back to mirrored section
bra4_AA44_RTS:
	RTS
; *********************************************************
; If Player has Yoshi START here
; ; ********************************************************
; most of this literally matches the code for if you don't have Yoshi so that's some grade A space efficiency right there
BuildCapeSprYoshiVer: ; If the player has Yoshi 
	PHA ; push value from A to stack 
	LDA playerPowerup 
	ASL ; double player powerup (result should be 06 or 08 depending on cape state)
	TAY ; transfer it to Y
	LDA tbl4_AC41,Y ; this table has 5 identical entries, it simply points to the cape frame selection table   
	STA $34 ; store the low byte
	LDA tbl4_AC41+1,Y ; meaning this segment is probably redundant 
	STA $35 ; store the high byte
	
	PLA ; get value from stack
	PHA ; copy it back to the stack again
	ASL ; double it
	TAY ; transfer it to Y
	LDA ($34),Y ; get cape mapping pointer from table the above section pointed to
	STA $32 ; store low byte
	INY ; advance to next byte of mapping pointer
	LDA ($34),Y
	STA $33 ; ; store high byte
; **************************************************
; Position cape vertically
; **************************************************	
	LDA #$00
	STA $2E ; clear $2E UNKNOWN use
	PLA ; retrive value from the stack again
	TAY ; move it to Y
	LDA playerSprY
	SEC
	SBC CapeVoffsetYoshi,Y ; subtract Y offset 
	LDX playerAction+1 ; get previous player action
	CLC
	ADC capeVoffset2,X ; add secondary vertical offset? to playerSprY (this table is mostly 00 except for one entry of 06)
	LDX playerPowerup
	BNE bra4_AA7C ; branch if the player has a powerup (?? not exactly sure the purpose of this)
	SEC ; unlogged ; if they dont,
	SBC #$03 ; unlogged  ; subtract 3 from the vertical offset	
; **************************************************	
; Position Cape Horizontally
; **************************************************
bra4_AA7C:
	STA playerMetaspriteVAlign ; This is being reused for the capes alignment since this is calculated per frame for both
	LDA playerMoveFlags
	EOR playerSprAttrs
	AND #$40 ; determine mirror direction 
	BNE bra4_AAA7 ; if player isn't H mirrored (facing left), branch
; else player is mirrored (facing right)
	LDA playerSprX
	CLC
	ADC tbl4_AC2F,Y ; calculate cape X position
	STA playerMetaspriteHAlign ; store it 
; **************************************************	
loc4_AA8E: ; If player H mirrored, (facing right) 
	LDA $2E ; mapping byte offset
	CLC
	ADC #$04 ; add 4 (select mirrored mappings)
	TAY ; move it to Y
	LDX $3C ; put OAM tracker byte into X
	LDA ($32),Y ; get tile ID from mapping
	CMP #$FF 
	BEQ bra4_AB02  ; branch if it's a null tile
; Load tile ID	
	AND #$3F ; else strip attributes
	STA spriteMem+1,X ; store tile ID 
	PHA ; push masked tile ID to stack
	LDA #$40 ; set mirroring for tile (mirrored)
	JMP loc4_AAC1 ; go to Yoshi Cape OAM manager
; **************************************************
bra4_AAA7: ; If player not H mirrored (facing left)
	LDA playerSprX
	CLC
	ADC tbl4_AC38,Y ; calculate cape X position
	STA playerMetaspriteHAlign ; store it 
; coderoll into load tile ID
; **************************************************
; Cape object OAM manager (Yoshi Version)
; **************************************************	
bra4_AAAF: ; get unmirrored tile ID (code loops back to here but starts ahead of it)
	LDY $2E  ; Unknown
	LDX $3C ; OAM tracker byte
	LDA ($32),Y ; get tile ID from mapping
	CMP #$FF
	BEQ bra4_AB02 ; branch if it's a null tile
	AND #$3F ; else strip attributes
	STA spriteMem+1,X ; store tile ID
	PHA ; push masked tile ID to stack
	LDA #$00 ; set mirroing for tile (unmirrored)
; **************************************************
; 
; **************************************************
loc4_AAC1: ; START HERE for cape OAM manager
	STA $38 ; Store mirroring for tile in temp byte
; Select attribute bank 	
	LDA chrSpriteBank1	
	ASL ; double bank ID
	TAY ; move it to Y
	LDA #$2F
	STA M90_PRG2 ; put the attributes bank into the 2nd PRG slot
	LDA CHRSprBankAttrs,Y
	STA $34 ; lowbyte of attribute pointer
	LDA CHRSprBankAttrs+1,Y
	STA $35 ; highbyte of attribute pointer 
	PLA ; retrive masked tile ID from stack
	TAY ; move it to Y
	LDA ($34),Y ; load attributes 
; probably to do with mirroring, not sure what these values contain
	ORA $38 ; use tile mirroring temp byte as bitmask to set some bits (00/40 bitmask: 1=set 0=ignore)
	ORA $06E0 ; use ?? as bitmask to set some bits
	STA spriteMem+2,X ; store attributes
	
	LDA #$24
	STA M90_PRG2 ; load the player animation bank into the 2nd PRG slot
	LDY $2E  ; put $2E into Y
	LDA playerMetaspriteHAlign
	CLC
	ADC tbl4_AC03,Y ; add column spacing to horizontal alignment
	STA spriteMem+3,X ; store X position
	
	LDA playerMetaspriteVAlign
	CLC
	ADC tbl4_AC07,Y ; Add row spacing to vertical offset 
	STA spriteMem,X ; store Y position
	TXA
	CLC
	ADC #$04
	STA $3C ; add one tile to the OAM tracker byte
	
bra4_AB02:
	INC $2E ; add one to $2E (loop counter for routine)
	LDA $2E
	CMP #$04 
	BCS bra4_AB15_RTS ; if $2E >= #$04, branch to end 
	LDA playerMoveFlags
	EOR playerSprAttrs
	AND #$40 ; determine sprite mirror
	BNE bra4_AAAF ; if not mirrored, branch to load unmirrored tile ID
	JMP loc4_AA8E ; if mirrored branch back to mirrored section
bra4_AB15_RTS:
	RTS

;--------------------
; Standing cape cycle code
loc4_AB16:
	LDY $0627 ; put current cape frame offset into Y
	LDA standingCapeCycle,Y ; Use it to pick a frame of animation
	BPL bra4_AB2D ; branch to jump if it's positive
; Else if negative 
	LDA #$00
	STA $0627 ; Clear frame offset
	LDA #$03
	STA playerPowerup ; set cape to static 
	JSR sub4_A14A ; Select if Yoshi is present or if carrying object
	LDA #$08 ; load #$08 on return
bra4_AB2D:
	JMP loc4_A96C ; jump to check for Yoshi
standingCapeCycle:
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
	db $80 ; end of mapping (negative)
	
; ******************************************************************
; Jumping cape cycle code
loc4_AB3C:
	LDY $0627 ; put current cape frame offset into Y
	LDA jumpCapeCycle,Y ; Use it to pick a frame of animation
loc4_AB42:
	BPL bra4_AB52 ; branch to jump if it's positive
; Else if negative (end of mapping)
	LDA #$00
	STA $0627 ; Clear frame offset
	LDA playerXSpd
	BNE bra4_AB50 ; branch if the player has X speed
	STA $0628 ; if they don't, store X speed at $0628 (clear it)
bra4_AB50:
	LDA #$00 ; clear A
bra4_AB52:
	JMP loc4_A96C ; jump to check for Yoshi 

jumpCapeCycle:
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
;--------------------
walkCapeCycle: 
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
;--------------------

loc4_AB70:
	LDA #$00
	STA $0627 ; clear cape frame picker
	LDA #$03
	STA playerPowerup ; set cape to static
	JSR sub4_A14A ; ; Select if Yoshi is present or if carrying object
	LDA #$00 ; clear A
	JMP loc4_A96C ; jump to check for Yoshi 
loc4_AB82:
	LDY $0627 ; Put frame picker into Y
	LDA playerMoveFlags
	AND #$04 
	BEQ bra4_AB8E
	JMP loc4_AB3C
bra4_AB8E:
	LDA fallingCapeCycle,Y ; Pick a frame of animation
	BPL bra4_ABA3 ; if it's positive branch to jump
; Else if it's negative (end of mapping)
	LDA #$00
	STA $0627 ; clear frame picker
	LDA playerYSpd
	BNE bra4_ABA1 ; branch if the player has Y speed
	LDA #$01 ; else,
	STA $0628 ; set $0628 to #$01
bra4_ABA1:
	LDA #$03 ; set A to 03
bra4_ABA3:
	JMP loc4_A96C ; jump to check for Yoshi 
fallingCapeCycle:
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
; ******************************************************************	
loc4_ABB0:
	LDA #$00
	STA $0627 ; clear frame picker
	LDY #$02 ; set Y to 02
	LDA objFrameCount ; load UNKNOWN 
	AND #$01 
	BNE bra4_ABC0 
	LDY #$07
bra4_ABC0:
	LDA playerYSpd
	BEQ bra4_ABCC
	LDA playerMoveFlags
	AND #$04
	BNE bra4_ABCC
	LDY #$06
bra4_ABCC:
	TYA
	JMP loc4_A96C ; jump to check for Yoshi 
capeAnimTable:
	db $80 ; standing
	db $05 ; walking
	db $01 ; running
	db $01 ; unused
	db $03 ; jump
	db $04 ; spinning
	db $80 ; unused
	db $80 ; ducking
	db $80 ; looking up
	db $01 ; leap
	db $03 ; falling	
	db $03 ; falling (underwater)
	db $01 ; swimming
	db $82	
	db $82
	db $01 ; flying
	db $80 ; victory pose
YoshicapeAnimTable:
	db $80 ; standing
	db $05 ; walking
	db $01 ; running
	db $01 ; unused
	db $03 ; jump
	db $04 ; spinning
	db $01 ; unused
	db $80 ; ducking
	db $80 ; looking up
	db $01 ; leap
	db $03 ; falling
	db $03 ; falling (underwater)
	db $01 ; swimming
	db $01 ; yoshi tongue out
	db $01 ; yoshi tongue out (while moving)
	db $01 ; flying
	db $80 ; victory pose
capeVoffset2:
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
tbl4_AC03: ; Cape column spacing table
	db $00 ; tile 1
	db $08 ; tile 2
	db $00 ; tile 3
	db $08 ; tile 4
tbl4_AC07: ; Cape row spacing table
	db $00 ; tile 1
	db $00 ; tile 2
	db $08 ; tile 3
	db $08 ; tile 4
CapeVoffset: ; Cape vertical alignment table (Mario only)
	db $11
	db $19
	db $11
	db $1E
	db $1E
	db $1E
	db $1E
	db $19
	db $17
CapeVoffsetYoshi: ; Cape vertical alignment table (Mario riding Yoshi)
	db $1B
	db $23
	db $1B
	db $29
	db $29
	db $29
	db $29
	db $23
	db $21
tbl4_AC1D: ; Cape X position offset for face right
	db $EE
	db $EE
	db $EE
	db $EF
	db $EF
	db $EF
	db $EF
	db $EE
	db $EE
tbl4_AC26: ; Cape X position offset for face left
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
tbl4_AC41: ; (Redundant?) table that just points to the cape mapping selection table
	.word CapeMappingTbl
	.word CapeMappingTbl
	.word CapeMappingTbl
	.word CapeMappingTbl
	.word CapeMappingTbl
CapeMappingTbl: ; Cape mapping selection table 1
	.word CapeFlap1
	.word CapeFlap2
	.word CapeFlap3
	.word CapeFall1
	.word CapeFall2
	.word CapeFall3
	.word CapeFall4
	.word CapeFlap4 ; also settle 1
	.word CapeSettle2
; Cape mappings 
CapeFlap1: ; flapping 1
	db $01
	db $02
	db $03
	db $04
; Mirrored version	
	db $02
	db $01
	db $04
	db $03
CapeFlap2: ; flapping 2
	db $05
	db $06
	db $07
	db $08
; Mirrored version	
	db $06
	db $05
	db $08
	db $07
CapeFlap3: ; flapping 3
	db $0B
	db $0C
	db $FF
	db $FF
; Mirrored version	
	db $0C
	db $0B
	db $FF
	db $FF
CapeFall1: ; Falling 1
	db $0D
	db $0E
	db $0F
	db $10
; Mirrored version	
	db $0E
	db $0D
	db $10
	db $0F
CapeFall2: ; Falling 2
	db $11
	db $12
	db $13
	db $14
; Mirrored version	
	db $12
	db $11
	db $14
	db $13
CapeFall3: ; Falling 3
	db $15
	db $16
	db $17
	db $18
; Mirrored version	
	db $16
	db $15
	db $18
	db $17
CapeFall4: ; Falling 4
	db $19
	db $1A
	db $1B
	db $1C
; Mirrored version	
	db $1A
	db $19
	db $1C
	db $1B
CapeFlap4: ; flapping 4 (frame 1 of settling)
	db $FF
	db $1D
	db $09
	db $0A
; Mirrored version	
	db $1D
	db $FF
	db $0A
	db $09
CapeSettle2: ; settle frame 2
	db $20
	db $FF
	db $1E
	db $1F
; Mirrored version		
	db $FF
	db $20
	db $1F
	db $1E
;--------------------

jmp_57_ACA5: 
	LDA playerState
	CMP #$09
	BCS bra4_ACCF ; Branch if Yoshi has his mouth open at all
	RTS

jmp_57_ACAC:
	LDA freezeFlag
	BEQ bra4_ACBE ; Branch if the game isn't frozen
		LDA playerMoveFlags
		AND #$04
		BNE bra4_ACBD_RTS ; Make sure the player isn't moving up
		LDA #$00
		STA playerAction
		STA playerAnimFrame ; Reset the player's animation and action

bra4_ACBD_RTS:
	RTS

; If game not frozen, go through this list
bra4_ACBE:
	JSR runLevelTimer
	JSR playerItemBoxLogicSub
	JSR sub4_AD8C
	JSR sub4_ADB3
	JSR sub4_B0BC
	LDA playerState

bra4_ACCF:
	ASL
	TAY
	LDA tbl4_ACDE,Y
	STA $32
	LDA tbl4_ACDE+1,Y
	STA $33
	JMP ($32) ; jump to pointer
tbl4_ACDE:
	.word ofs_AE4F
	.word ofs_AE4F
	.word ofs_AE4F
	.word ClimbingRoutines
	.word ofs_B57C
	.word ofs_B724 ; State 5 (currently unknown)
	.word ofs_B8DE
	.word ofs_B8DE
	.word ofs_B90C
	.word ofs_B724
	.word ofs_B76A
	.word ofs_B782
	.word ofs_B794
	.word ofs_B7B5
	.word ofs_B7CD
	.word ofs_B7DF
	.word ofs_B7F7
	.word ofs_B80F
	.word ofs_B821

jmp_57_AD04:
	LDA playerPowerupBuffer
	BEQ bra4_AD1E
	INC playerPowerupBuffer
	LDA playerPowerupBuffer
	AND #$7F
	CMP #$20
	BCC bra4_AD1D_RTS
	LDA #$00
	STA playerPowerupBuffer
	JSR sub4_A14A
bra4_AD1D_RTS:
	RTS

bra4_AD1E:
	LDA #$02
	STA gameState
	LDA #$00
	STA gameSubstate
	RTS

;----------------------------------------
; SUBROUTINE ($AD27)
; Counts the timer down.
;----------------------------------------
runLevelTimer:
	LDA prgDataBank2
	CMP #38
	BEQ bra4_AD8B_RTS ; Stop the timer if the final boss room bank is loaded (assumes the level is stored in bank 38)
	LDA worldNumber
	CMP #7
	BCC bra4_AD3E
	; Clear the timer and don't count down if in World 8 (Yoshi's House)
		LDA #$00
		STA levelTimer
		STA levelTimer+1
		RTS
	
bra4_AD3E:
	LDA $0616
	CMP #59
	BCS bra4_AD49
		INC $0616 ; Increment frame counter until one second is reached
		RTS

	; If a second has been counted:
	bra4_AD49:
		LDA #$00
		STA $0616 ; Clear frame counter every second
		
		; Tick the timer down one second
		LDA levelTimer
		SEC
		SBC #1
		STA levelTimer
		LDA levelTimer+1
		SBC #0
		STA levelTimer+1

		BNE bra4_AD8B_RTS
		LDA levelTimer
		BNE bra4_AD8B_RTS ; Stop if the timer hasn't reached 0 yet

		; If timer has reached 0:
			STA playerPowerup
			LDA #$01
			STA timeUpFlag
			LDA playerYoshiState
			BEQ bra4_AD76
			; If player is on Yoshi:
				JSR dismountYoshiRoutine ; Dismount the player from Yoshi

		bra4_AD76:
			LDA #0
			STA gameSubstate ; Go to first substate of death state
			STA playerState ; Set player to default state
			STA $06DC
			STA $06DD
			LDA #GAMESTATE_DEATH
			STA gameState ; Set game to death state
			JSR sub4_A14A
			PLA
			PLA

bra4_AD8B_RTS:
	RTS

sub4_AD8C:
	LDA playerState
	CMP #$05
	BCS bra4_ADB4_RTS
	LDA levelWaterFlag
	BEQ bra4_AD9F
	LDA playerState
	BNE bra4_ADB4_RTS
	LDX #$01
	BNE bra4_ADB0
bra4_AD9F:
	LDA playerState
	CMP #$03
	BEQ bra4_ADB4_RTS
	LDX #$00
	LDA playerPowerup
	CMP #$03 ; if the player doesn't have a cape,
	BCC bra4_ADB0 ; branch
	LDX #$04 ; set cape state
bra4_ADB0:
	STX $E1
bra4_ADB4_RTS:
	RTS
sub4_ADB3:
	LDA playerYoshiState
	BEQ bra4_ADE2 ; Branch if the player doesn't have Yoshi
	LDA playerHurtFlag
	BEQ bra4_ADE2 ; Branch if the damage flag isn't set
	LDA #$00
	STA playerHurtFlag ; Otherwise, clear the damage flag
	LDA #$40
	STA playerYSpd ; Set player's vertical speed to 64
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Set vertical movement upwards
	LDA #SFX_POWERDOWN
	STA sndSfx ; Play damage sound
	LDA #$03
	STA playerAction ; Knock the player off Yoshi
	LDA #$00
	STA playerState ; Stop whatever the player was doing
	JSR dismountYoshiRoutine
	LDA #$04
	STA yoshiUnmountedState
	STA $50
bra4_ADE2:
	LDA playerHoldFlag	
	CMP playerHoldFlag2 ; if the player's carry flag is equal to its duplicate,
	BEQ bra4_ADF0 ; branch
	STA playerHoldFlag2 ; if not, make it equal
	JSR sub4_A14A
bra4_ADF0:
	LDY invincibilityTimer
	BEQ bra4_AE14_RTS ; Stop if the timer is empty
	LDA frameCount
	AND #$03
	BNE bra4_AE14_RTS ; Only do this every 4 frames
	CPY #$01
	BNE bra4_AE03
	LDX #MUS_VALLEYOFBOWSER
	STX sndMusic ; Play the Valley of Bowser theme
bra4_AE03:
	CPY #$F8
	BCC bra4_AE0F
	JSR sub4_A4CE ; Clear the timer if it goes over 248
	LDA #$FF
	STA invincibilityTimer
bra4_AE0F:
	INC invincibilityTimer ; Increment timer
bra4_AE14_RTS:
	RTS 
playerItemBoxLogicSub: ; X: Itembox, Y: Player Power
	LDA btnPressed
	AND #BTN_SELECT ; Continue if select pressed
	BEQ playerItemBoxLogicDone
	
	LDA #$07
	STA gameState ; Set to event 7 (using lesser powerup from item box)
	
	LDY playerPowerup ; Load current powerup into Y register
	CPY #$04
	BNE bra4_AE27 ; Branch if player doesn't have cape
	LDY #$03 ; Load feather item to Y register
	
bra4_AE27:
	LDX playerItemBox ; Load item box contents into x register
	BEQ playerItemBoxLogicDone ; If item box is empty, stop
	CPX #$02
	BCS bra4_AE34 ; Branch if there's a flower in the item box
	CPY #$00
	BNE bra4_AE45 ; Branch if not empty nor flower
	
bra4_AE34:
	STY playerItemBox ; Put powerup from from Y register in item box
	LDA #$01
	STX playerPowerup ; Use item box contents stored in the x register
	CPX #$03 ; if the player doesn't have a cape,
	BNE bra4_AE42 ; branch
	LDA #$81
	
bra4_AE42:
	STA playerPowerupBuffer
bra4_AE45:
	LDA playerItemBoxSFX,X
	STA sndSfx ; Play the corresponding sound effect for the item
playerItemBoxLogicDone:
	RTS
playerItemBoxSFX:
	db $00 ; Empty
	db SFX_POWERUP ; Mushroom
	db SFX_POWERUP ; Flower
	db SFX_FEATHER ; Feather
ofs_AE4F:
	LDA playerPowerup
	CMP #$03
	BCC bra4_AE59 ; If the player doesn't have a cape, branch
	JSR spinCapeRoutine ; If they do, jump
bra4_AE59:
	LDA playerAction+1
	ASL
	TAY ; Get pointer for player's action value
	LDA tbl4_AE6A,Y
	STA $32 ; Load low byte of pointer
	LDA tbl4_AE6A+1,Y
	STA $33 ; Load high byte of pointer
	JMP ($32) ; Jump to loaded pointer location
tbl4_AE6A:
	.word pActIdle ; Idle
	.word pActWalk ; Walking
	.word pActRun ; Running
	.word pActWalk ; Unused
	.word pActJump ; Jumping
	.word pActSpin ; Spinning/Spin Jump
	.word pActIdle ; Unused, likely meant for turning around
	.word pActDuck ; Ducking
	.word pActIdle ; Looking up
	.word pActJump ; Leaping (Run Jump)
	.word pActJump ; Falling
	.word PActSwim ; Sinking
	.word PActSwim ; Swimming up
	.word pActRun ; Climbing/Yoshi Tongue (Idle)
	.word pActJump ; Climbing/Yoshi Tongue (Moving)
	.word pActJump ; Flying
	.word pActJump ; Victory Pose
	.word pnt_AF86
	.word PActSwim
	.word pnt_AF92
	
pActIdle:
	LDA playerYSpd
	BNE playerIdleFallChk ; Branch if player is moving vertically
	LDA playerMoveFlags
	AND #$04
	BNE pActIdleDone ; Make sure the player isn't moving up
	LDA btnHeld
	BNE pActIdleChecks ; Branch if any button is held
	STA playerAction ; Make the player stand still if none are held
pActIdleChecks:
	JSR lookUpDuckRoutine ; Check for ducking and looking up
	JSR playerWalkRoutine ; Check for walking
	JSR swimHoldRoutine ; Check for swimming
	JSR shootFireball ; Check for shooting fireballs
pActIdleDone:
	RTS
playerIdleFallChk:
	LDA playerMoveFlags
	AND #$04
	BNE pActIdleDone ; Branch if the player is already moving up
	LDA #$0A
	STA playerAction ; Trigger the "falling" action
	RTS
pActDuck:
	LDA playerYSpd
	BNE playerDuckFallChk ; Branch if the player is moving vertically
	LDA playerMoveFlags ; Continue if they aren't
	AND #$04
	BNE pActDuckDone ; Branch if the player is moving up
	LDA btnHeld ; Otherwise, continue
	AND #BTN_DOWN
	BNE bra4_AED0 ; Branch if down is held
	LDA #$00
	STA playerAction ; If not, set action to standing still
bra4_AED0:
	JSR lookUpDuckRoutine
	JSR swimHoldRoutine
	JSR shootFireball
pActDuckDone:
	RTS
playerDuckFallChk:
	LDA playerMoveFlags
	AND #$04
	BNE pActDuckDone ; If player not moving up,
	LDA #$0A
	STA playerAction ; Set action to falling
	RTS
pActWalk:
	JSR playerWalkFallRout ; Make sure player is on solid ground
	LDA playerXSpd
	BNE bra4_AEEE
	STA playerAction ; Make the player stop when their horizontal speed reaches 0
bra4_AEEE:
	JSR playerWalkRoutine
	JSR playerRunRoutine
	JSR swimHoldRoutine
	JSR shootFireball
	LDA btnHeld
	AND #BTN_DOWN
	BEQ bra4_AF05_RTS ; Make sure down is held
	LDA #$07
	STA playerAction ; Set action to ducking
bra4_AF05_RTS:
	RTS
pActRun:
	JSR playerWalkFallRout ; Make sure the player is on solid ground
	LDA playerXSpd
	BNE bra4_AF0F
	STA playerAction ; Make the player stop when their horizontal speed reaches 0
bra4_AF0F:
	JSR playerWalkRoutine
	JSR playerRunRoutine
	JSR swimHoldRoutine
	JSR leapRoutine
	JSR shootFireball
	RTS
playerWalkFallRout:
	LDA playerYSpd
	CMP #$07
	BCC fallingChkDone ; Make sure the player's Y speed is greater than 7
	LDX #$0A ; If it is, make the player fall
	LDA levelWaterFlag
	BEQ setPlayerFallingAct
	LDX #$0B ; If underwater, make the player sink instead
setPlayerFallingAct:
	STX playerAction ; Store loaded action
	PLA
	PLA
fallingChkDone:
	RTS
pActJump:
	LDA playerYSpd
	BNE bra4_AF41 ; Branch if the player is already moving vertically
	LDA playerMoveFlags
	AND #$04
	BNE bra4_AF41 ; Branch if the player is moving up
	LDA #$01
	STA playerAction ; Set action to walking
bra4_AF41:
	JSR jumpYSpdRoutine ; Extend Y height if A is held
	JSR midAirFireShoot ; Shoot fire in mid air
	JSR jumpXSpdRoutine ; X movement in mid air
	LDA playerState
	BEQ bra4_AF51 ; Skip the underwater object grab if the player isn't underwater
	JSR swimHoldRoutine
bra4_AF51:
	JSR spinJumpRoutine
	RTS
	
jumpYSpdRoutine:
	LDA playerMoveFlags
	AND #$04
	BEQ jumpYSpdRtDone ; Make sure the player is moving up
	LDA btnHeld
	AND #BTN_A
	BEQ jumpYSpdRtDone ; Make sure the A button is held
	LDA playerYSpd
	CLC
	ADC #$01
	STA playerYSpd ; Increase the player's vertical speed by 1
jumpYSpdRtDone:
	RTS
pActSpin:
	LDA playerYSpd
	BNE bra4_AF78 ; Branch if the player is already moving vertically
	LDA playerMoveFlags
	AND #$04
	BNE bra4_AF78 ; Branch if the player is moving up
	LDA #$01
	STA playerAction ; Set action to walking
bra4_AF78:
	JSR FireFlowerChk
	JSR jumpXSpdRoutine
	LDA playerState
	BEQ bra4_AF85_RTS ; Skip the underwater object grab if the player isn't underwater
	JSR swimHoldRoutine
bra4_AF85_RTS:
	RTS
pnt_AF86:
	LDX #$00
	LDY #$10
	JSR actionTimerRoutine ; Wait for one 10 frame tick
	LDA #$04
	STA playerAction
	RTS
pnt_AF92:
	JSR swimHoldRoutine
	LDX #$00
	LDY #$08
	JSR actionTimerRoutine ; Wait for one 8 frame tick
	LDA #$00
	STA playerAction ; set player action to nothing
	RTS
;-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-==-=-=-=-=-=-=-=-
; FIREBALL SPAWNING
;-=-=-=-=-=-=-=-==-=-=-==-=-=-=-=-=-=-==-=-=-=-=-=-=-=-	
shootFireball:
	LDA playerPowerup
	CMP #$02
	BNE shootFireballDone ; Make sure the player has fire power
	LDA fireballSlot
	AND fireballSlot2
	BNE shootFireballDone ; Make sure there's an open fireball slot
	LDA btnHeld	
	AND #BTN_DOWN
	BNE shootFireballDone ; Stop if down is held
	LDA btnPressed
	AND #BTN_B
	BEQ shootFireballDone ; Wait until B is pressed
	LDA #$13 ; norm fireball 
	STA playerAction ; Set PAct to throwing fireball
	JSR SetFireballDir ; Jump to set fireball direction
shootFireballDone:
	RTS		
midAirFireShoot:
	LDA playerPowerup
	CMP #$02
	BNE midAirFireShootDone ; Make sure the player has fire power
	LDA fireballSlot
	AND fireballSlot2
	BNE midAirFireShootDone ; Stop if there aren't any open fireball slots
	LDA btnHeld
	AND #BTN_DOWN
	BNE midAirFireShootDone ; Stop if down is held
	LDA btnPressed
	AND #BTN_B
	BEQ midAirFireShootDone ; Wait until B is pressed
	LDY #$11 ; Make the player shoot a mid-air fireball
	LDA levelWaterFlag
	BEQ bra4_AFEB ; If not underwater, skip
	INY ; If underwater, make the player shoot an underwater fireball instead
bra4_AFEB:
	STY playerAction ; Store loaded action (type of fire to throw)
	JSR SetFireballDir ; Jump
midAirFireShootDone:
	RTS
;-=-=--=-=		
FireFlowerChk: ; START HERE if spin jumping
	LDA playerPowerup
	CMP #$02
	BEQ bra4_AFF9 ; Branch if the player has fire power
flowerChkDone:
	RTS ; Otherwise, end the check
bra4_AFF9:
	LDX usedFireballSlots ; Load the current fireball slot number into the X register
	LDA fireballSlot,X
	BNE flowerChkDone ; Branch if the current slot is occupied
	LDA #$40 ; Make fireball move left
	CPX #$00
	BNE setSpinFireDir ; Branch if currently on fireball slot 1, this sets the direction of the fireball in the second slot
	TXA ; If the slot is zero, make fireball face right, sets the direction of the fireball in the first slot
setSpinFireDir:
	STA $32 ; Store loaded fireball direction
	JMP spawnFireball
;-=-=-=-=-=-=	
SetFireballDir:  ; Go here for normal or mid air fire
	LDA playerMoveFlags
	AND #$C0 ; Get the player's direction
	STA $32 ; Use it for the fireball's direction
	LDX usedFireballSlots
	LDA fireballSlot,X
	BEQ spawnFireball ; If the fireball slot is open, branch
	RTS ; end and check other slot on next frame
	
spawnFireball:
	INC fireballSlot,X ; Set selected fire slot to occupied
	LDY objCount ; Load next open object slot
	LDA $32
	STA objState,Y ; Store the fireball direction in object memory
	TXA ; set A to usedFireballSlots
	CLC
	ADC #$06 ; add 6 to A (Used slots +6)
	STA objSlot,Y ; Spawn the selected type of fireball (norm, mid-air, underwater)
	LDA $32
	AND #$40
	BNE FireSpawnLeft ; Branch if the fireball set to facing left
	LDA playerXLoDup
	CLC
	ADC #$00 ; clear carry of playerXLoDup
	STA objXLo,Y ; Spawn at player's x position
	LDA playerXHiDup
	ADC #$00 ; add carry if present 
	JMP FireSpawnY ; jump
FireSpawnLeft: ; if player facing left
	LDA playerXLoDup
	SEC
	SBC #$08
	STA objXLo,Y ; Spawn it 1 tile to the left of the player
	LDA playerXHiDup
	SBC #$00 ; subtract carry
FireSpawnY: ; set Y position of fireball 
	STA objXHi,Y
	LDA playerYHiDup
	STA objYHi,Y ; Spawn it at same vertical screen as player
	LDA #$EC
	BMI bra4_B075 ; Branch
; unused code:
	CLC ; unlogged
	ADC playerYLoDup ; unlogged
	STA objYLo,Y ; unlogged
	BCS bra4_B066 ; unlogged
	CMP #$F0 ; unlogged
	BCC bra4_B08C ; unlogged
bra4_B066:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,Y ; unlogged
	LDA objYHi,Y ; unlogged
	CLC ; unlogged
	ADC #$01 ; unlogged
	JMP loc4_B089 ; unlogged
bra4_B075:
	CLC
	ADC playerYLoDup
	STA objYLo,Y
	BCS bra4_B08C
	SEC
	SBC #$10
	STA objYLo,Y
	LDA objYHi,Y
	SEC
	SBC #$01
loc4_B089:
	STA objYHi,Y
bra4_B08C:
	LDA #$00
	STA $058C,Y
	STA objVar,Y
	STA objAction,Y
	INC objCount ; Add it to the total object count
	LDA usedFireballSlots
	EOR #$01
	STA usedFireballSlots
	RTS
;----------------------------------------
; END OF FIREBALL SPAWNING
;----------------------------------------
PActSwim: ; 0C
	LDA playerMoveFlags
	AND #$04
	BNE bra4_B0B2 ; Branch if the player is moving up
	LDX #$0B ; Set action to sinking
	LDA playerYSpd
	BNE bra4_B0B0 ; If the player has vertical speed, keep the previous action and branch
	LDX #$01 ; If they don't, make them walk instead
bra4_B0B0:
	STX playerAction ; Store action value
bra4_B0B2: ; swimming action list
	JSR swimMove
	JSR swimHoldRoutine
	JSR midAirFireShoot
	RTS
sub4_B0BC:
	LDA playerYoshiState
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
	LDA btnPressed
	AND #BTN_B
	BEQ bra4_B11D_RTS ; Make sure B is pressed
	LDA #$00
	STA swallowFrameCount
	STA yoshiSwallowTimer ; Clear Yoshi's swallow timer
	LDY #$0C ; Set player state
	LDA btnHeld
	AND #BTN_DOWN
	BEQ bra4_B0F4 ; Branch if down isn't held
	LDY #$0E ; If down is held, set the player's state
bra4_B0F4:
	LDA btnHeld
	AND #BTN_RIGHT+BTN_LEFT
	BEQ bra4_B0FD ; Branch if left or right aren't held
	LDY #$0D ; If left are right are held, set the player's state
bra4_B0FD:
	STY playerState ; Store the player's state
	LDA playerYoshiState
	CMP #$07
	BCC bra4_B113 ; Branch if not about to swallow stored item
	SEC ; If about to swallow item, continue
	SBC #$05
	STA playerYoshiState
	JSR sub4_A14A
	LDA #$00
	STA playerAnimFrame
bra4_B113:
	LDA playerYoshiState
	CMP #$04
	BNE bra4_B11E
	JSR spawnYoshiFire
bra4_B11D_RTS:
	RTS
bra4_B11E:
	LDY objCount
	STA objSlot,Y
	LDA playerMoveFlags
	AND #BTN_B
	BNE bra4_B138
	LDA playerXLoDup
	CLC
	ADC #$10
	STA objXLo,Y
	LDA playerXHiDup
	ADC #$00
	JMP loc4_B144
bra4_B138:
	LDA playerXLoDup
	SEC
	SBC #$20
	STA objXLo,Y
	LDA playerXHiDup
	SBC #$00
loc4_B144:
	STA objXHi,Y
	LDA playerYHiDup
	STA objYHi,Y
	LDA #$E4
	BMI bra4_B16B
	CLC ; unlogged
	ADC playerYLoDup ; unlogged
	STA objYLo,Y ; unlogged
	BCS bra4_B15C ; unlogged
	CMP #$F0 ; unlogged
	BCC bra4_B182 ; unlogged
bra4_B15C:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,Y ; unlogged
	LDA objYHi,Y ; unlogged
	CLC ; unlogged
	ADC #$01 ; unlogged
	JMP loc4_B17F ; unlogged
bra4_B16B:
	CLC
	ADC playerYLoDup
	STA objYLo,Y
	BCS bra4_B182
	SEC
	SBC #$10
	STA objYLo,Y
	LDA objYHi,Y
	SEC
	SBC #$01
loc4_B17F:
	STA objYHi,Y
bra4_B182:
	LDA #$00
	STA objState,Y
	STA objVar,Y
	LDA $0632
	STA $058C,Y
	INC objCount
	RTS
loc4_B193:
	LDA playerState
	CMP #$09
	BCS bra4_B1C0_RTS
	LDA btnPressed
	AND #BTN_B
	BEQ bra4_B1C0_RTS
	LDA #SFX_YOSHITONGUE
	STA sndSfx
	LDY #$09
	LDA btnHeld
	AND #BTN_DOWN
	BEQ bra4_B1AF
	LDY #$0B
bra4_B1AF:
	LDA btnHeld
	AND #BTN_RIGHT+BTN_LEFT
	BEQ bra4_B1BE
	LDY #$09
	LDA playerYSpd
	BNE bra4_B1BE
	LDY #$0A
bra4_B1BE:
	STY $E1
bra4_B1C0_RTS:
	RTS
loc4_B1C1:
	LDY #$0F
	LDA btnHeld
	AND #BTN_DOWN
	BEQ bra4_B1CC
	LDY #$11
bra4_B1CC:
	LDA btnHeld
	AND #BTN_RIGHT+BTN_LEFT
	BEQ bra4_B1DB
	LDY #$0F
	LDA playerYSpd
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
	STA playerState
	LDA playerYoshiState
	CLC
	ADC #$05
	STA playerYoshiState
	JSR sub4_A14A
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; YOSHI FIRE SPAWN
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
; This is unoptimised, it duplicates the code for calculating the exact same offsets for all 3 fireballs 
spawnYoshiFire:
	LDY objCount ; Get slot index based on object count
	LDA #$08
	STA objSlot,Y ; Load middle fireball
	LDA #$09
	STA objSlot+1,Y ; Load bottom fireball
	LDA #$0A
	STA objSlot+2,Y ; Load top fireball
	LDA playerMoveFlags
	STA objState,Y
	STA objState+1,Y
	STA objState+2,Y ; Set fireballs to the player's direction
	
	AND #$40 ; bitmask playerMoveFlags 
	BNE bra4_B225
	LDA playerXLoDup
	CLC
	ADC #$08 ; add 08 to duplicate player X position
	STA objXLo,Y ; store it as the object X position offset by object count (set spawn location)
	LDA playerXHiDup
	ADC #$00 ; apply carry if present to X screen duplicate (unknown function)
	JMP loc4_B231 ; Jump ahead
	
bra4_B225: ; set X spawn offset for middle fireball for left facing (the other 2 seem to adjust in some other way)
	LDA playerXLoDup
	SEC
	SBC #$10 ; subtract 10 from duplicate player X position
	STA objXLo,Y ; store it as the X position for the middle fireball
	LDA playerXHiDup 
	SBC #$00 ; subtract carry from duplicate player X screen (unknown function)
	
loc4_B231:
	STA objXHi,Y
	LDA playerYHiDup
	STA objYHi,Y
	LDA #$E4
	BMI bra4_B258
	CLC ; unlogged
	ADC playerYLoDup ; unlogged
	STA objYLo,Y ; unlogged
	BCS bra4_B249 ; unlogged
	CMP #$F0 ; unlogged
	BCC bra4_B26F ; unlogged
bra4_B249:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,Y ; unlogged
	LDA objYHi,Y ; unlogged
	CLC ; unlogged
	ADC #$01 ; unlogged
	JMP loc4_B26C ; unlogged
bra4_B258:
	CLC
	ADC playerYLoDup ; add #$E4 to duplicate Y pos
	STA objYLo,Y ; store it as Y position for middle fireball (final position)

	BCS bra4_B26F ; Branch on carry set
	SEC ; else, set carry
	SBC #$10 ; subtract 10
	STA objYLo,Y ; store it as the Y pos for middle fireball
	LDA objYHi,Y 
	SEC
	SBC #$01 ; subtract 1 from (middle fireball) object Y screen 
loc4_B26C:
	STA objYHi,Y ; store it
	
bra4_B26F: ; Bottom Fireball
	LDA #$00 
	STA $058C,Y ; clear UNKNOWN offset by Object count 
	STA objAction,Y ; clear object action of middle firebaall
	INY ; increment Y offset (select bottom fireball)
	LDA playerMoveFlags
	AND #$40
	BNE bra4_B28D
	LDA playerXLoDup
	CLC
	ADC #$08
	STA objXLo,Y
	LDA playerXHiDup
	ADC #$00
	JMP loc4_B299
bra4_B28D:
	LDA playerXLoDup
	SEC
	SBC #$10
	STA objXLo,Y
	LDA playerXHiDup
	SBC #$00
loc4_B299:
	STA objXHi,Y
	LDA playerYHiDup
	STA objYHi,Y
	LDA #$E4
	BMI bra4_B2C0
	CLC ; unlogged
	ADC playerYLoDup ; unlogged
	STA objYLo,Y ; unlogged
	BCS bra4_B2B1 ; unlogged
	CMP #$F0 ; unlogged
	BCC bra4_B2D7 ; unlogged
bra4_B2B1:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,Y ; unlogged
	LDA objYHi,Y ; unlogged
	CLC ; unlogged
	ADC #$01 ; unlogged
	JMP loc4_B2D4 ; unlogged
	
bra4_B2C0:
	CLC
	ADC playerYLoDup
	STA objYLo,Y
	BCS bra4_B2D7
	SEC
	SBC #$10
	STA objYLo,Y
	LDA objYHi,Y
	SEC
	SBC #$01
loc4_B2D4:
	STA objYHi,Y
	
bra4_B2D7: ; Top fireball
	LDA #$00
	STA $058C,Y
	STA objAction,Y
	INY ; select top fireball
	LDA playerMoveFlags
	AND #$40
	BNE bra4_B2F5
	LDA playerXLoDup
	CLC
	ADC #$08
	STA objXLo,Y
	LDA playerXHiDup
	ADC #$00
	JMP loc4_B301
bra4_B2F5:
	LDA playerXLoDup
	SEC
	SBC #$10
	STA objXLo,Y
	LDA playerXHiDup
	SBC #$00
loc4_B301:
	STA objXHi,Y
	LDA playerYHiDup
	STA objYHi,Y
	LDA #$E4
	BMI bra4_B328
	CLC ; unlogged
	ADC playerYLoDup ; unlogged
	STA objYLo,Y ; unlogged
	BCS bra4_B319 ; unlogged
	CMP #$F0 ; unlogged
	BCC bra4_B33F ; unlogged
bra4_B319:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,Y ; unlogged
	LDA objYHi,Y ; unlogged
	CLC ; unlogged
	ADC #$01 ; unlogged
	JMP loc4_B33C ; unlogged
bra4_B328:
	CLC
	ADC playerYLoDup
	STA objYLo,Y
	BCS bra4_B33F
	SEC
	SBC #$10
	STA objYLo,Y
	LDA objYHi,Y
	SEC
	SBC #$01
loc4_B33C:
	STA objYHi,Y
	
bra4_B33F:
	LDA #$00
	STA $058C,Y
	STA objAction,Y
	INY ; increment Y
	STY objCount ; Update object count
	LDA #SFX_YOSHIFIRESPIT
	STA sndSfx ; Play Yoshi fire sound
	RTS ; end
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; END OF YOSHI FIRE SPAWN
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
	
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; WALKING AND RUNNING
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
playerWalkRoutine:
	LDA btnHeld
	AND #BTN_RIGHT
	BEQ playerWalkLeft ; Branch if right isn't held
	LDA playerMoveFlags ; If it is, continue
	AND #$BE ; Make the player face right
	JMP loc4_B368 ; Jump
playerWalkLeft:
	LDA btnHeld
	AND #BTN_LEFT
	BEQ playerWalkDone ; Make sure left is held
	LDA playerMoveFlags
	ORA #$41 ; Make the player face left
loc4_B368:
	STA playerMoveFlags ; Store movement value
	LDA playerXSpd
	CMP #$10
	BCS setWalking ; Set walking speed at #$10, or 16 decimal
	LDA playerXSpd
	CLC
	ADC #$04
	STA playerXSpd ; Accelerate the player's speed by 4
setWalking:
	LDA #$01
	STA playerAction ; Trigger "walking" action
playerWalkDone:
	RTS
swimMove:
	LDA btnHeld	
	AND #BTN_RIGHT
	BEQ swimLeft ; If right is held,
	LDA playerMoveFlags
	AND #$BE ; Make the player face right
	JMP loc4_B395 ; Jump
swimLeft:
	LDA btnHeld
	AND #BTN_LEFT
	BEQ swimMoveDone ; If left is held,
	LDA playerMoveFlags
	ORA #$41 ; Make the player face left
loc4_B395:
	STA playerMoveFlags ; Store movement value
	LDA playerXSpd
	CMP #$10
	BCS swimMoveDone ; If X speed < 16,
	LDA playerXSpd
	CLC
	ADC #$04
	STA playerXSpd ; Increase the player's X speed by 4
swimMoveDone:
	RTS
jumpXSpdRoutine:
	LDA playerMoveFlags
	STA $26 ; Copy movement value
	LDA btnHeld
	AND #BTN_RIGHT
	BEQ doLeftJump ; Branch if the player isn't holding right
	LDA playerMoveFlags
	AND #$BE ; Set player's direction to right
	JMP jumpDirectnChk ; Jump
doLeftJump:
	LDA btnHeld
	AND #BTN_LEFT
	BNE playerSetLeft ; Branch if left is held
	LDA #$01 ; Set acceleration
	BNE jumpXSpdCap ; Branch
playerSetLeft:
	LDA playerMoveFlags
	ORA #$41 ; Set player's direction to left
jumpDirectnChk:
	STA playerMoveFlags ; Store loaded direction
	EOR $26	
	AND #$40
	BEQ setJumpXAccel ; If the player stays in the same direction while jumping, branch
	LDA #$00
	STA playerXSpd ; Clear X speed
	RTS
setJumpXAccel:
	LDA #$03 ; Set acceleration
jumpXSpdCap:
	CLC
	ADC playerXSpd ; Acceleration + Speed
	CMP #$20
	BCS jumpXSpdRtDone ; Keep adding it until the cap is reached
	STA playerXSpd ; Store the sum
jumpXSpdRtDone:
	RTS
swimHoldRoutine:
	LDA levelWaterFlag
	BEQ jumpingRoutine ; If player isn't underwater, branch
	LDA playerHoldFlag
	BEQ swimChk ; If player isn't carrying anything, branch
	LDA #$20
	STA playerYSpd ; Set vertical speed to 32
	LDA btnHeld	
	AND #BTN_DOWN
	BEQ holdFloatUp ; Make the player float if down isn't held
	LDA playerMoveFlags
	AND #$FB
	STA playerMoveFlags ; If it is held, make player swim down
	RTS
holdFloatUp:
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Make player float up
	RTS
swimChk:
	LDA btnPressed
	AND #BTN_A
	BEQ swimmingDone ; Make sure A is pressed
	LDA btnHeld
	AND #BTN_UP
	BEQ doSwim ; Dismount Yoshi if up is held 
	JSR dismountYoshiRoutine
doSwim:
	LDA #$30
	STA playerYSpd ; Set vertical speed to 48
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Set movement to moving up
	LDA #SFX_SWIM
	STA sndSfx ; Play swim sound
	LDA #$0C
	STA playerAction ; Set action to swimming up
swimmingDone:
	RTS
jumpingRoutine:
	LDA btnPressed
	AND #BTN_A
	BEQ swimmingDone ; Make sure the A button is pressed
	LDA playerYSpd
	BNE swimmingDone ; Make sure that the player has no leftover vertical speed
	LDA playerHoldFlag
	BNE doBJump ; Branch if the player is carrying something
	LDA btnHeld
	AND #BTN_UP
	BNE executeSpinJump ; If up is held, do a spin jump instead
doBJump:
	LDY #$48 ; Set vertical speed to $48
	LDA btnHeld
	AND #BTN_B
	BEQ doLowJump
	LDY #$58 ; If B is held, set vertical speed to $58
doLowJump:
	LDA btnHeld
	AND #BTN_DOWN
	BEQ executeJump
	LDY #$28 ; If down is held, set vertical speed to $28
executeJump:
	STY playerYSpd ; Store the jump height
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Set vertical movement upwards
	LDA #$04
	STA playerAction ; Trigger jumping animation/action
	LDA #SFX_JUMP
	STA sndSfx ; Play the jump sound
	RTS
spinJumpRoutine:
	LDA playerYoshiState
	BEQ spinJumpDone ; Make sure the player isn't riding Yoshi
	LDA btnPressed
	AND #BTN_A
	BEQ spinJumpDone ; Make sure A is held
	LDA btnHeld
	AND #BTN_UP
	BEQ spinJumpDone ; Make sure up is held
executeSpinJump:
	JSR dismountYoshiRoutine
	LDA #$50
	STA playerYSpd ; Set vertical speed to $50
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Set vertical movement upwards
	LDA #$05
	STA playerAction ; Trigger spinning action
	LDA #SFX_SPINJUMP
	STA sndSfx ; Play the spin sound
spinJumpDone:
	RTS
dismountYoshiRoutine:
	LDA playerYoshiState ; if player isn't riding yoshi,
	BEQ dismountYoshiRtDone ; stop
	LDA playerMoveFlags
	STA yoshiIdleMovement
	LDA playerYoshiState
	STA yoshiIdleStorage ; backup whatever yoshi had in his mouth
	LDA #$00
	STA playerYoshiState ; get off yoshi
	STA yoshiExitStatus
	JSR sub4_A14A
	LDA #$04
	STA yoshiUnmountedState
	LDA playerYLoDup ; get player y position
	SEC
	SBC #$20 ; subtract it by $20
	STA yoshiYLo ; store result as yoshi's y position
	LDA playerYHiDup
	SBC #$00 ; subtract player y screen by nothing (why?)
	STA yoshiYHi ; store result as yoshi's y screen
	LDA yoshiIdleMovement
	AND #$40 ; if yoshi is facing left,
	BNE bra4_B4D2 ; branch
	LDA playerMoveFlags
	ORA #$01
	STA playerMoveFlags
	LDA playerXLoDup ; get player x position
	SEC
	SBC #$08 ; subtract it by 8
	STA yoshiXLo ; store result as yoshi's x position
	JMP loc4_B4E0
bra4_B4D2:
	LDA playerMoveFlags
	AND #$FE
	STA playerMoveFlags
	LDA playerXLoDup
	SEC
	SBC #$18
	STA yoshiXLo
loc4_B4E0:
	LDA playerXHiDup ; Get player X screen
	SBC #$00 ; subtract carry if present
	STA yoshiXHi ; Set as Yoshi's X screen
	LDA #$00
	STA $05F6
	LDA #$30
	STA playerXSpd
	INC objCount
dismountYoshiRtDone:
	RTS
leapRoutine:
	LDA playerAnimFrame
	CMP #$10 ; if animation frame is lower than 10,
	BCC leapingDone ; branch
	LDA btnPressed ; 
	AND #BTN_A ; if A not pressed,
	BEQ leapingDone ; branch
	LDA #$60 ; 
	STA playerYSpd ; set y speed to $60
	LDA #$09 ; 
	STA playerAction ; set action to leap
leapingDone:
	RTS
playerRunRoutine:
	LDA levelWaterFlag
	BNE bra4_B55B_RTS ; Make sure the player isn't underwater
	LDA btnHeld
	AND #$03
	BEQ bra4_B55C ; Make sure either left or right are held. If they aren't, skip ahead.
	LDA btnHeld ; Otherwise, continue
	AND #BTN_B
	BNE setupPlayerRun ; Switch to running if B is held
	STA $0314 ; Likely an unused or residual opcode. Does nothing.
	LDA playerXSpd
	CMP #$10
	BCS playerWalk2Done ; Limit the player's X speed to #$10, or 16 decimal
	LDA playerXSpd
	CLC
	ADC #$04
	STA playerXSpd ; Increment the player's X speed by 4
playerWalk2Done:
	RTS
unused_func1:
	LDA $0314 ; unlogged
	CMP #$30 ; unlogged
	BCS setupPlayerRun ; unlogged
	INC $0314 ; unlogged
	RTS ; unlogged
setupPlayerRun:
	LDA playerMoveFlags ; Load the player's movement info
	AND #$01 ; Test the horizontal movement bit
	CMP $4F ; Compare with the previous direction
	BEQ doPlayerRun ; If the player stays in the same direction, have them run like normal
	STA $4F ; Otherwise, make the player turn around
	LDA #$10
	STA playerXSpd ; Set their horizontal speed to #$10
	LDA #$00
	STA playerAction ; Reset their action to standing still
doPlayerRun:
	LDA #$02
	STA playerAction ; Set action to running
	LDA playerXSpd
	CMP #$40
	BCS bra4_B55B_RTS ; Set running speed cap at #$40, or 64 decimal
	LDA playerXSpd
	CLC
	ADC #$04
	STA playerXSpd ; Accelerate the player's speed by 4 until the cap is reached
bra4_B55B_RTS:
	RTS
bra4_B55C:
	LDA playerXSpd
	BEQ bra4_B55B_RTS ; Make sure the player is moving horizontally
	LDA #$01
	STA playerAction ; Set action to walking
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; END OF WALKING AND RUNNING
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
lookUpDuckRoutine:
	LDA btnHeld
	AND #BTN_DOWN
	BEQ doLookUp ; If down isn't held, move to the next check
	LDA #$07
	STA playerAction ; Otherwise, set the player's action to ducking
doLookUp:
	LDA btnHeld
	AND #BTN_UP
	BEQ lookupDuckDone ; Make sure up is held
	LDA #$08
	STA playerAction ; Set the player's action to looking up
lookupDuckDone:
	RTS
ofs_B57C:
	JSR spinCapeRoutine
	LDA playerAction+1
	ASL
	TAY ; Get the pointer for player's action value
	LDA tbl4_B590,Y
	STA $32 ; Load lower byte of pointer
	LDA tbl4_B590+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer
tbl4_B590:
	.word pActIdle
	.word pActWalk
	.word pActRun
	.word pActWalk
	.word pActJump
	.word pActJump
	.word pActIdle
	.word pActIdle
	.word pActIdle
	.word pSpeedTimer
	.word pActJump
	.word PActSwim
	.word PActSwim
	.word pActRun
	.word pActJump
	.word pnt_B5DC
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
; P SPEED ROUTINE
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
pSpeedTimer:
	INC flightTakeoffTimer ; Increment takeoff timer
	LDA flightTakeoffTimer
	CMP #$50
	BCC bra4_B5C4 ; Branch if less than 80 frames have passed
	LDA #$00
	STA flightTakeoffTimer ; Clear takeoff timer
	LDA #$0F
	STA playerAction ; Set action to flying
	RTS
bra4_B5C4: ; if P speed timer not reached
	LDA playerYSpd
	BNE bra4_B5D2 ; Branch if Y speed isn't empty
	LDA playerMoveFlags
	AND #$04
	BNE bra4_B5D2 ; Branch if moving upwards
	LDA #$01
	STA playerAction ; Set action to walking
bra4_B5D2:
	JSR swimMove
	JSR sub4_B616
	JSR sub4_B669
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=	
; END OF P SPEED ROUTINE
;--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=		
pnt_B5DC:
	LDA playerYoshiState
	BEQ bra4_B5E7
	JSR swimMove
	JMP loc4_B5EA
bra4_B5E7:
	JSR sub4_B61B
loc4_B5EA:
	JSR sub4_B616
	LDA playerMoveFlags
	AND #$04
	BNE bra4_B5FB_RTS
	LDA playerYSpd
	BNE bra4_B5FB_RTS
	LDA #$01
	STA playerAction ; Set player action to walking
bra4_B5FB_RTS:
	RTS
	
spinCapeRoutine:
	LDA playerYoshiState
	BNE spinCapeDone ; Make sure the player isn't riding Yoshi
	LDA playerHoldFlag
	BNE spinCapeDone ; Make sure the player isn't carrying anything
	LDA btnPressed
	AND #BTN_B
	BEQ spinCapeDone ; Make sure B is pressed
	LDA #$08
	STA playerState ; Set player state
	LDA #SFX_SPINJUMP
	STA sndSfx ; Play spin sound
spinCapeDone:
	RTS
sub4_B616:
	LDA #$30
	STA playerXSpd
	RTS
sub4_B61B:
	LDA btnHeld ; 
	AND #BTN_B ; if b still held,
	BNE bra4_B627 ; branch
	LDA #$0A ; 
	STA playerAction ; set action to falling
	RTS
bra4_B627:
	LDX #$00
	LDA playerMoveFlags
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
	LDA playerMoveFlags
	AND #$04
	BNE bra4_B653
	LDA btnPressed
	AND $32
	BEQ bra4_B653
	INC playerYSpd
	LDA #$50
	CMP playerYSpd
	BCS bra4_B668_RTS
	STA playerYSpd
	RTS
bra4_B653:
	LDA btnPressed
	AND $34
	BEQ bra4_B668_RTS
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags
	LDA #$50
	CMP playerYSpd
	BCS bra4_B668_RTS
	STA playerYSpd
bra4_B668_RTS:
	RTS
sub4_B669:
	LDA btnHeld ; 
	AND #BTN_B ; if B not held,
	BEQ bra4_B67B_RTS ; branch
	LDA btnHeld ; 
	AND #BTN_A ; if A not held,
	BEQ bra4_B67B_RTS ; branch
	LDA #$40 ; 
	STA playerYSpd ; set Y speed to $40
bra4_B67B_RTS:
	RTS
;-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
; Climbing 
;-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-	
ClimbingRoutines: ; This section locks the player in place if no directions are held (suspend player in mid air)
	LDA btnHeld
	AND #$0F
	BNE climbingActionList ; If a direction is held, branch
	LDA #$00 ; else
	STA playerYSpd
	STA playerXSpd ; Stop the player's movement
	LDA #$0D
	STA playerAction ; Make the player climb
; ************************************************************
climbingActionList:
	JSR climbJoyUpChk
	JSR PlayerClimbJump
	RTS
PlayerClimbJump: ; Jump from climbing
	LDA btnPressed
	AND #BTN_A
	BEQ playerClimbJumpRTS ; If A button not pressed, branch
	LDA btnHeld ; else
	AND #BTN_UP
	BNE playerClimbJumpRTS ; Make sure that up isn't being held
	LDA #$50
	STA playerYSpd ; Set Y speed to $50
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Set vertical movement to up
	LDA #$04
	STA playerAction ; Make the player jump
	LDA #SFX_JUMP
	STA sndSfx ; Play the jump sound
	LDA #$00
	STA playerState ; Make the player stop climbing
	STA $06DC ; Clear Unknown 1
	STA $06DD ; Clear Unknown 2
playerClimbJumpRTS:
	RTS
; ********************
climbJoyUpChk:
	LDA btnHeld
	AND #BTN_UP ; if up isn't held,
	BEQ climbJoyDownChk ; branch ahead to down Dpad check
; Else
	LDA $06DD; load Unknown 2
	BEQ bra4_B6D1 ; if Unknown2 empty, branch ahead
	LDA #$00 ; else
	STA playerYSpd; clear y speed
	BEQ climbJoyDownChk ; branch ahead, always
	
bra4_B6D1: ; unknown, mirroring related maybe?
	LDA playerMoveFlags
	ORA #$04 ; flip some bits
	BNE bra4_B6E7 ; If result non zero, branch
	
climbJoyDownChk:
	LDA btnHeld
	AND #BTN_DOWN ; if down isn't held,
	BEQ bra4_B6EF ; branch
	LDA #$00
	STA $06DD ; Clear Unknown 2
	LDA playerMoveFlags
	AND #$7B
	
bra4_B6E7: ; Move player Up/Down
	STA playerMoveFlags
	LDA #$10
	STA playerYSpd ; set Y speed to #$10
	BNE playerClimbDone
	
bra4_B6EF:
	LDA $06DE
	BNE climbJoyLeftChk
	LDA $06DC
	BEQ climbJoyLeftChk
	LDA #$00
	STA playerXSpd
	RTS
	
climbJoyLeftChk:
	LDA btnHeld ; 
	AND #BTN_LEFT ; if left isn't pressed,
	BEQ climbJoyRightChk ; branch to check right
	LDA playerMoveFlags
	ORA #$41
	BNE bra4_B716
	
climbJoyRightChk:
	LDA btnHeld ; 
	AND #BTN_RIGHT ; if right isn't pressed,
	BEQ bra4_B71E_RTS ; branch to RTS
	LDA playerMoveFlags
	AND #$BE
	
bra4_B716: ; Move player Left/Right
	STA playerMoveFlags  ; Store it
	LDA #$10
	STA playerXSpd ; set Player X speed to #$10
	BNE playerClimbDone
	
bra4_B71E_RTS:
	RTS
	
playerClimbDone:
	LDA #$0E
	STA playerAction
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-		
ofs_B724:
	JSR tongueSpeedBoost
	JSR TongueswimChk
	LDX #$0D
	LDY #$00
	LDA playerYSpd ; If player not moving
	BEQ bra4_B734 ; branch
	LDY #$0A
bra4_B734:
	LDA btnHeld
	AND #BTN_DOWN
	BEQ bra4_B73D
	LDY #$07
bra4_B73D:
	LDA #$0D
	STA $32
sub4_B741:
	STX playerAction
	LDA playerAnimFrame
	CMP $32
	BCC bra4_B769_RTS
	STY playerAction
	LDY #$01
	LDA playerYoshiState
	CMP #$01
	BNE bra4_B75C ; Branch if the player isn't riding Yoshi
	LDY yoshiTongueState
	LDA #$01
	STA yoshiTongueState
bra4_B75C:
	STY playerYoshiState
	JSR sub4_A14A
	LDA #$00
	STA playerState
	STA $062E
bra4_B769_RTS:
	RTS
ofs_B76A:
	JSR tongueSpeedBoost
	JSR TongueswimChk
	LDX #$0E
	LDY #$00
	LDA playerYSpd
	BEQ bra4_B77A
	LDY #$0A
bra4_B77A:
	LDA #$0D
	STA $32
	JSR sub4_B741
	RTS
ofs_B782:
	JSR tongueSpeedBoost
	JSR TongueswimChk
	LDX #$06
	LDY #$07
	LDA #$0D
	STA $32
	JSR sub4_B741
	RTS
ofs_B794:
	JSR tongueSpeedBoost
	JSR TongueswimChk
	LDX #$0D
	LDY #$00
	LDA btnHeld
	AND #BTN_DOWN
	BEQ bra4_B7A7
	LDY #$07
bra4_B7A7:
	LDA playerYSpd
	BEQ bra4_B7AD
	LDY #$0A
bra4_B7AD:
	LDA #$03
	STA $32
	JSR sub4_B741
	RTS
ofs_B7B5:
	JSR tongueSpeedBoost
	JSR TongueswimChk
	LDX #$0E
	LDY #$00
	LDA playerYSpd
	BEQ bra4_B7C5
	LDY #$0A
bra4_B7C5:
	LDA #$04
	STA $32
	JSR sub4_B741
	RTS
ofs_B7CD:
	JSR tongueSpeedBoost
	JSR TongueswimChk
	LDX #$06
	LDY #$07
	LDA #$01
	STA $32
	JSR sub4_B741
	RTS
ofs_B7DF:
	JSR swimMove
	JSR TongueswimChk
	LDX #$0D
	LDY #$00
	LDA playerYSpd
	BEQ bra4_B7EF
	LDY #$0A
bra4_B7EF:
	LDA #$03
	STA $32
	JSR sub4_B741
	RTS
ofs_B7F7:
	JSR swimMove
	JSR TongueswimChk
	LDX #$0E
	LDY #$00
	LDA playerYSpd
	BEQ bra4_B807
	LDY #$0A
bra4_B807:
	LDA #$07
	STA $32
	JSR sub4_B741
	RTS
ofs_B80F:
	JSR swimMove
	JSR TongueswimChk
	LDX #$06
	LDY #$07
	LDA #$03
	STA $32
	JSR sub4_B741
	RTS
ofs_B821:
	JSR swimMove
	JSR TongueswimChk
	LDX #$00
	LDA btnHeld
	AND #$03
	BEQ bra4_B835 ; Branch if left/right aren't held
	LDA playerYSpd
	BNE bra4_B835
	INX
bra4_B835:
	STX playerAction
	LDX #$00
	LDY #$40
	JSR sub4_B8C0
	LDA #$06
	STA playerYoshiState ; Make Yoshi swallow
	JSR sub4_A14A
	LDA #SFX_YOSHISWALLOW
	STA sndSfx ; Play swallow sound
	RTS
tongueSpeedBoost:
	LDA btnHeld
	AND #BTN_RIGHT ; Make sure right is held
	BEQ bra4_B859
	LDA playerMoveFlags
	AND #$FE ; Make the player face right
	JMP loc4_B864
bra4_B859:
	LDA btnHeld
	AND #BTN_LEFT ; Make sure left is held
	BEQ tongueSpdBoostDone
	LDA playerMoveFlags
	ORA #$01 ; Set movement leftwards
loc4_B864:
	STA playerMoveFlags
	LDA playerXSpd
	CMP #$10 ; caps speed for when Yoshi sticks his tongue out
	BCS tongueSpdBoostDone ; Branch if x speed goes over 16 (this is basically a speed cap)
	LDA playerXSpd
	CLC
	ADC #$04
	STA playerXSpd
tongueSpdBoostDone:
	RTS
TongueswimChk:
	LDA btnPressed
	AND #BTN_A
	BEQ TongueswimChkDone ; Make sure the A button is pressed
	LDA levelWaterFlag
	BEQ bra4_B886 ; Branch if not underwater
	LDX #SFX_SWIM ; Load swim sound in x reg
	LDY #$20
	BNE bra4_B897 ; Branch
bra4_B886:	
	LDX #SFX_JUMP ; Load jump sound into X reg
	LDA playerYSpd
	BNE TongueswimChkDone ; Make sure the player has vertical speed
	LDY #$60
	LDA btnHeld	
	AND #BTN_DOWN
	BEQ bra4_B897 ; Branch if down isn't held
	LDY #$30
bra4_B897:
	STY playerYSpd
	STX sndSfx ; Play whatever sound was loaded into the X reg
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Set movement to jumping/swimming
TongueswimChkDone:
	RTS
actionTimerRoutine:
	INC playerActionFrameCount ; Increase action timer
	CPY playerActionFrameCount
	BCS bra4_B8B7 ; Wait until the set tick length (in frames) is reached
	LDA #$00
	STA playerActionFrameCount ; Clear timer
	INC playerActionTicks ; Increase by one tick
	CPX playerActionTicks
	BCC bra4_B8BA ; Branch when the set tick number is reached
bra4_B8B7:
	PLA
	PLA
	RTS
bra4_B8BA:
	LDA #$00
	STA playerActionTicks
	RTS
sub4_B8C0:
	INC swallowFrameCount
	CPY swallowFrameCount
	BCS bra4_B8D5
	LDA #$00
	STA swallowFrameCount
	INC yoshiSwallowTimer
	CPX yoshiSwallowTimer
	BCC bra4_B8D8
bra4_B8D5:
	PLA
	PLA
	RTS
bra4_B8D8:
	LDA #$00
	STA yoshiSwallowTimer
	RTS
ofs_B8DE:
	LDA playerYSpd
	BNE bra4_B90B_RTS
	LDA #$07
	STA playerState
	LDX $A4
	DEX
	LDA yoshiIdleMovement
	STA playerMoveFlags
	LDA yoshiIdleStorage
	STA playerYoshiState
	LDA #$01
	STA yoshiExitStatus
	LDA #$07
	STA playerAction ; set to ducking
	JSR sub4_A14A
	LDX #$00
	LDY #$14
	JSR actionTimerRoutine ; Wait one 20 frame tick
	LDA #$00
	STA playerState
bra4_B90B_RTS:
	RTS
ofs_B90C:
	JSR swimMove
	JSR unknownrout1
	LDA #$05
	STA playerAction ; set player action to spinning
	LDX #$00
	LDY #$14
	JSR actionTimerRoutine ; Wait one 20 frame tick
	LDA #$00
	STA playerState
	RTS
unknownrout1:
		LDA playerYSpd ; if player's y speed isn't empty,
		BNE rout1done ; stop
		LDA btnPressed ; 
		AND #BTN_A ; make sure A is pressed
		BEQ rout1done ; 
		LDA #$60 ; 
		STA playerYSpd ; set y speed to 60 (hex)
		LDA playerMoveFlags ; 
		ORA #$04 ; set movement to jumping
		STA playerMoveFlags ; 
rout1done:		RTS

;--------------------------------------------------------------------------------
; SPEED SCALING AND SPRITE ALIGNMENT 
;--------------------------------------------------------------------------------

; Determine if player is walking or running 
sub4_B938:
	LDA playerXSpd	
	CMP #16
	BCS getPlayerTrueXSpd
	; If player's speed is under 16:
		LDA frameCount
		AND #$01
		JMP loc4_B94F ; skip ahead to walking section

	; This is used when the player is moving faster than #$10, reads from a running speed table
	getPlayerTrueXSpd:
		ROR
		ROR
		ROR
		ROR
		AND #%00001111
		TAY
		LDA playerXSpdVecs,Y ; Get horizontal vector based on the player's current speed

; Decide if player should start walking
loc4_B94F:
	STA playerXMoveVec
	LDA playerXSpd
	CMP #3
	BCS bra4_B95B
	; Don't move horizontally at all if speed is under 3
		LDA #0
		STA playerXMoveVec
	
bra4_B95B:
	LDA playerXMoveVec
	BNE @playerApplyXVec ; Only apply horizontal vector if needed
		LDA playerXHi
		STA playerXHiDup
		LDA playerXLo
		STA playerXLoDup ; Don't change position
		JMP loc4_B993 ; skip ahead to Y speed section

; ***************************************************************
; Ok, so this next part is for if the player is moving
; It handles left and right movements as well as screen positions 
; It converts the speed to a vector
; If the player positioning sum creates a carry that is used to update the screen ID
; ***************************************************************

	@playerApplyXVec:
		LDA playerMoveFlags
		AND #%00000001
		BEQ MovePlayerRight ; Move right if player is facing right
		; If player is moving left	
			LDA playerXLo
			SEC
			SBC playerXMoveVec
			STA playerXLoDup
			LDA playerXHi
			SBC #0
			STA playerXHiDup ; Subtract scaled speed from X position
			JMP loc4_B993 ; Skip ahead
		
		MovePlayerRight:
			LDA playerSprX
			CMP #$F0
			BCS loc4_B993 ; Stop the player from wrapping around the right side of the screen
			; Move player right
				LDA playerXLo
				CLC
				ADC playerXMoveVec
				STA playerXLoDup
				LDA playerXHi
				ADC #0
				STA playerXHiDup ; Add scaled speed to X position

; Vectorize Y speed
loc4_B993:
	LDA playerYSpd
	LSR			
	LSR			
	LSR			
	LSR
	TAX
	LDA playerYSpdVecs,X
	STA playerYMoveVec ; Get vertical vector

	LDA playerYSpd
	CMP #4
	BCS bra4_B9A9
	; Don't move vertically at all if speed is under 4
		LDA #$00 
		STA playerYMoveVec
	
bra4_B9A9:
	LDA playerYMoveVec
	BNE @playerApplyYVec ; If player isn't static, branch ahead
	; Only apply vertical vector if needed
		LDA playerYHi 
		STA playerYHiDup
		LDA playerYLo
		STA playerYLoDup ; Don't change position
		JMP loc4_BA24 ; Skip ahead

; Apply vertical vector
@playerApplyYVec:
	LDA playerMoveFlags		
	AND #%00000100
	BEQ cliffDeathCheck ; Only check for death if the player is moving down

	; If player is moving up
	LDA playerSprY
	CMP #$08
	BCC cliffDeathCheck ; Stop the player from wrapping around the top of the screen
		LDA playerYLo
		SEC
		SBC playerYMoveVec
		STA playerYLoDup
		LDA playerYHi
		SBC #0
		STA playerYHiDup ; Apply vertical vector to position

		; Skip past position #$F0 (why?)
		LDA playerYLoDup
		CMP #$F0
		BCC bra4_B9DC
			SEC
			SBC #16
			STA playerYLoDup

		bra4_B9DC:
			JMP loc4_BA24

; Check if is dying in a pit before vectorizing their vertical speed	
cliffDeathCheck:
	LDA playerSprY		
	CMP #$E0
	BCC MovePlayerDown ; Kill player if they're below the death barrier

	; Otherwise, kill the player
		LDA #MUS_DEATH	
		STA sndMusic ; Play death music
		LDA #0		
		STA playerPowerup ; Remove any powerups
		STA playerYoshiState ; Remove yoshi
		LDA levelNumber	
		CMP #3
		BEQ playerKill
			LDA #$00
			STA yoshiExitStatus ; Only remove Yoshi outside of castles

	playerKill:
		LDA #GAMESTATE_DEATH		
		STA gameState ; Update game state
		LDA #$02
		STA gameSubstate ; Skip initial states of death, as player is off-screen
		LDA #PACT_DUCK
		STA playerAction ; Make player duck
		RTS

	; If player isn't past the death barrier, apply the vector as normal
	MovePlayerDown:
		LDA playerYLo
		CLC
		ADC playerYMoveVec
		STA playerYLoDup
		LDA playerYHi
		ADC #0
		STA playerYHiDup ; Add vector to player's vertical position

	; Skip past position #$F0 (why?)
		LDA playerYLoDup
		CMP #$F0
		BCC loc4_BA24
			CLC
			ADC #$10
			STA playerYLoDup
			INC playerYHiDup ; increment the new Y screen

; ***************************************************************
; Check event	
; ***************************************************************

loc4_BA24:
	LDA playerSprY
	CMP #$D0
	BCS bra4_BA42 ; if exceed this, branch to X positioning
	LDA gameState
	CMP #$04 ; death 
	BEQ bra4_BA42 ; if player dying, branch to X positioning 
	CMP #$0B ; going down pipe
	BEQ bra4_BA42 ; else if going down pipe, branch to X positioning
	CMP #$0D ; (event range: 0C: walk out pipe, 0D: enter level from pipe)
	BCC bra4_BA3C ; else if event > 0B but < than or == to #$0D, skip last event check, go to JSRs 
	CMP #$15 ; (event range: a whole bunch of pipe related things)
	BCC bra4_BA42 ; else if event > #$0D but < or == to #$15, branch to X Positioning
bra4_BA3C: ; if event > #$15, jump to these routines 
	JSR sub4_BAF1
	JSR sub4_BC50

; ***************************************************************
; Player Sprite Positioning?
; ***************************************************************	
bra4_BA42:
	LDA playerXLoDup
	SEC
	SBC playerXLo ; Subtract previous X position from new X position
	STA playerMetaspriteHAlign ; store result
; 
	LDA playerXHiDup
	SBC playerXHi ; subtract previous screen value from current screen value 
	BPL bra4_BA6A ; if result positive, branch (moved forward one screen)
; else player moved back a screen
	LDA playerMetaspriteHAlign ; get result of positioning sum
	EOR #$FF ; Flip all the bits 
	SEC ; set carry
	ADC #$00 ; add the carry
	CMP #$07
	BCC bra4_BA67 ; if result < #$07, branch to jump (go to Y positioning)
; if it's > 7
	LDA playerXLo 
	SEC
	SBC #$07 ; subtract #$07 from previous X position
	STA playerXLoDup ; set it as new X position
; move between X screens if necessary (left)
	LDA playerXHi
	SBC #$00 ; subtract carry if present  
	STA playerXHiDup ; Set as new X screen
bra4_BA67:
	JMP loc4_BA7D ; go to Y positioning 
; ***************************************************************	
bra4_BA6A: ; Go here if X screen sum result postive
	LDA playerMetaspriteHAlign ; get result of positoning sum
	CMP #$07 ; If < 7
	BCC bra4_BA7D ; branch to Y positioning 
; if it's > 7
	LDA playerXLo
	CLC
	ADC #$07 ; Add #$07 to previous X position
	STA playerXLoDup ; set it as new X position
; Move between X screens if necessary (right)
	LDA playerXHi
	ADC #$00 ; add carry if present 
	STA playerXHiDup ; set as new X screen
; ***************************************************************	
bra4_BA7D: ; Y positioning
loc4_BA7D:
	LDA playerYLoDup
	SEC
	SBC playerYLo ; subtract old Y position from new Y position
	STA playerMetaspriteHAlign ; Store result 
; check if screen is positive
	LDA playerYHiDup
	SBC playerYHi ; subtract old Y screen from new Y screen
	BPL bra4_BAB0 ; if result positive, branch ahead (moved down one screen)
; else player moved up a screen
	LDA playerMetaspriteHAlign ; get result of positioning sum
	EOR #$FF ; flip all bits
	SEC ; set carry
	ADC #$00 ; apply carry
	CMP #$07
	BCC bra4_BAAD ; if result less than #$07, branch to jump (go to RTS)
; else, Subtract a value from Y position
	LDA playerYLo
	SEC
	SBC #$07 ; subtract #$07 from old Y position
	STA playerYLoDup ; set it as new Y position 
; Move player between Y screens if necessary (upwards)
	LDA playerYHi
	SBC #$00 ; subtract carry if present 
	STA playerYHiDup ; store result as new Y screen
; 
	LDA playerYLoDup
	CMP #$F0 ; If duplicate Y position less than #$F0 (pit)
	BCC bra4_BAAD ; branch to RTS
; if greater than #$F0 (in pit)	
	SEC
	SBC #$10 ; subtract #$10 from duplicate Y position
	STA playerYLoDup ; update new position
bra4_BAAD:
	JMP loc4_BAD0_RTS ; go to RTS
; ***************************************************************
bra4_BAB0: ; Go here if Y screen sum result positive 
	LDA playerMetaspriteHAlign ; get result of positioning sum
	CMP #$07 ; If it's < #$07 
	BCC bra4_BAD0_RTS ; branch to RTS
; Else > #$07
	LDA playerYLo
	CLC
	ADC #$07 ; Add #$07 to old Y position
	STA playerYLoDup ; set it as new Y position
; move between vertical screens if necessary (downwards)
	LDA playerYHi
	ADC #$00 ; add carry if present 
	STA playerYHiDup ; store result as new Y screen
; 
	LDA playerYLoDup
	CMP #$F0 ; If new Y position less than #$F0 (pit)
	BCC bra4_BAD0_RTS ; end 
; else if player in pit
	CLC
	ADC #$10 
	STA playerYLoDup ; add #$10 to new Y position
; 
	INC playerYHiDup ; increment new Y screen
bra4_BAD0_RTS:
loc4_BAD0_RTS:
	RTS

; ***************************************************************
; Tables
; ***************************************************************
playerXSpdVecs: ; X speed table
; the higher the playerXSpd, the further through the table you can move
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

playerYSpdVecs:
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
; ***************************************************************
; Collision stuff 
; ***************************************************************	
sub4_BAF1:
	LDX playerAction
	LDA tbl4_BC2F,X ; Load the player's horizontal collision offset based on their current action
	CLC
	ADC playerXLoDup ; add collision offset to new X position
	STA playerCollXLo ; set as colision X postion
	LDA playerXHiDup ; get new X screen
	ADC #$00 ; if prior sum made a carry, apply it
	STA playerCollXHi ; store as collision X screen
	LDA playerYHiDup ; get new Y screen
	STA playerCollYHi ; set as collision Y screen
	LDA playerYLoDup ; get new Y position
	STA playerCollYLo ; Set the player's vertical collision position
loc4_BB09:
	LDA #$00
	STA $26 ; clear $26
	LDY playerCollYHi
	LDA levelVerticalScreenOffs,Y ; Get screen offset for the vertical hitbox screen
	CLC
	ADC playerCollXHi ; Add hitbox X screen to get total screen number (Y screen offset + X screen = total screen)
	TAY ; move result to Y
	LDA prgDataBank2
	STA M90_PRG0 ; Load tileset bank in
	LDA ($9F),Y ; load UNKNOWN offset by X collision offset
	STA $9E ; store loaded value
	LDA (levelScreenOrderPtr),Y
	STA playerScreenId ; Get the ID of the screen the player is on
	TAY ; Back up in Y register
	AND #%00011111
	ORA #%10000000 ; Clear lower 5 bits and add 80 to determine the address
	STA $33
	LDA #$00
	STA $32 ; Zero page high byte
	TYA ; Get screen ID the player is on
	AND #%00100000
	BNE bra4_BB3D ; Branch if bit 5 is set for the screen ID (this is seemingly unused)
	LDA prgDataBank1
	STA M90_PRG0
	JMP loc4_BB43
bra4_BB3D:
	LDA $04F4
	STA M90_PRG0 ; Likely an unused function
loc4_BB43:
	LDY playerCollXLo ; Get the horizontal hitbox position (will be reused soon)
	LDA playerCollYLo
	AND #%11110000 ; Get the vertical metatile number of the player's hitbox
	ORA upperNybbleShiftTable,Y ; Pack the horizontal and vertical metatile numbers into one byte, with the horizontal metatile being in the lower nybble and the vertical metatile in the upper nybble
	TAY
	LDA ($32),Y
	TAY
	LDA prgDataBank2
	STA M90_PRG0 ; Swap in tileset PRG bank
	LDA ($DA),Y ; Get current metatile's behavior
	STA playerBackColl
	LDA #$27
	STA M90_PRG3 ; Swap the collision bank into the 4th PRG slot
	JSR jmp_39_E000 ; Jump
	LDA #$3F
	STA M90_PRG3 ; Swap the IRQ bank back in
	LDA playerBackColl
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
	LDX playerAction
	LDA tbl4_BC2F,X
	ASL
	STA $25
	LDA playerCollXLo
	SEC
	SBC $25
	STA playerCollXLo
	LDA playerCollXHi
	SBC #$00
	STA playerCollXHi
loc4_BB95:
	LDA #$00
	STA $26
	LDY playerCollYHi
	LDA levelVerticalScreenOffs,Y
	CLC
	ADC playerCollXHi
	TAY
	LDA prgDataBank2
	STA M90_PRG0
	LDA ($9F),Y
	STA $9E
	LDA (levelScreenOrderPtr),Y
	STA playerScreenId
	TAY
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	TYA
	AND #$20
	BNE bra4_BBC9
	LDA prgDataBank1
	STA M90_PRG0
	JMP loc4_BBCF
bra4_BBC9:
	LDA $04F4 ; unlogged
	STA M90_PRG0 ; unlogged
loc4_BBCF:
	LDY playerCollXLo
	LDA playerCollYLo
	AND #$F0
	ORA upperNybbleShiftTable,Y
	TAY
	LDA ($32),Y
	TAY
	LDA prgDataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA playerBackColl
	LDA playerSprY
	CMP #$C8
	BCC bra4_BBF0
	LDA #$00
	STA playerBackColl
bra4_BBF0:
	LDA #$27
	STA M90_PRG3 ; Swap bank 39 into 4th PRG slot
	JSR jmp_39_E000 ; Jump
	LDA #$3F
	STA M90_PRG3 ; Swap the IRQ bank back in
	LDA playerBackColl
	CMP #$F8
	BNE bra4_BC09 ; Branch if the player isn't in front of a fence tile
	LDA $49
	ORA #$02 ; Set bit 1 of the player's climbing state??
	BNE bra4_BC0D ; Branch ahead (always)
bra4_BC09:
	LDA $49
	AND #$FD ; Clear bit 1 of the player's climbing state??
bra4_BC0D:
	STA $49
	LDA $26
	BEQ bra4_BC16
	JMP loc4_BB95
bra4_BC16: ; affects movement between horizontal screens
	LDX playerAction
	LDA playerCollXLo
	CLC
	ADC tbl4_BC2F,X
	STA playerXLoDup
	LDA playerCollXHi
	ADC #$00
	STA playerXHiDup
	LDA playerCollYLo
	STA playerYLoDup
	LDA playerCollYHi
	STA playerYHiDup
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
	LDA playerPowerup ; if player is small,
	BEQ bra4_BC59 ; branch
	LDY #$18
bra4_BC59:
	STY $2B
	LDX playerAction
	LDA tbl4_BC2F,X
	CLC
	ADC playerXLoDup
	STA playerCollXLo
	LDA playerXHiDup
	ADC #$00
	STA playerCollXHi
	LDA playerYLoDup
	SEC
	SBC playerMetaspriteVAlign
	STA playerCollYLo
	BCS bra4_BC7E
	SEC
	SBC #$10
	STA playerCollYLo
	LDY playerYHiDup
	DEY
	STY playerCollYHi
bra4_BC7E:
	LDA #$00
	STA $26
	LDY playerCollYHi ; Use the vertical screen of the player's collision as the index
	LDA levelVerticalScreenOffs,Y ; Determines what to offset the player's collision X screen number based on what vertical screen they're on. If they're on the top screen, offset it by #$12. If they're on the bottom, don't offset it.
	CLC
	ADC playerCollXHi ; Player X Screen + Offset = Absolute Screen
	TAY ; Set the ordered screen value as the index
	LDA prgDataBank2
	STA M90_PRG0 ; Move the second bank into the first bank slot ($8000-$9FFF)
	LDA ($9F),Y ; (This value is seemingly always zero anyways)
	STA $9E ; (This is stored but doesn't seem to be used anywhere)
	LDA (levelScreenOrderPtr),Y ; Find the screen the player is on from the screen order table
	STA playerScreenId ; Set the player's current screen ID
	TAY
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	TYA
	AND #$20
	BNE bra4_BCB2
	LDA prgDataBank1
	STA M90_PRG0
	JMP loc4_BCB8
bra4_BCB2:
	LDA $04F4
	STA M90_PRG0
loc4_BCB8:
	LDY playerCollXLo
	LDA playerCollYLo
	AND #$F0
	ORA upperNybbleShiftTable,Y
	TAY
	LDA ($32),Y
	TAY
	LDA prgDataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA playerBackColl
	JSR sub4_BE6D
	LDX playerAction
	LDA tbl4_BC2F,X
	ASL
	STA $25
	LDA playerCollXLo
	SEC
	SBC $25
	STA playerCollXLo
	LDA playerCollXHi
	SBC #$00
	STA playerCollXHi
	LDY playerCollYHi
	LDA levelVerticalScreenOffs,Y
	CLC
	ADC playerCollXHi
	TAY
	LDA prgDataBank2
	STA M90_PRG0
	LDA ($9F),Y
	STA $9E
	LDA (levelScreenOrderPtr),Y
	STA playerScreenId
	TAY
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	TYA
	AND #$20
	BNE bra4_BD17
	LDA prgDataBank1
	STA M90_PRG0 ; swap data bank into $8000
	JMP loc4_BD1D
bra4_BD17:
	LDA $04F4
	STA M90_PRG0
loc4_BD1D:
	LDY playerCollXLo
	LDA playerCollYLo
	AND #$F0
	ORA upperNybbleShiftTable,Y
	TAY
	LDA ($32),Y
	TAY
	LDA prgDataBank2 ; get 2nd data bank
	STA M90_PRG0 ; swap into to first prg bank ($8000)
	LDA ($DA),Y
	STA playerBackColl
	JSR sub4_BE6D
	JSR sub4_BE91
	LDX playerAction
	LDA playerCollXLo
	CLC
	ADC tbl4_BC2F,X
	STA playerXLoDup
	LDA playerCollXHi
	ADC #$00
	STA playerXHiDup
	LDY #$10
	LDA playerPowerup ; if player is small,
	BEQ bra4_BD53 ; branch
	LDY #$18
bra4_BD53:
	STY $2B
	LDA playerCollYLo
	CLC
	ADC playerMetaspriteVAlign
	STA playerYLoDup
	BCS bra4_BD62
	CMP #$F0
	BCC bra4_BD6C_RTS
bra4_BD62:
	CLC
	ADC #$10
	STA playerYLoDup
	LDY playerCollYHi
	INY
	STY playerYHiDup
bra4_BD6C_RTS:
	RTS
; Contains the high nybble shifted to the low nybble for every possible 8-bit value. This is technically faster than bit shifting right 4 times.
upperNybbleShiftTable:
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
	LDA playerBackColl
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
	STA M90_PRG3 ; Swap bank 39 into the 4th PRG slot ($E000-$FFFF)
	JSR jmp_39_E000
	LDA #$3F
	STA M90_PRG3 ; Swap bank 63 into the 4th PRG slot ($E000-$FFFF)
	RTS
sub4_BE91:
	LDA $06DE
	BNE bra4_BEAD_RTS
	LDA $06DC
	BNE bra4_BEAD_RTS
	LDA playerState
	CMP #$03
	BNE bra4_BEAE
	LDY #$00
	LDA playerBackColl
	CMP #$F8
	BEQ bra4_BEAA
	INY
bra4_BEAA:
	STY $06DD
bra4_BEAD_RTS:
	RTS
bra4_BEAE:
	LDA playerAction+1
	CMP #$08 ; if player not spinning cape,
	BNE bra4_BEAD_RTS ; stop
	LDA playerBackColl
	CMP #$F8
	BNE bra4_BEAD_RTS
	LDA #$00
	STA playerYSpd ; clear player's y speed
	STA playerXSpd ; clear player's x speed
	LDA #$03
	STA playerState ; set action to 'climbing'
	RTS
tbl4_BEC5: ; Vertical collision table for stage objects?? seems to affect collision with objects from below when jumping
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
loc4_BED5: ; Player bumped head on ceiling
	LDA playerMoveFlags ; 
	AND #$04 ; if player isn't moving up,
	BEQ bra4_BF06 ; branch
	LDA #$04
	EOR #$FF ; XOR #$04 by #$FF to get #$FB
	AND playerMoveFlags ; do AND operation
	STA playerMoveFlags ; store result (player stops moving up)
	LDA #$10 ; downward force
	STA playerYSpd ; set y speed to 16
	LDA playerState
	CMP #$03 ; if player is climbing,
	BEQ bra4_BEF1 ; branch
	LDA #SFX_THUD
	STA sndSfx ; play "thud" sound
bra4_BEF1: ; If player bumps head whilst climbing
	LDA playerCollYLo
	CLC
	ADC #$10
	AND #$F0
	STA playerCollYLo
	CMP #$F0
	BCC bra4_BF05_RTS
	CLC
	ADC #$10
	STA playerCollYLo
	INC playerCollYHi
bra4_BF05_RTS:
	RTS
bra4_BF06:
	LDA #$00
	STA playerXSpd ; Clear player X Speed
	LDA playerXLoDup
	SEC
	SBC playerCollXLo ; Subtract from duplicate X position
	LDA playerXHiDup
	SBC playerCollXHi ; Subtract value from duplicate X screen
	BMI bra4_BF25 ; if result negative, branch
	LDA playerCollXLo  ; otherwise get player X collision position
	CLC
	ADC #$10 ; add #$10
	AND #$F0 ; mask it
	STA playerCollXLo ; update player X collision position
	LDA playerCollXHi
	ADC #$00 ; apply carry if present 
	STA playerCollXHi ; update player X collision screen
	RTS
bra4_BF25:
	LDA playerCollXLo
	SEC
	SBC #$10
	ORA #$0F
	STA playerCollXLo
	LDA playerCollXHi
	SBC #$00
bra4_BF32:
	STA playerCollXHi
	RTS
	LDA ($32),Y ; everything below here is useless/leftover
	STA PPUDATA
	DEC playerMetaspriteVAlign
	BNE bra4_BF32
	JSR sub4_BF59
	JMP bra4_BF25+1
	STA playerMetaspriteVAlign
	JSR sub4_BF59
	LDA ($32),Y
bra4_BF4B:
	STA PPUDATA
	DEC playerMetaspriteVAlign
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
	STA objState,X
	LDA #$00
	STA objVar,X
	PLA
	PLA
	RTS
	JSR sub4_BF7A
	PLA
	PLA
	RTS
	LDA invincibilityTimer
	BEQ bra4_BF7A
	RTS
bra4_BF7A:
sub4_BF7A:
	LDX $A4
	LDA objSlot,X
	CMP #$48
	BCC bra4_BF87
	CMP #$4C
	BCC bra4_BF9B
bra4_BF87:
	LDA objXDistHi,X
	BMI bra4_BF93
	LDA objState,X
	ORA #$40
	BNE bra4_BF98
bra4_BF93:
	LDA objState,X
	AND #$BF
bra4_BF98:
	STA objState,X
bra4_BF9B:
	LDA #$00
	STA playerHoldFlag
	LDA playerYoshiState
	BEQ bra4_BFAD
	LDA #$01
	STA playerHurtFlag
	JMP loc4_BFC0
bra4_BFAD:
	LDA playerPowerup
	BEQ bra4_BFD2
	LDA #$00
	STA playerPowerup
	LDA #$01
	STA playerPowerupBuffer
	LDA #$07
	STA gameState
loc4_BFC0:
	LDA #$D0
	STA invincibilityTimer
	LDA #SFX_POWERDOWN
	STA sndSfx
	LDA objState,X
	AND #$E0
	STA objState,X
	RTS
bra4_BFD2:
	LDA #$04
	STA gameState
	LDA #$00
	STA gameSubstate
	STA playerState
	STA $06DC
	STA $06DD
	RTS ; unlogged code end
