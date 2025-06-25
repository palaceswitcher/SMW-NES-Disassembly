; Disassembled with BZK 6502 Disassembler
jmp_41_A000:
	LDA a:gameState ; Load event number
	ASL
	TAY ; Get pointer for it
	LDA tbl_A012,Y	
	STA $32 ; Load lower byte of pointer
	LDA tbl_A012+1,Y	
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer
tbl_A012:
	.word pnt5_A074 ; gameState 0
	.word pnt5_A0A2 ; gameState 1
	.word pnt5_A695 ; gameState 2
	.word pnt5_A706
	.word pnt5_A761
	.word pnt5_A7A6
	.word pnt5_A09E
	.word pnt5_A7D3
	.word pnt5_A7FF ; 08
	.word pnt5_A86F
	.word pnt5_A892
	.word pnt5_A8FE ; On map
	.word pnt5_A924 ; 0c
	.word pnt5_A933 ; 0d
	.word pnt5_A9A7
	.word pnt5_A927 ; 0f
	.word pnt5_A933
	.word pnt5_AB1D
	.word pnt5_A927 ; 12
	.word pnt5_AC8D ; 13
	.word pnt5_A927 ; 14
	.word pnt5_AD29 ; 15
	.word pnt5_AD5C ; 16
	.word pnt5_AD7E ; 17
	.word pnt5_ADC5 ; 18
	.word pnt5_A927 ; 19
	.word pnt5_AE09 ; 1A
	.word pnt5_998A ; 1B
	.word pnt5_AEB9 ; 1C
	.word pnt5_AF13 ; 1D
	.word pnt5_AF13 ; 1E
	.word pnt5_AF14 ; 1F
	.word pnt5_A927 ; 20
	.word pnt5_AF1F ; 21
	.word pnt5_AF4C ; 22
	.word pnt5_A927 ; 23
	.word pnt5_AF93 ; 24
	.word pnt5_A7FF ; 25
	.word pnt5_A86F
	.word pnt5_A892
	.word pnt5_9B28
	.word pnt5_AFF3
	.word pnt5_B013
	.word pnt5_A927
	.word pnt5_AFAF
	.word pnt5_A927
	.word pnt5_B03E
	.word pnt5_A927
	.word pnt5_B062
pnt5_A074:
	LDA #$2A
	STA bank42Backup ; Backup bank value
	STA M90_PRG0 ; Swap the other game state 0 bank (bank 42) into the 1st PRG slot
	LDA #$00
	STA worldNumber
	STA levelNumber ; Clear world and level numbers
	LDA #$0F
	STA playerLives
	STA playerLives+1 ; Set life count to 15 for both players
	LDA #$01
	STA player1LevelsUnlocked
	STA player2LevelsUnlocked ; Only set the first level to be unlocked for both players
	LDA #$1E
	STA tileRowCount ; Set the 8x8 row count so that only the first nametable is updated
	LDA #$18
	STA bgAttrRowCount ; Only update the palette of the first nametable
	JSR sub_B75D
pnt5_A09E:
	iNC a:gameState ; Go to the next event
	RTS
pnt5_A0A2:
	JSR sub_AE96 ; Reset PPU settings
	LDA #$55
	STA $0100 ; Store #$55 in the first byte of the stack
	JSR sub_B800
	LDA #$00
	STA $3C ; (unknown variable)
	STA playerXSpd
	STA playerYSpd
	STA playerMoveFlags ; Reset player's speed and movement
	STA playerSprAttrs ; Clear various player variables
	LDA #$2A
	STA M90_PRG0 ; Swap the other game state 0 bank (bank 42) into the 1st PRG slot
	LDA #$00
	STA worldSelectNum ; Go to the first world on the world select screen
	JSR sub_AACB ; Load the title screen logo into VRAM
	LDA #$00
	JSR CHRBankSub
	JSR sub_AE8A
	LDA worldNumber
	ASL
	ASL ; Multiply world number by 4
	CLC
	ADC levelNumber ; Then add it to the level number to get the level ID
	STA bgCurPalette ; Use palette for corresponding level ID
	LDA #MUS_TITLE
	STA sndMusic ; Play title screen music
	LDA #$00
	STA fadeoutMode ; Set fadeout mode
	STA $0312
	STA bgCurPalette
	STA hudDisplay
	LDA #$0A
	STA interruptMode ; Set interrupt mode for the title screen
	STA logoFlag ; Enable the logo
	JSR sub_A107
	JSR sub_B068
	LDA #$00
	STA $52
	LDA #$EF
	STA logoYOffs ; Set Y offset for the logo
	iNC a:gameState ; Go to next event number
	RTS
sub_A107:
	LDX #$07
	LDA #$03
	JSR sub_42_8DF8
	LDX #$01
	LDA #$11
	JSR sub_42_8DF8
	LDX #$02
	LDA #$13
	JSR sub_42_8DF8
	LDA #$9E
	STA gs0SpriteY+1
	LDA #$60
	STA gs0SpriteX+1 ; Set player's starting position
	LDA #$00
	STA gs0SpriteFlags+1
	STA gs0SpriteFlags+2 ; Make the player and Yoshi's sprites visible
	CLC
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2 ; Set X offset for Yoshi's sprite
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2 ; Set Y offset for Yoshi's sprite
	RTS
	CLC ; Unused duplicate code
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2
	RTS
titleYoshiXOfs:
	.byte $02
titleYoshiYOfs:
	.byte $0B

tbl_A155:
	titlespr 256, 169, 7
	titlespr 400, 112, 13
	titlespr 560, 169, 7
	titlespr 672, 112, 13
	titlespr 816, 128, 13
	titlespr 1024, 169, 9
	titlespr 1200, 169, 9
	titlespr 1328, 80, 13
	titlespr 1472, 169, 7
	titlespr 1584, 88, 13
	titlespr 1632, 169, 7
	titlespr 2096, 128, 13
	titlespr 2288, 96, 13
	titlespr 2608, 96, 13
	titlespr 2656, 169, 13
	titlespr 2885, 169, 9
	titlespr 2944, 169, 9
	titlespr 3120, 128, 13
	titlespr 3200, 96, 13
	titlespr 3488, 96, 13
	titlespr 3552, 96, 13
	.byte $FF, $FF, $00, $00 ; End of data

tbl_A1AD:
	.byte $00, $01, $03, $00
	.byte $00, $70, $04, $00
	.byte $01, $40, $02, $01
	.byte $02, $30, $05, $01
	.byte $02, $A0, $06, $0E
	.byte $03, $A0, $01, $01
	.byte $04, $2E, $07, $01
	.byte $04, $F0, $05, $01
	.byte $05, $B0, $06, $0E
	.byte $05, $EE, $07, $01
	.byte $06, $70, $01, $01
	.byte $06, $A0, $01, $01
	.byte $FF, $FF, $02, $00 ; End of data

;----------------------------------------
; SUBROUTINE ($A1E1)
;----------------------------------------
sub_A1E1:
	LDA $0360
	ASL
	ASL
	TAX ; 4 bytes per sprite position (mult index by 4)
	LDA tbl_A155,X
	STA $25
	LDA tbl_A155+1,X
	STA $26 ; Get X position
	LDA tbl_A155+2,X
	STA $27 ; Get sprite frame
	LDA tbl_A155+3,X
	STA $28
	LDA playerXHiDup ; Get Y position
	CMP $25
	BNE bra_A22E_RTS
	LDA playerXLoDup
	CMP $26
	BNE bra_A22E_RTS ; Stop if the X position matches the player's
	LDX #$03 ; Set GS0 sprite slot to 4
bra_A209:
	LDA gs0SpriteFrame,X
	BEQ bra_A214 ; Branch if the frame slot is empty
	INX ; Go to next slot
	CPX #$06
	BCC bra_A209 ; Keep checking slots until an enemy frame ID is found
	BCS bra_A22B ; Branch once it is found
bra_A214:
	STX gs0SpriteCount
	LDA $27
	JSR sub_42_8DF8
	LDX gs0SpriteCount
	LDA $28
	STA gs0SpriteY,X
	LDA #$01
	STA gs0SpriteFlags,X
	LDA #$40
	STA gs0SpriteX,X
bra_A22B:
	INC $0360
bra_A22E_RTS:
	RTS

;----------------------------------------
; SUBROUTINE ($A22F)
;----------------------------------------
sub_A22F:
	LDA $0361
	ASL
	ASL
	TAX ; Get index for current action
	LDA tbl_A1AD,X
	STA $25
	LDA tbl_A1AD+1,X
	STA $26
	LDA tbl_A1AD+2,X
	STA $27
	LDA tbl_A1AD+3,X
	STA $28 ; Copy action data to memory
	LDA playerXHiDup
	CMP $25
	BNE @stop
	LDA playerXLoDup
	CMP $26
	BNE @stop ; Don't change action until player reaches the X position
	LDA $27
	STA titleDemoAction
	LDA $28
	STA titleJumpTimer ; Load wait time before jumping
	INC $0361
@stop:
	RTS

sub_A263:
	LDA titleDemoAction
	ASL
	TAY ; Get pointer for current jump type
	LDA tbl_A275,Y
	STA $32 ; Load lower byte of pointer
	LDA tbl_A275+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer
tbl_A275:
	.word sub_A2AE
	.word ptr2_A2D8
	.word ptr2_A43B
	.word ptr2_A569
	.word ptr2_A28D
	.word ptr2_A3CE
	.word ptr2_A368
	.word ptr2_A480
	.word ptr2_A480
	.word ptr2_A480
	.word ptr2_A480
	.word ptr2_A480
ptr2_A28D:
	JSR sub_A2AE
	LDA gs0SpriteX+1
	CMP #$B0
	BCS bra_A2AD_RTS ; If Mario's sprite hasn't reached the middle of the screen, continue
	LDX #$01 ; Set X index for Mario's sprite
	JSR sub2_96F6 ; Jump
	CLC
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2 ; Set the horizontal offset for Yoshi
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2 ; Set the horizontal offset for Mario
bra_A2AD_RTS:
	RTS
sub_A2AE:
	LDA frameCount
	AND #$07 ; Mask out 3 LSB of global frame counter
	BNE bra_A2C8_RTS ; Branch if not zero to do this every 8th frame
	INC titleWalkTimer ; Increment walk timer
	LDA titleWalkTimer
	AND #$01
	BEQ bra_A2C9 ; Branch if the walk timer is an even number
	LDA titleMarioWalk1 ; If it's an odd number, continue
	STA gs0SpriteFrame+1 ; Switch Mario to the 1st walk sprite
	LDA titleYoshiWalk1
	STA gs0SpriteFrame+2 ; Switch Yoshi to the 1st walk sprite
bra_A2C8_RTS:
	RTS
bra_A2C9:
	LDA titleMarioWalk2
	STA gs0SpriteFrame+1 ; Switch Mario to the 2nd walk sprite
	LDA titleYoshiWalk2
	STA gs0SpriteFrame+2 ; Switch Yoshi to the 2nd walk sprite
	RTS
titleMarioWalk1:
	.byte $11
titleMarioWalk2:
	.byte $12
titleYoshiWalk1:
	.byte $13
titleYoshiWalk2:
	.byte $14
ptr2_A2D8:
	LDA frameCount
	AND #$01
	BEQ bra_A313_RTS ; Only do this on an odd frame number
	LDA titleJumpTimer
	BEQ bra_A313_RTS ; Make sure the jump timer is set
	LDX titleJumpTimer ; Set the X index to the jump timer value
	LDA tbl_A31D,X ; Load vertical speed value for the jump timer's current value
	CMP #$80
	BEQ bra_A314 ; Branch when the end marker is reached ($80)
	CLC
	ADC gs0SpriteY+1
	STA gs0SpriteY+1 ; Add loaded speed value
	CLC
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2 ; Set horizontal offset for Yoshi
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2 ; Set vertical offset for Yoshi
	LDA tbl_A336,X ; Load Mario's sprite for the current jump timer value
	STA gs0SpriteFrame+1 ; Make Mario use it
	LDA tbl_A34F,X ; Load Yoshi's sprite for the current jump timer value
	STA gs0SpriteFrame+2 ; Make Yoshi use it
	INC titleJumpTimer ; Increment jump timer
bra_A313_RTS:
	RTS
bra_A314:
	LDA #$00
	STA titleJumpTimer ; Clear jump timer
	STA titleDemoAction ; Set demo action to walking
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
ptr2_A368:
	LDA frameCount
	AND #$01
	BEQ bra_A3C4_RTS ; Only continue if on an odd frame number
	LDA titleJumpTimer
	BEQ bra_A3C4_RTS ; Make sure the jump timer is still active
	LDX titleJumpTimer ; Set the X index to the jump timer value
	LDA tbl_A31D,X ; Load vertical speed value for the jump timer's current value
	CMP #$80
	BEQ bra_A3C5 ; Branch if the end marker is reached ($80)
	CLC
	ADC gs0SpriteY+1
	STA gs0SpriteY+1 ; Add loaded speed value
	CLC
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2 ; Set horizontal offset for Yoshi's sprite
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2 ; Set vertical offset for Yoshi's sprite
	LDA playerTitleY
	CMP #$9E
	BCC bra_A3B7 ; Branch if Mario's Y position is below $9E
	LDA #$9E
	STA playerTitleY ; Otherwise, set it to $9E
	CLC
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2 ; Set horizontal offset again?
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2 ; Set vertical offset again?
	JMP loc_A3C5
bra_A3B7:
	LDA tbl_A336,X
	STA gs0SpriteFrame+1 ; Load animation frame for Mario
	LDA tbl_A34F,X
	STA gs0SpriteFrame+2 ; Load animation frame for Yoshi
	INC titleJumpTimer ; Increment jump timer
bra_A3C4_RTS:
	RTS
bra_A3C5:
loc_A3C5:
	LDA #$00
	STA titleJumpTimer ; Clear jump timer
	STA titleDemoAction ; Set demo action to walking
	RTS
ptr2_A3CE:
	LDA frameCount
	AND #$01
	BEQ bra_A431_RTS ; Check if the global frame count is odd
	LDA titleJumpTimer
	BEQ bra_A431_RTS ; Make sure the jump timer is still active
	LDX titleJumpTimer ; Set the X index to the jump timer value
	LDA tbl_A31D,X ; Load vertical speed value for the jump timer's current value
	CMP #$80
	BEQ bra_A432 ; Branch when the end marker is reached ($80)
	CLC
	ADC gs0SpriteY+1
	STA gs0SpriteY+1 ; Add loaded speed value
	CLC
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2 ; Set horizontal offset for Yoshi
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2 ; Set vertical offset for Yoshi
	LDA titleJumpTimer
	CMP #$0C
	BCC bra_A424 ; Branch if the jump timer is under $0C
	LDA gs0SpriteY+1
	CMP #$7E
	BCC bra_A424 ; Branch if Mario's Y position is below $7E
	LDA #$7E
	STA gs0SpriteY+1 ; Otherwise, set it to $7E
	CLC
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2 ; Set horizontal offset again?
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2 ; Set vertical offset again?
	JMP loc_A432
bra_A424:
	LDA tbl_A336,X ; Load Mario's sprite for the current jump timer value
	STA gs0SpriteFrame+1 ; Make Mario use it
	LDA tbl_A34F,X ; Load Yoshi's sprite for the current jump timer value
	STA gs0SpriteFrame+2 ; Make Yoshi use it
	INC titleJumpTimer ; Increment jump timer
bra_A431_RTS:
	RTS
bra_A432:
loc_A432:
	LDA #$00
	STA titleJumpTimer ; Clear jump timer
	STA titleDemoAction ; Set demo action to walking
	RTS
ptr2_A43B:
	LDA frameCount
	AND #$01
	BEQ bra_A476_RTS ; Only continue if on an odd frame number
	LDA titleJumpTimer
	BEQ bra_A476_RTS ; Make sure the jump timer is active
	LDX titleJumpTimer ; Set the X index to the current jump timer value
	LDA tbl_A4FD,X ; Load vertical speed value for the jump timer's current value
	CMP #$80
	BEQ bra_A477 ; Branch when the end marker is reached ($80)
	CLC
	ADC gs0SpriteY+1
	STA gs0SpriteY+1 ; Add loaded speed value
	CLC
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2 ; Set Yoshi's horizontal offset
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2 ; Set Yoshi's vertical offset
	LDA tbl_A518,X ; Load Mario's sprite for the current jump timer value
	STA gs0SpriteFrame+1 ; Make Mario use it
	LDA tbl_A533,X ; Load Yoshi's sprite for the current jump timer value
	STA gs0SpriteFrame+2 ; Make Yoshi use it
	INC titleJumpTimer ; Increment jump timer
bra_A476_RTS:
	RTS
bra_A477:
	LDA #$00
	STA titleJumpTimer ; Clear jump timer
	STA titleDemoAction ; Set demo action to walking
	RTS
ptr2_A480:
	LDA frameCount
	AND #$01
	BEQ bra_A4C3_RTS ; Only continue if on an odd frame number
	LDA titleJumpTimer
	BEQ bra_A4C3_RTS ; Make sure the jump timer is active
	LDX titleJumpTimer ; Set the X index to the current jump timer value
	LDA tbl_A4FD,X ; Load vertical speed value for the jump timer's current value
	CMP #$80
	BEQ bra_A4C4 ; Branch if the end marker is reached ($80)
	CLC
	ADC gs0SpriteY+1
	STA gs0SpriteY+1 ; Add loaded speed value
	CLC
	LDA gs0SpriteX+1
	ADC titleYoshiXOfs
	STA gs0SpriteX+2 ; Set Yoshi's horizontal offset
	CLC
	LDA gs0SpriteY+1
	ADC titleYoshiYOfs
	STA gs0SpriteY+2 ; Set Yoshi's vertical offset
	LDA tbl_A518,X
	STA gs0SpriteFrame+1 ; Get sprite for Mario (based on jump timer)
	LDA tbl_A533,X
	STA gs0SpriteFrame+2 ; Get sprite for Yoshi (based on jump timer)
	LDA tbl_A54E,X
	STA gs0SpriteFrame ; Get sprite for "pop" effect (based on jump timer)
	JSR sub_A4E8
	INC titleJumpTimer ; Increment jump timer
bra_A4C3_RTS:
	RTS
bra_A4C4:
	LDX $0361
	LDA tbl_A4D7,X
	TAX
	LDA #$00
	STA titleJumpTimer
	STA titleDemoAction
	STA gs0SpriteFrame,X
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
	LDA gs0SpriteX+1
	ADC popEffectXOfs
	STA gs0SpriteX ; Set horizontal offset for the enemy "pop" effect
	CLC
	LDA gs0SpriteY+1
	ADC popEffectYOfs
	STA gs0SpriteY ; Set vertical offset for the "pop" effect
	RTS
popEffectXOfs:
	.byte $04
popEffectYOfs:
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
ptr2_A569:
	LDA #$11
	STA $B3
	LDA #$13
	STA $B4
	RTS
sub_A572:
	INC $0F
	BNE bra_A578
	INC playerXHiDup
bra_A578:
	LDX #$03
bra_A57A:
	LDA gs0SpriteFrame,X
	BEQ bra_A581
	JSR sub2_96DB
bra_A581:
	INX
	CPX #$07
	BCC bra_A57A
	RTS
	LDA btnPressed
	AND #$01
	BEQ bra_A5AB_RTS
	LDX #$02
	STX $30
	LDA $0362
	JSR sub_42_8DF8
	INC $0362
	LDX $30
	LDA #$80
	STA gs0SpriteY,X
	LDA #$00
	STA gs0SpriteFlags,X
	LDA #$C0
	STA gs0SpriteX,X
bra_A5AB_RTS:
	RTS
	
;----------------------------------------
; SUBROUTINE ($A5AC)
;----------------------------------------
sub_A5AC:
	LDX #$03
bra_A5AE:
	LDA gs0SpriteFrame,X
	BEQ bra_A5E1
	JSR sub_A5F9
	LDX $29
	CMP #$0D
	BEQ bra_A5C5
	CMP #$0E
	BEQ bra_A5C5
	LDA frameCount
	AND #$01
	BNE bra_A5DF
bra_A5C5:
	DEC gs0SpriteX,X
	LDA gs0SpriteX,X
	CMP #$FF
	BNE bra_A5D0
	DEC gs0SpriteFlags,X
bra_A5D0:
	LDA gs0SpriteFlags,X
	BNE bra_A5DF
	LDA gs0SpriteX,X
	CMP #$20
	BCS bra_A5DF
	LDA #$00
	STA gs0SpriteFrame,X
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
	LDA frameCount
	AND #$01
	BNE bra_A5F8_RTS
bra_A5F5:
	JSR sub2_96DB
bra_A5F8_RTS:
	RTS

;----------------------------------------
; SUBROUTINE ($A5F9)
;----------------------------------------
sub_A5F9:
	STA $28
	STX $29
	LDA $033B,X
	BEQ bra_A635_RTS
	ASL
	TAX
	LDA TitleSpriteAnimations,X
	STA gs0SpriteAnimPtr
	LDA TitleSpriteAnimations+1,X
	STA gs0SpriteAnimPtr+1
	LDY #$00
	LDA (gs0SpriteAnimPtr),Y
	STA $25
	INY
	LDA (gs0SpriteAnimPtr),Y
	STA $26
	INY
	INY
	LDA (gs0SpriteAnimPtr),Y
	STA $27
	LDA frameCount
	AND $27
	BNE bra_A635_RTS
	LDX $29
	INC $28
	LDA $28
	CMP $26
	BEQ bra_A636
	BCC bra_A636
	LDA $25
	STA gs0SpriteFrame,X
bra_A635_RTS:
	RTS
bra_A636:
	LDA $28
	STA gs0SpriteFrame,X
	RTS
	LDA btnPressed
	AND #$80
	BEQ bra_A64C_RTS
	LDA #$07
	STA $0365
	LDA #$01
	STA titleJumpTimer
bra_A64C_RTS:
	RTS

;----------------------------------------
; SUBROUTINE ($A64D)
;----------------------------------------
sub_A64D:
	LDA playerXHiDup
	BEQ bra_A677
	LDX #$07
	JSR sub2_96DB
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
	LDA frameCount
	AND #$03
	TAX
	LDA tbl_A691,X
	STA $035D
bra_A677:
	LDA frameCount
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

;----------------------------------------
; TITLE SCREEN CODE ($A695)
;----------------------------------------
pnt5_A695:
	JSR sub_A1E1
	JSR sub_A22F
	JSR sub_A64D
	JSR sub_A263
	JSR sub_A5AC
	JSR ClearOtherSprites
	LDA btnPressed
	AND #$F0
	BNE bra_A6D3
	JSR sub_A572
	LDA playerXHiDup
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
	sTA a:gameState
	RTS
bra_A6CF:
	JSR sub_B486
	RTS
bra_A6D3:
	JSR clearGS0Sprites
	JSR clearSprites
	LDX #$00
	LDA #$01
	JSR sub_42_8DF8
	LDX #$01
	LDA #$02
	JSR sub_42_8DF8
	JSR sub_A6EE
	iNC a:gameState
	RTS
sub_A6EE:
	LDA #$00
	JSR sub_42_99FA
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
pnt5_A706:
	JSR sub_42_99B2
	JSR ClearOtherSprites
	LDA btnPressed
	AND #$D0
	BEQ bra_A735
	LDA #$05
	STA $0312
	LDA #$0A
	STA sndSfx
	JSR sub_B068
	LDA #$00
	STA interruptMode
	STA $0361
	LDA #$00
	STA $52
	LDA #$2A
	STA $08
	LDA #$07
	sTA a:gameState
	RTS
bra_A735:
	LDA btnPressed
	AND #$08
	BEQ bra_A74B
	LDA #$80
	STA gs0SpriteY+1
	LDA #$00
	STA numPlayers
	LDA #SFX_BEEP
	STA sndSfx
	RTS
bra_A74B:
	LDA btnPressed
	AND #$04
	BEQ bra_A760_RTS
	LDA #$90
	STA gs0SpriteY+1
	LDA #$01
	STA numPlayers
	LDA #$05
	STA sndSfx
bra_A760_RTS:
	RTS
pnt5_A761:
	JSR sub_AE96
	LDA #$2A
	STA M90_PRG0
	LDA #$03
	STA worldSelectNum
	JSR sub_AACB
	LDA #$03
	JSR CHRBankSub
	JSR sub_AE8A
	JSR clearGS0Sprites
	JSR clearSprites
	LDA #$03
	STA bgCurPalette
	LDA #$00
	STA fadeoutMode
	STA $0312
	STA hudDisplay
	STA interruptMode
	STA logoFlag
	STA $02
	STA $03
	STA $0368
	STA $0369
	JSR sub_B068
	iNC a:gameState
	RTS
pnt5_A7A6:
	LDA btnHeld
	BNE bra_A7BB
	LDA frameCount
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
	sTA a:gameState
	STA playerXHiDup
	STA playerXLoDup
	STA $0360
	STA $0361
bra_A7D2_RTS:
	RTS
pnt5_A7D3:
	LDA #$2A
	STA $08
	NOP
	NOP
	INC gameState
	NOP
	NOP
	NOP
	RTS
tbl_A7DF:
	.byte $25 ; world select music settings
	.byte $25
	.byte $25
	.byte $25
	.byte $25 ; World 1
	.byte $24
	.byte $24
	.byte $24
	.byte $24
	.byte $24 ; World 2
	.byte $24
	.byte $24
	.byte $24
	.byte $24 ; World 3
	.byte $24
	.byte $24
	.byte $24
	.byte $24 ; World 4
	.byte $28
	.byte $28
	.byte $28
	.byte $28
	.byte $28 ; World 5
	.byte $27
	.byte $27
	.byte $27
	.byte $27 ; World 6
	.byte $27
	.byte $27
	.byte $26
	.byte $26 ; World 7
	.byte $00
pnt5_A7FF:
	LDX #$01
	LDA curPlayer
	BNE bra_A808
	LDX #$00
bra_A808:
	LDA levelId,X
	STA mapLevelId
	TAX
	LDA tbl_A7DF,X
	STA sndMusic
	LDA player1LevelsUnlocked,X
	CMP #$06
	BEQ bra_A825
	LDA player1LevelsUnlocked,X
	CMP #$14
	BEQ bra_A825
	JMP loc_A828
bra_A825:
	INC player1LevelsUnlocked,X
loc_A828:
	LDA player1LevelsUnlocked,X
	STA $039B
	JSR clearSprites
	JSR clearGS0Sprites
	LDA #$00
	STA worldNumber
	STA $0378
	STA mapMoveFlag
	STA $0360
	STA $0361
	LDA #$01
	STA levelNumber
	LDA #$38
	STA tileRowCount
	LDA #$30
	STA bgAttrRowCount
	LDX #$05
bra_A854:
	LDA tbl_A869,X
	STA chrBgBank1,X
	DEX
	BPL bra_A854
	LDX #$00
	STX gs0SpriteSlot
	JSR sub_AC1D
	iNC a:gameState
	RTS
tbl_A869:
	.byte $E8
	.byte $EA
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $E7
pnt5_A86F:
	JSR sub_B75D
	JSR sub_42_99D6
	JSR sub_AE96
	JSR sub_42_97D3
	LDA playerXHi
	STA playerXHiDup
	LDA playerXLo
	STA playerXLoDup
	LDA $0C
	STA $10
	LDA $0D
	STA $11
	JSR sub_AE8A
	iNC a:gameState
	RTS
pnt5_A892:
	LDX #$01
	LDA curPlayer
	BNE bra_A89B
	LDX #$00
bra_A89B:
	LDA playerLives,X
	BNE bra_A8A6
	LDA #$2C
	sTA a:gameState
	RTS
bra_A8A6:
	JSR sub_AE96
	JSR sub_B800
	LDA mapLevelId
	ASL
	ASL ; (multiply ID value by 4)
	TAX ; Get Y scroll position for current level ID
	LDA tbl_AB9F,X
	STA scrollY ; Set Y scroll position for current level ID
	LDA #$00
	STA $3C
	STA playerXSpd
	STA playerYSpd
	STA playerMoveFlags
	STA playerSprAttrs ; Clear player variables
	LDA #$2A
	STA M90_PRG0 ; Swap bank 42 into 1st PRG slot
	JSR sub_42_9C43
	LDA #$00
	STA $0378
	STA mapMoveFlag
	JSR sub_AE8A
	LDA curPlayer
	BEQ bra_A8DF
	LDA #$06
	BNE bra_A8E1
bra_A8DF:
	LDA #$04
bra_A8E1:
	STA bgCurPalette
	LDA #$00
	STA fadeoutMode
	STA $0312
	STA hudDisplay
	STA logoFlag
	LDA #$0B
	STA interruptMode
	JSR sub_B068
	iNC a:gameState
	RTS
pnt5_A8FE:
	LDA mapMoveFlag
	BNE bra_A90F ; Branch if the player starts moving
	JSR sub_AA5F
	JSR worldSelectCheck
	JSR sub_42_96FE
	JMP loc_A912
bra_A90F:
	JSR sub_42_8FFB
loc_A912:
	JSR AnimateMapPlayer
	JSR ClearOtherSprites
	JSR sub_B486
	LDA #$2A
	STA M90_PRG0 ; Swap bank 42 into the 1st PRG slot
	JSR DrawDestroyedCastle
	RTS
pnt5_A924:
	JSR DrawDestroyedCastle
pnt5_A927:
	LDA #$05
	STA palTransition ; Start palette fadeout
	JSR sub_B068
	iNC a:gameState ; Go to the next event
	RTS
pnt5_A933:
	JSR sub_B75D
	LDA mapScreen
	ASL
	ASL
	TAX
	LDA tbl_A98F,X
	STA cameraXHi
	STA playerCollXHi
	STA playerXHi
	LDA tbl_A98F+1,X
	STA $52
	STA $65
	STA scrollX
	CLC
	ADC playerXLo
	STA playerXLo
	LDA playerXHi
	ADC #$00
	STA playerXHi
	LDA playerXHi
	STA playerXHiDup
	LDA playerXLo
	STA playerXLoDup
	LDA $0C
	STA $10
	LDA $0D
	STA $11
	JSR sub_AE96
	JSR sub_B800
	LDA mapScreen
	ASL
	ASL
	TAX
	LDA tbl_A98F+2,X
	STA $03
	JSR clearSprites
	JSR sub_AE8A
	LDA #$00
	STA fadeoutMode
	STA $0312
	JSR sub_B068
	iNC a:gameState
	RTS
tbl_A98F:
	.byte $09
	.byte $00
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
pnt5_A9A7:
	INC $0360
	LDA #$00
	STA $037C
	LDA #$0B
	sTA a:gameState
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
playLevel:
	CLC
	LDX #$08 ; Set index for player #2
	LDA curPlayer
	BNE levelDestroyCheck ; Branch if player #2 is playing
	LDX #$00 ; Otherwise, set index for player #1
levelDestroyCheck:
	STX $25 ; Store index value
	LDY mapLevelId
	LDA tbl_A9B5,Y
	ADC $25
	STA $25 ; Add to index
	LDX $25
	LDA castlesDestroyed,X
	BEQ bra_A9F3 ; Branch if the current level isn't destroyed
	RTS
bra_A9F3:
	LDX #$01 ; Set index for player #2
	LDA curPlayer
	BNE bra_A9FC ; Branch if player #2 is playing
	LDX #$00 ; Otherwise, set index for player #1
bra_A9FC:
	LDA mapLevelId
	STA levelId,X ; Set level ID
	LDA playerMapAnim
	CMP #$07 ; Check if the player is on Yoshi
	BNE bra_AA0D ; Branch if not
	LDA #$0E
	BNE bra_AA25 ; Otherwise, set animation
bra_AA0D:
	LDA playerMapAnim
	CMP #$0A ; Check if the player is on a water level with Yoshi
	BNE bra_AA18 ; If not, branch
	LDA #$0F
	BNE bra_AA25 ; Otherwise, set animation
bra_AA18:
	LDA playerMapAnim
	CMP #$04 ; Check if the player is on a water level
	BNE bra_AA23 ; If they aren't, branch
	LDA #$10
	BNE bra_AA25 ; Otherwise, set animation for it
bra_AA23:
	LDA #$0D ; Use normal "start" animation
bra_AA25:
	STA playerMapAnim
	LDA #SFX_BEEP
	STA sndSfx ; Play "beep" sound
	LDA #$00
	STA overworldMapTimer ; Clear overworld timer
	STA frameCount
	STA frameCount+1 ; Clear global frame counters
	STA playerMapFrame ; Reset animation frame
bra_AA38:
	LDA frameCount
	CMP frameCount+1
	BEQ bra_AA38 ; Branch if the frame counters are synchronized
	STA frameCount+1 ; If not, synchronize them
	JSR AnimateMapPlayer
	JSR ClearOtherSprites ; Clear non-player sprites
	JSR DrawDestroyedCastle
	LDA frameCount
	AND #$1F
	BNE bra_AA52
	INC worldSelectNum
bra_AA52:
	LDA worldSelectNum
	CMP #$04
	BCC bra_AA38 ; Branch if the timer hasn't reached 4 yet
	LDA #$12
	sTA a:gameState ; Otherwise, start fadeout
	RTS
sub_AA5F:
	LDA btnPressed
	AND #BTN_A+BTN_START ; Check if A or start is pressed
	BEQ bra_AA6A ; If not, branch
	JSR playLevel ; If they are, jump
	RTS
bra_AA6A:
	LDX curPlayer
	LDA player1LevelsUnlocked,X
	STA $039B
	LDA mapLevelId
	ASL
	TAX
	LDA numPlayers
	BNE bra_AA89
	LDA unlockNextLevel
	BEQ bra_AA89
	LDA #$00
	STA unlockNextLevel
	BEQ bra_AAA3
bra_AA89:
	LDA mapLevelId
	CMP $039B
	BCS bra_AA99
	LDA btnPressed
	AND MapDirections,X
	BNE bra_AAA3
bra_AA99:
	INX
	LDA btnPressed
	AND MapDirections,X
	BNE bra_AAA9
	RTS
bra_AAA3:
	INC mapLevelId
	JMP loc_AAB1
bra_AAA9:
	LDA mapLevelId
	BEQ bra_AAB1
	DEC mapLevelId
bra_AAB1:
loc_AAB1:
	STX $0391
	LDA #$FF
	STA mapMoveFlag
	LDA #$00
	STA $0360
	STA $037C
	RTS
	RTS
	LDA #$88
	STA ppuCtrlMirror
	STA PPUCTRL
	RTS
sub_AACB:
	LDA #$2A
	STA M90_PRG0 ; Load bank 42 into the 1st PRG slot
	JSR TilemapDecompSub ; Draw the compressed title screen logo to VRAM
	RTS
clearGS0Sprites:
	LDX #$00
	LDA #$00
gS0ClearLoop:
	STA gs0SpriteFrame,X
	INX
	CPX #$07 ; Make all sprites blank
	BCC gS0ClearLoop
	RTS
clearSprites:
	LDX #$00
	LDA #$F8
clearSpritesLoop:
	STA spriteMem,X
	INX
	INX
	INX
	INX
	BNE clearSpritesLoop ; Move all 8x8 sprites off-screen
	RTS
worldSelectCheck:
	LDA worldSelectTrigger
	BEQ bra_AAFA ; Branch if the world select trigger is set to zero
	LDA btnPressed
	AND #BTN_SELECT ; Check if select is pressed
	BEQ bra_AB0C_RTS ; If not, stop
bra_AAFA:
	LDA #$04
	STA mapScreen ; Set screen
	LDA #$00
	STA playerMapAnim ; Reset the player's animation
	STA worldSelectNum ; Set the starting spot
	LDA #$0F ; Set next event
	JSR sub_BFD0 ; Reset the trigger
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
pnt5_AB1D:
	LDA btnPressed
	AND #$02
	BEQ bra_AB30
	LDA #SFX_BEEP
	STA sndSfx
	LDA worldSelectNum
	BEQ bra_AB45
	DEC worldSelectNum
bra_AB30:
	LDA btnPressed
	AND #$01
	BEQ bra_AB45
	LDA #SFX_BEEP
	STA sndSfx
	LDA worldSelectNum
	CMP #$06
	BCS bra_AB45
	INC worldSelectNum
bra_AB45:
	LDA btnHeld
	AND #$90
	BEQ bra_AB79
	LDA #SFX_BEEP
	STA sndSfx
	LDX worldSelectNum
	LDA tbl_AB95,X
	STA mapLevelId
	LDX #$01
	LDA curPlayer
	BNE bra_AB62
	LDX #$00
bra_AB62:
	LDA mapLevelId
	STA levelId,X
	STA player1LevelsUnlocked,X
	LDA #$05
	STA $0312
	JSR sub_B068
	LDA #$08
	sTA a:gameState
	RTS
bra_AB79:
	LDA worldSelectNum
	ASL
	TAX
	LDA tbl_AB0D,X
	STA gs0SpriteFlags
	LDA tbl_AB0E,X
	STA gs0SpriteX
	LDA #$50
	STA gs0SpriteY
	JSR AnimateMapPlayer
	JSR ClearOtherSprites
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
	LDA mapLevelId
	ASL
	ASL
	TAX
	LDA tbl_9B83,X
	STA gs0SpriteFlags
	LDA tbl_9B83+1,X
	STA gs0SpriteX
	LDA tbl_9B83+2,X
	STA gs0SpriteY
	LDX curPlayer
	LDA playerStoredYoshi,X
	BEQ bra_AC5C
	SEC
	LDA gs0SpriteY
	SBC #$09
	STA gs0SpriteY
	LDA #$07
	STA $0361
	LDA mapLevelId
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
	LDA mapLevelId
	CMP #$0B
	BEQ bra_AC68
	CMP #$15
	BEQ bra_AC68
	RTS
bra_AC68:
	LDA #$04
	STA $0361
	RTS
cycleFrameCount:
	LDX #$00
cycleCountLoop:
	JSR cycleFrameEnd
	JSR cycleFrameEnd
	JSR cycleFrameEnd
	JSR cycleFrameEnd
	NOP
	NOP
	NOP
	DEX
	BNE cycleCountLoop ; Wait a frame worth of cycles
	DEY
	BNE cycleFrameCount ; Wait for the set amount of frames
cycleFrameEnd:
	RTS
yoshiHouseIDs:
	.byte $00
	.byte $06
	.byte $14
	.byte $00
	.byte $00
	.byte $00
	.byte $00
pnt5_AC8D:
	LDY #$00
	LDX #$01
	LDA curPlayer
	BNE bra_AC98
	LDX #$00
bra_AC98:
	LDA levelId,X
	CMP yoshiHouseIDs,Y
	BEQ bra_ACA8 ; If current level ID is one of the Yoshi house IDs, branch
	INY ; Go to next byte of ID list
	CPY #$03
	BCC bra_AC98 ; Keep going until 3 bytes are read
	JMP loc_ACB3
bra_ACA8:
	LDY #$40
	JSR cycleFrameCount
	LDA #$2E
	sTA a:gameState ; Enter Yoshi house
	RTS
loc_ACB3:
	LDA #$00
	STA scrollX
	STA scrollY
	STA PPUMASK
	STA ppuMaskMirror ; Clear PPU registers
	JSR ClearNametable ; Clear the screen
	LDA #$2E
	STA sndMusic ; Stop playing music
	LDA curPlayer
	BNE p2TransitionSet ; Branch if player #2 is playing
	LDA #$01
	BNE bra_ACD0 ; Set transition for player #1
p2TransitionSet:
	LDA #$03 ; Set transition for player #2
bra_ACD0:
	JSR TransitionScreenSub
loc_ACD3:
	JSR clearGS0Sprites ; Hide sprites
	JSR clearSprites
	LDA #$00
	STA fadeoutMode ; Set fadeout mode
	STA palTransition ; Fade the screen in
	STA hudDisplay ; Turn off the HUD
	STA logoFlag
	LDA #$05
	STA bgCurPalette ; Set palette
	JSR CHRBankSub
	LDY #$40
	JSR cycleFrameCount ; Wait 64 frames
	LDA #%00011110
	STA ppuMaskMirror ; Set the PPU mask
	LDA #$0C
	STA interruptMode ; Set horizontal interrupt mode
	JSR sub_B068
	LDY #$E0
	JSR cycleFrameCount ; Wait 224 frames
	iNC a:gameState
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
pnt5_AD29:
	LDA #$00
	STA $037E
	STA unlockNextLevel
	STA $0398
	STA $039A
	LDX curPlayer
	LDA levelId,X
	TAX
	LDA tbl_AD09,X
	STA $25
	AND #$0F
	STA levelNumber
	LDA $25
	LSR
	LSR
	LSR
	LSR
	STA worldNumber
	LDA #$01
	sTA a:inLvlFlag
	LDA #$00
	sTA a:gameState
	RTS
pnt5_AD5C:
	LDA #$00
	STA $5B
	LDA #$2A
	STA $08
	iNC a:gameState
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
pnt5_AD7E:
	JSR clearSprites
	LDA $0361
	AND #$1F
	TAX
	LDA tbl_AD68,X
	STA $0361
	LDA #$00
	STA $0378
	STA mapMoveFlag
	LDA curPlayer
	BEQ bra_ADA0
	LDA $0361
	STA $0332
bra_ADA0:
	LDA $037E
	BEQ bra_ADA9
	iNC a:gameState
	RTS
bra_ADA9:
	LDA unlockNextLevel
	BEQ bra_ADB4
	LDA #$1C
	sTA a:gameState
	RTS
bra_ADB4:
	LDA $0398
	BEQ bra_ADBF
	LDA #$1F
	sTA a:gameState
	RTS
bra_ADBF:
	LDA #$21
	sTA a:gameState
	RTS
pnt5_ADC5:
	JSR sub_AE96
	LDA #MUS_ENDING
	STA sndMusic
	LDA #$2A
	STA M90_PRG0
	LDA #$02
	STA worldSelectNum
	JSR sub_AACB
	LDA #$02
	JSR CHRBankSub
	JSR sub_AE8A
	LDA #$00
	STA fadeoutMode
	STA $0312
	STA hudDisplay
	STA logoFlag
	STA $02
	STA $03
	LDA #$02
	STA bgCurPalette
	LDA #$0C
	STA interruptMode
	JSR sub_B068
	LDY #$FF
	JSR cycleFrameCount
	iNC a:gameState
	RTS
pnt5_AE09:
	JSR sub_AE96
	LDA #$2A
	STA M90_PRG0
	LDA #$01
	STA worldSelectNum
	JSR sub_AACB
	LDA #$01
	JSR CHRBankSub
	JSR sub_AE8A
	JSR clearSprites
	LDX #$00
bra_AE26:
	LDA tbl_AE5A,X
	STA spriteMem,X
	INX
	CPX #$30
	BCC bra_AE26
	LDA #$00
	STA fadeoutMode
	STA $0312
	STA hudDisplay
	STA logoFlag
	LDA #$01
	STA bgCurPalette
	LDA #$0C
	STA interruptMode
	LDY #$A0
	JSR cycleFrameCount
	JSR sub_B068
	LDA #$00
	STA worldSelectNum
	iNC a:gameState
	RTS
tbl_AE5A:
	.byte $28, $01, $00, $50
	.byte $28, $02, $00, $60
	.byte $28, $03, $00, $70
	.byte $28, $04, $00, $88
	.byte $28, $05, $00, $98
	.byte $28, $06, $00, $A8
	.byte $30, $07, $00, $50
	.byte $30, $08, $00, $60
	.byte $30, $09, $00, $70
	.byte $30, $0A, $00, $88
	.byte $30, $0B, $00, $98
	.byte $30, $0C, $00, $A8
sub_AE8A:
	LDA #%00011000
	STA ppuMaskMirror ; Set PPU mask bits
	LDA #%10001000
	STA PPUCTRL ; Set PPU control bits
	STA ppuCtrlMirror
	RTS
sub_AE96:
	LDA #$00
	STA PPUCTRL
	STA ppuCtrlMirror
	STA PPUMASK
	STA ppuMaskMirror ; Clear the PPU mask and control registers, disabling rendering and NMI
	RTS
sub_AEA3:
	LDA #$00
	STA scrollX
	STA scrollY
	STA PPUMASK
	STA ppuMaskMirror ; Clear the PPU registers
	JSR ClearNametable ; Clear the screen
	RTS
tbl_AEB2:
	.byte $04
	.byte $09
	.byte $0D
	.byte $11
	.byte $16
	.byte $1A
	.byte $1E
pnt5_AEB9:
	LDY #$00
	LDX curPlayer
bra_AEBE:
	LDA levelId,X
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
	LDA curPlayer
	BEQ bra_AEDE
	CLC
	LDA $25
	ADC #$08
	TAY
bra_AEDE:
	LDA #$01
	STA $0380,Y
bra_AEE3:
	LDA numPlayers
	BNE bra_AEF9
	LDA #$08
	sTA a:gameState
	LDY player1LevelsUnlocked
	CPY levelId
	BNE bra_AEF8_RTS
	INC player1LevelsUnlocked
bra_AEF8_RTS:
	RTS
bra_AEF9:
	LDX #$01
	LDA curPlayer
	BNE bra_AF02
	LDX #$00
bra_AF02:
	LDA player1LevelsUnlocked,X
	CMP levelId,X
	BNE bra_AF0D
	INC player1LevelsUnlocked,X
bra_AF0D:
	LDA #$25
	sTA a:gameState
	RTS
pnt5_AF13:
	RTS
pnt5_AF14:
	JSR sub_AEA3
	LDA #$02
	JSR TransitionScreenSub
	JMP loc_ACD3
pnt5_AF1F:
	LDA numPlayers
	BEQ bra_AF2B ; Branch if in 1 player mode
	LDX #$01 ; Set index for player #2
	LDA curPlayer
	BNE bra_AF2D ; Branch if player #2 is playing
bra_AF2B:
	LDX #$00 ; Set index for player #1
bra_AF2D:
	DEC playerLives,X ; Subtract from the player's life count
	LDA playerLives,X
	BEQ setGameOver ; Branch if the player has zero lives
	LDA numPlayers
	BNE setPlayerChange ; Switch to the other player
	LDA #$2C
	sTA a:gameState
	RTS
setGameOver:
	LDA #$22
	sTA a:gameState
	RTS
setPlayerChange:
	LDA #$25
	sTA a:gameState
	RTS
pnt5_AF4C:
	JSR sub_AEA3
	LDA #$00
	JSR TransitionScreenSub
	LDA #MUS_GAMEOVER
	STA sndMusic
	JSR clearGS0Sprites
	JSR clearSprites
	LDA #$00
	STA fadeoutMode
	STA $0312
	STA hudDisplay
	STA logoFlag
	LDA #$05
	STA bgCurPalette
	JSR CHRBankSub
	LDY #$40
	JSR cycleFrameCount
	LDA #$1E
	STA ppuMaskMirror
	LDA #$0C
	STA interruptMode
	JSR sub_B068
	LDY #$E0
	JSR cycleFrameCount
	LDY #$E0
	JSR cycleFrameCount
	iNC a:gameState
	RTS
pnt5_AF93:
	LDA numPlayers
	BNE bra_AFA0
loc_AF98:
	LDY #$40
	JSR cycleFrameCount
	JMP reset
bra_AFA0:
	LDA playerLives
	ORA playerLives+1
	BNE bra_AFAB
	JMP loc_AF98
bra_AFAB:
	iNC a:gameState
	RTS
pnt5_AFAF:
	LDA numPlayers
	BEQ bra_AFD5
	LDA playerLives
	ORA playerLives+1
	BEQ bra_AFEB
bra_AFBC:
	LDA curPlayer
	EOR #$01
	STA curPlayer
	LDX #$01
	LDA curPlayer
	BNE bra_AFCD
	LDX #$00
bra_AFCD:
	LDA playerLives,X
	BEQ bra_AFBC
	JMP loc_AFDA
bra_AFD5:
	LDA #$00
	STA curPlayer
loc_AFDA:
	LDA #$07
	sTA a:gameState
	LDA curPlayer
	BEQ bra_AFEA_RTS
	LDA $0332
	STA $0361
bra_AFEA_RTS:
	RTS
bra_AFEB:
	LDY #$40
	JSR cycleFrameCount
	JMP reset
pnt5_AFF3:
	LDA mapMoveFlag
	BNE bra_AFFE
	iNC a:gameState
	JMP loc_B001
bra_AFFE:
	JSR sub_42_8FFB
loc_B001:
	JSR AnimateMapPlayer
	JSR ClearOtherSprites
	JSR sub_B486
	LDA #$2A
	STA M90_PRG0
	JSR DrawDestroyedCastle
	RTS
pnt5_B013:
	LDA frameCount
	AND #$1F
	BNE bra_B01C
	INC worldSelectNum
bra_B01C:
	LDA worldSelectNum
	CMP #$04
	BCC bra_B029
	iNC a:gameState
	JMP loc_B02C
bra_B029:
	JSR sub2_90D3
loc_B02C:
	JSR AnimateMapPlayer
	JSR ClearOtherSprites
	JSR sub_B486
	LDA #$2A
	STA M90_PRG0
	JSR DrawDestroyedCastle
	RTS
pnt5_B03E:
	LDA #$00
	STA $037E
	STA $0398
	STA $039A
	STA $0361
	STA levelNumber
	LDA #$07
	STA worldNumber
	LDA #$01
	sTA a:inLvlFlag
	STA unlockNextLevel
	LDA #$00
	sTA a:gameState
	RTS
pnt5_B062:
	LDA #$07
	sTA a:gameState
	RTS
sub_B068:
	LDA bgCurPalette
	ASL
	TAY ; Get palette pointer
	LDA tbl_B0EB,Y
	STA $32
	LDA tbl_B0EB+1,Y
	STA $33 ; Store pointer
	LDA fadeoutMode
	ASL
	TAY ; Get fadeout mode pointer
	LDA tbl_B0E7,Y
	STA $34
	LDA tbl_B0E7+1,Y
	STA $35 ; Store pointer
bra_B086:
loc_B086:
	LDA ppuUpdatePtr
	BNE bra_B086 ; Make sure the PPU address low byte is 0??
	LDA frameCount
	AND #$03 ; Mask out 2 LSB
	BNE bra_B086 ; Only do this every 4th frame
	LDX palTransition
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
	STA ppuDataBuf,Y
	INY
	CPY #$20
	BNE bra_B09B
	LDA #$3F
	STA ppuUpdatePtr
	LDA #$00
	STA ppuUpdatePtr+1
	STA $03A0
	LDA #$20
	STA ppuBufSize
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
	.byte $40 ; fadeout effect
	.byte $30 ; 
	.byte $20 ; 
	.byte $10 ; 
	.byte $00 ; 
	.byte $10 ; 
	.byte $20 ; 
	.byte $30 ; 
	.byte $40 ; 
tbl_B0E7:
	.word ofs_B1C9
	.word ofs_B1E9
tbl_B0EB:
	.word ofs_B0F9
	.word ofs_B119
	.word ofs_B139
	.word ofs_B149
	.word ofs_B169
	.word ofs_B189
	.word ofs_B1A9
ofs_B0F9:
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
ofs_B119:
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
ofs_B139:
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
ofs_B149:
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
ofs_B169:
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
ofs_B189:
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
ofs_B1A9:
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
ofs_B1C9:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
ofs_B1E9:
	.byte $00
	.byte $00
	.byte $00
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
	LDA PPUSTATUS
	LDA $00
	ORA #$04
	STA PPUCTRL
	LDA PPUSTATUS
	LDA $0480
	STA PPUADDR
	LDA nextBgColumn
	STA PPUADDR
	LDX #$00
bra_B3B4:
	LDA $0485,X
	STA PPUDATA
	INX
	CPX #$1E
	BCC bra_B3B4
	LDA PPUSTATUS
	LDA $0480
	ORA #$08
	STA PPUADDR
	LDA nextBgColumn
	STA PPUADDR
bra_B3D0:
	LDA $0485,X
	STA PPUDATA
	INX
	CPX #$38
	BCC bra_B3D0
	LDA PPUSTATUS
	LDA $00
	AND #$FB
	STA PPUCTRL
	RTS
	LDA palAssignPtr
	BEQ bra_B40E_RTS
	LDX #$00
bra_B3ED:
	LDA PPUSTATUS
	LDA palAssignPtr,X
	STA PPUADDR
	LDA palAssignPtr+1,X
	STA PPUADDR
	LDA palAssignData,X
	STA PPUDATA
	INX
	INX
	INX
	CPX #$30
	BCC bra_B3ED
	LDA #$00
	STA palAssignPtr
bra_B40E_RTS:
	RTS
	LDA btnPressed
	AND #$80
	BEQ bra_B424
	INC scrollSpd
	LDA #$08
	CMP scrollSpd
	BCS bra_B423_RTS
	STA scrollSpd
bra_B423_RTS:
	RTS
bra_B424:
	LDA btnPressed
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
	LDA scrollSpd
	AND #$07
	STA scrollSpd
	LDA $0327
	AND #$07
	STA $0327
	LDA btnHeld
	AND #$01
	BEQ bra_B458
	LDA scrollSpd
	AND #$7F
	STA scrollSpd
bra_B458:
	LDA btnHeld
	AND #$02
	BEQ bra_B467
	LDA scrollSpd
	ORA #$80
	STA scrollSpd
bra_B467:
	LDA btnHeld
	AND #$04
	BEQ bra_B476
	LDA $0327
	AND #$7F
	STA $0327
bra_B476:
	LDA btnHeld
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
	LDA btnHeld
	AND #$0F
	BEQ bra_B4BB
	LDA btnHeld
	AND #$0C
	BEQ bra_B4A0
bra_B4A0:
	LDA btnHeld
	AND #$03
	BEQ bra_B4AA
	JSR sub_BDD1
bra_B4AA:
	LDA btnHeld
	AND #$0C
	BEQ bra_B4B1
bra_B4B1:
	LDA btnHeld
	AND #$03
	BEQ bra_B4BB
	JSR sub_BE23
bra_B4BB:
loc_B4BB:
	LDA playerXHiDup
	STA playerXHi
	LDA playerXLoDup
	STA playerXLo
	LDA playerYHiDup
	STA playerYHi
	LDA playerYLoDup
	STA playerYLo
	LDA $55
	STA cameraXHi
	LDA $56
	STA $52
	RTS
	RTS
sub_B4D5:
	LDA levelNumber
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
	STA nextBgColumn
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
	LDA prgDataBank2
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
	lDA a:$0060,Y
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
	LDA bgTileAttrs,Y
	AND $25
	ORA $37
	STA bgTileAttrs,Y
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
	LDA bgTileAttrs,Y
	STA palAssignData,X
	TYA
	AND #$3F
	ORA #$C0
	STA palAssignPtr+1,X
	TYA
	LDY #$23
	AND #$40
	BEQ bra_B638
	LDY #$2B
bra_B638:
	TYA
	STA palAssignPtr,X
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
	LDA prgDataBank2
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
	LDA prgDataBank1
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
	LDA bgTileAttrs,Y
	AND $25
	ORA $37
	STA bgTileAttrs,Y
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
	LDA worldNumber
	ASL
	ASL
	ASL
	ASL
	STA $32
	LDA levelNumber
	ASL
	ASL
	CLC
	ADC $32
	TAX
	LDA tbl_B997,X
	STA prgDataBank1
	LDA tbl_B997+1,X
	STA $04F4
	LDA tbl_B997+2,X
	STA prgDataBank2
	LDA tbl_B997+3,X
	STA $6D
	LDY #$00
	STY levelVerticalScreenOffs
	STA lvlBottomScreenOffs
	LDY levelNumber
	LDA tbl_BA07,Y
	STA $8C
	LDA tbl_BA0B,Y
	STA $8D
	LDA worldNumber
	ASL
	TAY
	LDA tbl_BA2D,Y
	STA $32
	LDA tbl_BA2D+1,Y
	STA $33
	LDA levelNumber
	ASL
	ASL
	ASL
	TAY
	LDA ($32),Y
	STA cameraXHi
	STA playerCollXHi
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
	LDA cameraXHi
	STA playerXHi
	INY
	LDA ($32),Y
	STA playerXLo
	STA $12
	LDA $53
	STA playerYHi
	INY
	LDA ($32),Y
	STA playerYLo
	STA $13
	INY
	LDA ($32),Y
	STA horizScrollLock
	INY
	LDA ($32),Y
	STA levelXScreenCount
	INY
	LDA ($32),Y
	STA vertScrollLock
	INY
	LDA ($32),Y
	STA levelYScreenCount
	RTS
	RTS
sub_B800:
	LDA PPUSTATUS ; Clear PPU address latch
	LDA ppuCtrlMirror
	AND #%01111111
	STA PPUCTRL ; Disable NMI
	LDA #$00
	STA scrollY ; Clear the vertical scroll position
	LDA scrollX
	LSR
	LSR
	LSR ; Divide the horizontal scroll position by 8 (to align it with a tile)
	STA $59
	STA $30
	LDA #$20
	STA $5A
	LDA #$20
	STA $26
loc_B81F:
	JSR sub_B670
	LDA prgDataBank2
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
	STA nextBgColumn
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
	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$C0
	STA PPUADDR
	LDX #$00
bra_B8DB:
	LDA bgTileAttrs,X
	STA PPUDATA
	INX
	CPX #$40
	BCC bra_B8DB
	LDA PPUSTATUS
	LDA #$2B
	STA PPUADDR
	LDA #$C0
	STA PPUADDR
bra_B8F3:
	LDA bgTileAttrs,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra_B8F3
	RTS
	LDA #$2B
	STA PPUADDR
	LDA #$40
	STA PPUADDR
	LDX #$00
bra_B90B:
	LDA tbl_B917,X
	STA PPUDATA
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
	.byte $00
	.byte $2C
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
	LDA prgDataBank2
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
	.word ofs_BA3B
	.word ofs_BA5B
	.word ofs_BA7B
	.word ofs_BA9B
	.word ofs_BABB
	.word ofs_BADB
	.word ofs_BAFB
ofs_BA3B:
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
ofs_BA5B:
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
ofs_BA7B:
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
ofs_BA9B:
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
ofs_BABB:
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
ofs_BADB:
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
ofs_BAFB:
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
	LDA playerXSpd
	ROR
	ROR
	ROR
	ROR
	AND #$0F
	TAY
	LDA tbl_BC4E,Y
	STA $28
	LDA playerXSpd
	BNE bra_BB31
	LDA #$00
	STA $28
bra_BB31:
	LDA $28
	BNE bra_BB40
	LDA playerXHi
	STA playerXHiDup
	LDA playerXLo
	STA playerXLoDup
	JMP loc_BB63
bra_BB40:
	LDA playerMoveFlags
	AND #$01
	BEQ bra_BB56
	LDA playerXLo
	SEC
	SBC $28
	STA playerXLoDup
	LDA playerXHi
	SBC #$00
	STA playerXHiDup
	JMP loc_BB63
bra_BB56:
	LDA playerXLo
	CLC
	ADC $28
	STA playerXLoDup
	LDA playerXHi
	ADC #$00
	STA playerXHiDup
loc_BB63:
	LDA playerYSpd
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA tbl_BC5E,X
	STA $2B
	LDA $2B
	BNE bra_BB7E
	LDA playerYHi
	STA playerYHiDup
	LDA playerYLo
	STA playerYLoDup
	JMP loc_BBB9
bra_BB7E:
	LDA playerMoveFlags
	AND #$04
	BEQ bra_BB9F
	LDA playerYLo
	SEC
	SBC $2B
	STA playerYLoDup
	LDA playerYHi
	SBC #$00
	STA playerYHiDup
	LDA playerYLoDup
	CMP #$F0
	BCC bra_BB9C
	SEC
	SBC #$10
	STA playerYLoDup
bra_BB9C:
	JMP loc_BBB9
bra_BB9F:
	LDA playerYLo
	CLC
	ADC $2B
	STA playerYLoDup
	LDA playerYHi
	ADC #$00
	STA playerYHiDup
	LDA playerYLoDup
	CMP #$F0
	BCC bra_BBB9
	CLC
	ADC #$10
	STA playerYLoDup
	INC playerYHiDup
bra_BBB9:
loc_BBB9:
	JSR sub_BED2
	JSR sub_BE4D
	LDA playerXLoDup
	SEC
	SBC playerXLo
	STA $28
	LDA playerXHiDup
	SBC playerXHi
	BPL bra_BBE7
	LDA $28
	EOR #$FF
	SEC
	ADC #$00
	CMP #$07
	BCC bra_BBE4
	LDA playerXLo
	SEC
	SBC #$07
	STA playerXLoDup
	LDA playerXHi
	SBC #$00
	STA playerXHiDup
bra_BBE4:
	JMP loc_BBFA
bra_BBE7:
	LDA $28
	CMP #$07
	BCC bra_BBFA
	LDA playerXLo
	CLC
	ADC #$07
	STA playerXLoDup
	LDA playerXHi
	ADC #$00
	STA playerXHiDup
bra_BBFA:
loc_BBFA:
	LDA playerYLoDup
	SEC
	SBC playerYLo
	STA $28
	LDA playerYHiDup
	SBC playerYHi
	BPL bra_BC2D
	LDA $28
	EOR #$FF
	SEC
	ADC #$00
	CMP #$07
	BCC bra_BC2A
	LDA playerYLo
	SEC
	SBC #$07
	STA playerYLoDup
	LDA playerYHi
	SBC #$00
	STA playerYHiDup
	LDA playerYLoDup
	CMP #$F0
	BCC bra_BC2A
	SEC
	SBC #$10
	STA playerYLoDup
bra_BC2A:
	JMP loc_BC4D_RTS
bra_BC2D:
	LDA $28
	CMP #$07
	BCC bra_BC4D_RTS
	LDA playerYLo
	CLC
	ADC #$07
	STA playerYLoDup
	LDA playerYHi
	ADC #$00
	STA playerYHiDup
	LDA playerYLoDup
	CMP #$F0
	BCC bra_BC4D_RTS
	CLC
	ADC #$10
	STA playerYLoDup
	INC playerYHiDup
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
	LDA playerXLoDup
	SEC
	SBC $52
	STA $28
	LDA playerXHiDup
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
	LDA playerXLoDup
	SEC
	SBC $12
	STA $56
	LDA playerXHiDup
	SBC #$00
	STA $55
	BPL bra_BCA6
	LDA $56
	EOR #$FF
	SEC
	ADC #$00
	STA $56
bra_BCA6:
	LDA horizScrollLock
	CMP $55
	BNE bra_BCC0
	LDA #$00
	STA $55
	STA $56
	LDA playerXLoDup
	SEC
	SBC $56
	STA $12
	LDA playerXHiDup
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
	LDA playerXLoDup
	SEC
	SBC $12
	STA $56
	LDA playerXHiDup
	SBC #$00
	STA $55
	BPL bra_BCE5
	LDA $56
	EOR #$FF
	SEC
	ADC #$00
	STA $56
bra_BCE5:
	LDA levelXScreenCount
	CMP $55
	BNE bra_BD01
	STA $55
	LDA #$00
	STA $56
	LDA playerXLoDup
	SEC
	SBC $56
	STA $12
	LDA playerXHiDup
	SBC $55
	BPL bra_BD01
	STA $12
bra_BD01:
	JMP loc_BD0E
bra_BD04:
	STA $12
	LDA cameraXHi
	STA $55
	LDA $52
	STA $56
loc_BD0E:
	LDA playerYLoDup
	SEC
	SBC $54
	STA $2B
	LDA playerYHiDup
	SBC $53
	BPL bra_BD24
	LDA $2B
	EOR #$FF
	SEC
	ADC #$00
	STA $2B
bra_BD24:
	LDA playerYHiDup
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
	LDA playerYLoDup
	SEC
	SBC $13
	STA $58
	LDA playerYHiDup
	SBC #$00
	STA $57
	BPL bra_BD53
	LDA $58
	EOR #$FF
	SEC
	ADC #$00
	STA $58
bra_BD53:
	LDA vertScrollLock
	CMP $57
	BNE bra_BD6D
	LDA #$00
	STA $57
	STA $58
	LDA playerYLoDup
	SEC
	SBC $58
	STA $13
	LDA playerYHiDup
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
	LDA playerYLoDup
	SEC
	SBC $13
	STA $58
	LDA playerYHiDup
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
	LDA levelYScreenCount
	CMP $57
	BNE bra_BDB5
	STA $57
	LDA #$00
	STA $58
	LDA playerYLoDup
	SEC
	SBC $58
	STA $13
	LDA playerYHiDup
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
	STA scrollSpd
	LDA $55
	SBC $51
	BPL bra_BDEC
	LDA scrollSpd
	EOR #$FF
	SEC
	ADC #$00
	ORA #$80
	STA scrollSpd
bra_BDEC:
	LDA scrollSpd
	BEQ bra_BE22_RTS
	LDA $52
	EOR $56
	AND #$F8
	BEQ bra_BE22_RTS
	LDA cameraXHi
	STA playerCollXHi
	LDA $52
	STA $65
	LDA #$00
	STA $66
	LDA #$00
	STA $67
	LDA scrollSpd
	BMI bra_BE1A
	INC $64
	JSR sub_B52B
	LDX $51
	INX
	STX $04F2
	RTS
bra_BE1A:
	JSR sub_B52B
	LDA cameraXHi
	STA $04F2
bra_BE22_RTS:
	RTS
sub_BE23:
	LDA scrollSpd
	BMI bra_BE36
	CLC
	ADC $02
	STA $02
	LDA $56
	STA $52
	LDA $55
	STA cameraXHi
	RTS
bra_BE36:
	AND #$7F
	STA scrollSpd
	LDA $02
	SEC
	SBC scrollSpd
	STA $02
	LDA $56
	STA $52
	LDA $55
	STA cameraXHi
	RTS
	RTS
; Unused (possibly duplicate) code starts here
sub_BE4D:
	LDA playerXHiDup
	STA playerCollXHi
	LDA playerXLoDup
	STA $65
	LDA playerYHiDup
	STA $66
	LDA playerYLoDup
	STA $67
loc_BE5D:
	LDA #$00
	STA $26
	LDY $66
	LDA levelVerticalScreenOffs,Y
	CLC
	ADC $64
	TAY
	LDA prgDataBank2
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
	LDA prgDataBank1
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
	LDA prgDataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA playerBackColl
	LDA #60
	STA M90_PRG0
	JSR $8000 ; Unused function, bank 60 is just padding
	LDA $26
	BEQ bra_BEBC
	JMP loc_BE5D
bra_BEBC:
	JMP loc_BEC1
	STA $95
loc_BEC1:
	LDA playerCollXHi
	STA playerXHiDup
	LDA $65
	STA playerXLoDup
	LDA $66
	STA playerYHiDup
	LDA $67
	STA playerYLoDup
	RTS
sub_BED2:
	LDA playerXHi
	STA playerCollXHi
	LDA playerXLo
	SEC
	SBC #$08
	STA $65
	LDA playerYHi
	STA $66
	LDA playerYLo
	SEC
	SBC #$20
	STA $67
	JSR sub_BF31
	LDA playerXHi
	STA playerCollXHi
	LDA playerXLo
	CLC
	ADC #$08
	STA $65
	LDA playerYHi
	STA $66
	LDA playerYLo
	SEC
	SBC #$20
	STA $67
	JSR sub_BF31
	LDA playerXHi
	STA playerCollXHi
	LDA playerXLo
	SEC
	SBC #$08
	STA $65
	LDA playerYHi
	STA $66
	LDA playerYLo
	STA $67
	JSR sub_BF31
	LDA playerXHi
	STA playerCollXHi
	LDA playerXLo
	SEC
	SBC #$08
	STA $65
	LDA playerYHi
	STA $66
	LDA playerYLo
	STA $67
	JSR sub_BF31
	RTS
sub_BF31:
	LDY $66
	LDA levelVerticalScreenOffs,Y
	CLC
	ADC $64
	TAY
	LDA prgDataBank2
	STA M90_PRG0
	LDA ($8C),Y
	AND #$1F
	ORA #$80
	STA $33
	LDA #$00
	STA $32
	LDA prgDataBank1
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
	LDA prgDataBank2
	STA M90_PRG0
	LDA ($DA),Y
	CMP #$78
	BCC bra_BF7A_RTS
	STA playerBackColl
	LDA #60
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
	.byte $1A ; Unlogged data ends here
sub_BFD0:
	sTA a:gameState ; Store set event
	LDA #$01
	STA worldSelectTrigger ; Reset the trigger
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
