; disassembled by BZK 6502 Disassembler
jmp_63_E000:
	PHP ; Push the CPU status into the stack
	PHA ; Push the accumulator into the stack
	TXA
	PHA ; Push the X register into the stack
	TYA
	PHA ; Push the Y register into the stack
	LDA ppuMaskMirror
	STA PPUMASK ; Copy the software mask register to the hardware register
	LDA xScroll
	STA PPUSCROLL ; Set horizontal scroll in the PPU
	LDA yScroll
	STA PPUSCROLL ; Set vertical scroll in the PPU
	LDA ppuCtrlMirror
	AND #$FC
	ORA vertScrollFlag
	STA ppuCtrlMirror
	STA PPUCTRL
	
	JSR sub3_F6E0 ; Set interupt mode to on
; UPDATE CHR ; Seems to have an effect when the game lags too much	
; I think this is a bandaid fix for the interrupt being mistimed by lag
; On return from interrupt
	LDA chrBgBank1
	STA M90_BG_CHR0 ; Update 1st BG bank
	LDA chrBgBank2
	STA M90_BG_CHR1 ; Update 2nd BG bank
	LDA chrBgBank3
	STA M90_BG_CHR2 ; Update 3rd BG bank
	LDA chrBgBank4
	STA M90_BG_CHR3 ; Update 4th BG bank (This goes unused)
	LDA chrSpriteBank1
	STA M90_SP_CHR0 ; Update 1st sprite bank
	LDA chrSpriteBank2
	STA M90_SP_CHR1 ; Update 2nd sprite bank
	LDA chrSpriteBank3
	STA M90_SP_CHR2 ; Update 3rd sprite bank
	LDA chrSpriteBank4
	STA M90_SP_CHR3 ; Update 4th sprite bank
	PLA
	TAY ; Pull the Y register from the stack
	PLA
	TAX ; Pull the X register from the stack
	PLA ; Pull the accumulator from the stack
	PLP ; Pull CPU status from the stack
	RTI
NMI_E05C:
	JMP loc3_EF10
NMI_E05F:
	JMP loc3_EFE0
NMI_E062:
	PHP ; Push CPU status to stack 
	PHA ; Push A to stack
	TXA 
	PHA ; Push X to stack
	TYA
	PHA ; Push Y to stack
	
	LDA columnFinishFlag
	BEQ bra3_E0E8
	LDA PPUSTATUS ; Clear PPU address data latch
	LDA ppuCtrlMirror
	ORA #$04
	STA PPUCTRL
	LDA PPUSTATUS ; Clear PPU address data latch
	LDA columnFinishFlag
	STA PPUADDR
	LDA nextBgColumn
	STA PPUADDR
	LDX #$00
bra3_E088:
	LDA tileColumnMem,X
	STA PPUDATA
	INX
	CPX #$1E
	BCC bra3_E088
	LDA PPUSTATUS ; Clear PPU address data latch
	LDA columnFinishFlag
	ORA #$08
	STA PPUADDR
	LDA nextBgColumn
	STA PPUADDR
bra3_E0A4:
	LDA tileColumnMem,X
	STA PPUDATA
	INX
	CPX #$38
	BCC bra3_E0A4
	LDA PPUSTATUS ; Clear PPU address data latch
	LDA ppuCtrlMirror
	AND #$FB
	STA PPUCTRL
	LDA palAssignPtr
	BEQ bra3_E0E1
	LDX #$00
bra3_E0C0:
	LDA PPUSTATUS ; Clear PPU address data latch
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
	BCC bra3_E0C0
	LDA #$00
	STA palAssignPtr
bra3_E0E1:
	LDA #$00
	STA columnFinishFlag
	BEQ bra3_E0F0
bra3_E0E8:
	LDA ppuUpdatePtr
	BEQ bra3_E0F0
	JSR sub3_F20F
bra3_E0F0:
	LDA $03E4
	BEQ bra3_E0F8
	JSR sub3_F5CE
	
bra3_E0F8: ; OAM writing for in level sprites
	LDA #$00
	STA OAMADDR
	LDA #$02 ; this is the start address spriteMem+0
	STA OAMDMA ; set OAM to copy sprite all data from spriteMem+0-$02FF
	
	LDA ppuMaskMirror
	STA PPUMASK
	LDA scrollX
	STA PPUSCROLL ; update X scrolling
; Screen shake flag check and timer
	LDY $03
	LDA $0633
	BEQ bra3_E12F ; if screen shake timer == 00, skip shake
	CMP #$30 ; else compare #$30
	BCC bra3_E11E ; if $0633 less than #$30 but > #$00, branch (creates timer for shake)
; If exceed #$30	
	LDA #$00 
	STA $0633 ; clear screen shake timer
	BEQ bra3_E12F ; skip ahead, always
	
bra3_E11E: ; go here if screen shake timer less than #$30 (48 decimal)
	INC $0633 ; add 1 to screen shake timer
	LDA frameCount
	AND #$04
	BNE bra3_E12F ; if not match,  branch to shake screen
	CPY #$EC
	BCS bra3_E12F ; if frame count >= #$EC, branch
	INY
	INY
	INY
	INY ; Increment Y by 4 
	
bra3_E12F:
	STY PPUSCROLL
	LDA ppuCtrlMirror
	AND #$FC
	ORA vertScrollFlag
	STA ppuCtrlMirror
	STA PPUCTRL
	JSR sub3_F6E0
; Update BG and sprite banks	
	LDA chrBgBank1
	STA M90_BG_CHR0
	LDA chrBgBank2
	STA M90_BG_CHR1
	LDA chrBgBank3
	STA M90_BG_CHR2
	LDA chrBgBank4
	STA M90_BG_CHR3
	LDA chrSpriteBank1
	STA M90_SP_CHR0
	LDA chrSpriteBank2
	STA M90_SP_CHR1
	LDA chrSpriteBank3
	STA M90_SP_CHR2
	LDA chrSpriteBank4
	STA M90_SP_CHR3

	JSR pauseChk ; Check if the game is paused
	JSR updateJoypad ; Update controller input
	LDA #$3A
	STA M90_PRG0
	LDA #$3B
	STA M90_PRG1 ; Load music banks 58 and 59 into $8000 and $A000 respectively
	JSR jmp_58_85BE
	JSR jmp_58_862A
	LDA #$00
	STA $3C
	INC frameCount
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI

reset:
	SEI
	CLD ; Standard 2A03/6502 initialization
	LDX #$FF
	TXS ; Set the stack pointer to $FF
	LDA #$00
	STA M90_IRQ_DISABLE ; Disable mapper interrupts
	STA PPUMASK ; Clear the screen
	STA PPUCTRL
	LDX #$02 ; Set the amount of frames to wait. This is likely done to prevent false negatives

vBlankWait1:
	BIT PPUSTATUS
	BPL vBlankWait1 ; Wait for VBlank
vBlankWait2:
	BIT PPUSTATUS
	BMI vBlankWait2 ; Wait for the VBlank flag to clear
	DEX
	BNE vBlankWait1 ; Loop until the set amount of frames have passed

;--------------------

; Mapper/System initialization
	LDA #62
	STA M90_PRG2 ; Swap bank 62 into the 3rd PRG bank
	LDA #63
	STA M90_PRG3 ; Swap bank 63 into the 4th PRG bank
	LDA #%10000101
	STA M90_IRQ_MODE ; Set mapper IRQ mode (Count down, normal prescaler, 3 bit prescaler, PPU A12 source/scanline counter)
	LDA #%00111110
	STA M90_BANK_SIZE ; Set mapper bank sizes (8K PRG, 1K CHR)
	LDA #$00
	STA M90_NT0
	LDA #$01
	STA M90_NT1
	LDA #$02
	STA M90_NT2
	LDA #$03
	STA M90_NT3 ; Set 1K nametable banks (Seems useless, ROM nametables are already disabled)
	LDA #$00
	STA M90_IRQ_XOR ; Set to IRQ XOR to zero
	STA M90_PPU_CFG ; Clear PPU address config
	STA M90_CHR_CTRL1 ; Disable outer bank selection
	LDA #%00000001
	STA M90_CHR_CTRL2 ; Enable horizontal nametable mirroring
	LDA #%00001111
	STA APUSTATUS ; Enable audio channels (excluding DMC)
	LDA #$00
	STA DMC_FREQ ; Disable the DMC channel
	LDA #%01000000
	STA JOY2 ; Disable APU frame counter interrupt
	STA M90_IRQ_DISABLE ; Disable mapper interrupts
	LDA PPUSTATUS ; Clear PPU address latch

	LDA #$10 ; Set the high/low byte of the PPU address
	TAX ; Also set the loop count
bra3_E202: ; No idea what this loop is for
	STA PPUADDR
	STA PPUADDR ; Store the high/low bytes
	EOR #$10 ; Alternate between #$10 and #$0
	DEX
	BNE bra3_E202 ; Keep looping until the loop count is reached

; Wipe memory
	LDA #$00 ; Load zero
	LDX #$00 ; Clear X index
clearMemory:
	STA $00,X
	STA $0200,X
	STA $0300,X
	STA $0400,X
	STA $0500,X
	STA $0600,X
	STA $0700,X ; Wipe all pages of memory
	DEX
	BNE clearMemory ; Keep looping until every page is cleared

; Initialize game engine?
	LDA #$00 ; Clear the accumulator
	JSR mapperProtection ; Verify the game is on Mapper 90
	LDA #58
	STA M90_PRG0
	LDA #59
	STA M90_PRG1 ; Swap music banks into first and second PRG banks
	JSR sndInit ; Initizialize sound driver
	LDA #MUS_TITLE
	STA sndMusic ; Play the title screen music
	JSR sub_58_8E23+1 ; Jumps inbetween an opcode. Probably an error.
	INC sndMuteFlag ; Enable audio
	LDA #$00
	STA hudDisplay ; Sey HUD to default display mode?
	CLI ; Disable interrupts
	LDA #$80
	ORA palTransition
	STA palTransition ; Disable transition
	LDA #$03
	STA playerPowerup ; Set powerup to cape

	LDA #$4C
	STA nmiJmpOpcode ; Store the first byte of the NMI JMP
	LDX #$04
	LDA tbl3_EF08,X	
	STA nmiJmpOpcode+1
	LDA #$E0
	STA nmiJmpOpcode+2 ; Load JMP location pointer
	LDA #%10001000
	STA PPUCTRL
	STA ppuCtrlMirror ; Set PPU control
	LDA #%00011000
	STA PPUMASK
	STA ppuMaskMirror ; Set PPU mask

loc3_E277:
	INC $00E4
	LDA frameCount
	CMP frameCount+1
	BEQ loc3_E277 ; Loop if the duplicate frame counter is the same as the main counter
	STA frameCount+1 ; If they aren't, make them the same
	LDA #$01
	STA $062D
	JSR sub3_E2AB
	LDA #$00
	STA $062D
	LDX #$00
	lDA a:inLvlFlag
	BNE bra3_E298
	LDX #$04
bra3_E298:
	LDA tbl3_EF08,X
	STA nmiJmpOpcode+1
	LDA scrollX
	STA xScroll ; Copy horizontal scroll
	LDA scrollY
	STA yScroll ; Copy vertical scroll
	JMP loc3_E277 ; Jump
sub3_E2AB:
	lDA a:inLvlFlag
	BNE loc3_E317 ; Branch if in a level
	LDX #$04
	LDA tbl3_EF08,X
	STA nmiJmpOpcode+1
	JMP loc3_E2BE ; Jump
	JMP loc3_E317 ; Jump
loc3_E2BE:
	LDX #$29 ; Load bank 41
	STX $09
	STX M90_PRG1 ; Swap bank 41 into 2nd PRG slot
	JMP jmp_41_A000 ; Jump
	RTS

;-----UNUSED CODE START-----
; Seems to be an early routine for loading levels
	lDA a:gameState
	ASL
	TAY ; Get the event pointer
	LDA tbl3_E2DB,Y 
	STA $32 ; Load lower byte of pointer
	LDA tbl3_E2DB+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to the loaded pointer
tbl3_E2DB:
	.word pnt2_E2E5
	.word pnt2_E316
	.word pnt2_E316
	.word pnt2_E316
	.word pnt2_E316
pnt2_E2E5:
	LDA btnPressed
	AND #BTN_A
	BEQ bra3_E2FE ; If the A button is pressed,
	INC levelNumber ; Increment level number
	LDA levelNumber
	CMP #$04 ; Check if level number is below 4,
	BCC bra3_E2FE ; If it is, branch
	LDA #$00 ; If it's above 4, continue
	STA levelNumber ; Clear level number
	INC worldNumber ; Carry over world number (1-5 would become 2-1)
bra3_E2FE:
	LDA btnPressed
	AND #BTN_START
	BEQ bra3_E315 ; If start is pressed,
	INC a:inLvlFlag ; Set game state to 'in level'
	LDA #$00
	sTA a:gameState ; Clear event triggers
	LDA #$05
	STA palTransition
	JSR sub3_F919 ; Jump
bra3_E315:
	RTS
pnt2_E316:
	RTS
;-----UNUSED CODE END-----

loc3_E317:
	lDA a:gameState
	ASL
	TAY ; Get the pointer for the current event
	LDA tbl3_E329,Y
	STA $32 ; Load lower byte of pointer
	LDA tbl3_E329+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer
tbl3_E329:
	.word pnt2_E353 ; Game State 0
	.word pnt2_E372 ; Reentering level
	.word pnt2_E409 ; Normal/Default
	.word pnt2_E4CA ; Entering door
	.word pnt2_E534 ; Death
	.word pnt2_E610 ; Castle intro
	.word pnt2_E6ED ; Level complete
	.word pnt2_E79E ; Unusable item box use (nothing)
	.word pnt2_E7A2 ; Game State 8
	.word pnt2_E7D0 ; Game State 9
	.word pnt2_E85F ; JY Easter egg
	.word pnt2_ED75 ; Bonus pipe down
	.word pnt2_EE02 ; Exiting pipe horizontally
	.word pnt2_EE23 ; Exiting pipe upwards
	.word pnt2_EE59 ; Enter 1st cannon pipe
	.word pnt2_EE96 ; Launch out of 1st cannon
	.word pnt2_EEC8 ; Enter 2nd cannon pipe
	.word pnt2_EE96 ; Launch out of 2nd cannon
	.word pnt2_EEC8 ; Enter pipe up
	.word pnt2_ED75
	.word pnt2_EEFD
pnt2_E353:
	LDA yoshiExitStatus
	STA playerYoshiState ; Copy player 2's yoshi to current yoshi
	LDA #$80
	ORA palTransition
	STA palTransition
	LDA #$3C
	STA M90_PRG0 ; Swap bank 60 into 1st PRG slot (This bank is useless. Why?)
	LDA #$3D
	STA M90_PRG1 ; Swap bank 61 into 2nd PRG slot
	JSR jmp_61_B19E
	iNC a:gameState
	RTS
pnt2_E372:
	lDA a:gameSubstate
	ASL
	TAY ; Get the pointer for the current event part
	LDA tbl3_E384,Y
	STA $32 ; Load lower byte of pointer
	LDA tbl3_E384+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer
tbl3_E384:
	.word pnt2_E388
	.word pnt2_E3DD
pnt2_E388:
	LDA #$00
	STA PPUCTRL
	STA ppuCtrlMirror ; Clear PPU control
	STA PPUMASK
	STA ppuMaskMirror ; Clear PPU mask
	LDX #$00 ; Set slot to 0
	TXA
bra3_E397:
	STA objSlot,X ; Clear object slot
	INX ; Move to next slot
	CPX #$14
	BCC bra3_E397 ; Loop until all 20 have been cleared
	STA yoshiUnmountedState ; Remove Yoshi
	JSR sub3_E904 ; Jump
	LDA #$3C
	STA M90_PRG0 ; Swap bank 60 into 1st PRG slot
	LDA #$3D
	STA M90_PRG1 ; Swap bank 61 into 2nd PRG slot
	JSR jmp_61_B38E
	LDA TimerSetting
	STA levelTimer ; Set lower byte of level timer
	STA levelTimer+2 ; Store backup
	LDA TimerSetting+1
	STA levelTimer+1 ; Set upper byte of level timer
	STA levelTimer+3 ; Store backup
	LDA #%00011000
	STA ppuMaskMirror ; Set PPU mask
	LDA #%10001000
	STA PPUCTRL
	STA ppuCtrlMirror ; Set PPU control
	LDA #%01
	STA M90_CHR_CTRL2 ; Set mirroring to horizontal
	JSR sub3_F0CB ; Jump
	iNC a:gameSubstate ; Go to next part of event
	RTS

TimerSetting: .word 300 ; Timer data for levels

pnt2_E3DD:
	LDA #$00
	STA fadeoutMode ; Disable "blackout" effect
	JSR sub3_E6E0
	JSR sub3_F919
	LDA #$00
	STA $52
	sTA a:gameSubstate ; End level transition
	LDA prgDataBank2
	CMP #$23
	BNE bra3_E405 ; Check if using the tileset PRG bank for the castle or ghost house intro

	; If using an intro level, continue as normal
	LDA cameraXHi
	BNE bra3_E405 ; Make sure the camera is on the first screen
	LDA levelNumber
	BEQ bra3_E405 ; Make sure the player isn't in the first level of a world
	LDA #$05
	sTA a:gameState ; Trigger castle/ghost house intro
	RTS
	; Otherwise, start the level as normal.
	bra3_E405:
		iNC a:gameState
		RTS

;----------------------------------------
; DEFAULT GAME STATE ($E409)
;----------------------------------------
pnt2_E409:
	lDA a:gameSubstate
	BEQ @continue
	JMP loc3_E498 ; Jump if in the level exit substate

@continue:
	LDX #$02
	LDA tbl3_EF08,X
	STA nmiJmpOpcode+1 ; Set the high byte of the NMI jump
	LDA pauseFlag
	BNE bra3_E442 ; Branch if the game is paused
	LDA #$39
	STA M90_PRG1 ; Swap the player control bank into the 2nd PRG slot
	LDA endingFreezeFlag
	BNE bra3_E42B ; Branch if the ending cutscene is playing
	JSR jmp_57_ACAC ; Jump
bra3_E42B:
	LDA $06EF
	BEQ bra3_E437
	LDA #$00
	STA $06EF
	STA playerXSpd ; Clear player's X speed
bra3_E437:
	LDA levelWaterFlag
	BEQ bra3_E445 ; Branch if not underwater
	LDA frameCount
	AND #$01
	BEQ bra3_E445
bra3_E442:
	JMP loc3_E45F ; Jump
bra3_E445:
	JSR sub3_ED14
	LDA pSwitchTimer
	BEQ loc3_E45F ; Branch if P-Switch timer is up
	INC pSwitchFrameCount ; Increment frame count
	LDA pSwitchFrameCount
	CMP #$3B
	BCC loc3_E45F ; After 60 frames pass,
	DEC pSwitchTimer ; Decrease timer
	LDA #$00
	STA pSwitchFrameCount ; Clear frame count

loc3_E45F:
	LDA endingFreezeFlag
	BNE bra3_E47C ; Don't let the player unpause at the ending cutscene
	; If not in ending cutscene:
		LDA btnPressed
		AND #BTN_START
		BEQ bra3_E47C
		; If start was pressed:
			LDA #$00
			STA jyEasterEggInput ; Clear Easter egg button combo input
			LDA pauseFlag
			EOR #$01
			STA pauseFlag ; Toggle pause flag
			LDA #SFX_PAUSE
			STA sndSfx ; Play pause/unpause sound

bra3_E47C:
	LDA pauseFlag
	BEQ bra3_E494 ; Stop if game isn't paused
	; If game is paused:
		JSR jYButtonComboCheck ; Check for Easter egg button combo
		LDA btnPressed
		AND #BTN_SELECT
		BEQ bra3_E494 ; Stop if select isn't pressed
		; If select pressed:
			iNC a:gameSubstate ; Enter level exit state if
			LDX curPlayer
			INC playerLives,X ; Temporarily increment current player's life count

bra3_E494:
	JSR hUD_Update ; Update HUD before stopping
	RTS

loc3_E498:
	LDA #$00
	STA fadeoutMode ; Disable BG 'blackout' effect
	JSR sub3_E6D5 ; Jump
	JSR sub3_F919 ; Jump
	JSR sub3_E904 ; Jump
	LDA #$00
	STA pauseFlag ; Unpause the game
	STA a:inLvlFlag ; Not in a level anymore
	sTA a:gameSubstate
	LDA #GAMESTATE_MAPEXITLEVEL_TRANS
	sTA a:gameState ; Set to transition state for exiting a level
	JSR backupplayerPowerups
	RTS

;----------------------------------------
; SUBROUTINE ($E4BA)
; Backup the player's powerup and Yoshi.
;----------------------------------------
backupplayerPowerups:
	LDX curPlayer ; Set index for current player
	LDA playerPowerup
	STA playerStoredPowerup,X ; Backup player's powerup
	LDA yoshiExitStatus
	STA playerStoredYoshi,X ; Backup the player's Yoshi
	RTS

pnt2_E4CA:
	lDA a:gameSubstate
	ASL
	TAY
	LDA tbl3_E4DC,Y
	STA $32
	LDA tbl3_E4DC+1,Y
	STA $33
	JMP ($32)
tbl3_E4DC:
	.word pnt2_E4E4
	.word pnt2_E4EC
	.word pnt2_E4F7
	.word pnt2_E509
pnt2_E4E4:
	LDA #SFX_WARP
	STA sndSfx ; Play warp sound
	iNC a:gameSubstate
	RTS
pnt2_E4EC:
	LDX #$00
	LDY #$3C
	JSR sub3_E5B6 ; Jump
	iNC a:gameSubstate
	RTS
pnt2_E4F7:
	LDA #$00
	STA fadeoutMode ; Disable BG 'blackout' effect
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	iNC a:gameSubstate ; Go to next part of event
	RTS
pnt2_E509:
	LDY warpLvlNumber ; Load pointers based on level number of warp
	LDA tbl3_EB24,Y
	STA $32 ; Store lower byte of 1st pointer
	LDA tbl3_EB24+1,Y
	STA $33 ; Store upper byte of 1st pointer
	LDA tbl3_EA10,Y
	STA $34 ; Store lower byte of 2nd pointer
	LDA tbl3_EA10+1,Y
	STA $35 ; Store upper byte of 2nd pointer
	JSR sub3_E870 ; Jump
	LDA #$01
	sTA a:gameState ; Trigger door exit
	LDA #$00
	sTA a:gameSubstate ; Go to 1st event part
	STA $06DE
	STA $06DF
	RTS
pnt2_E534:
	lDA a:gameSubstate ; Load part of event
	ASL ; Multiply by 2
	TAY ; Load pointer based on event part
	LDA tbl3_E546,Y
	STA $32 ; Load lower byte of pointer
	LDA tbl3_E546+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer
tbl3_E546:
	.word pnt2_E54E
	.word pnt2_E570
	.word pnt2_E585
	.word pnt2_E597
pnt2_E54E:
	LDA #$11
	STA playerAction ; Set action to "dying"
	LDA #$00
	STA playerAttrs ; Clear player's attributes
	STA playerXSpd ; Clear player's X speed
	STA playerYSpd ; Clear player's Y speed
	JSR sub3_E5D4 ; Jump
	LDA #MUS_DEATH
	STA sndMusic ; Play death music
	LDX #$00 ; Set action tick count to 1
	LDY #$28 ; Set tick length to 40 frames
	JSR sub3_E5B6 ; Jump
	JSR hUD_Update ; Jump
	iNC a:gameSubstate ; Start level transition
	RTS
pnt2_E570:
	LDA #$00
	STA playerXSpd ; Clear X speed
	LDA #$70
	STA playerYSpd ; Set Y speed to 70h
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Make player move up
	JSR sub3_E5D4
	iNC a:gameSubstate
	RTS
pnt2_E585:
	LDA #$00
	STA playerXSpd ; Clear X speed
	JSR sub3_E5D4 ; Jump
	LDX #$04 ; Set action tick count to 4
	LDY #$3B ; Set tick length to 59 frames
	JSR sub3_E5B6 ; Jump
	iNC a:gameSubstate ; Start level transition
	RTS
pnt2_E597:
	LDA #$00
	STA fadeoutMode ; Disable BG blackout flag
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA a:inLvlFlag ; Set game state for map
	sTA a:gameSubstate ; Go to first part of event
	LDA #$16
	sTA a:gameState ; Trigger map fade-in
	JSR backupplayerPowerups
	RTS
sub3_E5B6:
	INC playerActionFrameCount ; Increment frame count for player action
	CPY playerActionFrameCount
	BCS bra3_E5CB ; Branch when loaded action tick length is exceeded
	LDA #$00
	STA playerActionFrameCount ; Clear action frame count
	INC playerActionTicks ; Increase action tick
	CPX playerActionTicks
	BCC bra3_E5CE ; Branch if the loaded tick count isn't reached
bra3_E5CB:
	PLA
	PLA ; Pull accumulator from stack twice (Not sure what this is for)
	RTS
bra3_E5CE:
	LDA #$00
	STA playerActionTicks ; Clear action tick count
	RTS
sub3_E5D4:
	LDA #$39
	STA M90_PRG1 ; Swap player bank into 2nd PRG slot
	JSR jmp_57_ACA5
	JSR jmp_57_A000
	LDA #$36
	STA M90_PRG1 ; Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A150
	JSR jmp_54_A0D9
	JSR jmp_54_A000
	LDA #$3D
	STA M90_PRG1 ; Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F
	LDA #$00
	STA objFrameCount
	LDA #$34
	STA M90_PRG1 ; Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A080 ; Jump
	JSR jmp_52_A089 ; Jump
	JSR RenderplayerItemBoxSprite ; Jump
	JSR sub3_E9C4 ; Jump
	RTS
pnt2_E610:
	JSR sub3_ED14 ; Jump
	JSR hUD_Update ; Jump
	LDA btnPressed
	AND #BTN_A|BTN_B
	BEQ bra3_E62F ; If A or B are pressed,
	LDA #$00
	STA playerYoshiState ; Remove Yoshi
	LDA #$39
	STA M90_PRG1 ; Swap player bank into 2nd PRG slot
	JSR sub4_A14A ; Jump
	LDA #$03
	sTA a:gameSubstate ; Skip to 3rd part of event
bra3_E62F:
	lDA a:gameSubstate ; Load event part
	ASL ; Multiply by 2
	TAY ; Load pointer based on event part
	LDA tbl3_E641,Y
	STA $32 ; Load lower byte of pointer
	LDA tbl3_E641+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer
tbl3_E641:
	.word pnt2_E649
	.word pnt2_E68B
	.word pnt2_E69E
	.word pnt2_E6B0
pnt2_E649:
	LDA playerYSpd
	BNE bra3_E68A ; Branch if moving vertically
	LDA #$01
	STA playerAction ; Set action to walking
	LDA #$10
	STA playerXSpd ; Set walking speed to 10h
	LDA playerMoveFlags
	AND #$BE
	STA playerMoveFlags ; Make player face right
	LDA playerSprX
	CMP #$80 ; If player hasn't reached this point,
	BCC bra3_E68A ; stop
	LDA playerYoshiState
	BEQ bra3_E681 ; Branch if player doesn't have Yoshi
	JSR sub3_E965 ; Jump
	LDA #$01
	STA yoshiExitStatus ; Set Yoshi for Player 2
	LDA #$50
	STA playerYSpd ; Set Y speed to 50h
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Set movement to 'moving up'
	LDA #$05
	STA playerAction ; Do spin jump
	LDA #SFX_SPINJUMP
	STA sndSfx ; Play spin jump sound
	RTS
bra3_E681:
	LDA playerSprX
	CMP #$B0 ; If player hasn't reached this point,
	BCC bra3_E68A ; stop
	iNC a:gameSubstate ; Set level transition
bra3_E68A:
	RTS
pnt2_E68B:
	LDA #$08
	STA playerAction ; Make player look up
	LDA #$00
	STA playerXSpd ; Clear player's X speed
	LDX #$01
	LDY #$3B
	JSR sub3_E5B6 ; Jump
	iNC a:gameSubstate ; Go to next part of event
	RTS
pnt2_E69E:
	LDA #$01
	STA playerAction ; Set action to walking
	LDA #$10
	STA playerXSpd ; Set walking speed to 10h
	LDA playerSprX
	CMP #$C8 ; If player hasn't reached this point,
	BCC bra3_E6AF ; stop
	iNC a:gameSubstate ; Go to next part of event
bra3_E6AF:
	RTS
pnt2_E6B0:
	LDA worldNumber ; Load world number
	ASL
	ASL ; Multiply it by 4
	CLC
	ADC levelNumber ; Add it to level number to get total level number
	ASL ; Multiply result by 2
	STA warpLvlNumber ; Store as warp level number
	LDA #$00
	STA warpNumber ; Set level warp to 0
	LDA #$03
	sTA a:gameState ; Enter door
	LDA #$00
	sTA a:gameSubstate ; Set event part
	STA playerActionFrameCount ; Disable action frame counter
	STA playerActionTicks ; Disable action timer
	STA playerAction ; Clear player action
	RTS

;----------------------------------------
; SUBROUTINE ($E6D5)
;----------------------------------------
sub3_E6D5:
	LDA palTransition
	AND #$80
	BEQ bra3_E6EC ; Branch if the palette transition is already set??
	LDA #$05 ; If it isn't, set it
	BNE bra3_E6E9

;----------------------------------------
; SUBROUTINE ($E6E0)
;----------------------------------------
sub3_E6E0:
	LDA palTransition
	AND #$80 ; If palette transition not set,
	BEQ bra3_E6EC
	LDA #$00

bra3_E6E9:
	STA palTransition

bra3_E6EC:
	RTS

pnt2_E6ED:
	LDA #$39
	STA M90_PRG1 ; Swap player bank into 2nd PRG slot
	JSR jmp_57_A000 ; Jump
	LDA #$36
	STA M90_PRG1 ; Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A000 ; Jump
	LDA #$34
	STA M90_PRG1 ; Swap bank 52 into 2nd PRG slot
	LDA #$3D
	STA M90_PRG1 ; Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F ; Jump
	JSR sub3_E9C4
	lDA a:gameSubstate ; Load event part
	ASL
	TAY ; Load pointer based on event part
	LDA tbl3_E71F,Y
	STA $32 ; Load lower byte of pointer
	LDA tbl3_E71F+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer
tbl3_E71F:
	.word pnt2_E727
	.word pnt2_E748
	.word pnt2_E769
	.word pnt2_E774
pnt2_E727:
	LDA playerYSpd
	BNE bra3_E747 ; If player not moving vertically,
	LDA #$01
	STA fadeoutMode ; Start BG 'blackout' effect
	JSR sub3_E6D5 ; Jump
	JSR sub3_F919 ; Jump
	LDA #$01
	STA playerAction ; Set action to walking
	LDA #$20
	STA playerXSpd ; Set walking speed to 20h
	LDA playerMoveFlags
	AND #$BE
	STA playerMoveFlags ; Make player face right
	iNC a:gameSubstate ; Go to next part of event
bra3_E747:
	RTS
pnt2_E748:
	LDA #$10
	STA playerXSpd ; Set walking speed to 10h
	LDA playerSprX
	CMP #$98
	BCC bra3_E768 ; If player's sprite reaches this point...
	LDA #$10
	STA playerAction ; ...Do victory pose 
	LDA #$00
	STA playerXSpd ; Stop moving horizontally
	LDA #$01
	STA fadeoutMode ; Start BG 'blackout' effect
	JSR sub3_E6E0 ; Jump
	JSR sub3_F919 ; Jump
	iNC a:gameSubstate ; Go to next part of event
bra3_E768:
	RTS
pnt2_E769:
	LDX #$02
	LDY #$3B
	JSR sub3_E5B6
	iNC a:gameSubstate ; Go to next part of event
	RTS
pnt2_E774:
	LDA #$01
	STA unlockNextLevel ; Unlock next level
	STA playerAction ; Set action to walking
	LDA #$20
	STA playerXSpd ; Set walking speed to 20h
	LDA #$00
	STA fadeoutMode ; Stop BG 'blackout' effect
	JSR sub3_E6D5 ; Jump
	JSR sub3_F919 ; Jump
	JSR sub3_E904 ; Jump
	LDA #$00
	STA a:inLvlFlag ; Set game state to be outside a level
	sTA a:gameSubstate ; Clear event part
	LDA #$16
	sTA a:gameState ; Set event number to 16h
	JSR backupplayerPowerups ; Jump
	RTS
pnt2_E79E:
	iNC a:gameState ; Increment event number (go right to next event)
	RTS
pnt2_E7A2:
	LDA #$39
	STA M90_PRG1 ; Swap player bank (bank 57) into 2nd PRG slot
	JSR jmp_57_ACA5 ; Jump
	JSR jmp_57_AD04 ; Jump
	JSR jmp_57_A000 ; Jump
	LDA #$36
	STA M90_PRG1 ; Swap bank 54 into 2nd PRG slot
	LDA #$00
	STA objFrameCount
	LDA #$34
	STA M90_PRG1 ; Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A080 ; Jump
	JSR jmp_52_A089 ; Jump
	JSR RenderplayerItemBoxSprite ; Jump
	JSR sub3_E9C4 ; Jump
	RTS
pnt2_E7D0:
	LDA #$39
	STA M90_PRG1 ; Swap player bank (bank 57) into 2nd PRG slot
	JSR jmp_57_A000 ; Jump
	LDA #$36
	STA M90_PRG1 ; Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A150 ; Jump
	JSR jmp_54_A07E ; Jump
	JSR jmp_54_A000 ; Jump
	LDA #$3D
	STA M90_PRG1 ; Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F ; Jump
	LDA #$34
	STA M90_PRG1 ; Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A089 ; Jump
	JSR sub3_E9C4 ; Jump
	lDA a:gameSubstate
	ASL
	TAY ; Load pointer based on event part
	LDA tbl3_E80F,Y
	STA $32 ; Load lower byte of pointer
	LDA tbl3_E80F+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer
tbl3_E80F:
	.word pnt2_E813
	.word pnt2_E81E
pnt2_E813:
	LDX #$06
	LDY #$3B
	JSR sub3_E5B6
	iNC a:gameSubstate
	RTS
pnt2_E81E:
	LDY #$03
	LDA #$01
	BEQ bra3_E826
	LDY #$06
bra3_E826:
	STY $32
	LDY #$01
	LDA worldNumber
	CMP $32
	BNE bra3_E83D
	LDA levelNumber
	CMP #$03
	BNE bra3_E83D
	STY $037E
	BNE bra3_E840
bra3_E83D:
	STY unlockNextLevel
bra3_E840:
	LDA #$00
	STA fadeoutMode ; Disable BG 'blackout' effect
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA a:inLvlFlag ; Set game state to 'not in level'
	sTA a:gameSubstate ; Set event part
	LDA #$16
	sTA a:gameState
	JSR backupplayerPowerups
	RTS
pnt2_E85F:
	lDA a:gameSubstate
	BNE bra3_E86F ; Branch if not on 1st event part
	LDA #$3D
	STA M90_PRG1 ; Swap level handling bank into 2nd PRG slot
	JSR jmp_61_BE85 ; Jump
	iNC a:gameSubstate ; Go to next event part
bra3_E86F:
	RTS
sub3_E870:
	LDY warpNumber
	LDX #$01
	STX interruptMode ; Set horizontal interrupt for levels
	LDA ($32),Y ; Load warp X screen from pointer
	AND #%01111111 ; Mask out bit 7
	STA cameraXHi ; Store as camera X screen
	STA playerCollXHi ; Store as wall collision position
	LDA #$00
	STA $52
	STA playerCollXLo ; reset player collision and sprite positioning?
	INY ; Move to next byte
	LDA ($32),Y
	STA $53
	ASL
	STA vertScrollFlag
	LDA #$00
	STA playerCollYHi
	STA $54
	STA playerCollYLo
	LDA cameraXHi
	STA playerXHi ; Move player to same X screen as the camera
	INY
	LDA ($32),Y
	STA playerXLo
	STA playerSprX ; Get X position
	LDA $53
	STA playerYHi ; Move the player to the same Y screen as the camera
	INY
	LDA ($32),Y
	STA playerYLo
	STA playerSprY ; Get Y position
	INY ; Move to next byte
	LDA ($32),Y
	STA horizScrollLock ; Set horizontal scroll lock
	INY ; Move to next byte
	LDA ($32),Y
	STA levelXScreenCount ; Set horizontal screen count
	INY ; Move to next byte
	LDA ($32),Y
	STA vertScrollLock ; Set vertical scroll lock
	INY ; Move to next byte
	LDA ($32),Y
	STA levelYScreenCount ; Set vertical screen count
	LDA warpNumber ; Load warp number
	LSR ; Divide it by 2
	TAY ; Load pointer based on the result
; First byte of level settings
	LDA ($34),Y ; Load byte from 2nd pointer location
	AND #%00100000
	STA playerAttrs ; Mask out and store BG priority bit
	STA $06E1
	LDA ($34),Y
	AND #%11000000
	STA levelWaterFlag ; Mask out and store underwater bit
	LDA ($34),Y
	AND #%11011111 ; Clear BG priority bit
	STA prgDataBank1 ; Store as level bank/number
	INY
; Second byte of level settings
	LDA ($34),Y ; Load next byte from 2nd pointer location
	CMP #$32
	BNE bra3_E8ED
	LDA #$04 ; If the level is the final boss room, set the interrupt mode accordingly
	STA interruptMode
bra3_E8ED:
	LDA #$3D
	STA M90_PRG1
	LDA ($34),Y
	JSR sub6_B34A
	INY
	LDA ($34),Y
	STA prgDataBank2
	INY
	LDA ($34),Y
	STA bgCurPalette
	RTS
sub3_E904:
	JSR sub3_F176 ; Jump
	JSR sub3_E959 ; Jump
	LDA #$01
	STA yoshiIdleStorage
	STA yoshiTongueState
	LDA #$90
	STA chrSpriteBank2 ; Load bank 90h into 2nd sprite bank
	LDA #$00
	STA playerXSpd
	STA playerYSpd
	STA playerMoveFlags
	STA $1A
	STA playerAction
	sTA a:playerState
	STA playerActionFrameCount
	STA playerActionTicks
	STA $0613
	STA $0614
	STA $0629
	STA $0627
	STA playerHoldFlag
	STA invincibilityTimer ; Clear ALL player variables
	LDA #$39
	STA M90_PRG1 ; Swap player bank (bank 57) into 2nd PRG slot
	JSR sub4_A14A ; Jump
	JSR jmp_57_A000 ; Jump
	JSR sub3_E9C4 ; Jump
	LDX #$70
	LDA #$00
bra3_E950:
	STA bgTileAttrs,X ; Clear tile attribute
	INX
	CPX #$80 ; Keep going until all attributes are cleared
	BCC bra3_E950
	RTS
sub3_E959:
	LDA #$00
	TAX ; Clear X register
bra3_E95C:
	STA $03CE,X
	INX
	CPX #$16
	BCC bra3_E95C
	RTS
sub3_E965:
	LDA playerYoshiState
	BEQ bra3_E9C3 ; If player has Yoshi,
	LDA playerMoveFlags
	STA yoshiIdleMovement ; Set Yoshi's idle movement
	LDA #$00
	STA playerYoshiState ; Stop riding Yoshi
	LDA #$39
	STA M90_PRG1 ; Swap player bank into 2nd PRG slot
	JSR sub4_A14A ; Jump
	LDA #$02
	STA yoshiUnmountedState ; Set Yoshi to be ducking down
	LDA playerYLoDup
	SEC
	SBC #$20 ; Subtract player's Y position by 20h
	STA yoshiYLo ; Set as Yoshi's Y position
	LDA playerYHiDup
	SBC #$00
	STA yoshiYHi ; Set Yoshi's Y screen
	LDA playerMoveFlags
	ORA #$01
	STA playerMoveFlags ; Set movement to dismounting Yoshi (right)
	LDY #$08 ; Set Yoshi X displacement for facing right
	LDA yoshiIdleMovement
	AND #$40
	BEQ bra3_E9A7 ; Branch if Yoshi is facing right
	LDA playerMoveFlags
	AND #$FE
	STA playerMoveFlags ; Set movement to dismounting Yoshi (left)
	LDY #$18 ; Load Yoshi X displacement for facing left
bra3_E9A7:
	STY $32 ; Store loaded X displacement temporarily 
	SEC
	LDA playerXLoDup
	SBC $32 ; Subtract player's X position by loaded displacement
	STA yoshiXLo ; Store result as Yoshi's X position
	LDA playerXHiDup
	SBC #$00 ; Subtract player's X screen by nothing
	STA yoshiXHi ; Store result as Yoshi's X screen
	LDA #$00
	STA $05F6
	LDA #$30
	STA playerXSpd ; Set player's X speed to 30h
	INC objCount ; Add Yoshi to total object count
bra3_E9C3:
	RTS
sub3_E9C4:
	LDA #$14
	STA $3C
	LDA #$39
	STA M90_PRG1 ; Swap player control bank into 2nd PRG slot
	JSR jmp_57_A23B
	JSR jmp_57_A8DE
	LDA #$34
	STA M90_PRG1 ; Swap bank 52 into 2nd PRG slot
	JSR jmp_52_A0F3
	RTS
jYButtonComboCheck:
	LDA btnPressed
	CMP #BTN_START
	BEQ jYTriggerDone ; Stop if the game is unpaused.
	LDA btnPressed
	BEQ jYTriggerDone ; If any button is being pressed,
	LDX jyEasterEggInput ; Load correct input count
	BMI jYTriggerDone
	CMP jYScreenInputs,X
	BNE clearJYInputs ; Start over if the wrong button is pressed
	INC jyEasterEggInput ; Continue with each correct input
	LDA jyEasterEggInput
	CMP #$08
	BCC jYTriggerDone ; Wait for all 8 inputs to be entered correctly
	LDA #$0A
	sTA a:gameState ; Trigger JY Easter egg screen
jYTriggerDone:
	RTS
clearJYInputs:
	LDA #$00
	STA jyEasterEggInput ; Clear correct input count
	RTS
	
; This is the 8 button code needed to trigger the JY easter egg screen
jYScreenInputs:
	.byte BTN_UP, BTN_RIGHT, BTN_A, BTN_DOWN, BTN_RIGHT, BTN_B, BTN_UP, BTN_LEFT
tbl3_EA10:
	.word pnt2_EA48
	.word pnt2_EA48
	.word pnt2_EA48
	.word pnt2_EA48
	.word pnt2_EA48
	.word pnt2_EA48
	.word pnt2_EA54
	.word pnt2_EA70
	.word pnt2_EA48
	.word pnt2_EA48
	.word pnt2_EA80
	.word pnt2_EA9C
	.word pnt2_EA48
	.word pnt2_EA48
	.word pnt2_EA48
	.word pnt2_EAA8
	.word pnt2_EA48
	.word pnt2_EAB4
	.word pnt2_EA48
	.word pnt2_EAD0
	.word pnt2_EA48
	.word pnt2_EADC ; 6-2
	.word pnt2_EA48
	.word pnt2_EAE8
	.word pnt2_EA48
	.word pnt2_EA48
	.word pnt2_EAF4
	.word pnt2_EB10
pnt2_EA48:
	.byte $03
	.byte $03
	.byte $1C
	.byte $03
	.byte $03
	.byte $03
	.byte $1C
	.byte $21
	.byte $0F
	.byte $0F
	.byte $1F
	.byte $20
pnt2_EA54:
	.byte $06
	.byte $06
	.byte $1D
	.byte $06
	.byte $06
	.byte $06
	.byte $1D
	.byte $06
	.byte $06
	.byte $06
	.byte $1D
	.byte $06
	.byte $06
	.byte $06
	.byte $1D
	.byte $06
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $06
	.byte $06
	.byte $1D
	.byte $06
pnt2_EA70:
	.byte $07
	.byte $07
	.byte $1D
	.byte $20
	.byte $07
	.byte $07
	.byte $1D
	.byte $20
	.byte $07
	.byte $07
	.byte $1D
	.byte $21
	.byte $07
	.byte $07
	.byte $1D
	.byte $1E
pnt2_EA80:
	.byte $0A
	.byte $0A
	.byte $1E
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $1E
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $1E
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $1E
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $1E
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $1E
	.byte $0A
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt2_EA9C:
	.byte $0B
	.byte $0B
	.byte $1E
	.byte $21
	.byte $0B
	.byte $0B
	.byte $1E
	.byte $21
	.byte $0B
	.byte $0B
	.byte $1E
	.byte $1F
pnt2_EAA8:
	.byte $0F
	.byte $0F
	.byte $1F
	.byte $21
	.byte $0F
	.byte $0F
	.byte $1F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $1F
	.byte $20
pnt2_EAB4:
	.byte $11
	.byte $11
	.byte $20
	.byte $11
	.byte $11
	.byte $11
	.byte $20
	.byte $11
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
	.byte $11
	.byte $11
	.byte $20
	.byte $11
	.byte $11
	.byte $11
	.byte $20
	.byte $11
	.byte $11
	.byte $11
	.byte $20
	.byte $11
pnt2_EAD0:
	.byte $13
	.byte $13
	.byte $20
	.byte $13
	.byte $13
	.byte $13
	.byte $20
	.byte $13
	.byte $07
	.byte $07
	.byte $1D
	.byte $23
pnt2_EADC:
	.byte $15
	.byte $16
	.byte $21
	.byte $15
	.byte $15
	.byte $16
	.byte $21
	.byte $15
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt2_EAE8:
	.byte $17
	.byte $17
	.byte $21
	.byte $17
	.byte $17
	.byte $17
	.byte $21
	.byte $17
	.byte $0B
	.byte $0B
	.byte $1E
	.byte $1F
pnt2_EAF4:
	.byte $1A
	.byte $1A
	.byte $22
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $22
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $22
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $22
	.byte $1A
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
	.byte $1A
	.byte $1A
	.byte $22
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $22
	.byte $1A
pnt2_EB10:
	.byte $1B
	.byte $1B
	.byte $22
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $22
	.byte $1B
	.byte $3B
	.byte $1B
	.byte $22
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $22
	.byte $1B
	.byte $3B
	.byte $32
	.byte $26
	.byte $24
tbl3_EB24:
	.word pnt2_EB5C
	.word pnt2_EB5C
	.word pnt2_EB5C
	.word pnt2_EB5C
	.word pnt2_EB5C
	.word pnt2_EB5C
	.word pnt2_EB74
	.word pnt2_EBAC
	.word pnt2_EB5C
	.word pnt2_EB5C
	.word pnt2_EBCC
	.word pnt2_EC04
	.word pnt2_EB5C
	.word pnt2_EB5C
	.word pnt2_EB5C
	.word pnt2_EC1C
	.word pnt2_EB5C
	.word pnt2_EC34
	.word pnt2_EB5C
	.word pnt2_EC6C
	.word pnt2_EB5C
	.word pnt2_EC84
	.word pnt2_EB5C
	.word pnt2_EC9C
	.word pnt2_EB5C
	.word pnt2_EB5C
	.word pnt2_ECB4
	.word pnt2_ECEC
pnt2_EB5C:
	.byte $00 ; warp data start here
	.byte $00
	.byte $40
	.byte $B0
	.byte $FF
	.byte $07
	.byte $FF
	.byte $00
	.byte $89
	.byte $00
	.byte $40
	.byte $B0
	.byte $08
	.byte $0D
	.byte $FF
	.byte $00
	.byte $10
	.byte $01
	.byte $40
	.byte $A0
	.byte $0F
	.byte $10
	.byte $00
	.byte $01
pnt2_EB74:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $06
	.byte $FF
	.byte $01
	.byte $08
	.byte $01
	.byte $40
	.byte $B0
	.byte $07
	.byte $09
	.byte $FF
	.byte $01
	.byte $0C
	.byte $01
	.byte $80
	.byte $A0
	.byte $0A
	.byte $0C
	.byte $FF
	.byte $01
	.byte $09
	.byte $01
	.byte $80
	.byte $A0
	.byte $07
	.byte $09
	.byte $FF
	.byte $01
	.byte $01
	.byte $00
	.byte $20
	.byte $C0
	.byte $00
	.byte $02
	.byte $FF
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $0E
	.byte $01
	.byte $20
	.byte $B0
	.byte $0D
	.byte $0E
	.byte $FF
	.byte $01
pnt2_EBAC:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $02
	.byte $FF
	.byte $01
	.byte $06
	.byte $01
	.byte $70
	.byte $B0
	.byte $03
	.byte $06
	.byte $FF
	.byte $01
	.byte $08
	.byte $01
	.byte $40
	.byte $B0
	.byte $07
	.byte $0E
	.byte $00
	.byte $01
	.byte $10
	.byte $01
	.byte $40
	.byte $A0
	.byte $0F
	.byte $10
	.byte $00
	.byte $01
pnt2_EBCC:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $04
	.byte $00
	.byte $01
	.byte $0A
	.byte $01
	.byte $88
	.byte $B0
	.byte $05
	.byte $0B
	.byte $FF
	.byte $01
	.byte $02
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $04
	.byte $00
	.byte $01
	.byte $0D
	.byte $01
	.byte $88
	.byte $B0
	.byte $0B
	.byte $0E
	.byte $00
	.byte $01
	.byte $04
	.byte $01
	.byte $88
	.byte $B0
	.byte $FF
	.byte $04
	.byte $00
	.byte $01
	.byte $06
	.byte $01
	.byte $40
	.byte $70
	.byte $05
	.byte $0B
	.byte $FF
	.byte $01
	.byte $01
	.byte $00
	.byte $20
	.byte $C0
	.byte $00
	.byte $02
	.byte $FF
	.byte $00
pnt2_EC04:
	.byte $00
	.byte $00
	.byte $40
	.byte $40
	.byte $FF
	.byte $09
	.byte $FF
	.byte $00
	.byte $00
	.byte $01
	.byte $40
	.byte $60
	.byte $FF
	.byte $0B
	.byte $00
	.byte $01
	.byte $0D
	.byte $01
	.byte $40
	.byte $80
	.byte $0C
	.byte $0D
	.byte $00
	.byte $01
pnt2_EC1C:
	.byte $00
	.byte $01
	.byte $40
	.byte $80
	.byte $FF
	.byte $05
	.byte $00
	.byte $01
	.byte $06
	.byte $01
	.byte $40
	.byte $90
	.byte $05
	.byte $0D
	.byte $FF
	.byte $01
	.byte $10
	.byte $01
	.byte $40
	.byte $A0
	.byte $0F
	.byte $10
	.byte $00
	.byte $01
pnt2_EC34:
	.byte $00
	.byte $01
	.byte $40
	.byte $80
	.byte $FF
	.byte $0A
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $30
	.byte $B0
	.byte $FF
	.byte $07
	.byte $FF
	.byte $00
	.byte $01
	.byte $00
	.byte $20
	.byte $C0
	.byte $00
	.byte $02
	.byte $FF
	.byte $00
	.byte $01
	.byte $00
	.byte $20
	.byte $C0
	.byte $00
	.byte $02
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $30
	.byte $B0
	.byte $FF
	.byte $07
	.byte $FF
	.byte $00
	.byte $06
	.byte $01
	.byte $70
	.byte $80
	.byte $FF
	.byte $0A
	.byte $00
	.byte $01
	.byte $06
	.byte $01
	.byte $70
	.byte $80
	.byte $FF
	.byte $0A
	.byte $00
	.byte $01
pnt2_EC6C:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $05
	.byte $00
	.byte $01
	.byte $06
	.byte $01
	.byte $40
	.byte $B0
	.byte $05
	.byte $11
	.byte $00
	.byte $01
	.byte $10
	.byte $01
	.byte $40
	.byte $A0
	.byte $0F
	.byte $10
	.byte $00
	.byte $01
pnt2_EC84:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $0B
	.byte $00
	.byte $01
	.byte $0C
	.byte $01
	.byte $40
	.byte $B0
	.byte $0B
	.byte $11
	.byte $00
	.byte $01
	.byte $01
	.byte $00
	.byte $20
	.byte $C0
	.byte $00
	.byte $02
	.byte $FF
	.byte $00
pnt2_EC9C:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $08
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $40
	.byte $40
	.byte $FF
	.byte $0B
	.byte $FF
	.byte $00
	.byte $0D
	.byte $01
	.byte $40
	.byte $80
	.byte $0C
	.byte $0D
	.byte $00
	.byte $01
pnt2_ECB4:
	.byte $00
	.byte $01
	.byte $20
	.byte $B0
	.byte $FF
	.byte $04
	.byte $00
	.byte $01
	.byte $0C
	.byte $01
	.byte $88
	.byte $90
	.byte $09
	.byte $11
	.byte $00
	.byte $01
	.byte $09
	.byte $01
	.byte $48
	.byte $B0
	.byte $04
	.byte $09
	.byte $00
	.byte $01
	.byte $05
	.byte $01
	.byte $30
	.byte $B0
	.byte $04
	.byte $09
	.byte $00
	.byte $01
	.byte $01
	.byte $00
	.byte $20
	.byte $C0
	.byte $00
	.byte $02
	.byte $FF
	.byte $00
	.byte $00
	.byte $01
	.byte $30
	.byte $B0
	.byte $FF
	.byte $04
	.byte $00
	.byte $01
	.byte $04
	.byte $01
	.byte $48
	.byte $90
	.byte $FF
	.byte $04
	.byte $00
	.byte $01
pnt2_ECEC:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $02
	.byte $00
	.byte $01
	.byte $03
	.byte $01
	.byte $40
	.byte $B0
	.byte $02
	.byte $05
	.byte $00
	.byte $01
	.byte $06
	.byte $01
	.byte $30
	.byte $90
	.byte $05
	.byte $0A
	.byte $FF
	.byte $01
	.byte $0B
	.byte $01
	.byte $40
	.byte $B0
	.byte $0A
	.byte $11
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
sub3_ED14:
	LDA #$39
	STA M90_PRG1 ; Swap player bank into 2nd PRG slot
	JSR jmp_57_A000
	LDA #$36
	STA M90_PRG1 ; Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A150
	JSR jmp_54_A07E
	JSR jmp_54_A000
	LDA #$3D
	STA M90_PRG1 ; Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F
	LDA #$34
	STA M90_PRG1 ; Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A080
	JSR jmp_52_A089
	JSR RenderplayerItemBoxSprite
	JSR sub3_E9C4 ; Jump
	RTS
sub3_ED48:
	LDA #$24
	STA M90_PRG2 ; Swap bank 36 into 3rd PRG slot
	LDA SpecialWarpCoords,Y
	STA $32 ; Load lower byte of warp coord pointer
	LDA SpecialWarpCoords+1,Y
	STA $33 ; Load upper byte of warp coord pointer
	LDA SpecialWarpSettings,Y
	STA $34 ; Load lower byte of warp level pointer
	LDA SpecialWarpSettings+1,Y
	STA $35 ; Load upper byte of warp level pointer
	LDA #$00
	STA warpNumber ; Set warp number to 0
	JSR sub3_E870
	iNC a:gameSubstate ; Go to next part of event
	LDA #$00
	STA $06DE
	STA $06DF
	RTS
pnt2_ED75:
	lDA a:gameSubstate ; Load event part
	ASL
	TAY ; Load pointer based on event part
	LDA tbl3_ED87,Y
	STA $32 ; Load lower byte of pointer
	LDA tbl3_ED87+1,Y
	STA $33 ; Load upper byte of pointer
	JMP ($32) ; Jump to loaded pointer location
tbl3_ED87:
	.word pnt2_ED93
	.word pnt2_EDAA
	.word pnt2_EDCF
	.word pnt2_EDE1
	.word pnt2_E388
	.word pnt2_E3DD
pnt2_ED93:
	LDA #%00100000
	STA playerAttrs ; Set player to be behind BG
	LDA #$00
	STA playerAction ; Make player stand still
	JSR sub3_E5D4 ; Jump
	LDA #SFX_WARP
	STA sndSfx ; Play warp sound
	JSR hUD_Update ; Jump
	iNC a:gameSubstate ; Go to next part of event
	RTS
pnt2_EDAA:
	LDA #$00
	STA playerXSpd ; Stop player from moving vertically
	LDA #$10
	STA playerYSpd ; Set pipe speed to 10h
	LDA playerMoveFlags
	AND #$FB ; Stop player from moving up
	lDY a:gameState
	CPY #$13 ; If player isn't going up a pipe,
	BNE bra3_EDBF ; branch
	ORA #$04 ; Otherwise, make the player move up
bra3_EDBF:
	STA playerMoveFlags ; Store movement type
	JSR sub3_E5D4 ; Jump
	LDX #$01
	LDY #$16 ; Set action length to 22 frames
	JSR sub3_E5B6 ; Jump
	iNC a:gameSubstate ; Go to next part of event
	RTS
pnt2_EDCF:
	LDA #$00
	STA fadeoutMode ; Disable BG 'blackout' effect
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	iNC a:gameSubstate ; Go to next part of event
	RTS
pnt2_EDE1:
	LDY #$38
	JSR sub3_ED48
	LDA #$00
	STA levelWaterFlag
	LDA #61
	STA M90_PRG1
	LDA BonusEntitySet
	sTA a:$DC
	LDA BonusEntitySet+1
	sTA a:$DD
	LDA #$00
	STA $06E1
	RTS
pnt2_EE02:
	JSR sub3_ED14
	JSR hUD_Update
	LDA #$01
	STA playerAction
	LDA #$10
	STA playerXSpd
	LDA playerMoveFlags
	AND #$BE
	STA playerMoveFlags
	LDX #$01
	LDY #$1E
	JSR sub3_E5B6
	LDA #$02
	sTA a:gameState
	RTS
pnt2_EE23:
	lDA a:gameSubstate
	ASL
	TAY
	LDA tbl3_EE35,Y
	STA $32
	LDA tbl3_EE35+1,Y
	STA $33
	JMP ($32)
tbl3_EE35:
	.word pnt2_EDCF
	.word pnt2_EE3D
	.word pnt2_E388
	.word pnt2_E3DD
pnt2_EE3D:
	LDA worldNumber
	ASL
	ASL
	CLC
	ADC levelNumber
	ASL
	TAY
	JSR sub3_ED48
	LDA #$3D
	STA M90_PRG1
	JSR GetEntitySetPtr
	LDA #$20
	STA playerAttrs
	RTS
pnt2_EE59:
	JSR sub3_ED14
	JSR hUD_Update
	LDA #$00
	STA playerAction
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	AND #$FB
	LDY $06E9
	BNE bra3_EE72
	ORA #$04
bra3_EE72:
	STA playerMoveFlags
	LDA #$FF
	STA $06EA
	LDA playerActionFrameCount
	CMP #$02
	BNE bra3_EE84
	LDA #SFX_WARP
	STA sndSfx
bra3_EE84:
	LDX #$00
	LDY #$19
	JSR sub3_E5B6
	LDA #$00
	STA playerAttrs
	LDA #$02
	sTA a:gameState
	RTS
pnt2_EE96:
	lDA a:gameSubstate
	ASL
	TAY
	LDA tbl3_EEA8,Y
	STA $32
	LDA tbl3_EEA8+1,Y
	STA $33
	JMP ($32)
tbl3_EEA8:
	.word pnt2_ED93
	.word pnt2_EDAA
	.word pnt2_EDCF
	.word ofs5_EEB4
	.word pnt2_E388
	.word pnt2_E3DD
ofs5_EEB4:
	LDY #$3A
	lDA a:gameState
	CMP #$0F
	BEQ bra3_EEBF
	LDY #$3C
bra3_EEBF:
	JSR sub3_ED48
	LDA #$20
	STA playerAttrs
	RTS
pnt2_EEC8:
	JSR sub3_ED14
	JSR hUD_Update
	LDA #$0F
	STA playerAction
	LDA #$50
	STA playerYSpd
	STA playerXSpd
	LDA playerMoveFlags
	ORA #$04
	AND #$BE
	STA playerMoveFlags
	LDA playerActionFrameCount
	CMP #$02
	BNE bra3_EEEB
	LDA #$10
	STA sndSfx
bra3_EEEB:
	LDX #$00
	LDY #$19
	JSR sub3_E5B6
	LDA #$00
	STA playerAttrs
	LDA #$02
	sTA a:gameState
	RTS
pnt2_EEFD:
	LDA #$00
	sTA a:gameSubstate
	LDA #$0C
	sTA a:gameState
	RTS
tbl3_EF08:
	.word NMI_E062
	.word jmp_63_E000
	.word NMI_E05C
	.word NMI_E05F
loc3_EF10:
	PHP ; Push the CPU status into the stack
	PHA ; Push the accumulator into the stack
	TXA
	PHA ; Push the X register into the stack
	TYA
	PHA ; Push the Y register into the stack
	LDA #$3D
	STA M90_PRG1
	LDA columnFinishFlag
	BEQ bra3_EF2B
	JSR sub3_F055
	JSR sub3_F0A2
	LDA #$00
	STA columnFinishFlag
bra3_EF2B:
	LDA ppuUpdatePtr
	BEQ bra3_EF33
	JSR sub3_F20F
bra3_EF33: ; OAM writing for title screen and map sprites
	LDA #$00
	STA OAMADDR
	LDA #$02
	STA OAMDMA
	LDA ppuMaskMirror
	STA PPUMASK
	LDA #$00
	STA PPUADDR
	STA PPUADDR
	LDA ppuCtrlMirror
	AND #$FC
	ORA vertScrollFlag
	STA ppuCtrlMirror
	STA PPUCTRL
	LDA logoFlag
	BNE bra3_EF67
	LDA scrollX
	STA PPUSCROLL
	LDA scrollY
	STA PPUSCROLL
	JMP loc3_EF73
bra3_EF67:
	LDA logoXOffs
	STA PPUSCROLL
	LDA logoYOffs
	STA PPUSCROLL
loc3_EF73:
	JSR sub3_F6E0
; Update CHR for title logo and map screen	
	LDX chrBgBank1
	STX M90_BG_CHR0 ; Update 1st BG bank
	INX ; Load next CHR bank
	STX M90_BG_CHR1 ; Set as 2nd BG bank
	LDX chrBgBank3
	STX M90_BG_CHR2 ; Update 3rd BG bank
	INX ; Load next CHR bank
	STX M90_BG_CHR3 ; Set as 4th BG bank
	LDA chrSpriteBank1
	STA M90_SP_CHR0 ; Update 1st sprite bank
	LDA chrSpriteBank2
	STA M90_SP_CHR1 ; Update 2nd sprite bank
	LDA chrSpriteBank3
	STA M90_SP_CHR2 ; Update 3rd sprite bank
	LDA chrSpriteBank4
	STA M90_SP_CHR3 ; Update 4th sprite bank
	JSR updateJoypad ; Jump
	INC secFrameCount ; Increment second frame counter
	LDA secFrameCount
	CMP #$3C ; If its below 60 frames,
	BCC bra3_EFB4 ; branch
	AND #$00
	STA secFrameCount ; Clear second frame count
bra3_EFB4:
	LDA #$00
	STA $3C
	INC frameCount ; Increment global frame counter
	LDA #$3A
	STA M90_PRG0
	LDA #$3B
	STA M90_PRG1
	lDA a:inLvlFlag
	BNE bra3_EFD9 ; If in a level, branch
	JSR jmp_58_85BE ; Otherwise, jump
	JSR jmp_58_862A
	LDA $08
	STA M90_PRG0
	LDA $09
	STA M90_PRG1
bra3_EFD9:
	PLA
	TAY ; Pull stack to Y register
	PLA
	TAX ; Pull stack to X register
	PLA ; Pull stack to accumulator
	PLP ; Pull CPU status from stack
	RTI
loc3_EFE0:
	PHP ; Push CPU status to stack
	PHA ; Push accumulator to stack
	TXA
	PHA ; Push X register to stack
	TYA
	PHA ; Push Y register to stack
	LDA ppuMaskMirror
	STA PPUMASK ; Copy software mask register to hardware register
	LDA ppuCtrlMirror
	AND #%11111100 ; Mask out bits
	ORA vertScrollFlag ; Add vertical scroll flag (changes nametable address if set)
	STA ppuCtrlMirror
	STA PPUCTRL ; Store in both software and hardware registers
	LDA logoFlag ; If logo flag set,
	BNE bra3_F008 ; branch
	LDA scrollX
	STA PPUSCROLL ; Load horizontal scroll position into PPU
	LDA scrollY
	STA PPUSCROLL ; Load vertical scroll position into PPU
	JMP loc3_F014
bra3_F008:
	LDA logoXOffs
	STA PPUSCROLL ; Load logo horizontal offset into PPU
	LDA logoYOffs
	STA PPUSCROLL ; Load logo vertical offset into PPU
loc3_F014:
	JSR sub3_F6E0
	LDX chrBgBank1
	STX M90_BG_CHR0 ; Update 1st BG bank
	INX ; Load next CHR bank
	STX M90_BG_CHR1 ; Set it as 2nd BG bank
	LDX chrBgBank3
	STX M90_BG_CHR2 ; Update 3rd BG bank
	INX ; Load next CHR bank
	STX M90_BG_CHR3 ; Set it as 4th BG bank
	LDA chrSpriteBank1
	STA M90_SP_CHR0 ; Update 1st sprite bank
	LDA chrSpriteBank2
	STA M90_SP_CHR1 ; Update 2nd sprite bank
	LDA chrSpriteBank3
	STA M90_SP_CHR2 ; Update 3rd sprite bank
	LDA chrSpriteBank4
	STA M90_SP_CHR3 ; Update 4th sprite bank
	PLA
	TAY ; Pull stack into Y register
	PLA
	TAX ; Pull stack into X register
	PLA ; Pull stack into accumulator
	PLP ; Pull CPU status from stack
	RTI
	LDX #$3C
bra3_F04C:
	LDY #$3C
bra3_F04E:
	DEY
	BNE bra3_F04E
	DEX
	BNE bra3_F04C
	RTS
sub3_F055:
	LDA PPUSTATUS ; Clear address latch
	LDA ppuCtrlMirror ; Load PPU control software reg
	ORA #$04 ; Do OR operation, effectively adding 4
	STA PPUCTRL ; Store in PPU control hardware reg
	LDA PPUSTATUS
	LDA columnFinishFlag
	STA PPUADDR ; Load upper byte of PPU address (20 when scrolling)
	LDA nextBgColumn
	STA PPUADDR ; Load current column into low byte of PPU address
	LDX #$00 ; Set row to 0
bra3_F070:
	LDA tileColumnMem,X ; Load 8x8 tile row data
	STA PPUDATA ; Store it in the PPU
	INX ; Move to next row
	CPX #$1E ; Keep looping until row 30 is reached
	BCC bra3_F070
	LDA PPUSTATUS ; Clear address latch
	LDA columnFinishFlag ; Load upper byte (20 when scrolling)
	ORA #$08 ; Do OR operation, effectively adding 8
	STA PPUADDR ; Store as upper byte of PPU address
	LDA nextBgColumn
	STA PPUADDR ; Load current column into lower byte of PPU address
bra3_F08C:
	LDA tileColumnMem,X ; Load 8x8 tile row data
	STA PPUDATA ; Store it in the PPU
	INX ; Move to next row
	CPX tileRowCount ; Keep looping until current row count is reached
	BCC bra3_F08C
	LDA PPUSTATUS ; Clear address latch
	LDA ppuCtrlMirror
	AND #%11111011
	STA PPUCTRL ; Set PPUCTRL to increment by 1
	RTS
sub3_F0A2:
	LDA palAssignPtr
	BEQ bra3_F0CA ; Stop if upper byte of mapping pointer is empty
	LDX #$00
bra3_F0A9:
	LDA PPUSTATUS ; Clear address latch
	LDA palAssignPtr,X
	STA PPUADDR
	LDA palAssignPtr+1,X
	STA PPUADDR ; Load attribute pointer
	LDA palAssignData,X
	STA PPUDATA ; Store attributes
	INX
	INX
	INX ; Load next pointer data set
	CPX bgAttrRowCount ; Keep going until pointer count is reached
	BCC bra3_F0A9
	LDA #$00
	STA palAssignPtr ; Clear upper byte of pointer
bra3_F0CA:
	RTS
sub3_F0CB:
	LDA worldNumber ; Load world number
	ASL
	ASL ; multiply it by 4
	CLC
	ADC levelNumber ; Add it to level count
	TAX ; Copy to X reg
	LDA levelMusic,X
	STA sndMusic ; Load/play music for level
	RTS
levelMusic:
	.byte $29 ; 1-1 Music
	.byte $28 ; 1-2 Music
	.byte $20 ; 1-3 Music
	.byte $2C ; 1-4 Music
	.byte $29 ; 2-1 Music
	.byte $28 ; 2-2 Music
	.byte $2B ; 2-3 Music
	.byte $2C ; 2-4 Music
	.byte $2A ; 3-1 Music
	.byte $2D ; 3-2 Music
	.byte $2B ; 3-3 Music
	.byte $2C ; 3-4 Music
	.byte $29 ; 4-1 Music
	.byte $28 ; 4-2 Music
	.byte $20 ; 4-3 Music
	.byte $2C ; 4-4 Music
	.byte $29 ; 5-1 Music
	.byte $2B ; 5-2 Music
	.byte $2D ; 5-3 Music
	.byte $2C ; 5-4 Music
	.byte $29 ; 6-1 Music
	.byte $2B ; 6-2 Music
	.byte $28 ; 6-3 Music
	.byte $2C ; 6-4 Music
	.byte $29 ; 7-1 Music
	.byte $28 ; 7-2 Music
	.byte $2B ; 7-3 Music
	.byte $2C ; 7-4 Music
	.byte $29 ; Yoshi's House Music
pnt2_F0F8:
	LDX #$F0
	STX M90_BG_CHR0 ; Set bank F0 to 1st BG bank
	INX ; Load next CHR bank
	STX M90_BG_CHR1 ; Set it as 2nd BG bank
	LDX $0362
	STX M90_BG_CHR2 ; Update 3rd BG bank
	INX ; Load next CHR bank
	STX M90_BG_CHR3 ; Set it as 4th BG bank
	LDY #$21 ; Load upper byte of PPU address
	LDA scrollX ; Load horizontal scroll position
	LSR
	LSR
	LSR ; Divide it by 8
	ORA #$B0 ; Do OR operation
	TAX ; Set it as lower byte of PPU address
	STY PPUADDR ; Store upper byte
	STX PPUADDR ; Store lower byte
	LDA scrollX
	STA PPUSCROLL
	STA PPUSCROLL ; Set the horizontal scroll to both axes
	STA M90_IRQ_DISABLE ; Disable mapper IRQ
	RTS ; Done
pnt2_F127: ; HUD ON MAP SCREEN
	LDA PPUSTATUS
	LDA #$2B ; Load upper byte of PPU address
	STA PPUADDR
	LDA #$40 ; Load lower byte of PPU address
	STA PPUADDR
	LDA #$00
	STA PPUSCROLL
	STA PPUSCROLL ; Set scroll to default position
	LDA #%00001110
	STA PPUMASK ; Disable sprite rendering
	LDX #$EC
	STX M90_BG_CHR0 ; Set bank EC to 1st BG bank
	INX ; Load next CHR bank
	STX M90_BG_CHR1 ; Set it as 2nd BG bank
	INX ; Load next CHR bank
	STX M90_BG_CHR2 ; Set it as 3rd BG bank
	INX ; Load next CHR bank
	STX M90_BG_CHR3 ; Set it as 4th BG bank
pnt2_F152:
	STA M90_IRQ_DISABLE ; Disable mapper IRQ
	RTS
bra3_F156:
	LDA PPUSTATUS
	BPL bra3_F156 ; Keep looping if VBlank isn't set
bra3_F15B:
	LDA PPUSTATUS
	BPL bra3_F15B ; Keep looping if VBlank isn't set
	RTS ; Return
	ASL
	TAY
	PLA
	STA $34
	PLA
	STA $35
	INY
	LDA ($34),Y
	STA $32
	INY
	LDA ($34),Y
	STA $33
	JMP ($32)
;----------------------------------------
; Clear sprites from screen during gameplay
; This must happen before sprites are sent to $0200
;----------------------------------------
sub3_F176:
	LDA #$F8 ; Y position (offscreen)
	LDX #$00 ; storage offset
bra3_F17A: ; In level sprite clearing 
	STA spriteMem,X ; store at sprite Y position
	INX
	INX
	INX
	INX ; increment X until on next Y pos storage byte
	BNE bra3_F17A ; loop until X overflows to 00  
	RTS 
;-----------------------------************************
sub3_F184:
	ASL
	ASL
	CLC
	ADC #$20
	LDX #$00
	STA PPUADDR
	STX PPUADDR
	LDY #$03
	LDA #$FF
bra3_F195:
	STA PPUDATA
	DEX
	BNE bra3_F195
	DEY
	BPL bra3_F195
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; CONTROLLER READING
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
updateJoypad:
	JSR readJoypad
	LDX #$00 ; Set the X index for the first controller
	JSR controllerLogicSub
	INX ; Set the X index for the second controller
controllerLogicSub:
	LDA btnHeld,X
	EOR btnMirrored,X
	AND btnHeld,X ; Try to match the main controller bits with the mirrored bits
	STA btnPressed,X ; If they match, set the input to pressed. Otherwise, clear the input
	LDA btnHeld,X
	STA btnMirrored,X ; Copy the button input over
	AND #$0C ; Mask out the bits for up and down
	CMP #$0C
	BNE updateJoypadDone ; If both up and down are held, continue
	LDA btnHeld,X
	AND #%11111011
	STA btnHeld,X ; Ignore the down button
updateJoypadDone:
	RTS
	
readJoypad:
	LDA #$01
	STA JOY1 ; Strobe controller input
	LDA #$00
	STA JOY1 ; Reload controller input
	LDA #$01
	STA JOY1 ; Strobe controller again
	NOP
	NOP ; Wait 2 cycles
	LDA #$00
	STA JOY1 ; Read controller input
	NOP
	NOP ; Wait 2 cycles
	LDA #$01
	LSR ; Set the carry by shifting a bit into it
	TAX ; Set the X index for the first controller
	STA JOY1 ; Reload controller input again
	JSR sub3_F1EC
	INX ; Set the X index for the second controller
sub3_F1EC:
	LDA #$00
	STA controller2Input ; Clear input for the 2nd controller
	LDY #$08 ; Set loop count to 8
bra3_F1F3:
	PHA ; Push blank value into the stack
	LDA JOY1,X ; Read controller input
	STA $063D ; Store input data
	LSR
	LSR ; Shift bit 1 of the control input into the carry (check for left button?)
	ROL $25 ; Shift the carry bit into memory??
	LSR $063D ; Shift bit 0 of the control input into the carry
	PLA ; Pull empty value back from accumulator
	ROL controller2Input ; Shift the carry bit into memory (set another controller bit)??
	DEY
	BNE bra3_F1F3 ; Loop for the set amount of times
	ORA controller2Input
	STA btnHeld,X
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
; END OF CONTROLLER READING
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
sub3_F20F:
	LDA ppuUpdatePtr
	BEQ bra3_F258
	LDA $03A0
	ORA ppuCtrlMirror
	AND #$7F
	STA PPUCTRL
	LDY #$00
	LDX #$00
bra3_F222:
	LDA PPUSTATUS ; Clear address latch
	LDA ppuUpdatePtr
	STA PPUADDR ; Set upper byte of PPU pointer
	LDA ppuUpdatePtr+1
	STA PPUADDR ; Set lower byte of PPU pointer
bra3_F231:
	LDA ppuDataBuf,X
	STA PPUDATA ; Transfer data from the buffer
	INY
	INX ; Go to the next byte of the buffer
	CPY ppuBufSize
	BCC bra3_F231 ; Keep storing data until the buffer size is reached
	LDA ppuUpdatePtr+1
	CLC
	ADC #$20
	STA ppuUpdatePtr+1 ; Move down one row of tiles
	BCC bra3_F24C
	INC ppuUpdatePtr ; Add to the upper byte (if necessary) 
bra3_F24C:
	LDY #$00
	DEC $03A3
	BNE bra3_F222
	LDA #$00
	STA ppuUpdatePtr
bra3_F258:
	RTS
	TXA
	ADC $00E4
	STA $00E4
	AND #$01
	BNE bra3_F270
	TXA
	ADC $00E4
	TYA
	ADC $00E4
	STA $00E4
	RTS
bra3_F270:
	ADC $00E4
	STA $00E4
	ROR
	ROR
	ADC $00E4
	STA $00E4
	RTS

;----------------------------------------
; SUBROUTINE ($F27F)
; Updates HUD counters while in levels.
;----------------------------------------
hUD_Update:
	LDA interruptMode
	CMP #$04
	BEQ @stop ; Don't render the HUD in the Bowser fight
	LDA ppuUpdatePtr
	BNE @stop ; Stop if the upper byte of the PPU pointer is empty
		LDA hudUpdate
		ASL
		TAY
		LDA hUD_UpdateFuncs,Y
		STA $32
		LDA hUD_UpdateFuncs+1,Y
		STA $33 ; Get pointer for current HUD update state
		JMP ($32) ; Jump to loaded pointer
@stop:
	RTS
	
hUD_UpdateFuncs:
	.word hUD_UpdateLifeCount
	.word hUD_UpdateDragonCoins
	.word hUD_UpdateTimer
	.word hUD_UpdateScore
	.word hUD_UpdateCoinCount

;--------------------
; Update life counter display
;--------------------
hUD_UpdateLifeCount:
	JSR hUD_GetPPUUploadParams ; Get PPU upload parameters
	INC hudUpdate ; Go to next update state after this code is finished
	LDX #0 ; Set index for Player 1
	LDA curPlayer
	BEQ @continue ; Continue using Player 1 index if it's their turn
		LDX #1 ; Use index for Player 2 otherwise, effectively clamping the player value to 1 (Player 2)
@continue:
	LDA playerLives,X
	STA $34
	LDA #$00
	STA $35 ; Pass in player's life count
	LDA #$0B
	STA $26 ; Number tiles start at #$0B
	JSR hUD_RenderCounterToBuf ; Render counter to buffer

; Upload HUD counter buffer to PPU data buffer backwards
	LDY #$00 ; Start at end of life count string
	LDX #1 ; Start at second character of PPU data buffer
@uploadLoop:
	LDA hudUpdateTiles,Y ; Load currently updated HUD tile
	STA ppuDataBuf,X
	INY ; Advance to next tile in HUD buffer
	DEX ; Go to previous tile in PPU data buffer
	BPL @uploadLoop
	RTS

;--------------------
; Update Dragon Coin display
;--------------------
hUD_UpdateDragonCoins:
	JSR hUD_GetPPUUploadParams ; Get PPU upload parameters
	INC hudUpdate ; Go to next update state after this code is finished

; Clear PPU buffer for Dragon coins
	LDX #4 ; Clear 5 tiles starting from the back
	LDA #$00
bra3_F2E0:
	STA ppuDataBuf,X
	DEX
	BPL bra3_F2E0 ; Loop until the start of the buffer is reached

	LDX #0 ; Set index for player 1
	LDA curPlayer
	BEQ @continue ; Continue using Player 1 index if it's their turn
		LDX #1 ; Use index for Player 2 otherwise, effectively clamping the player value to 1 (Player 2)
@continue:
	LDA playerDragonCoins,X
	STA $25 ; Copy player's Dragon Coin count to zero page for faster access
	BEQ @stop ; Stop if no Dragon Coins have been collected
		LDY #$00 ; Clear Y for loop
		LDA #$06 ; Dragon Coin tile
	; Render a Dragon Coin icon for each one the player collected
	@tileUploadLoop:
		STA ppuDataBuf,Y
		INY
		CPY $25
		BCC @tileUploadLoop
@stop:
	RTS

;--------------------
; Update timer display
;--------------------
hUD_UpdateTimer:
	JSR hUD_GetPPUUploadParams ; Get PPU upload parameters
	INC hudUpdate ; Go to next update state after this code is finished
	LDA levelTimer
	STA $34
	LDA levelTimer+1
	STA $35 ; Pass in timer
	LDA #$0B
	STA $26 ; Number tiles start at #$0B
	JSR hUD_RenderCounterToBuf ; Render counter to buffer

; Upload HUD counter buffer to PPU data buffer backwards
	LDY #$00
	LDX #$02 ; Upload 3 tiles from buffer
@uploadLoop:
	LDA hudUpdateTiles,Y
	STA ppuDataBuf,X
	INY ; Advance to next tile in HUD buffer
	DEX ; Go to previous tile in PPU data buffer
	BPL @uploadLoop
	RTS

;--------------------
; Update score display
;--------------------
hUD_UpdateScore:
	JSR hUD_GetPPUUploadParams ; Get PPU upload parameters
	INC hudUpdate ; Go to next update state after this code is finished
	LDX #0 ; Set index for player 1
	LDA curPlayer
	BEQ @continue ; Continue using Player 1 index if it's their turn
		LDX #2 ; Use index for Player 2 otherwise, effectively clamping the player value to 1 (Player 2)
@continue:
	LDA #$0B ; Number tiles start at #$0B
	STA $26
	LDA playerScores,X
	STA $34
	LDA playerScores+1,X
	STA $35 ; Pass in player's score
	JSR hUD_RenderCounterToBuf ; Render counter to buffer

; Upload HUD counter buffer to PPU data buffer backwards
	LDY #$00
	LDX #$04 ; Display up to 5 digits
@uploadLoop:
	LDA hudUpdateTiles,Y
	STA ppuDataBuf,X
	INY ; Advance to next tile in HUD buffer
	DEX ; Go to previous tile in PPU data buffer
	BPL @uploadLoop
	RTS

;--------------------
; Update coin counter display
;--------------------
hUD_UpdateCoinCount:
	JSR hUD_GetPPUUploadParams
	LDA #$00
	STA hudUpdate
	LDX #$00 ; Set to Player 1
	LDA curPlayer
	BEQ bra3_F369 ; Branch if Player 1 is playing
	LDX #$01 ; Otherwise, set values to Player 2
bra3_F369:
	LDA playerCoins,X ; Load current player's coin count
	STA $34
	LDA #$00
	STA $35
	LDA #$0B ; Pass in player's coin count
	STA $26 ; Number tiles start at #$0B
	JSR hUD_RenderCounterToBuf ; Render counter to buffer

; Upload HUD counter buffer to PPU data buffer backwards
	LDY #$00
	LDX #$01 ; Display up to 2 digits
@uploadLoop:
	LDA hudUpdateTiles,Y
	STA ppuDataBuf,X
	INY ; Advance to next tile in HUD buffer
	DEX ; Go to previous tile in PPU data buffer
	BPL @uploadLoop
	RTS

;----------------------------------------
; SUBROUTINE ($F388)
; Returns the PPU update parameters for the current HUD update state
;----------------------------------------
hUD_GetPPUUploadParams:
	LDA hudUpdate ; Get HUD update state
	ASL
	ASL
	TAX ; Get pointer for current HUD update stage (selects on screen HUD value to update)
	LDA tbl3_F3A7,X
	STA ppuUpdatePtr
	LDA tbl3_F3A7+1,X
	STA ppuUpdatePtr+1 ; Load PPU address
	LDA tbl3_F3A7+2,X
	STA $03A3
	LDA tbl3_F3A7+3,X
	STA ppuBufSize ; Load tile length
	RTS
tbl3_F3A7:
; Life Counter (00)
	.byte $2B, $84 ; PPU Address 
	.byte $01
	.byte $02 ; Tile Length
; Dragon Coins (04)
	.byte $2B, $68
	.byte $01
	.byte $05
; Timer (08)
	.byte $2B, $94
	.byte $01
	.byte $03
; Score (12)
	.byte $2B, $98
	.byte $01
	.byte $05
; Coin Counter (16)
	.byte $2B, $7C
	.byte $01
	.byte $02

;----------------------------------------
; SUBROUTINE ($F3BB)
; Renders a counter in decimal to the HUD buffer.
; Parameters:
; > $26: Number start tile
; > $34: [16-bit] Counter value
;----------------------------------------
hUD_RenderCounterToBuf:
	LDA #$00
	STA $39
	STA $25 ; Clear registers
	LDA #10
	STA $38 ; Convert number to base 10 (decimal)

renderDigitLoop:
	JSR div16 ; Divide counter by base
	LDA $32
	CLC
	ADC $26 ; (Counter % Base) + Digit start tile = Next digit of counter
	LDY $25
	STA hudUpdateTiles,Y ; Upload number tile to update buffer
	INC $25 ; Move to next tile in buffer
	LDA $25
	CMP #5
	BCC renderDigitLoop ; Upload up to 5 digits of a count, displaying each digit from right to left

; Clear every unused digit from the left
	LDY #4
clearUnusedDigitsLoop:
	LDA hudUpdateTiles,Y
	CMP $26
	BNE @stop ; Stop if a non-zero tile is reached, as this marks the start of the number
		LDA #$00
		STA hudUpdateTiles,Y ; Render each zero from the left as blank
		DEY
		BNE clearUnusedDigitsLoop ; Loop until the last digit is reached
@stop:
	RTS

;----------------------------------------
; SUBROUTINE ($F3EC)
; Performs 16-bit division on two 16-bit numbers, storing the quotient in the dividend and returning the remainder.
; Parameters:
; > $34: [16-bit] Dividend, becomes quotient
; > $38: [16-bit] Divisor
; Return:
; > $32: [16-bit] Remainder
;----------------------------------------
div16:
	LDA #$00
	STA $32
	STA $33 ; Clear the remainder
	LDX #16 ; Loop through all 16 bits of the number
; Divide the number by the base
@loop:
	ASL $34
	ROL $35
	ROL $32
	ROL $33 ; Shift the bits of the numerical value in from the left
	LDA $32
	SEC
	SBC $38
	TAY ; Copy low byte of result to Y for later
	LDA $33
	SBC $39 ; Subtract divisor to see if it fits
	BCC @continue ; If it underflowed, the divisor didn't fit yet
		INC $34 ; Otherwise, increment the result for each time it fits
		STA $33
		STY $32 ; Save the new difference as the remainder
@continue:
	DEX
	BNE @loop
	RTS

	LDA #$2B
	STA PPUADDR
	LDA #$40
	STA PPUADDR
	LDX #$00
	LDA interruptMode
	CMP #$04
	BEQ bra3_F442
	LDA curPlayer
	BNE bra3_F436 ; if player 2, branch
bra3_F42A: ; if player 1
	LDA tbl3_F44E,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra3_F42A
	RTS
	
bra3_F436:  ; If player 2, go here
	LDA tbl3_F4CE,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra3_F436
	RTS

bra3_F442: ; not sure, it just loads nothing from a table and clears PPU data over and over
	LDA tbl3_F54E,X ; this entire table is just #$00 and it's massive
	STA PPUDATA ; clear PPU data
	INX ; Increment X
	CPX #$80
	BCC bra3_F442 ; Loop if X < #$80
	RTS
tbl3_F44E:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $9F
	.byte $A0
	.byte $A1
	.byte $A2
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $07
	.byte $08
	.byte $09
	.byte $00
	.byte $00
	.byte $00
	.byte $06
	.byte $0A
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $0A
	.byte $00
	.byte $0B
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
	.byte $0E
	.byte $0B
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
tbl3_F4CE:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $9F
	.byte $A0
	.byte $A1
	.byte $A2
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $07
	.byte $08
	.byte $09
	.byte $00
	.byte $00
	.byte $00
	.byte $06
	.byte $0A
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $0A
	.byte $00
	.byte $0B
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
	.byte $0E
	.byte $0B
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
tbl3_F54E:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
sub3_F5CE:
	LDX #$00
loc3_F5D0:
	LDA $03E4,X
	BEQ bra3_F5DA
	BMI bra3_F5E3
	JMP loc3_F668
bra3_F5DA:
	LDA #$00
	STA $03FE
	STA $03E4
	RTS
bra3_F5E3:
	CMP #$8E
	BCS bra3_F623
	LDA $03E5,X
	STA PPUADDR
	LDA $03E6,X
	STA PPUADDR
	CLC
	ADC #$20
	STA $28
	LDA $03E5,X
	ADC #$00
	LDY $03F6
	STY PPUDATA
	LDY $03F7
	STY PPUDATA
	STA PPUADDR
	LDA $28
	STA PPUADDR
	LDY $03F8
	STY PPUDATA
	LDY $03F9
	STY PPUDATA
	INX
	INX
	INX
	JMP loc3_F5D0
bra3_F623:
	LDA $03E5,X
	STA PPUADDR
	LDA $03E6,X
	STA PPUADDR
	CLC
	ADC #$20
	STA $28
	LDA $03E5,X
	ADC #$00
	LDY $03FA
	STY PPUDATA
	LDY $03FB
	STY PPUDATA
	STA PPUADDR
	LDA $28
	STA PPUADDR
	LDY $03FC
	STY PPUDATA
	LDY $03FD
	STY PPUDATA
	INX
	INX
	INX
	JMP loc3_F5D0
	LDA #$00
	STA $03FE
	STA $03E4
	RTS
loc3_F668:
	LDA $03E5,X
	STA PPUADDR
	LDA $03E6,X
	STA PPUADDR
	CLC
	ADC #$20
	STA $28
	LDA $03E5,X
	ADC #$00
	STA $25
	LDY $03E4
	LDA tbl3_F6AB,Y
	STA PPUDATA
	LDA tbl3_F6AC,Y
	STA PPUDATA
	LDA $25
	STA PPUADDR
	LDA $28
	STA PPUADDR
	LDA tbl3_F6AD,Y
	STA PPUDATA
	LDA tbl3_F6AE,Y
	STA PPUDATA
	INX
	INX
	INX
	JMP loc3_F5D0
tbl3_F6AB:
	.byte $00
tbl3_F6AC:
	.byte $E0
tbl3_F6AD:
	.byte $E1
tbl3_F6AE:
	.byte $E2
	.byte $E3
	.byte $D0
	.byte $D1
	.byte $D2
	.byte $D3
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00

irq:
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	JSR memJmpOpcode ; Execute JMP opcode from RAM
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
	LDA #$4C
	STA memJmpOpcode ; Store JMP opcode into RAM
	; Load pointer for JMP location
	LDA tbl3_F720
	STA memJmpPtr
	LDA tbl3_F720+1
	STA memJmpPtr+1
	JMP loc3_F6F3

sub3_F6E0:
	LDA #$4C
	STA memJmpOpcode ; Load JMP opcode into RAM
	; Load JMP pointer for current interrupt mode
	LDA interruptMode
	ASL
	TAX
	LDA tbl3_F71A,X
	STA memJmpPtr
	LDA tbl3_F71A+1,X
loc3_F6F3:
	STA memJmpPtr+1
	LDX interruptMode
	LDA PPUSTATUS ; Clear address latch
	LDA interruptLineTable,X
	STA M90_IRQ_DISABLE
	STA M90_IRQ_COUNTER ; Temporarily disable interrupts and set IRQ counter to the given scanline, causing it to fire an interrupt once the number of scanlines has been reached
	LDA #$FB
	STA M90_IRQ_PRESCALER
	STA M90_IRQ_ENABLE ; Enable interrupts and set prescaler to 251 (unsure of why)
	RTS
interruptLineTable:
	.byte 8
	.byte 204 ; Level
	.byte 128
	.byte 8
	.byte 176 ; Bowser Fight
	.byte 8
	.byte 8
	.byte 8
	.byte 8
	.byte 8
	.byte 100 ; Title Screen
	.byte 208 ; Overworld Map
tbl3_F71A:
	.word pnt2_F152
	.word bra3_F751
	.word bra3_F76E
tbl3_F720:
	.word bra3_F78B
	.word bra3_F7A8
	.word pnt2_F734
	.word pnt2_F734
	.word pnt2_F734
	.word pnt2_F734
	.word pnt2_F734
	.word pnt2_F0F8
	.word pnt2_F127
	.word pnt2_F152

;-----------------------------
; HUD MODE CHECKS
; (CONDITIONAL NIGHTMARE WARNING!!)
;-----------------------------
pnt2_F734:
	LDA hudDisplay
	BNE bra3_F73C ; Branch if HUD BG isn't updated at all (not sure about these)
	JMP loc3_F7C5 ; Jump if it is
bra3_F73C:
	CMP #$01
	BNE bra3_F743
	JMP loc3_F7C5
bra3_F743:
	CMP #$02
	BNE bra3_F74A
	JMP loc3_F7C5
bra3_F74A:
	CMP #$03
	BNE bra3_F751
	JMP loc3_F7C5
bra3_F751:
	LDA hudDisplay
	BNE bra3_F759 ; Go to next check if the HUD isn't in mode 0
	JMP loc3_F7CE ; If it is, jump
bra3_F759:
	CMP #$01
	BNE bra3_F760 ; Go to next check if the HUD isn't in mode 1
	JMP loc3_F85A ; If it is, jump
bra3_F760:
	CMP #$02
	BNE bra3_F767 ; Go to next check if the HUD isn't in mode 2
	JMP loc3_F899 ; If it is, jump
bra3_F767:
	CMP #$03
	BNE bra3_F76E ; Go to next check if the HUD isn't in mode 3
	JMP loc3_F7C5 ; If it is, jump
bra3_F76E:
	LDA hudDisplay
	BNE bra3_F776
	JMP loc3_F8AC
bra3_F776:
	CMP #$01
	BNE bra3_F77D
	JMP loc3_F8B5
bra3_F77D:
	CMP #$02
	BNE bra3_F784
	JMP loc3_F7C5
bra3_F784:
	CMP #$03
	BNE bra3_F78B
	JMP loc3_F7C5
bra3_F78B:
	LDA hudDisplay
	BNE bra3_F793
	JMP loc3_F7CE
bra3_F793:
	CMP #$01
	BNE bra3_F79A
	JMP loc3_F899
bra3_F79A:
	CMP #$02
	BNE bra3_F7A1
	JMP loc3_F7C5
bra3_F7A1:
	CMP #$03
	BNE bra3_F7A8
	JMP loc3_F7C5
bra3_F7A8:
	LDA hudDisplay
	BNE bra3_F7B0
	JMP loc3_F8D7
bra3_F7B0:
	CMP #$01
	BNE bra3_F7B7
	JMP loc3_F7C5
bra3_F7B7:
	CMP #$02
	BNE bra3_F7BE
	JMP loc3_F7C5
bra3_F7BE:
	CMP #$03
	BNE bra3_F7C5
	JMP loc3_F7C5
bra3_F7C5:
loc3_F7C5:
	STA $E000 ; Write to useless, unmapped location (Maybe this was originally for another mapper?)
	LDA #$00
	STA hudDisplay
	RTS
loc3_F7CE:
	INC hudDisplay
	LDA #$20
	STA M90_IRQ_ENABLE
	STA M90_IRQ_ENABLE ; Enable interrupts
	RTS

pauseChk:
	LDA pauseFlag ; Check if the game is paused
	BNE bGAnimSubDone ; If so, branch (stop)
	LDA prgDataBank2 ; Otherwise, continue
	CMP #$26 ; Check if the final boss area is loaded
	BNE bGAnimSub ; If not, do standard BG animation
	JSR sub3_F90B ; If it is, animate the clown car instead
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
; BG BANK ANIMATION
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
bGAnimSub:
	LDA prgDataBank2
	CMP #$23
	BEQ bGAnimSubDone ; Skip BG animation if on special level, which includes Yoshi's house or any of the level intro screens
	CMP #$2B
	BEQ bGAnimSubDone ; Also skip BG animation if the bonus level is loaded
	LDA chrBgBankAnimation
	LSR
	TAY ; Get pointer index for BG bank animation
	LDA animatedBankPointers,Y
	STA $A6 ; Load lower byte of pointer
	LDA animatedBankPointers+1,Y
	STA $A7 ; Load upper byte of pointer
	LDA frameCount
	AND #%00011000 ; Mask out bits 4 and 5 to cycle through 4 values every 32 frames
	LSR
	LSR
	LSR ; Divide the result by 8 to get the bank index, effectively switching to the next bank every 8 frames
	TAY ; Set pointer index
	LDA ($A6),Y
	STA M90_BG_CHR3 ; Update the 4th CHR bank
bGAnimSubDone:
	RTS
animatedBankPointers:
	.word animBank2
	.word animBank2
	.word animBank3
	.word animBank2
	.word animBank2
	.word animBank2
	.word animBank1
	.word animBank1
	.word animBank2
	.word animBank2
	.word animBank1
	.word animBank1
	.word animBank3
	.word animBank3
	.word animBank3
	.word animBank1
	.word animBank2
	.word animBank1
	.word animBank2
	.word animBank1
	.word animBank3
	.word animBank2
	.word animBank1
	.word animBank1
	.word animBank1
	.word animBank4
	.word animBank1
	.word animBank2
animBank1:
	.byte $01
	.byte $45
	.byte $41
	.byte $0A
animBank2:
	.byte $5B
	.byte $56
	.byte $16
	.byte $36
animBank3:
	.byte $0D
	.byte $33
	.byte $63
	.byte $79
animBank4:
	.byte $C4
	.byte $C5
	.byte $C6
	.byte $C7
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
; END OF BG BANK ANIMATION
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-	
loc3_F85A:
	LDA #$1D
	STA M90_IRQ_DISABLE
	STA M90_IRQ_ENABLE ; Disable then enable interrupts (removing this causes the HUD to flicker, I assume this is an IRQ reset of some sort)
	STA M90_IRQ_COUNTER ; Set IRQ counter (line?) to $1D
	LDX #$0C ; Set X for loop count (See below)
bra3_F867:
	DEX
	BNE bra3_F867 ; Wait 59 (X*5 - 1) cycles before updating registers

	LDX #$2B
	LDY #$40
	STX PPUADDR
	STY PPUADDR ; Set PPU address to $2B40

	LDA PPUSTATUS ; Clear PPU address data latch 
	LDA #$00
	STA PPUSCROLL ; Set horizontal scroll for HUD (seems to position the item box, not the HUD itself)
	LDA #$C4
	STA PPUSCROLL ; Set vertical scroll for HUD
	INC hudDisplay

	LDA #$EC
	STA M90_BG_CHR0 ; Swap in 1st HUD bank (contains text and icons)
	LDA #$ED
	STA M90_BG_CHR1 ; Swap in 2nd HUD bank (nothing to do with HUD, just random level tiles)
	LDA #$EE
	STA M90_BG_CHR2 ; Swap in 3rd HUD bank (contains item box graphic)
	LDA #$EF
	STA M90_BG_CHR3 ; Swap in 4th HUD bank (nothing to do with HUD, just random level tiles)
	RTS

loc3_F899:
	STA M90_IRQ_DISABLE
	LDX #$0C
bra3_F89E:
	DEX
	BNE bra3_F89E ; Wait 59 (X*5 - 1) cycles before updating HUD
	LDA #%00010000
	STA PPUMASK ; Display sprites only
	LDA #$00
	STA hudDisplay
	RTS
loc3_F8AC:
	LDA #$00
	STA hudDisplay
	STA M90_IRQ_DISABLE
	RTS
loc3_F8B5:
	LDX #$0C
bra3_F8B7:
	DEX
	BNE bra3_F8B7
	LDX #$2B
	LDY #$40
	STX PPUADDR
	STY PPUADDR
	LDA PPUSTATUS
	LDA #$00
	STA PPUSCROLL
	LDA #$C4
	STA PPUSCROLL
	LDA #$00
	STA hudDisplay
	RTS
loc3_F8D7:
	LDX #$22
	LDY #$D8 ; Set interrupt line
	STX PPUADDR
	STY PPUADDR ; Store interrupt line
	LDA PPUSTATUS
	LDA #$00
	STA PPUSCROLL
	LDA #$B0
	STA PPUSCROLL
	LDA #$00
	STA hudDisplay
	LDA #$C8
	STA M90_BG_CHR0 ; Load 1st Clown Car bank into PPU
	LDA #$C9
	STA M90_BG_CHR1 ; Load 2nd Clown Car bank into PPU
	LDA #$CA
	STA M90_BG_CHR2 ; Load 3rd Clown Car bank into PPU
	LDA #$CB
	STA M90_BG_CHR3 ; Load 4th Clown Car bank into PPU
	STA M90_IRQ_DISABLE
	RTS
sub3_F90B:
	LDY clownCarFace
	LDA clownCarBanks,Y
	STA M90_BG_CHR0
	RTS
clownCarBanks:
	.byte $C8 ; Default
	.byte $C9 ; Blinking
	.byte $CA ; Hurt
	.byte $CB ; Angry

;----------------------------------------
; SUBROUTINE ($F919)
; Backup the player's powerup and Yoshi.
;----------------------------------------
sub3_F919:
	; Local variables
	@sprPalettePtr = $30
	@bgPalettePtr = $32
	@bgPaletteFadeoutMask = $34
	@sprPaletteFadeoutMask = $2E


	LDA bgCurPalette
	ASL
	ASL
	TAY ; Get the pointer index for the BG palette
	LDA curPlayer
	BEQ @bra3_F939 ; Load player 1 palettes if player 1 is playing
	; Otherwise, load palettes for player 2
	LDA player2LevelPalettes+2,Y
	STA @sprPalettePtr ; Load lower byte of pointer
	LDA player2LevelPalettes+3,Y
	STA @sprPalettePtr+1 ; Load upper byte of pointer
	LDA player2LevelPalettes,Y
	STA @bgPalettePtr
	LDA player2LevelPalettes+1,Y
	JMP @loc3_F94B

@bra3_F939:
	LDA player1LevelPalettes+2,Y
	STA @sprPalettePtr ; Load lower byte of pointer
	LDA player1LevelPalettes+3,Y
	STA @sprPalettePtr+1 ; Load upper byte of pointer
	LDA player1LevelPalettes,Y
	STA @bgPalettePtr
	LDA player1LevelPalettes+1,Y

@loc3_F94B:
	; Get fade-out masks for current fade-out mode
	STA @bgPalettePtr+1
	LDA fadeoutMode
	ASL
	ASL
	TAY
	LDA paletteFadeOutMasks,Y
	STA @bgPaletteFadeoutMask
	LDA paletteFadeOutMasks+1,Y
	STA @bgPaletteFadeoutMask+1
	LDA paletteFadeOutMasks+2,Y
	STA @sprPaletteFadeoutMask
	LDA paletteFadeOutMasks+3,Y
	STA @sprPaletteFadeoutMask+1

	LDA ppuUpdatePtr
	BNE @bra3_F9E7
	LDA frameCount
	AND #$03
	BNE @bra3_F9E7 ; Only advance palette fadeout phases every 4 frames
		LDX palTransition
		LDA tbl3_F9F3,X
		STA $25
		LDY #$00
		LDX #$00

	@bra3_F97E:
		LDA ($34),Y
		BPL @bra3_F987
		LDA ($32),Y
		JMP @loc3_F990

	@bra3_F987:
		LDA ($32),Y
		SEC
		SBC $25
		BPL @loc3_F990
		LDA #$FF

	@loc3_F990:
		CPY #$00
		BNE @bra3_F99A
		STA $03B5
		JMP @loc3_F99D

	@bra3_F99A:
		STA ppuDataBuf,X

	@loc3_F99D:
		INX
		INY
		CPY #$10
		BNE @bra3_F97E
		LDY #$01
		LDX #$11

	@bra3_F9A7:
		LDA ($2E),Y
		BPL @bra3_F9B0
		LDA ($30),Y
		JMP @loc3_F9B9

	@bra3_F9B0:
		LDA ($30),Y
		SEC
		SBC $25
		BPL @loc3_F9B9
		LDA #$FF

	@loc3_F9B9:
		STA ppuDataBuf,X
		INX
		INY
		CPY #$10
		BNE @bra3_F9A7
		LDA #$3F
		STA ppuUpdatePtr
		LDA #$00
		STA ppuUpdatePtr+1
		STA $03A0
		LDA #$20
		STA ppuBufSize
		LDA #$01
		STA $03A3
		INC palTransition
		LDA palTransition
		CMP #$05
		BEQ @bra3_F9EA
		CMP #$09
		BEQ @bra3_F9EA

@bra3_F9E7:
	PLA
	PLA
	RTS

@bra3_F9EA:
	LDA #$80
	ORA palTransition
	STA palTransition
	RTS

tbl3_F9F3:
	.byte $40
	.byte $30
	.byte $20
	.byte $10
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
player1LevelPalettes:
	.word lvlPalBG_1_1 ; Level 1-1 BG Palette
	.word lvlPalSprP1_1 ; Level 1-1 Sprite Palette
	.word lvlPalBG_1_2 ; Level 1-2 BG Palette
	.word lvlPalSprP1_1 ; Level 1-2 Sprite Palette
	.word lvlPalBG_1_3 ; Level 1-3 BG Palette
	.word lvlPalSprP1_1 ; Level 1-3 Sprite Palette
	.word lvlPalBG_Castle1 ; Level 1-4 BG Palette
	.word lvlPalSprP1_1 ; Level 1-4 Sprite Palette
	.word lvlPalBG_2_1 ; Level 2-1 BG Palette
	.word lvlPalSprP1_1 ; Level 2-1 Sprite Palette
	.word lvlPalBG_2_2 ; Level 2-2 BG Palette
	.word lvlPalSprP1_1 ; Level 2-2 Sprite Palette
	.word lvlPalBG_GhostHouse1 ; Level 2-3 BG Palette
	.word lvlPalSprP1_1 ; Level 2-3 Sprite Palette
	.word lvlPalBG_Castle1
	.word lvlPalSprP1_1
	.word lvlPalBG_3_1 ; Level 3-1 BG Palette
	.word lvlPalSprP1_1 ; Level 3-1 Sprite Palette
	.word lvlPalBG_3_2 ; Level 3-2 BG Palette
	.word lvlPalSprP1_1 ; Level 3-2 Sprite Paltte
	.word lvlPalBG_GhostHouse1 ; Level 3-3 BG Palette
	.word lvlPalSprP1_1 ; Level 3-3 BG Palette
	.word ofs_FBBC
	.word lvlPalSprP1_1
	.word lvlPalBG_Bridge ; Level 4-1 BG Palette
	.word lvlPalSprP1_1 ; Level 4-1 Sprite Palette
	.word lvlPalBG_Bridge ; Level 4-2 BG Palette
	.word lvlPalSprP1_1 ; Level 4-2 Sprite Palette
	.word lvlPalBG_4_3 ; Level 4-3 BG Palette
	.word lvlPalSprP1_1 ; Level 4-3 Sprite Palette
	.word lvlPalBG_4_4 ; Level 4-4 (Area 2) BG Palette
	.word lvlPalSprP1_1 ; Level 4-4 (Area 2) BG Palette
	.word lvlPalBG_5_1 ; Level 5-1 BG Palette
	.word lvlPalSprP1_1 ; Level 5-1 Sprite Palette
	.word lvlPalBG_5_2 ; Level 5-2 BG Palette
	.word lvlPalSprP1_1 ; Level 5-2 Sprite Palette
	.word lvlPalBG_5_3 ; Level 5-3 BG Palette
	.word lvlPalSprP1_1 ; Level 5-3 Sprite Palette
	.word lvlPalBG_5_4 ; Level 5-4 BG Palette
	.word lvlPalSprP1_Castle3 ; Level 5-4 Sprite Palette
	.word lvlPalBG_6_1 ; Level 6-1 BG Palette
	.word lvlPalSprP1_1 ; Level 6-1 Sprite Palette
	.word lvlPalBG_6_2 ; Level 6-2 BG Palette
	.word lvlPalSprP1_1 ; Level 6-2 Sprite Palette
	.word lvlPalBG_6_3 ; Level 6-3 BG Palette
	.word lvlPalSprP1_1 ; Level 6-3 Sprite Palette
	.word lvlPalBG_6_4 ; Level 6-4 BG Palette
	.word lvlPalSprP1_Castle3 ; Level 6-4 Sprite Palette
	.word lvlPalBG_7_1 ; Level 7-1 BG Palette
	.word lvlPalSprP1_1 ; Level 7-1 Sprite Palette
	.word lvlPalBG_7_2 ; Level 7-2 BG Palette
	.word lvlPalSprP1_1 ; Level 7-2 Sprite Palette
	.word lvlPalBG_7_3 ; Level 7-3 BG Palette
	.word lvlPalSprP1_1 ; Level 7-3 Sprite Palette
	.word lvlPalBG_7_4 ; Level 7-4 BG Palette
	.word lvlPalSprP1_Castle3 ; Level 7-4 Sprite Palette
	.word lvlPalBG_GhostHouseIntro ; Ghost House Intro BG Palette
	.word lvlPalSprP1_1 ; Ghost House Intro Sprite Palette
	.word lvlPalBG_CastleIntro ; Castle Intro BG Palette
	.word lvlPalSprP1_1 ; Castle Intro Sprite Palette
	.word lvlPalBG_MortonBoss ; Morton Boss Room BG Palette
	.word lvlPalSprP1_MortonBoss ; Morton Boss Room Sprite Palette
	.word lvlPalBG_LemmyBoss ; Lemmy/Wendy Boss Room BG Palette
	.word lvlPalSprP1_LemmyBoss ; Lemmy/Wendy Boss Room Sprite Palette
	.word lvlPalBG_Castle2 ; Reznor Room, Level 2-4 (Areas 1 and 2) BG Palette
	.word lvlPalSprP1_Castle2 ; Reznor Room, Level 2-4 (Areas 1 and 2) Sprite Palette
	.word lvlPalBG_Castle3 ; Level 1-4 (Area 2), 2-4 (Area 3), 3-4, 4-4 (Area 1) BG Palette
	.word lvlPalSprP1_Castle3 ; Level 1-4 (Area 2), 2-4 (Area 3), 3-4, 4-4 (Area 1) Sprite Palette
	.word lvlPalBG_YoshisHouse ; Yoshi's House BG Palette
	.word lvlPalSprP1_YoshisHouse ; Yoshi's House Sprite Palette
	.word lvlPalBG_MortonBoss ; Roy Boss Room BG Palette
	.word lvlPalSprP1_RoyBoss ; Roy Boss Room Sprite Palette
	.word lvlPalBG_BowserFight ; Bowser Fight BG Palette
	.word lvlPalSprP1_BowserFight ; Bowser Fight Sprite Palette
	.word lvlPalBG_BonusRoom ; Bonus Room BG Palette
	.word lvlPalSprP1_BonusRoom ; Bonus Room Sprite Palette
player2LevelPalettes:
	.word lvlPalBG_1_1 ; Level 1-1 BG Palette
	.word lvlPalSprP2_1 ; Level 1-1 Sprite Palette
	.word lvlPalBG_1_2 ; Level 1-2 BG Palette
	.word lvlPalSprP2_1 ; Level 1-2 Sprite Palette
	.word lvlPalBG_1_3 ; Level 1-3 BG Palette
	.word lvlPalSprP2_1 ; Level 1-3 Sprite Palette
	.word lvlPalBG_Castle1 ; Level 1-4 BG Palette
	.word lvlPalSprP2_1 ; Level 1-4 Sprite Palette
	.word lvlPalBG_2_1 ; Level 2-1 BG Palette
	.word lvlPalSprP2_1 ; Level 2-1 Sprite Palette
	.word lvlPalBG_2_2 ; Level 2-2 BG Palette
	.word lvlPalSprP2_1 ; Level 2-2 Sprite Palette
	.word lvlPalBG_GhostHouse1 ; Level 2-3 BG Palette
	.word lvlPalSprP2_1 ; Level 2-3 Sprite Palette
	.word lvlPalBG_Castle1
	.word lvlPalSprP2_1
	.word lvlPalBG_3_1 ; Level 3-1 BG Palette
	.word lvlPalSprP2_1 ; Level 3-1 Sprite Palette
	.word lvlPalBG_3_2 ; Level 3-2 BG Palette
	.word lvlPalSprP2_1 ; Level 3-2 Sprite Paltte
	.word lvlPalBG_GhostHouse1 ; Level 3-3 BG Palette
	.word lvlPalSprP2_1 ; Level 3-3 BG Palette
	.word ofs_FBBC
	.word lvlPalSprP2_1
	.word lvlPalBG_Bridge ; Level 4-1 BG Palette
	.word lvlPalSprP2_1 ; Level 4-1 Sprite Palette
	.word lvlPalBG_Bridge ; Level 4-2 BG Palette
	.word lvlPalSprP2_1 ; Level 4-2 Sprite Palette
	.word lvlPalBG_4_3 ; Level 4-3 BG Palette
	.word lvlPalSprP2_1 ; Level 4-3 Sprite Palette
	.word lvlPalBG_4_4 ; Level 4-4 (Area 2) BG Palette
	.word lvlPalSprP2_1 ; Level 4-4 (Area 2) BG Palette
	.word lvlPalBG_5_1 ; Level 5-1 BG Palette
	.word lvlPalSprP2_1 ; Level 5-1 Sprite Palette
	.word lvlPalBG_5_2 ; Level 5-2 BG Palette
	.word lvlPalSprP2_1 ; Level 5-2 Sprite Palette
	.word lvlPalBG_5_3 ; Level 5-3 BG Palette
	.word lvlPalSprP2_1 ; Level 5-3 Sprite Palette
	.word lvlPalBG_5_4 ; Level 5-4 BG Palette
	.word lvlPalSprP2_Castle3 ; Level 5-4 Sprite Palette
	.word lvlPalBG_6_1 ; Level 6-1 BG Palette
	.word lvlPalSprP2_1 ; Level 6-1 Sprite Palette
	.word lvlPalBG_6_2 ; Level 6-2 BG Palette
	.word lvlPalSprP2_1 ; Level 6-2 Sprite Palette
	.word lvlPalBG_6_3 ; Level 6-3 BG Palette
	.word lvlPalSprP2_1 ; Level 6-3 Sprite Palette
	.word lvlPalBG_6_4 ; Level 6-4 BG Palette
	.word lvlPalSprP2_Castle3 ; Level 6-4 Sprite Palette
	.word lvlPalBG_7_1 ; Level 7-1 BG Palette
	.word lvlPalSprP2_1 ; Level 7-1 Sprite Palette
	.word lvlPalBG_7_2 ; Level 7-2 BG Palette
	.word lvlPalSprP2_1 ; Level 7-2 Sprite Palette
	.word lvlPalBG_7_3 ; Level 7-3 BG Palette
	.word lvlPalSprP2_1 ; Level 7-3 Sprite Palette
	.word lvlPalBG_7_4 ; Level 7-4 BG Palette
	.word lvlPalSprP2_Castle3 ; Level 7-4 Sprite Palette
	.word lvlPalBG_GhostHouseIntro ; Ghost House Intro BG Palette
	.word lvlPalSprP2_1 ; Ghost House Intro Sprite Palette
	.word lvlPalBG_CastleIntro ; Castle Intro BG Palette
	.word lvlPalSprP2_1 ; Castle Intro Sprite Palette
	.word lvlPalBG_MortonBoss ; Morton Boss Room BG Palette
	.word lvlPalSprP2_MortonBoss ; Morton Boss Room Sprite Palette
	.word lvlPalBG_LemmyBoss ; Lemmy/Wendy Boss Room BG Palette
	.word lvlPalSprP2_LemmyBoss ; Lemmy/Wendy Boss Room Sprite Palette
	.word lvlPalBG_Castle2 ; Reznor Room, Level 2-4 (Areas 1 and 2) BG Palette
	.word lvlPalSprP2_Castle2 ; Reznor Room, Level 2-4 (Areas 1 and 2) Sprite Palette
	.word lvlPalBG_Castle3 ; Level 1-4 (Area 2), 2-4 (Area 3), 3-4, 4-4 (Area 1) BG Palette
	.word lvlPalSprP2_Castle3 ; Level 1-4 (Area 2), 2-4 (Area 3), 3-4, 4-4 (Area 1) Sprite Palette
	.word lvlPalBG_YoshisHouse ; Yoshi's House BG Palette
	.word lvlPalSprP2_YoshisHouse ; Yoshi's House Sprite Palette
	.word lvlPalBG_MortonBoss ; Roy Boss Room BG Palette
	.word lvlPalSprP2_RoyBoss ; Roy Boss Room Sprite Palette
	.word lvlPalBG_BowserFight ; Bowser Fight BG Palette
	.word lvlPalSprP2_BowserFight ; Bowser Fight Sprite Palette
	.word lvlPalBG_BonusRoom ; Bonus Room BG Palette
	.word lvlPalSprP2_BonusRoom ; Bonus Room Sprite Palette
lvlPalBG_1_1:
	.byte $11, $30, $38, $3D
	.byte $11, $30, $2A, $1A
	.byte $11, $37, $2A, $1A
	.byte $11, $2C, $3C, $30

lvlPalBG_1_2:
	.byte $0A, $2C, $1C, $30
	.byte $0A, $30, $38, $28
	.byte $0A, $37, $2A, $1A
	.byte $0A, $29, $19, $39

lvlPalBG_1_3:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $37, $27
	.byte $0E, $29, $38, $18
	.byte $0E, $00, $10, $30

lvlPalBG_Castle1:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $20
	.byte $0E, $27, $17, $37

lvlPalBG_2_1:
	.byte $11, $11, $3C, $30
	.byte $11, $30, $38, $28
	.byte $11, $37, $2A, $1A
	.byte $11, $39, $29, $1A

lvlPalBG_2_2:
	.byte $0A, $31, $11, $30
	.byte $0A, $30, $38, $28
	.byte $0A, $0E, $2A, $30
	.byte $0A, $2A, $19, $39

lvlPalBG_GhostHouse1:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $1C, $2C, $38
	.byte $0E, $37, $27, $18

lvlPalBG_3_1:
	.byte $0E, $21, $11, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $37, $0C, $1C
	.byte $0E, $38, $27, $17

lvlPalBG_3_2:
	.byte $01, $2C, $1C, $3C
	.byte $01, $30, $38, $28
	.byte $01, $00, $10, $30
	.byte $01, $38, $27, $17

ofs_FBBC:
	.byte $0E, $11, $21, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $30
	.byte $0E, $27, $17, $37

lvlPalBG_Bridge:
	.byte $30, $11, $2C, $0E
	.byte $30, $28, $18, $0E
	.byte $30, $37, $31, $0E
	.byte $30, $30, $2A, $0A

lvlPalBG_4_3:
	.byte $30, $11, $21, $0E
	.byte $30, $28, $18, $0E
	.byte $30, $37, $2A, $0A
	.byte $30, $0E, $2A, $1A

lvlPalBG_4_4:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $30
	.byte $0E, $27, $17, $37

lvlPalBG_5_1:
	.byte $0E, $2C, $1C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $1A, $28, $18
	.byte $0E, $1A, $0A, $2A

lvlPalBG_5_2:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $0C, $1C, $2C
	.byte $0E, $37, $27, $18

lvlPalBG_5_3:
	.byte $01, $2C, $1C, $3C
	.byte $01, $30, $38, $28
	.byte $01, $00, $10, $38
	.byte $01, $38, $27, $17

lvlPalBG_5_4:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $20
	.byte $0E, $27, $17, $37

lvlPalBG_6_1:
	.byte $0E, $01, $21, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $29, $38, $18
	.byte $0E, $29, $30, $18

lvlPalBG_6_2:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $0C, $1C, $2C
	.byte $0E, $37, $27, $18

lvlPalBG_6_3:
	.byte $01, $1C, $2C, $30
	.byte $01, $30, $28, $18
	.byte $01, $37, $2A, $1C
	.byte $01, $3C, $2C, $1C

lvlPalBG_6_4:
	.byte $0E, $01, $31, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $30
	.byte $0E, $27, $17, $37

lvlPalBG_7_1:
	.byte $0E, $21, $11, $30
	.byte $0E, $30, $38, $28
	.byte $0E, $1A, $2A, $30
	.byte $0E, $00, $10, $30

lvlPalBG_7_2:
	.byte $0E, $31, $22, $30
	.byte $0E, $30, $38, $28
	.byte $0E, $1A, $2A, $30
	.byte $0E, $00, $10, $30

lvlPalBG_7_3:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $0C, $1C, $31
	.byte $0E, $37, $27, $18

lvlPalBG_7_4:
	.byte $0E, $15, $1A, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $30
	.byte $0E, $27, $16, $37

lvlPalBG_GhostHouseIntro:
	.byte $0E, $30, $0C, $15
	.byte $0E, $01, $31, $30
	.byte $0E, $37, $2A, $1A
	.byte $0E, $10, $0C, $00

lvlPalBG_CastleIntro:
	.byte $0E, $21, $31, $30
	.byte $0E, $31, $2A, $1A
	.byte $0E, $37, $2A, $1A
	.byte $0E, $00, $10, $20

lvlPalBG_MortonBoss:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $20
	.byte $0E, $27, $17, $37

lvlPalBG_LemmyBoss:
	.byte $0E, $11, $21, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $30
	.byte $0E, $27, $17, $37

lvlPalBG_Castle2:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $30
	.byte $0E, $27, $17, $37

lvlPalBG_Castle3:
	.byte $0E, $11, $3C, $30
	.byte $0E, $30, $28, $18
	.byte $0E, $00, $10, $30
	.byte $0E, $27, $17, $37

lvlPalBG_YoshisHouse:
	.byte $0E, $2A, $2C, $36
	.byte $0E, $37, $27, $38
	.byte $0E, $2A, $37, $30
	.byte $0E, $1C, $2C, $30

lvlPalBG_BowserFight:
	.byte $1E, $10, $00, $0E
	.byte $1E, $27, $22, $20
	.byte $1E, $2A, $1A, $20
	.byte $1E, $27, $16, $20

lvlPalBG_BonusRoom:
	.byte $0E, $30, $2C, $0E
	.byte $0E, $30, $28, $18
	.byte $0E, $30, $2A, $19
	.byte $0E, $30, $21, $23

lvlPalSprP1_1:
	.byte $11, $37, $16, $0E
	.byte $10, $30, $16, $02
	.byte $10, $2A, $20, $0E
	.byte $10, $38, $16, $0E

lvlPalSprP1_MortonBoss:
	.byte $0E, $37, $16, $0E
	.byte $0E, $30, $16, $02
	.byte $0E, $28, $1A, $30
	.byte $0E, $38, $16, $0E

lvlPalSprP1_LemmyBoss:
	.byte $0E, $37, $16, $0E
	.byte $10, $30, $16, $02
	.byte $10, $28, $06, $30
	.byte $10, $38, $16, $0E

lvlPalSprP1_Castle2:
	.byte $0E, $37, $16, $0E
	.byte $00, $30, $16, $02
	.byte $00, $10, $20, $0E
	.byte $00, $38, $16, $0E

lvlPalSprP1_Castle3:
	.byte $0E, $37, $16, $0E
	.byte $00, $30, $16, $02
	.byte $00, $10, $20, $0E
	.byte $00, $38, $16, $0E

lvlPalSprP1_YoshisHouse:
	.byte $0E, $37, $16, $0E
	.byte $10, $30, $16, $02
	.byte $10, $2A, $20, $0E
	.byte $10, $38, $16, $0E

lvlPalSprP1_RoyBoss:
	.byte $1E, $37, $16, $0E
	.byte $1E, $30, $16, $02
	.byte $1E, $28, $1C, $30
	.byte $1E, $28, $16, $0E

lvlPalSprP1_BowserFight:
	.byte $0E, $37, $16, $0E
	.byte $0E, $30, $16, $02
	.byte $0E, $28, $15, $30
	.byte $0E, $28, $16, $0E

lvlPalSprP1_BonusRoom:
	.byte $3D, $37, $16, $0E
	.byte $3D, $30, $16, $02
	.byte $3D, $2A, $30, $0F
	.byte $3D, $28, $16, $0E

lvlPalSprP2_1:
	.byte $11, $37, $2B, $0E
	.byte $10, $30, $1B, $02
	.byte $10, $2A, $20, $0E
	.byte $10, $38, $16, $0E
	; What are these extras for exactly?
	.byte $0E, $37, $2B, $0E
	.byte $10, $30, $1B, $02
	.byte $10, $2A, $20, $0E
	.byte $10, $38, $16, $0E
	.byte $0E, $37, $2B, $0E
	.byte $10, $30, $1B, $02
	.byte $10, $2A, $20, $0E
	.byte $10, $38, $16, $0E
lvlPalSprP2_MortonBoss:
	.byte $0E, $37, $2B, $0E
	.byte $0E, $30, $1B, $02
	.byte $0E, $28, $1A, $30
	.byte $0E, $38, $16, $0E

lvlPalSprP2_LemmyBoss:
	.byte $0E, $37, $2B, $0E
	.byte $10, $30, $1B, $02
	.byte $10, $28, $06, $30
	.byte $10, $38, $16, $0E

lvlPalSprP2_Castle2:
	.byte $0E, $37, $2B, $0E
	.byte $00, $30, $1B, $02
	.byte $00, $10, $20, $0E
	.byte $00, $38, $16, $0E

lvlPalSprP2_Castle3:
	.byte $0E, $37, $2B, $0E
	.byte $00, $30, $1B, $02
	.byte $00, $10, $20, $0E
	.byte $00, $38, $16, $0E

lvlPalSprP2_YoshisHouse:
	.byte $0E, $37, $2B, $0E
	.byte $10, $30, $1B, $02
	.byte $10, $2A, $20, $0E
	.byte $10, $38, $16, $0E

lvlPalSprP2_RoyBoss:
	.byte $1E, $37, $2B, $0E
	.byte $1E, $30, $1B, $02
	.byte $1E, $28, $1C, $30
	.byte $1E, $28, $16, $0E

lvlPalSprP2_BowserFight:
	.byte $0E, $37, $2B, $0E
	.byte $0E, $30, $1B, $02
	.byte $0E, $28, $15, $30
	.byte $0E, $28, $16, $0E

lvlPalSprP2_BonusRoom:
	.byte $3D, $37, $2B, $0E
	.byte $3D, $30, $1B, $02
	.byte $3D, $2A, $30, $0F
	.byte $3D, $28, $16, $0E

paletteFadeOutMasks:
	.word paletteFadeOutMask1 ;
	.word paletteFadeOutMask1 ; Default fade-out (Fade all colors)
	.word paletteFadeOutMask1 ;
	.word paletteFadeOutMask2 ; BG-only fade-out (Fade only BG colors)

; Filter none
paletteFadeOutMask1:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00

; Filter all
paletteFadeOutMask2:
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
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $00
	.byte $04
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
	.byte $03
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
	.byte $03
	.byte $03
	.byte $01
	.byte $03
	.byte $01
	.byte $03
	.byte $01
	.byte $68
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $03
	.byte $03
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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
mapperProtection:
	LDA #$05 ; Use 5 for both values to multiply
	STA M90_MULTIPLICAND ; First value to multiply (5)
	STA M90_MULTIPLIER ; Multiplier (5)
	LDA #$00
	JSR sub3_F184
mapperProtectLoop:
	LDA M90_MULTIPLICAND ; Get product
	CMP #$19
	BNE mapperProtectLoop ; If the product isn't 25, send the game into a loop and prevent it from starting
	RTS
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
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $01
