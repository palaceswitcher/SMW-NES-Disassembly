;disassembled by BZK 6502 Disassembler
jmp_63_E000:
	PHP ;Push the CPU status into the stack
	PHA ;Push the accumulator into the stack
	TXA
	PHA ;Push the X register into the stack
	TYA
	PHA ;Push the Y register into the stack
	LDA PPUMaskMirror
	STA PPUMASK ;Copy the software mask register to the hardware register
	LDA XScroll
	STA PPUSCROLL ;Set horizontal scroll in the PPU
	LDA YScroll
	STA PPUSCROLL ;Set vertical scroll in the PPU
	LDA PPUControlMirror
	AND #$FC
	ORA VerticalScrollFlag
	STA PPUControlMirror
	STA PPUCTRL
	
	JSR sub3_F6E0 ;Set interupt mode to on
;UPDATE CHR ;Seems to have an effect when the game lags too much	
;I think this is a bandaid fix for the interrupt being mistimed by lag
;On return from interrupt
	LDA BGBank1
	STA M90_BG_CHR0 ;Update 1st BG bank
	LDA BGBank2
	STA M90_BG_CHR1 ;Update 2nd BG bank
	LDA BGBank3
	STA M90_BG_CHR2 ;Update 3rd BG bank
	LDA BGBank4
	STA M90_BG_CHR3 ;Update 4th BG bank (This goes unused)
	LDA SpriteBank1
	STA M90_SP_CHR0 ;Update 1st sprite bank
	LDA SpriteBank2
	STA M90_SP_CHR1 ;Update 2nd sprite bank
	LDA SpriteBank3
	STA M90_SP_CHR2 ;Update 3rd sprite bank
	LDA SpriteBank4
	STA M90_SP_CHR3 ;Update 4th sprite bank
	PLA
	TAY ;Pull the Y register from the stack
	PLA
	TAX ;Pull the X register from the stack
	PLA ;Pull the accumulator from the stack
	PLP ;Pull CPU status from the stack
	RTI
NMI_E05C:
	JMP loc3_EF10
NMI_E05F:
	JMP loc3_EFE0
NMI_E062:
	PHP ;Push CPU status to stack 
	PHA ;Push A to stack
	TXA 
	PHA ;Push X to stack
	TYA
	PHA ;Push Y to stack
	
	LDA ColumnFinishFlag
	BEQ bra3_E0E8
	LDA PPUSTATUS ;Clear PPU address data latch
	LDA PPUControlMirror
	ORA #$04
	STA PPUCTRL
	LDA PPUSTATUS ;Clear PPU address data latch
	LDA ColumnFinishFlag
	STA PPUADDR
	LDA NextBGColumn
	STA PPUADDR
	LDX #$00
bra3_E088:
	LDA TileColumnMem,X
	STA PPUDATA
	INX
	CPX #$1E
	BCC bra3_E088
	LDA PPUSTATUS ;Clear PPU address data latch
	LDA ColumnFinishFlag
	ORA #$08
	STA PPUADDR
	LDA NextBGColumn
	STA PPUADDR
bra3_E0A4:
	LDA TileColumnMem,X
	STA PPUDATA
	INX
	CPX #$38
	BCC bra3_E0A4
	LDA PPUSTATUS ;Clear PPU address data latch
	LDA PPUControlMirror
	AND #$FB
	STA PPUCTRL
	LDA PalAssignPtrHi
	BEQ bra3_E0E1
	LDX #$00
bra3_E0C0:
	LDA PPUSTATUS ;Clear PPU address data latch
	LDA PalAssignPtrHi,X
	STA PPUADDR
	LDA PalAssignPtrLo,X
	STA PPUADDR
	LDA PalAssignData,X
	STA PPUDATA
	INX
	INX
	INX
	CPX #$30
	BCC bra3_E0C0
	LDA #$00
	STA PalAssignPtrHi
bra3_E0E1:
	LDA #$00
	STA ColumnFinishFlag
	BEQ bra3_E0F0
bra3_E0E8:
	LDA PPUUpdatePtr
	BEQ bra3_E0F0
	JSR sub3_F20F
bra3_E0F0:
	LDA $03E4
	BEQ bra3_E0F8
	JSR sub3_F5CE
	
bra3_E0F8: ;OAM writing for in level sprites
	LDA #$00
	STA OAMADDR
	LDA #$02 ; this is the start address SpriteMem+0
	STA OAMDMA ;set OAM to copy sprite all data from SpriteMem+0-$02FF
	
	LDA PPUMaskMirror
	STA PPUMASK
	LDA ScrollXPos
	STA PPUSCROLL ;update X scrolling
;Screen shake flag check and timer
	LDY $03
	LDA $0633
	BEQ bra3_E12F ;if screen shake timer == 00, skip shake
	CMP #$30 ;else compare #$30
	BCC bra3_E11E ;if $0633 less than #$30 but > #$00, branch (creates timer for shake)
;If exceed #$30	
	LDA #$00 
	STA $0633 ;clear screen shake timer
	BEQ bra3_E12F ;skip ahead, always
	
bra3_E11E: ;go here if screen shake timer less than #$30 (48 decimal)
	INC $0633 ;add 1 to screen shake timer
	LDA FrameCount
	AND #$04
	BNE bra3_E12F ;if not match,  branch to shake screen
	CPY #$EC
	BCS bra3_E12F ;if frame count >= #$EC, branch
	INY
	INY
	INY
	INY ;Increment Y by 4 
	
bra3_E12F:
	STY PPUSCROLL
	LDA PPUControlMirror
	AND #$FC
	ORA VerticalScrollFlag
	STA PPUControlMirror
	STA PPUCTRL
	JSR sub3_F6E0
;Update BG and sprite banks	
	LDA BGBank1
	STA M90_BG_CHR0
	LDA BGBank2
	STA M90_BG_CHR1
	LDA BGBank3
	STA M90_BG_CHR2
	LDA BGBank4
	STA M90_BG_CHR3
	LDA SpriteBank1
	STA M90_SP_CHR0
	LDA SpriteBank2
	STA M90_SP_CHR1
	LDA SpriteBank3
	STA M90_SP_CHR2
	LDA SpriteBank4
	STA M90_SP_CHR3

	JSR PauseChk ;Check if the game is paused
	JSR UpdateJoypad ;Update controller input
	LDA #$3A
	STA M90_PRG0
	LDA #$3B
	STA M90_PRG1 ;Load music banks 58 and 59 into $8000 and $A000 respectively
	JSR jmp_58_85BE
	JSR jmp_58_862A
	LDA #$00
	STA $3C
	INC FrameCount
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI

Reset:
	SEI
	CLD ;Standard 2A03/6502 initialization
	LDX #$FF
	TXS ;Set the stack pointer to $FF
	LDA #$00
	STA M90_IRQ_DISABLE ;Disable mapper interrupts
	STA PPUMASK ;Clear the screen
	STA PPUCTRL
	LDX #$02 ;Set the amount of frames to wait. This is likely done to prevent false negatives

VBlankWait1:
	BIT PPUSTATUS
	BPL VBlankWait1 ;Wait for VBlank
VBlankWait2:
	BIT PPUSTATUS
	BMI VBlankWait2 ;Wait for the VBlank flag to clear
	DEX
	BNE VBlankWait1 ;Loop until the set amount of frames have passed

;--------------------

; Mapper/System initialization
	LDA #62
	STA M90_PRG2 ;Swap bank 62 into the 3rd PRG bank
	LDA #63
	STA M90_PRG3 ;Swap bank 63 into the 4th PRG bank
	LDA #%10000101
	STA M90_IRQ_MODE ;Set mapper IRQ mode (Count down, normal prescaler, 3 bit prescaler, PPU A12 source/scanline counter)
	LDA #%00111110
	STA M90_BANK_SIZE ;Set mapper bank sizes (8K PRG, 1K CHR)
	LDA #$00
	STA M90_NT0
	LDA #$01
	STA M90_NT1
	LDA #$02
	STA M90_NT2
	LDA #$03
	STA M90_NT3 ;Set 1K nametable banks (Seems useless, ROM nametables are already disabled)
	LDA #$00
	STA M90_IRQ_XOR ;Set to IRQ XOR to zero
	STA M90_PPU_CFG ;Clear PPU address config
	STA M90_CHR_CTRL1 ;Disable outer bank selection
	LDA #%00000001
	STA M90_CHR_CTRL2 ;Enable horizontal nametable mirroring
	LDA #%00001111
	STA APUSTATUS ;Enable audio channels (excluding DMC)
	LDA #$00
	STA DMC_FREQ ;Disable the DMC channel
	LDA #%01000000
	STA JOY2 ;Disable APU frame counter interrupt
	STA M90_IRQ_DISABLE ;Disable mapper interrupts
	LDA PPUSTATUS ;Clear PPU address latch

	LDA #$10 ;Set the high/low byte of the PPU address
	TAX ;Also set the loop count
bra3_E202: ;No idea what this loop is for
	STA PPUADDR
	STA PPUADDR ;Store the high/low bytes
	EOR #$10 ;Alternate between #$10 and #$0
	DEX
	BNE bra3_E202 ;Keep looping until the loop count is reached

; Wipe memory
	LDA #$00 ;Load zero
	LDX #$00 ;Clear X index
ClearMemory:
	STA $00,X
	STA $0200,X
	STA $0300,X
	STA $0400,X
	STA $0500,X
	STA $0600,X
	STA $0700,X ;Wipe all pages of memory
	DEX
	BNE ClearMemory ;Keep looping until every page is cleared

; Initialize game engine?
	LDA #$00 ;Clear the accumulator
	JSR MapperProtection ;Verify the game is on Mapper 90
	LDA #58
	STA M90_PRG0
	LDA #59
	STA M90_PRG1 ;Swap music banks into first and second PRG banks
	JSR Sound_Init ;Initizialize sound driver
	LDA #mus_Title
	STA Sound_Music ;Play the title screen music
	JSR sub_58_8E23+1 ;Jumps inbetween an opcode. Probably an error.
	INC MuteFlag ;Enable audio
	LDA #$00
	STA HUDDisplay ;Sey HUD to default display mode?
	CLI ;Disable interrupts
	LDA #$80
	ORA PalTransition
	STA PalTransition ;Disable transition
	LDA #$03
	STA PlayerPowerup ;Set powerup to cape

	LDA #$4C
	STA NMIJMPOpcode ;Store the first byte of the NMI JMP
	LDX #$04
	LDA tbl3_EF08,X	
	STA NMIJMPOpcode+1
	LDA #$E0
	STA NMIJMPOpcode+2 ;Load JMP location pointer
	LDA #%10001000
	STA PPUCTRL
	STA PPUControlMirror ;Set PPU control
	LDA #%00011000
	STA PPUMASK
	STA PPUMaskMirror ;Set PPU mask

loc3_E277:
	INC $00E4
	LDA FrameCount
	CMP FrameCount+1
	BEQ loc3_E277 ;Loop if the duplicate frame counter is the same as the main counter
	STA FrameCount+1 ;If they aren't, make them the same
	LDA #$01
	STA $062D
	JSR sub3_E2AB
	LDA #$00
	STA $062D
	LDX #$00
	LDA a:InLevelFlag
	BNE bra3_E298
	LDX #$04
bra3_E298:
	LDA tbl3_EF08,X
	STA NMIJMPOpcode+1
	LDA ScrollXPos
	STA XScroll ;Copy horizontal scroll
	LDA ScrollYPos
	STA YScroll ;Copy vertical scroll
	JMP loc3_E277 ;Jump
sub3_E2AB:
	LDA a:InLevelFlag
	BNE loc3_E317 ;Branch if in a level
	LDX #$04
	LDA tbl3_EF08,X
	STA NMIJMPOpcode+1
	JMP loc3_E2BE ;Jump
	JMP loc3_E317 ;Jump
loc3_E2BE:
	LDX #$29 ;Load bank 41
	STX $09
	STX M90_PRG1 ;Swap bank 41 into 2nd PRG slot
	JMP jmp_41_A000 ;Jump
	RTS

;-----UNUSED CODE START-----
;Seems to be an early routine for loading levels
	LDA a:GameState
	ASL
	TAY ;Get the event pointer
	LDA tbl3_E2DB,Y 
	STA $32 ;Load lower byte of pointer
	LDA tbl3_E2DB+1,Y
	STA $33 ;Load upper byte of pointer
	JMP ($32) ;Jump to the loaded pointer
tbl3_E2DB:
	dw pnt2_E2E5
	dw pnt2_E316
	dw pnt2_E316
	dw pnt2_E316
	dw pnt2_E316
pnt2_E2E5:
	LDA ButtonsPressed
	AND #btnA
	BEQ bra3_E2FE ;If the A button is pressed,
	INC LevelNumber ;Increment level number
	LDA LevelNumber
	CMP #$04 ;Check if level number is below 4,
	BCC bra3_E2FE ;If it is, branch
	LDA #$00 ;If it's above 4, continue
	STA LevelNumber ;Clear level number
	INC WorldNumber ;Carry over world number (1-5 would become 2-1)
bra3_E2FE:
	LDA ButtonsPressed
	AND #btnStart
	BEQ bra3_E315 ;If start is pressed,
	INC a:InLevelFlag ;Set game state to 'in level'
	LDA #$00
	STA a:GameState ;Clear event triggers
	LDA #$05
	STA PalTransition
	JSR sub3_F919 ;Jump
bra3_E315:
	RTS
pnt2_E316:
	RTS
;-----UNUSED CODE END-----

loc3_E317:
	LDA a:GameState
	ASL
	TAY ;Get the pointer for the current event
	LDA tbl3_E329,Y
	STA $32 ;Load lower byte of pointer
	LDA tbl3_E329+1,Y
	STA $33 ;Load upper byte of pointer
	JMP ($32) ;Jump to loaded pointer
tbl3_E329:
	dw pnt2_E353 ;Game State 0
	dw pnt2_E372 ;Reentering level
	dw pnt2_E409 ;Normal/Default
	dw pnt2_E4CA ;Entering door
	dw pnt2_E534 ;Death
	dw pnt2_E610 ;Castle intro
	dw pnt2_E6ED ;Level complete
	dw pnt2_E79E ;Unusable item box use (nothing)
	dw pnt2_E7A2 ;Game State 8
	dw pnt2_E7D0 ;Game State 9
	dw pnt2_E85F ;JY Easter egg
	dw pnt2_ED75 ;Bonus pipe down
	dw pnt2_EE02 ;Exiting pipe horizontally
	dw pnt2_EE23 ;Exiting pipe upwards
	dw pnt2_EE59 ;Enter 1st cannon pipe
	dw pnt2_EE96 ;Launch out of 1st cannon
	dw pnt2_EEC8 ;Enter 2nd cannon pipe
	dw pnt2_EE96 ;Launch out of 2nd cannon
	dw pnt2_EEC8 ;Enter pipe up
	dw pnt2_ED75
	dw pnt2_EEFD
pnt2_E353:
	LDA YoshiExitStatus
	STA Player1YoshiStatus ;Copy player 2's yoshi to current yoshi
	LDA #$80
	ORA PalTransition
	STA PalTransition
	LDA #$3C
	STA M90_PRG0 ;Swap bank 60 into 1st PRG slot (This bank is useless. Why?)
	LDA #$3D
	STA M90_PRG1 ;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_B19E
	INC a:GameState
	RTS
pnt2_E372:
	LDA a:GameSubstate
	ASL
	TAY ;Get the pointer for the current event part
	LDA tbl3_E384,Y
	STA $32 ;Load lower byte of pointer
	LDA tbl3_E384+1,Y
	STA $33 ;Load upper byte of pointer
	JMP ($32) ;Jump to loaded pointer
tbl3_E384:
	dw pnt2_E388
	dw pnt2_E3DD
pnt2_E388:
	LDA #$00
	STA PPUCTRL
	STA PPUControlMirror ;Clear PPU control
	STA PPUMASK
	STA PPUMaskMirror ;Clear PPU mask
	LDX #$00 ;Set slot to 0
	TXA
bra3_E397:
	STA ObjectSlot,X ;Clear object slot
	INX ;Move to next slot
	CPX #$14
	BCC bra3_E397 ;Loop until all 20 have been cleared
	STA YoshiUnmountedState ;Remove Yoshi
	JSR sub3_E904 ;Jump
	LDA #$3C
	STA M90_PRG0 ;Swap bank 60 into 1st PRG slot
	LDA #$3D
	STA M90_PRG1 ;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_B38E
	LDA TimerSetting
	STA LevelTimerLo ;Set lower byte of level timer
	STA LevelTimerLo+2 ;Store backup
	LDA TimerSetting+1
	STA LevelTimerHi ;Set upper byte of level timer
	STA LevelTimerHi+2 ;Store backup
	LDA #%00011000
	STA PPUMaskMirror ;Set PPU mask
	LDA #%10001000
	STA PPUCTRL
	STA PPUControlMirror ;Set PPU control
	LDA #%01
	STA M90_CHR_CTRL2 ;Set mirroring to horizontal
	JSR sub3_F0CB ;Jump
	INC a:GameSubstate ;Go to next part of event
	RTS

TimerSetting: dw 300 ;Timer data for levels

pnt2_E3DD:
	LDA #$00
	STA FadeoutMode ;Disable "blackout" effect
	JSR sub3_E6E0
	JSR sub3_F919
	LDA #$00
	STA $52
	STA a:GameSubstate ;End level transition
	LDA DataBank2
	CMP #$23
	BNE bra3_E405 ;Check if using the tileset PRG bank for the castle or ghost house intro

	;If using an intro level, continue as normal
	LDA CameraXScreen
	BNE bra3_E405 ;Make sure the camera is on the first screen
	LDA LevelNumber
	BEQ bra3_E405 ;Make sure the player isn't in the first level of a world
	LDA #$05
	STA a:GameState ;Trigger castle/ghost house intro
	RTS
	;Otherwise, start the level as normal.
	bra3_E405:
		INC a:GameState
		RTS

;----------------------------------------
;DEFAULT GAME STATE ($E409)
;----------------------------------------
pnt2_E409:
	LDA a:GameSubstate
	BEQ @Continue
	JMP loc3_E498 ;Jump if in the level exit substate

@Continue:
	LDX #$02
	LDA tbl3_EF08,X
	STA NMIJMPOpcode+1 ;Set the high byte of the NMI jump
	LDA PauseFlag
	BNE bra3_E442 ;Branch if the game is paused
	LDA #$39
	STA M90_PRG1 ;Swap the player control bank into the 2nd PRG slot
	LDA EndingFreezeFlag
	BNE bra3_E42B ;Branch if the ending cutscene is playing
	JSR jmp_57_ACAC ;Jump
bra3_E42B:
	LDA $06EF
	BEQ bra3_E437
	LDA #$00
	STA $06EF
	STA PlayerXSpeed ;Clear player's X speed
bra3_E437:
	LDA UnderwaterFlag
	BEQ bra3_E445 ;Branch if not underwater
	LDA FrameCount
	AND #$01
	BEQ bra3_E445
bra3_E442:
	JMP loc3_E45F ;Jump
bra3_E445:
	JSR sub3_ED14
	LDA PSwitchTimer
	BEQ loc3_E45F ;Branch if P-Switch timer is up
	INC PSwitchFrameCount ;Increment frame count
	LDA PSwitchFrameCount
	CMP #$3B
	BCC loc3_E45F ;After 60 frames pass,
	DEC PSwitchTimer ;Decrease timer
	LDA #$00
	STA PSwitchFrameCount ;Clear frame count

loc3_E45F:
	LDA EndingFreezeFlag
	BNE bra3_E47C ;Don't let the player unpause at the ending cutscene
	;If not in ending cutscene:
		LDA ButtonsPressed
		AND #btnStart
		BEQ bra3_E47C
		;If start was pressed:
			LDA #$00
			STA JYEasterEggInput ;Clear Easter egg button combo input
			LDA PauseFlag
			EOR #$01
			STA PauseFlag ;Toggle pause flag
			LDA #sfx_Pause
			STA Sound_Sfx ;Play pause/unpause sound

bra3_E47C:
	LDA PauseFlag
	BEQ bra3_E494 ;Stop if game isn't paused
	;If game is paused:
		JSR JYButtonComboCheck ;Check for Easter egg button combo
		LDA ButtonsPressed
		AND #btnSelect
		BEQ bra3_E494 ;Stop if select isn't pressed
		;If select pressed:
			INC a:GameSubstate ;Enter level exit state if
			LDX CurrentPlayer
			INC Player1Lives,X ;Temporarily increment current player's life count

bra3_E494:
	JSR HUD_Update ;Update HUD before stopping
	RTS

loc3_E498:
	LDA #$00
	STA FadeoutMode ;Disable BG 'blackout' effect
	JSR sub3_E6D5 ;Jump
	JSR sub3_F919 ;Jump
	JSR sub3_E904 ;Jump
	LDA #$00
	STA PauseFlag ;Unpause the game
	STA a:InLevelFlag ;Not in a level anymore
	STA a:GameSubstate
	LDA #gameState_MapExitLevelTransition
	STA a:GameState ;Set to transition state for exiting a level
	JSR BackupPlayerPowerups
	RTS

;----------------------------------------
;SUBROUTINE ($E4BA)
;Backup the player's powerup and Yoshi.
;----------------------------------------
BackupPlayerPowerups:
	LDX CurrentPlayer ;Set index for current player
	LDA PlayerPowerup
	STA P1PowerupBackup,X ;Backup player's powerup
	LDA YoshiExitStatus
	STA P1YoshiBackup,X ;Backup the player's Yoshi
	RTS

pnt2_E4CA:
	LDA a:GameSubstate
	ASL
	TAY
	LDA tbl3_E4DC,Y
	STA $32
	LDA tbl3_E4DC+1,Y
	STA $33
	JMP ($32)
tbl3_E4DC:
	dw pnt2_E4E4
	dw pnt2_E4EC
	dw pnt2_E4F7
	dw pnt2_E509
pnt2_E4E4:
	LDA #sfx_Warp
	STA Sound_Sfx ;Play warp sound
	INC a:GameSubstate
	RTS
pnt2_E4EC:
	LDX #$00
	LDY #$3C
	JSR sub3_E5B6 ;Jump
	INC a:GameSubstate
	RTS
pnt2_E4F7:
	LDA #$00
	STA FadeoutMode ;Disable BG 'blackout' effect
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	INC a:GameSubstate ;Go to next part of event
	RTS
pnt2_E509:
	LDY WarpLevelNumber ;Load pointers based on level number of warp
	LDA tbl3_EB24,Y
	STA $32 ;Store lower byte of 1st pointer
	LDA tbl3_EB24+1,Y
	STA $33 ;Store upper byte of 1st pointer
	LDA tbl3_EA10,Y
	STA $34 ;Store lower byte of 2nd pointer
	LDA tbl3_EA10+1,Y
	STA $35 ;Store upper byte of 2nd pointer
	JSR sub3_E870 ;Jump
	LDA #$01
	STA a:GameState ;Trigger door exit
	LDA #$00
	STA a:GameSubstate ;Go to 1st event part
	STA $06DE
	STA $06DF
	RTS
pnt2_E534:
	LDA a:GameSubstate ;Load part of event
	ASL ;Multiply by 2
	TAY ;Load pointer based on event part
	LDA tbl3_E546,Y
	STA $32 ;Load lower byte of pointer
	LDA tbl3_E546+1,Y
	STA $33 ;Load upper byte of pointer
	JMP ($32) ;Jump to loaded pointer
tbl3_E546:
	dw pnt2_E54E
	dw pnt2_E570
	dw pnt2_E585
	dw pnt2_E597
pnt2_E54E:
	LDA #$11
	STA PlayerAction ;Set action to "dying"
	LDA #$00
	STA PlayerAttributes ;Clear player's attributes
	STA PlayerXSpeed ;Clear player's X speed
	STA PlayerYSpeed ;Clear player's Y speed
	JSR sub3_E5D4 ;Jump
	LDA #mus_Death
	STA Sound_Music ;Play death music
	LDX #$00 ;Set action tick count to 1
	LDY #$28 ;Set tick length to 40 frames
	JSR sub3_E5B6 ;Jump
	JSR HUD_Update ;Jump
	INC a:GameSubstate ;Start level transition
	RTS
pnt2_E570:
	LDA #$00
	STA PlayerXSpeed ;Clear X speed
	LDA #$70
	STA PlayerYSpeed ;Set Y speed to 70h
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Make player move up
	JSR sub3_E5D4
	INC a:GameSubstate
	RTS
pnt2_E585:
	LDA #$00
	STA PlayerXSpeed ;Clear X speed
	JSR sub3_E5D4 ;Jump
	LDX #$04 ;Set action tick count to 4
	LDY #$3B ;Set tick length to 59 frames
	JSR sub3_E5B6 ;Jump
	INC a:GameSubstate ;Start level transition
	RTS
pnt2_E597:
	LDA #$00
	STA FadeoutMode ;Disable BG blackout flag
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA a:InLevelFlag ;Set game state for map
	STA a:GameSubstate ;Go to first part of event
	LDA #$16
	STA a:GameState ;Trigger map fade-in
	JSR BackupPlayerPowerups
	RTS
sub3_E5B6:
	INC ActionFrameCount ;Increment frame count for player action
	CPY ActionFrameCount
	BCS bra3_E5CB ;Branch when loaded action tick length is exceeded
	LDA #$00
	STA ActionFrameCount ;Clear action frame count
	INC PlayerActionTicks ;Increase action tick
	CPX PlayerActionTicks
	BCC bra3_E5CE ;Branch if the loaded tick count isn't reached
bra3_E5CB:
	PLA
	PLA ;Pull accumulator from stack twice (Not sure what this is for)
	RTS
bra3_E5CE:
	LDA #$00
	STA PlayerActionTicks ;Clear action tick count
	RTS
sub3_E5D4:
	LDA #$39
	STA M90_PRG1 ;Swap player bank into 2nd PRG slot
	JSR jmp_57_ACA5
	JSR jmp_57_A000
	LDA #$36
	STA M90_PRG1 ;Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A150
	JSR jmp_54_A0D9
	JSR jmp_54_A000
	LDA #$3D
	STA M90_PRG1 ;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F
	LDA #$00
	STA ObjFrameCounter
	LDA #$34
	STA M90_PRG1 ;Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A080 ;Jump
	JSR jmp_52_A089 ;Jump
	JSR RenderItemBoxSprite ;Jump
	JSR sub3_E9C4 ;Jump
	RTS
pnt2_E610:
	JSR sub3_ED14 ;Jump
	JSR HUD_Update ;Jump
	LDA ButtonsPressed
	AND #btnA|btnB
	BEQ bra3_E62F ;If A or B are pressed,
	LDA #$00
	STA Player1YoshiStatus ;Remove Yoshi
	LDA #$39
	STA M90_PRG1 ;Swap player bank into 2nd PRG slot
	JSR sub4_A14A ;Jump
	LDA #$03
	STA a:GameSubstate ;Skip to 3rd part of event
bra3_E62F:
	LDA a:GameSubstate ;Load event part
	ASL ;Multiply by 2
	TAY ;Load pointer based on event part
	LDA tbl3_E641,Y
	STA $32 ;Load lower byte of pointer
	LDA tbl3_E641+1,Y
	STA $33 ;Load upper byte of pointer
	JMP ($32) ;Jump to loaded pointer
tbl3_E641:
	dw pnt2_E649
	dw pnt2_E68B
	dw pnt2_E69E
	dw pnt2_E6B0
pnt2_E649:
	LDA PlayerYSpeed
	BNE bra3_E68A ;Branch if moving vertically
	LDA #$01
	STA PlayerAction ;Set action to walking
	LDA #$10
	STA PlayerXSpeed ;Set walking speed to 10h
	LDA PlayerMovement
	AND #$BE
	STA PlayerMovement ;Make player face right
	LDA PlayerSprXPos
	CMP #$80 ;If player hasn't reached this point,
	BCC bra3_E68A ;stop
	LDA Player1YoshiStatus
	BEQ bra3_E681 ;Branch if player doesn't have Yoshi
	JSR sub3_E965 ;Jump
	LDA #$01
	STA YoshiExitStatus ;Set Yoshi for Player 2
	LDA #$50
	STA PlayerYSpeed ;Set Y speed to 50h
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Set movement to 'moving up'
	LDA #$05
	STA PlayerAction ;Do spin jump
	LDA #sfx_SpinJump
	STA Sound_Sfx ;Play spin jump sound
	RTS
bra3_E681:
	LDA PlayerSprXPos
	CMP #$B0 ;If player hasn't reached this point,
	BCC bra3_E68A ;stop
	INC a:GameSubstate ;Set level transition
bra3_E68A:
	RTS
pnt2_E68B:
	LDA #$08
	STA PlayerAction ;Make player look up
	LDA #$00
	STA PlayerXSpeed ;Clear player's X speed
	LDX #$01
	LDY #$3B
	JSR sub3_E5B6 ;Jump
	INC a:GameSubstate ;Go to next part of event
	RTS
pnt2_E69E:
	LDA #$01
	STA PlayerAction ;Set action to walking
	LDA #$10
	STA PlayerXSpeed ;Set walking speed to 10h
	LDA PlayerSprXPos
	CMP #$C8 ;If player hasn't reached this point,
	BCC bra3_E6AF ;stop
	INC a:GameSubstate ;Go to next part of event
bra3_E6AF:
	RTS
pnt2_E6B0:
	LDA WorldNumber ;Load world number
	ASL
	ASL ;Multiply it by 4
	CLC
	ADC LevelNumber ;Add it to level number to get total level number
	ASL ;Multiply result by 2
	STA WarpLevelNumber ;Store as warp level number
	LDA #$00
	STA WarpNumber ;Set level warp to 0
	LDA #$03
	STA a:GameState ;Enter door
	LDA #$00
	STA a:GameSubstate ;Set event part
	STA ActionFrameCount ;Disable action frame counter
	STA PlayerActionTicks ;Disable action timer
	STA PlayerAction ;Clear player action
	RTS

;----------------------------------------
;SUBROUTINE ($E6D5)
;----------------------------------------
sub3_E6D5:
	LDA PalTransition
	AND #$80
	BEQ bra3_E6EC ;Branch if the palette transition is already set??
	LDA #$05 ;If it isn't, set it
	BNE bra3_E6E9

;----------------------------------------
;SUBROUTINE ($E6E0)
;----------------------------------------
sub3_E6E0:
	LDA PalTransition
	AND #$80 ;If palette transition not set,
	BEQ bra3_E6EC
	LDA #$00

bra3_E6E9:
	STA PalTransition

bra3_E6EC:
	RTS

pnt2_E6ED:
	LDA #$39
	STA M90_PRG1 ;Swap player bank into 2nd PRG slot
	JSR jmp_57_A000 ;Jump
	LDA #$36
	STA M90_PRG1 ;Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A000 ;Jump
	LDA #$34
	STA M90_PRG1 ;Swap bank 52 into 2nd PRG slot
	LDA #$3D
	STA M90_PRG1 ;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F ;Jump
	JSR sub3_E9C4
	LDA a:GameSubstate ;Load event part
	ASL
	TAY ;Load pointer based on event part
	LDA tbl3_E71F,Y
	STA $32 ;Load lower byte of pointer
	LDA tbl3_E71F+1,Y
	STA $33 ;Load upper byte of pointer
	JMP ($32) ;Jump to loaded pointer
tbl3_E71F:
	dw pnt2_E727
	dw pnt2_E748
	dw pnt2_E769
	dw pnt2_E774
pnt2_E727:
	LDA PlayerYSpeed
	BNE bra3_E747 ;If player not moving vertically,
	LDA #$01
	STA FadeoutMode ;Start BG 'blackout' effect
	JSR sub3_E6D5 ;Jump
	JSR sub3_F919 ;Jump
	LDA #$01
	STA PlayerAction ;Set action to walking
	LDA #$20
	STA PlayerXSpeed ;Set walking speed to 20h
	LDA PlayerMovement
	AND #$BE
	STA PlayerMovement ;Make player face right
	INC a:GameSubstate ;Go to next part of event
bra3_E747:
	RTS
pnt2_E748:
	LDA #$10
	STA PlayerXSpeed ;Set walking speed to 10h
	LDA PlayerSprXPos
	CMP #$98
	BCC bra3_E768 ;If player's sprite reaches this point...
	LDA #$10
	STA PlayerAction ;...Do victory pose 
	LDA #$00
	STA PlayerXSpeed ;Stop moving horizontally
	LDA #$01
	STA FadeoutMode ;Start BG 'blackout' effect
	JSR sub3_E6E0 ;Jump
	JSR sub3_F919 ;Jump
	INC a:GameSubstate ;Go to next part of event
bra3_E768:
	RTS
pnt2_E769:
	LDX #$02
	LDY #$3B
	JSR sub3_E5B6
	INC a:GameSubstate ;Go to next part of event
	RTS
pnt2_E774:
	LDA #$01
	STA UnlockNextLevel ;Unlock next level
	STA PlayerAction ;Set action to walking
	LDA #$20
	STA PlayerXSpeed ;Set walking speed to 20h
	LDA #$00
	STA FadeoutMode ;Stop BG 'blackout' effect
	JSR sub3_E6D5 ;Jump
	JSR sub3_F919 ;Jump
	JSR sub3_E904 ;Jump
	LDA #$00
	STA a:InLevelFlag ;Set game state to be outside a level
	STA a:GameSubstate ;Clear event part
	LDA #$16
	STA a:GameState ;Set event number to 16h
	JSR BackupPlayerPowerups ;Jump
	RTS
pnt2_E79E:
	INC a:GameState ;Increment event number (go right to next event)
	RTS
pnt2_E7A2:
	LDA #$39
	STA M90_PRG1 ;Swap player bank (bank 57) into 2nd PRG slot
	JSR jmp_57_ACA5 ;Jump
	JSR jmp_57_AD04 ;Jump
	JSR jmp_57_A000 ;Jump
	LDA #$36
	STA M90_PRG1 ;Swap bank 54 into 2nd PRG slot
	LDA #$00
	STA ObjFrameCounter
	LDA #$34
	STA M90_PRG1 ;Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A080 ;Jump
	JSR jmp_52_A089 ;Jump
	JSR RenderItemBoxSprite ;Jump
	JSR sub3_E9C4 ;Jump
	RTS
pnt2_E7D0:
	LDA #$39
	STA M90_PRG1 ;Swap player bank (bank 57) into 2nd PRG slot
	JSR jmp_57_A000 ;Jump
	LDA #$36
	STA M90_PRG1 ;Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A150 ;Jump
	JSR jmp_54_A07E ;Jump
	JSR jmp_54_A000 ;Jump
	LDA #$3D
	STA M90_PRG1 ;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F ;Jump
	LDA #$34
	STA M90_PRG1 ;Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A089 ;Jump
	JSR sub3_E9C4 ;Jump
	LDA a:GameSubstate
	ASL
	TAY ;Load pointer based on event part
	LDA tbl3_E80F,Y
	STA $32 ;Load lower byte of pointer
	LDA tbl3_E80F+1,Y
	STA $33 ;Load upper byte of pointer
	JMP ($32) ;Jump to loaded pointer
tbl3_E80F:
	dw pnt2_E813
	dw pnt2_E81E
pnt2_E813:
	LDX #$06
	LDY #$3B
	JSR sub3_E5B6
	INC a:GameSubstate
	RTS
pnt2_E81E:
	LDY #$03
	LDA #$01
	BEQ bra3_E826
	LDY #$06
bra3_E826:
	STY $32
	LDY #$01
	LDA WorldNumber
	CMP $32
	BNE bra3_E83D
	LDA LevelNumber
	CMP #$03
	BNE bra3_E83D
	STY $037E
	BNE bra3_E840
bra3_E83D:
	STY UnlockNextLevel
bra3_E840:
	LDA #$00
	STA FadeoutMode ;Disable BG 'blackout' effect
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA a:InLevelFlag ;Set game state to 'not in level'
	STA a:GameSubstate ;Set event part
	LDA #$16
	STA a:GameState
	JSR BackupPlayerPowerups
	RTS
pnt2_E85F:
	LDA a:GameSubstate
	BNE bra3_E86F ;Branch if not on 1st event part
	LDA #$3D
	STA M90_PRG1 ;Swap level handling bank into 2nd PRG slot
	JSR jmp_61_BE85 ;Jump
	INC a:GameSubstate ;Go to next event part
bra3_E86F:
	RTS
sub3_E870:
	LDY WarpNumber
	LDX #$01
	STX InterruptMode ;Set horizontal interrupt for levels
	LDA ($32),Y ;Load warp X screen from pointer
	AND #%01111111 ;Mask out bit 7
	STA CameraXScreen ;Store as camera X screen
	STA PlayerColXScreen ;Store as wall collision position
	LDA #$00
	STA $52
	STA PlayerColXPos ;Reset player collision and sprite positioning?
	INY ;Move to next byte
	LDA ($32),Y
	STA $53
	ASL
	STA VerticalScrollFlag
	LDA #$00
	STA PlayerColYScreen
	STA $54
	STA PlayerColYPos
	LDA CameraXScreen
	STA PlayerXScreen ;Move player to same X screen as the camera
	INY
	LDA ($32),Y
	STA PlayerXPos
	STA PlayerSprXPos ;Get X position
	LDA $53
	STA PlayerYScreen ;Move the player to the same Y screen as the camera
	INY
	LDA ($32),Y
	STA PlayerYPos
	STA PlayerSprYPos ;Get Y position
	INY ;Move to next byte
	LDA ($32),Y
	STA HorizScrollLock ;Set horizontal scroll lock
	INY ;Move to next byte
	LDA ($32),Y
	STA XScreenCount ;Set horizontal screen count
	INY ;Move to next byte
	LDA ($32),Y
	STA VertScrollLock ;Set vertical scroll lock
	INY ;Move to next byte
	LDA ($32),Y
	STA YScreenCount ;Set vertical screen count
	LDA WarpNumber ;Load warp number
	LSR ;Divide it by 2
	TAY ;Load pointer based on the result
;First byte of level settings
	LDA ($34),Y ;Load byte from 2nd pointer location
	AND #%00100000
	STA PlayerAttributes ;Mask out and store BG priority bit
	STA $06E1
	LDA ($34),Y
	AND #%11000000
	STA UnderwaterFlag ;Mask out and store underwater bit
	LDA ($34),Y
	AND #%11011111 ;Clear BG priority bit
	STA DataBank1 ;Store as level bank/number
	INY
;Second byte of level settings
	LDA ($34),Y ;Load next byte from 2nd pointer location
	CMP #$32
	BNE bra3_E8ED
	LDA #$04 ;If the level is the final boss room, set the interrupt mode accordingly
	STA InterruptMode
bra3_E8ED:
	LDA #$3D
	STA M90_PRG1
	LDA ($34),Y
	JSR sub6_B34A
	INY
	LDA ($34),Y
	STA DataBank2
	INY
	LDA ($34),Y
	STA BGPalette
	RTS
sub3_E904:
	JSR sub3_F176 ;Jump
	JSR sub3_E959 ;Jump
	LDA #$01
	STA YoshiIdleStorage
	STA YoshiTongueState
	LDA #$90
	STA SpriteBank2 ;Load bank 90h into 2nd sprite bank
	LDA #$00
	STA PlayerXSpeed
	STA PlayerYSpeed
	STA PlayerMovement
	STA $1A
	STA PlayerAction
	STA a:PlayerState
	STA ActionFrameCount
	STA PlayerActionTicks
	STA $0613
	STA $0614
	STA $0629
	STA $0627
	STA PlayerHoldFlag
	STA InvincibilityTimer ;Clear ALL player variables
	LDA #$39
	STA M90_PRG1 ;Swap player bank (bank 57) into 2nd PRG slot
	JSR sub4_A14A ;Jump
	JSR jmp_57_A000 ;Jump
	JSR sub3_E9C4 ;Jump
	LDX #$70
	LDA #$00
bra3_E950:
	STA TileAttributes,X ;Clear tile attribute
	INX
	CPX #$80 ;Keep going until all attributes are cleared
	BCC bra3_E950
	RTS
sub3_E959:
	LDA #$00
	TAX ;Clear X register
bra3_E95C:
	STA $03CE,X
	INX
	CPX #$16
	BCC bra3_E95C
	RTS
sub3_E965:
	LDA Player1YoshiStatus
	BEQ bra3_E9C3 ;If player has Yoshi,
	LDA PlayerMovement
	STA YoshiIdleMovement ;Set Yoshi's idle movement
	LDA #$00
	STA Player1YoshiStatus ;Stop riding Yoshi
	LDA #$39
	STA M90_PRG1 ;Swap player bank into 2nd PRG slot
	JSR sub4_A14A ;Jump
	LDA #$02
	STA YoshiUnmountedState ;Set Yoshi to be ducking down
	LDA PlayerYPosDup
	SEC
	SBC #$20 ;Subtract player's Y position by 20h
	STA YoshiYPos ;Set as Yoshi's Y position
	LDA PlayerYScreenDup
	SBC #$00
	STA YoshiYScreen ;Set Yoshi's Y screen
	LDA PlayerMovement
	ORA #$01
	STA PlayerMovement ;Set movement to dismounting Yoshi (right)
	LDY #$08 ;Set Yoshi X displacement for facing right
	LDA YoshiIdleMovement
	AND #$40
	BEQ bra3_E9A7 ;Branch if Yoshi is facing right
	LDA PlayerMovement
	AND #$FE
	STA PlayerMovement ;Set movement to dismounting Yoshi (left)
	LDY #$18 ;Load Yoshi X displacement for facing left
bra3_E9A7:
	STY $32 ;Store loaded X displacement temporarily 
	SEC
	LDA PlayerXPosDup
	SBC $32 ;Subtract player's X position by loaded displacement
	STA YoshiXPos ;Store result as Yoshi's X position
	LDA PlayerXScreenDup
	SBC #$00 ;Subtract player's X screen by nothing
	STA YoshiXScreen ;Store result as Yoshi's X screen
	LDA #$00
	STA $05F6
	LDA #$30
	STA PlayerXSpeed ;Set player's X speed to 30h
	INC ObjectCount ;Add Yoshi to total object count
bra3_E9C3:
	RTS
sub3_E9C4:
	LDA #$14
	STA $3C
	LDA #$39
	STA M90_PRG1 ;Swap player control bank into 2nd PRG slot
	JSR jmp_57_A23B
	JSR jmp_57_A8DE
	LDA #$34
	STA M90_PRG1 ;Swap bank 52 into 2nd PRG slot
	JSR jmp_52_A0F3
	RTS
JYButtonComboCheck:
	LDA ButtonsPressed
	CMP #btnStart
	BEQ JYTriggerDone ;Stop if the game is unpaused.
	LDA ButtonsPressed
	BEQ JYTriggerDone ;If any button is being pressed,
	LDX JYEasterEggInput ;Load correct input count
	BMI JYTriggerDone
	CMP JYScreenInputs,X
	BNE ClearJYInputs ;Start over if the wrong button is pressed
	INC JYEasterEggInput ;Continue with each correct input
	LDA JYEasterEggInput
	CMP #$08
	BCC JYTriggerDone ;Wait for all 8 inputs to be entered correctly
	LDA #$0A
	STA a:GameState ;Trigger JY Easter egg screen
JYTriggerDone:
	RTS
ClearJYInputs:
	LDA #$00
	STA JYEasterEggInput ;Clear correct input count
	RTS
	
;This is the 8 button code needed to trigger the JY easter egg screen
JYScreenInputs:
	db dirUp, dirRight, btnA, dirDown, dirRight, btnB, dirUp, dirLeft
tbl3_EA10:
	dw pnt2_EA48
	dw pnt2_EA48
	dw pnt2_EA48
	dw pnt2_EA48
	dw pnt2_EA48
	dw pnt2_EA48
	dw pnt2_EA54
	dw pnt2_EA70
	dw pnt2_EA48
	dw pnt2_EA48
	dw pnt2_EA80
	dw pnt2_EA9C
	dw pnt2_EA48
	dw pnt2_EA48
	dw pnt2_EA48
	dw pnt2_EAA8
	dw pnt2_EA48
	dw pnt2_EAB4
	dw pnt2_EA48
	dw pnt2_EAD0
	dw pnt2_EA48
	dw pnt2_EADC ;6-2
	dw pnt2_EA48
	dw pnt2_EAE8
	dw pnt2_EA48
	dw pnt2_EA48
	dw pnt2_EAF4
	dw pnt2_EB10
pnt2_EA48:
	db $03
	db $03
	db $1C
	db $03
	db $03
	db $03
	db $1C
	db $21
	db $0F
	db $0F
	db $1F
	db $20
pnt2_EA54:
	db $06
	db $06
	db $1D
	db $06
	db $06
	db $06
	db $1D
	db $06
	db $06
	db $06
	db $1D
	db $06
	db $06
	db $06
	db $1D
	db $06
	db $03
	db $27
	db $23
	db $1C
	db $FF
	db $FF
	db $FF
	db $FF
	db $06
	db $06
	db $1D
	db $06
pnt2_EA70:
	db $07
	db $07
	db $1D
	db $20
	db $07
	db $07
	db $1D
	db $20
	db $07
	db $07
	db $1D
	db $21
	db $07
	db $07
	db $1D
	db $1E
pnt2_EA80:
	db $0A
	db $0A
	db $1E
	db $0A
	db $0A
	db $0A
	db $1E
	db $0A
	db $0A
	db $0A
	db $1E
	db $0A
	db $0A
	db $0A
	db $1E
	db $0A
	db $0A
	db $0A
	db $1E
	db $0A
	db $0A
	db $0A
	db $1E
	db $0A
	db $03
	db $27
	db $23
	db $1C
pnt2_EA9C:
	db $0B
	db $0B
	db $1E
	db $21
	db $0B
	db $0B
	db $1E
	db $21
	db $0B
	db $0B
	db $1E
	db $1F
pnt2_EAA8:
	db $0F
	db $0F
	db $1F
	db $21
	db $0F
	db $0F
	db $1F
	db $0F
	db $0F
	db $0F
	db $1F
	db $20
pnt2_EAB4:
	db $11
	db $11
	db $20
	db $11
	db $11
	db $11
	db $20
	db $11
	db $03
	db $27
	db $23
	db $1C
	db $03
	db $27
	db $23
	db $1C
	db $11
	db $11
	db $20
	db $11
	db $11
	db $11
	db $20
	db $11
	db $11
	db $11
	db $20
	db $11
pnt2_EAD0:
	db $13
	db $13
	db $20
	db $13
	db $13
	db $13
	db $20
	db $13
	db $07
	db $07
	db $1D
	db $23
pnt2_EADC:
	db $15
	db $16
	db $21
	db $15
	db $15
	db $16
	db $21
	db $15
	db $03
	db $27
	db $23
	db $1C
pnt2_EAE8:
	db $17
	db $17
	db $21
	db $17
	db $17
	db $17
	db $21
	db $17
	db $0B
	db $0B
	db $1E
	db $1F
pnt2_EAF4:
	db $1A
	db $1A
	db $22
	db $1A
	db $1A
	db $1A
	db $22
	db $1A
	db $1A
	db $1A
	db $22
	db $1A
	db $1A
	db $1A
	db $22
	db $1A
	db $03
	db $27
	db $23
	db $1C
	db $1A
	db $1A
	db $22
	db $1A
	db $1A
	db $1A
	db $22
	db $1A
pnt2_EB10:
	db $1B
	db $1B
	db $22
	db $1B
	db $1B
	db $1B
	db $22
	db $1B
	db $3B
	db $1B
	db $22
	db $1B
	db $1B
	db $1B
	db $22
	db $1B
	db $3B
	db $32
	db $26
	db $24
tbl3_EB24:
	dw pnt2_EB5C
	dw pnt2_EB5C
	dw pnt2_EB5C
	dw pnt2_EB5C
	dw pnt2_EB5C
	dw pnt2_EB5C
	dw pnt2_EB74
	dw pnt2_EBAC
	dw pnt2_EB5C
	dw pnt2_EB5C
	dw pnt2_EBCC
	dw pnt2_EC04
	dw pnt2_EB5C
	dw pnt2_EB5C
	dw pnt2_EB5C
	dw pnt2_EC1C
	dw pnt2_EB5C
	dw pnt2_EC34
	dw pnt2_EB5C
	dw pnt2_EC6C
	dw pnt2_EB5C
	dw pnt2_EC84
	dw pnt2_EB5C
	dw pnt2_EC9C
	dw pnt2_EB5C
	dw pnt2_EB5C
	dw pnt2_ECB4
	dw pnt2_ECEC
pnt2_EB5C:
	db $00 ;warp data start here
	db $00
	db $40
	db $B0
	db $FF
	db $07
	db $FF
	db $00
	db $89
	db $00
	db $40
	db $B0
	db $08
	db $0D
	db $FF
	db $00
	db $10
	db $01
	db $40
	db $A0
	db $0F
	db $10
	db $00
	db $01
pnt2_EB74:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $06
	db $FF
	db $01
	db $08
	db $01
	db $40
	db $B0
	db $07
	db $09
	db $FF
	db $01
	db $0C
	db $01
	db $80
	db $A0
	db $0A
	db $0C
	db $FF
	db $01
	db $09
	db $01
	db $80
	db $A0
	db $07
	db $09
	db $FF
	db $01
	db $01
	db $00
	db $20
	db $C0
	db $00
	db $02
	db $FF
	db $00
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $0E
	db $01
	db $20
	db $B0
	db $0D
	db $0E
	db $FF
	db $01
pnt2_EBAC:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $02
	db $FF
	db $01
	db $06
	db $01
	db $70
	db $B0
	db $03
	db $06
	db $FF
	db $01
	db $08
	db $01
	db $40
	db $B0
	db $07
	db $0E
	db $00
	db $01
	db $10
	db $01
	db $40
	db $A0
	db $0F
	db $10
	db $00
	db $01
pnt2_EBCC:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $04
	db $00
	db $01
	db $0A
	db $01
	db $88
	db $B0
	db $05
	db $0B
	db $FF
	db $01
	db $02
	db $01
	db $40
	db $B0
	db $FF
	db $04
	db $00
	db $01
	db $0D
	db $01
	db $88
	db $B0
	db $0B
	db $0E
	db $00
	db $01
	db $04
	db $01
	db $88
	db $B0
	db $FF
	db $04
	db $00
	db $01
	db $06
	db $01
	db $40
	db $70
	db $05
	db $0B
	db $FF
	db $01
	db $01
	db $00
	db $20
	db $C0
	db $00
	db $02
	db $FF
	db $00
pnt2_EC04:
	db $00
	db $00
	db $40
	db $40
	db $FF
	db $09
	db $FF
	db $00
	db $00
	db $01
	db $40
	db $60
	db $FF
	db $0B
	db $00
	db $01
	db $0D
	db $01
	db $40
	db $80
	db $0C
	db $0D
	db $00
	db $01
pnt2_EC1C:
	db $00
	db $01
	db $40
	db $80
	db $FF
	db $05
	db $00
	db $01
	db $06
	db $01
	db $40
	db $90
	db $05
	db $0D
	db $FF
	db $01
	db $10
	db $01
	db $40
	db $A0
	db $0F
	db $10
	db $00
	db $01
pnt2_EC34:
	db $00
	db $01
	db $40
	db $80
	db $FF
	db $0A
	db $00
	db $01
	db $00
	db $00
	db $30
	db $B0
	db $FF
	db $07
	db $FF
	db $00
	db $01
	db $00
	db $20
	db $C0
	db $00
	db $02
	db $FF
	db $00
	db $01
	db $00
	db $20
	db $C0
	db $00
	db $02
	db $FF
	db $00
	db $00
	db $00
	db $30
	db $B0
	db $FF
	db $07
	db $FF
	db $00
	db $06
	db $01
	db $70
	db $80
	db $FF
	db $0A
	db $00
	db $01
	db $06
	db $01
	db $70
	db $80
	db $FF
	db $0A
	db $00
	db $01
pnt2_EC6C:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $05
	db $00
	db $01
	db $06
	db $01
	db $40
	db $B0
	db $05
	db $11
	db $00
	db $01
	db $10
	db $01
	db $40
	db $A0
	db $0F
	db $10
	db $00
	db $01
pnt2_EC84:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $0B
	db $00
	db $01
	db $0C
	db $01
	db $40
	db $B0
	db $0B
	db $11
	db $00
	db $01
	db $01
	db $00
	db $20
	db $C0
	db $00
	db $02
	db $FF
	db $00
pnt2_EC9C:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $08
	db $00
	db $01
	db $00
	db $00
	db $40
	db $40
	db $FF
	db $0B
	db $FF
	db $00
	db $0D
	db $01
	db $40
	db $80
	db $0C
	db $0D
	db $00
	db $01
pnt2_ECB4:
	db $00
	db $01
	db $20
	db $B0
	db $FF
	db $04
	db $00
	db $01
	db $0C
	db $01
	db $88
	db $90
	db $09
	db $11
	db $00
	db $01
	db $09
	db $01
	db $48
	db $B0
	db $04
	db $09
	db $00
	db $01
	db $05
	db $01
	db $30
	db $B0
	db $04
	db $09
	db $00
	db $01
	db $01
	db $00
	db $20
	db $C0
	db $00
	db $02
	db $FF
	db $00
	db $00
	db $01
	db $30
	db $B0
	db $FF
	db $04
	db $00
	db $01
	db $04
	db $01
	db $48
	db $90
	db $FF
	db $04
	db $00
	db $01
pnt2_ECEC:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $02
	db $00
	db $01
	db $03
	db $01
	db $40
	db $B0
	db $02
	db $05
	db $00
	db $01
	db $06
	db $01
	db $30
	db $90
	db $05
	db $0A
	db $FF
	db $01
	db $0B
	db $01
	db $40
	db $B0
	db $0A
	db $11
	db $00
	db $01
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
sub3_ED14:
	LDA #$39
	STA M90_PRG1 ;Swap player bank into 2nd PRG slot
	JSR jmp_57_A000
	LDA #$36
	STA M90_PRG1 ;Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A150
	JSR jmp_54_A07E
	JSR jmp_54_A000
	LDA #$3D
	STA M90_PRG1 ;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F
	LDA #$34
	STA M90_PRG1 ;Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A080
	JSR jmp_52_A089
	JSR RenderItemBoxSprite
	JSR sub3_E9C4 ;Jump
	RTS
sub3_ED48:
	LDA #$24
	STA M90_PRG2 ;Swap bank 36 into 3rd PRG slot
	LDA SpecialWarpCoords,Y
	STA $32 ;Load lower byte of warp coord pointer
	LDA SpecialWarpCoords+1,Y
	STA $33 ;Load upper byte of warp coord pointer
	LDA SpecialWarpSettings,Y
	STA $34 ;Load lower byte of warp level pointer
	LDA SpecialWarpSettings+1,Y
	STA $35 ;Load upper byte of warp level pointer
	LDA #$00
	STA WarpNumber ;Set warp number to 0
	JSR sub3_E870
	INC a:GameSubstate ;Go to next part of event
	LDA #$00
	STA $06DE
	STA $06DF
	RTS
pnt2_ED75:
	LDA a:GameSubstate ;Load event part
	ASL
	TAY ;Load pointer based on event part
	LDA tbl3_ED87,Y
	STA $32 ;Load lower byte of pointer
	LDA tbl3_ED87+1,Y
	STA $33 ;Load upper byte of pointer
	JMP ($32) ;Jump to loaded pointer location
tbl3_ED87:
	dw pnt2_ED93
	dw pnt2_EDAA
	dw pnt2_EDCF
	dw pnt2_EDE1
	dw pnt2_E388
	dw pnt2_E3DD
pnt2_ED93:
	LDA #%00100000
	STA PlayerAttributes ;Set player to be behind BG
	LDA #$00
	STA PlayerAction ;Make player stand still
	JSR sub3_E5D4 ;Jump
	LDA #sfx_Warp
	STA Sound_Sfx ;Play warp sound
	JSR HUD_Update ;Jump
	INC a:GameSubstate ;Go to next part of event
	RTS
pnt2_EDAA:
	LDA #$00
	STA PlayerXSpeed ;Stop player from moving vertically
	LDA #$10
	STA PlayerYSpeed ;Set pipe speed to 10h
	LDA PlayerMovement
	AND #$FB ;Stop player from moving up
	LDY a:GameState
	CPY #$13 ;If player isn't going up a pipe,
	BNE bra3_EDBF ;branch
	ORA #$04 ;Otherwise, make the player move up
bra3_EDBF:
	STA PlayerMovement ;Store movement type
	JSR sub3_E5D4 ;Jump
	LDX #$01
	LDY #$16 ;Set action length to 22 frames
	JSR sub3_E5B6 ;Jump
	INC a:GameSubstate ;Go to next part of event
	RTS
pnt2_EDCF:
	LDA #$00
	STA FadeoutMode ;Disable BG 'blackout' effect
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	INC a:GameSubstate ;Go to next part of event
	RTS
pnt2_EDE1:
	LDY #$38
	JSR sub3_ED48
	LDA #$00
	STA UnderwaterFlag
	LDA #61
	STA M90_PRG1
	LDA BonusEntitySet
	STA a:$DC
	LDA BonusEntitySet+1
	STA a:$DD
	LDA #$00
	STA $06E1
	RTS
pnt2_EE02:
	JSR sub3_ED14
	JSR HUD_Update
	LDA #$01
	STA PlayerAction
	LDA #$10
	STA PlayerXSpeed
	LDA PlayerMovement
	AND #$BE
	STA PlayerMovement
	LDX #$01
	LDY #$1E
	JSR sub3_E5B6
	LDA #$02
	STA a:GameState
	RTS
pnt2_EE23:
	LDA a:GameSubstate
	ASL
	TAY
	LDA tbl3_EE35,Y
	STA $32
	LDA tbl3_EE35+1,Y
	STA $33
	JMP ($32)
tbl3_EE35:
	dw pnt2_EDCF
	dw pnt2_EE3D
	dw pnt2_E388
	dw pnt2_E3DD
pnt2_EE3D:
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	ASL
	TAY
	JSR sub3_ED48
	LDA #$3D
	STA M90_PRG1
	JSR GetEntitySetPtr
	LDA #$20
	STA PlayerAttributes
	RTS
pnt2_EE59:
	JSR sub3_ED14
	JSR HUD_Update
	LDA #$00
	STA PlayerAction
	LDA #$10
	STA PlayerYSpeed
	LDA PlayerMovement
	AND #$FB
	LDY $06E9
	BNE bra3_EE72
	ORA #$04
bra3_EE72:
	STA PlayerMovement
	LDA #$FF
	STA $06EA
	LDA ActionFrameCount
	CMP #$02
	BNE bra3_EE84
	LDA #sfx_Warp
	STA Sound_Sfx
bra3_EE84:
	LDX #$00
	LDY #$19
	JSR sub3_E5B6
	LDA #$00
	STA PlayerAttributes
	LDA #$02
	STA a:GameState
	RTS
pnt2_EE96:
	LDA a:GameSubstate
	ASL
	TAY
	LDA tbl3_EEA8,Y
	STA $32
	LDA tbl3_EEA8+1,Y
	STA $33
	JMP ($32)
tbl3_EEA8:
	dw pnt2_ED93
	dw pnt2_EDAA
	dw pnt2_EDCF
	dw ofs5_EEB4
	dw pnt2_E388
	dw pnt2_E3DD
ofs5_EEB4:
	LDY #$3A
	LDA a:GameState
	CMP #$0F
	BEQ bra3_EEBF
	LDY #$3C
bra3_EEBF:
	JSR sub3_ED48
	LDA #$20
	STA PlayerAttributes
	RTS
pnt2_EEC8:
	JSR sub3_ED14
	JSR HUD_Update
	LDA #$0F
	STA PlayerAction
	LDA #$50
	STA PlayerYSpeed
	STA PlayerXSpeed
	LDA PlayerMovement
	ORA #$04
	AND #$BE
	STA PlayerMovement
	LDA ActionFrameCount
	CMP #$02
	BNE bra3_EEEB
	LDA #$10
	STA Sound_Sfx
bra3_EEEB:
	LDX #$00
	LDY #$19
	JSR sub3_E5B6
	LDA #$00
	STA PlayerAttributes
	LDA #$02
	STA a:GameState
	RTS
pnt2_EEFD:
	LDA #$00
	STA a:GameSubstate
	LDA #$0C
	STA a:GameState
	RTS
tbl3_EF08:
	dw NMI_E062
	dw jmp_63_E000
	dw NMI_E05C
	dw NMI_E05F
loc3_EF10:
	PHP ;Push the CPU status into the stack
	PHA ;Push the accumulator into the stack
	TXA
	PHA ;Push the X register into the stack
	TYA
	PHA ;Push the Y register into the stack
	LDA #$3D
	STA M90_PRG1
	LDA ColumnFinishFlag
	BEQ bra3_EF2B
	JSR sub3_F055
	JSR sub3_F0A2
	LDA #$00
	STA ColumnFinishFlag
bra3_EF2B:
	LDA PPUUpdatePtr
	BEQ bra3_EF33
	JSR sub3_F20F
bra3_EF33: ;OAM writing for title screen and map sprites
	LDA #$00
	STA OAMADDR
	LDA #$02
	STA OAMDMA
	LDA PPUMaskMirror
	STA PPUMASK
	LDA #$00
	STA PPUADDR
	STA PPUADDR
	LDA PPUControlMirror
	AND #$FC
	ORA VerticalScrollFlag
	STA PPUControlMirror
	STA PPUCTRL
	LDA LogoFlag
	BNE bra3_EF67
	LDA ScrollXPos
	STA PPUSCROLL
	LDA ScrollYPos
	STA PPUSCROLL
	JMP loc3_EF73
bra3_EF67:
	LDA LogoXOffset
	STA PPUSCROLL
	LDA LogoYOffset
	STA PPUSCROLL
loc3_EF73:
	JSR sub3_F6E0
;Update CHR for title logo and map screen	
	LDX BGBank1
	STX M90_BG_CHR0 ;Update 1st BG bank
	INX ;Load next CHR bank
	STX M90_BG_CHR1 ;Set as 2nd BG bank
	LDX BGBank3
	STX M90_BG_CHR2 ;Update 3rd BG bank
	INX ;Load next CHR bank
	STX M90_BG_CHR3 ;Set as 4th BG bank
	LDA SpriteBank1
	STA M90_SP_CHR0 ;Update 1st sprite bank
	LDA SpriteBank2
	STA M90_SP_CHR1 ;Update 2nd sprite bank
	LDA SpriteBank3
	STA M90_SP_CHR2 ;Update 3rd sprite bank
	LDA SpriteBank4
	STA M90_SP_CHR3 ;Update 4th sprite bank
	JSR UpdateJoypad ;Jump
	INC SecFrameCount ;Increment second frame counter
	LDA SecFrameCount
	CMP #$3C ;If its below 60 frames,
	BCC bra3_EFB4 ;branch
	AND #$00
	STA SecFrameCount ;Clear second frame count
bra3_EFB4:
	LDA #$00
	STA $3C
	INC FrameCount ;Increment global frame counter
	LDA #$3A
	STA M90_PRG0
	LDA #$3B
	STA M90_PRG1
	LDA a:InLevelFlag
	BNE bra3_EFD9 ;If in a level, branch
	JSR jmp_58_85BE ;Otherwise, jump
	JSR jmp_58_862A
	LDA $08
	STA M90_PRG0
	LDA $09
	STA M90_PRG1
bra3_EFD9:
	PLA
	TAY ;Pull stack to Y register
	PLA
	TAX ;Pull stack to X register
	PLA ;Pull stack to accumulator
	PLP ;Pull CPU status from stack
	RTI
loc3_EFE0:
	PHP ;Push CPU status to stack
	PHA ;Push accumulator to stack
	TXA
	PHA ;Push X register to stack
	TYA
	PHA ;Push Y register to stack
	LDA PPUMaskMirror
	STA PPUMASK ;Copy software mask register to hardware register
	LDA PPUControlMirror
	AND #%11111100 ;Mask out bits
	ORA VerticalScrollFlag ;Add vertical scroll flag (changes nametable address if set)
	STA PPUControlMirror
	STA PPUCTRL ;Store in both software and hardware registers
	LDA LogoFlag ;If logo flag set,
	BNE bra3_F008 ;branch
	LDA ScrollXPos
	STA PPUSCROLL ;Load horizontal scroll position into PPU
	LDA ScrollYPos
	STA PPUSCROLL ;Load vertical scroll position into PPU
	JMP loc3_F014
bra3_F008:
	LDA LogoXOffset
	STA PPUSCROLL ;Load logo horizontal offset into PPU
	LDA LogoYOffset
	STA PPUSCROLL ;Load logo vertical offset into PPU
loc3_F014:
	JSR sub3_F6E0
	LDX BGBank1
	STX M90_BG_CHR0 ;Update 1st BG bank
	INX ;Load next CHR bank
	STX M90_BG_CHR1 ;Set it as 2nd BG bank
	LDX BGBank3
	STX M90_BG_CHR2 ;Update 3rd BG bank
	INX ;Load next CHR bank
	STX M90_BG_CHR3 ;Set it as 4th BG bank
	LDA SpriteBank1
	STA M90_SP_CHR0 ;Update 1st sprite bank
	LDA SpriteBank2
	STA M90_SP_CHR1 ;Update 2nd sprite bank
	LDA SpriteBank3
	STA M90_SP_CHR2 ;Update 3rd sprite bank
	LDA SpriteBank4
	STA M90_SP_CHR3 ;Update 4th sprite bank
	PLA
	TAY ;Pull stack into Y register
	PLA
	TAX ;Pull stack into X register
	PLA ;Pull stack into accumulator
	PLP ;Pull CPU status from stack
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
	LDA PPUSTATUS ;Clear address latch
	LDA PPUControlMirror ;Load PPU control software reg
	ORA #$04 ;Do OR operation, effectively adding 4
	STA PPUCTRL ;Store in PPU control hardware reg
	LDA PPUSTATUS
	LDA ColumnFinishFlag
	STA PPUADDR ;Load upper byte of PPU address (20 when scrolling)
	LDA NextBGColumn
	STA PPUADDR ;Load current column into low byte of PPU address
	LDX #$00 ;Set row to 0
bra3_F070:
	LDA TileColumnMem,X ;Load 8x8 tile row data
	STA PPUDATA ;Store it in the PPU
	INX ;Move to next row
	CPX #$1E ;Keep looping until row 30 is reached
	BCC bra3_F070
	LDA PPUSTATUS ;Clear address latch
	LDA ColumnFinishFlag ;Load upper byte (20 when scrolling)
	ORA #$08 ;Do OR operation, effectively adding 8
	STA PPUADDR ;Store as upper byte of PPU address
	LDA NextBGColumn
	STA PPUADDR ;Load current column into lower byte of PPU address
bra3_F08C:
	LDA TileColumnMem,X ;Load 8x8 tile row data
	STA PPUDATA ;Store it in the PPU
	INX ;Move to next row
	CPX TileRowCount ;Keep looping until current row count is reached
	BCC bra3_F08C
	LDA PPUSTATUS ;Clear address latch
	LDA PPUControlMirror
	AND #%11111011
	STA PPUCTRL ;Set PPUCTRL to increment by 1
	RTS
sub3_F0A2:
	LDA PalAssignPtrHi
	BEQ bra3_F0CA ;Stop if upper byte of mapping pointer is empty
	LDX #$00
bra3_F0A9:
	LDA PPUSTATUS ;Clear address latch
	LDA PalAssignPtrHi,X
	STA PPUADDR
	LDA PalAssignPtrLo,X
	STA PPUADDR ;Load attribute pointer
	LDA PalAssignData,X
	STA PPUDATA ;Store attributes
	INX
	INX
	INX ;Load next pointer data set
	CPX BGAttrRowCount ;Keep going until pointer count is reached
	BCC bra3_F0A9
	LDA #$00
	STA PalAssignPtrHi ;Clear upper byte of pointer
bra3_F0CA:
	RTS
sub3_F0CB:
	LDA WorldNumber ;Load world number
	ASL
	ASL ;multiply it by 4
	CLC
	ADC LevelNumber ;Add it to level count
	TAX ;Copy to X reg
	LDA LevelMusic,X
	STA Sound_Music ;Load/play music for level
	RTS
LevelMusic:
	db $29 ;1-1 Music
	db $28 ;1-2 Music
	db $20 ;1-3 Music
	db $2C ;1-4 Music
	db $29 ;2-1 Music
	db $28 ;2-2 Music
	db $2B ;2-3 Music
	db $2C ;2-4 Music
	db $2A ;3-1 Music
	db $2D ;3-2 Music
	db $2B ;3-3 Music
	db $2C ;3-4 Music
	db $29 ;4-1 Music
	db $28 ;4-2 Music
	db $20 ;4-3 Music
	db $2C ;4-4 Music
	db $29 ;5-1 Music
	db $2B ;5-2 Music
	db $2D ;5-3 Music
	db $2C ;5-4 Music
	db $29 ;6-1 Music
	db $2B ;6-2 Music
	db $28 ;6-3 Music
	db $2C ;6-4 Music
	db $29 ;7-1 Music
	db $28 ;7-2 Music
	db $2B ;7-3 Music
	db $2C ;7-4 Music
	db $29 ;Yoshi's House Music
pnt2_F0F8:
	LDX #$F0
	STX M90_BG_CHR0 ;Set bank F0 to 1st BG bank
	INX ;Load next CHR bank
	STX M90_BG_CHR1 ;Set it as 2nd BG bank
	LDX $0362
	STX M90_BG_CHR2 ;Update 3rd BG bank
	INX ;Load next CHR bank
	STX M90_BG_CHR3 ;Set it as 4th BG bank
	LDY #$21 ;Load upper byte of PPU address
	LDA ScrollXPos ;Load horizontal scroll position
	LSR
	LSR
	LSR ;Divide it by 8
	ORA #$B0 ;Do OR operation
	TAX ;Set it as lower byte of PPU address
	STY PPUADDR ;Store upper byte
	STX PPUADDR ;Store lower byte
	LDA ScrollXPos
	STA PPUSCROLL
	STA PPUSCROLL ;Set the horizontal scroll to both axes
	STA M90_IRQ_DISABLE ;Disable mapper IRQ
	RTS ;Done
pnt2_F127: ;HUD ON MAP SCREEN
	LDA PPUSTATUS
	LDA #$2B ;Load upper byte of PPU address
	STA PPUADDR
	LDA #$40 ;Load lower byte of PPU address
	STA PPUADDR
	LDA #$00
	STA PPUSCROLL
	STA PPUSCROLL ;Set scroll to default position
	LDA #%00001110
	STA PPUMASK ;Disable sprite rendering
	LDX #$EC
	STX M90_BG_CHR0 ;Set bank EC to 1st BG bank
	INX ;Load next CHR bank
	STX M90_BG_CHR1 ;Set it as 2nd BG bank
	INX ;Load next CHR bank
	STX M90_BG_CHR2 ;Set it as 3rd BG bank
	INX ;Load next CHR bank
	STX M90_BG_CHR3 ;Set it as 4th BG bank
pnt2_F152:
	STA M90_IRQ_DISABLE ;Disable mapper IRQ
	RTS
bra3_F156:
	LDA PPUSTATUS
	BPL bra3_F156 ;Keep looping if VBlank isn't set
bra3_F15B:
	LDA PPUSTATUS
	BPL bra3_F15B ;Keep looping if VBlank isn't set
	RTS ;Return
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
;Clear sprites from screen during gameplay
;This must happen before sprites are sent to $0200
;----------------------------------------
sub3_F176:
	LDA #$F8 ;Y position (offscreen)
	LDX #$00 ;storage offset
bra3_F17A: ;In level sprite clearing 
	STA SpriteMem,X ;store at sprite Y position
	INX
	INX
	INX
	INX ;increment X until on next Y pos storage byte
	BNE bra3_F17A ;loop until X overflows to 00  
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
;CONTROLLER READING
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
UpdateJoypad:
	JSR ReadJoypad
	LDX #$00 ;Set the X index for the first controller
	JSR ControllerLogicSub
	INX ;Set the X index for the second controller
ControllerLogicSub:
	LDA ButtonsHeld,X
	EOR ButtonsMirrored,X
	AND ButtonsHeld,X ;Try to match the main controller bits with the mirrored bits
	STA ButtonsPressed,X ;If they match, set the input to pressed. Otherwise, clear the input
	LDA ButtonsHeld,X
	STA ButtonsMirrored,X ;Copy the button input over
	AND #$0C ;Mask out the bits for up and down
	CMP #$0C
	BNE UpdateJoypadDone ;If both up and down are held, continue
	LDA ButtonsHeld,X
	AND #%11111011
	STA ButtonsHeld,X ;Ignore the down button
UpdateJoypadDone:
	RTS
	
ReadJoypad:
	LDA #$01
	STA JOY1 ;Strobe controller input
	LDA #$00
	STA JOY1 ;Reload controller input
	LDA #$01
	STA JOY1 ;Strobe controller again
	NOP
	NOP ;Wait 2 cycles
	LDA #$00
	STA JOY1 ;Read controller input
	NOP
	NOP ;Wait 2 cycles
	LDA #$01
	LSR ;Set the carry by shifting a bit into it
	TAX ;Set the X index for the first controller
	STA JOY1 ;Reload controller input again
	JSR sub3_F1EC
	INX ;Set the X index for the second controller
sub3_F1EC:
	LDA #$00
	STA Controller2Input ;Clear input for the 2nd controller
	LDY #$08 ;Set loop count to 8
bra3_F1F3:
	PHA ;Push blank value into the stack
	LDA JOY1,X ;Read controller input
	STA $063D ;Store input data
	LSR
	LSR ;Shift bit 1 of the control input into the carry (check for left button?)
	ROL $25 ;Shift the carry bit into memory??
	LSR $063D ;Shift bit 0 of the control input into the carry
	PLA ;Pull empty value back from accumulator
	ROL Controller2Input ;Shift the carry bit into memory (set another controller bit)??
	DEY
	BNE bra3_F1F3 ;Loop for the set amount of times
	ORA Controller2Input
	STA ButtonsHeld,X
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=
;END OF CONTROLLER READING
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=	
sub3_F20F:
	LDA PPUUpdatePtr
	BEQ bra3_F258
	LDA $03A0
	ORA PPUControlMirror
	AND #$7F
	STA PPUCTRL
	LDY #$00
	LDX #$00
bra3_F222:
	LDA PPUSTATUS ;Clear address latch
	LDA PPUUpdatePtr
	STA PPUADDR ;Set upper byte of PPU pointer
	LDA PPUUpdatePtr+1
	STA PPUADDR ;Set lower byte of PPU pointer
bra3_F231:
	LDA PPUDataBuffer,X
	STA PPUDATA ;Transfer data from the buffer
	INY
	INX ;Go to the next byte of the buffer
	CPY PPUWriteCount
	BCC bra3_F231 ;Keep storing data until the buffer size is reached
	LDA PPUUpdatePtr+1
	CLC
	ADC #$20
	STA PPUUpdatePtr+1 ;Move down one row of tiles
	BCC bra3_F24C
	INC PPUUpdatePtr ;Add to the upper byte (if necessary) 
bra3_F24C:
	LDY #$00
	DEC $03A3
	BNE bra3_F222
	LDA #$00
	STA PPUUpdatePtr
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
;SUBROUTINE ($F27F)
;Updates HUD counters while in levels.
;----------------------------------------
HUD_Update:
	LDA InterruptMode
	CMP #$04
	BEQ @Stop ;Don't render the HUD in the Bowser fight
	LDA PPUUpdatePtr
	BNE @Stop ;Stop if the upper byte of the PPU pointer is empty
		LDA HUDUpdate
		ASL
		TAY
		LDA HUD_UpdateFuncs,Y
		STA $32
		LDA HUD_UpdateFuncs+1,Y
		STA $33 ;Get pointer for current HUD update state
		JMP ($32) ;Jump to loaded pointer
@Stop:
	RTS
	
HUD_UpdateFuncs:
	dw HUD_UpdateLifeCount
	dw HUD_UpdateDragonCoins
	dw HUD_UpdateTimer
	dw HUD_UpdateScore
	dw HUD_UpdateCoinCount

;--------------------
; Update life counter display
;--------------------
HUD_UpdateLifeCount:
	JSR HUD_GetPPUUploadParams ;Get PPU upload parameters
	INC HUDUpdate ;Go to next update state after this code is finished
	LDX #0 ;Set index for Player 1
	LDA CurrentPlayer
	BEQ @Continue ;Continue using Player 1 index if it's their turn
		LDX #1 ;Use index for Player 2 otherwise, effectively clamping the player value to 1 (Player 2)
@Continue:
	LDA Player1Lives,X
	STA $34
	LDA #$00
	STA $35 ;Pass in player's life count
	LDA #$0B
	STA $26 ;Number tiles start at #$0B
	JSR HUD_RenderCounterToBuf ;Render counter to buffer

; Upload HUD counter buffer to PPU data buffer backwards
	LDY #$00 ;Start at end of life count string
	LDX #1 ;Start at second character of PPU data buffer
@UploadLoop:
	LDA HUDUpdateTiles,Y ;Load currently updated HUD tile
	STA PPUDataBuffer,X
	INY ;Advance to next tile in HUD buffer
	DEX ;Go to previous tile in PPU data buffer
	BPL @UploadLoop
	RTS

;--------------------
; Update Dragon Coin display
;--------------------
HUD_UpdateDragonCoins:
	JSR HUD_GetPPUUploadParams ;Get PPU upload parameters
	INC HUDUpdate ;Go to next update state after this code is finished

; Clear PPU buffer for Dragon coins
	LDX #4 ;Clear 5 tiles starting from the back
	LDA #$00
bra3_F2E0:
	STA PPUDataBuffer,X
	DEX
	BPL bra3_F2E0 ;Loop until the start of the buffer is reached

	LDX #0 ;Set index for player 1
	LDA CurrentPlayer
	BEQ @Continue ;Continue using Player 1 index if it's their turn
		LDX #1 ;Use index for Player 2 otherwise, effectively clamping the player value to 1 (Player 2)
@Continue:
	LDA Player1YoshiCoins,X
	STA $25 ;Copy player's Dragon Coin count to zero page for faster access
	BEQ @Stop ;Stop if no Dragon Coins have been collected
		LDY #$00 ;Clear Y for loop
		LDA #$06 ;Dragon Coin tile
	; Render a Dragon Coin icon for each one the player collected
	@TileUploadLoop:
		STA PPUDataBuffer,Y
		INY
		CPY $25
		BCC @TileUploadLoop
@Stop:
	RTS

;--------------------
; Update timer display
;--------------------
HUD_UpdateTimer:
	JSR HUD_GetPPUUploadParams ;Get PPU upload parameters
	INC HUDUpdate ;Go to next update state after this code is finished
	LDA LevelTimerLo
	STA $34
	LDA LevelTimerHi
	STA $35 ;Pass in timer
	LDA #$0B
	STA $26 ;Number tiles start at #$0B
	JSR HUD_RenderCounterToBuf ;Render counter to buffer

; Upload HUD counter buffer to PPU data buffer backwards
	LDY #$00
	LDX #$02 ;Upload 3 tiles from buffer
@UploadLoop:
	LDA HUDUpdateTiles,Y
	STA PPUDataBuffer,X
	INY ;Advance to next tile in HUD buffer
	DEX ;Go to previous tile in PPU data buffer
	BPL @UploadLoop
	RTS

;--------------------
; Update score display
;--------------------
HUD_UpdateScore:
	JSR HUD_GetPPUUploadParams ;Get PPU upload parameters
	INC HUDUpdate ;Go to next update state after this code is finished
	LDX #0 ;Set index for player 1
	LDA CurrentPlayer
	BEQ @Continue ;Continue using Player 1 index if it's their turn
		LDX #2 ;Use index for Player 2 otherwise, effectively clamping the player value to 1 (Player 2)
@Continue:
	LDA #$0B ;Number tiles start at #$0B
	STA $26
	LDA P1Score,X
	STA $34
	LDA P1Score+1,X
	STA $35 ;Pass in player's score
	JSR HUD_RenderCounterToBuf ;Render counter to buffer

; Upload HUD counter buffer to PPU data buffer backwards
	LDY #$00
	LDX #$04 ;Display up to 5 digits
@UploadLoop:
	LDA HUDUpdateTiles,Y
	STA PPUDataBuffer,X
	INY ;Advance to next tile in HUD buffer
	DEX ;Go to previous tile in PPU data buffer
	BPL @UploadLoop
	RTS

;--------------------
; Update coin counter display
;--------------------
HUD_UpdateCoinCount:
	JSR HUD_GetPPUUploadParams
	LDA #$00
	STA HUDUpdate
	LDX #$00 ;Set to Player 1
	LDA CurrentPlayer
	BEQ bra3_F369 ;Branch if Player 1 is playing
	LDX #$01 ;Otherwise, set values to Player 2
bra3_F369:
	LDA Player1Coins,X ;Load current player's coin count
	STA $34
	LDA #$00
	STA $35
	LDA #$0B ;Pass in player's coin count
	STA $26 ;Number tiles start at #$0B
	JSR HUD_RenderCounterToBuf ;Render counter to buffer

; Upload HUD counter buffer to PPU data buffer backwards
	LDY #$00
	LDX #$01 ;Display up to 2 digits
@UploadLoop:
	LDA HUDUpdateTiles,Y
	STA PPUDataBuffer,X
	INY ;Advance to next tile in HUD buffer
	DEX ;Go to previous tile in PPU data buffer
	BPL @UploadLoop
	RTS

;----------------------------------------
;SUBROUTINE ($F388)
;Returns the PPU update parameters for the current HUD update state
;----------------------------------------
HUD_GetPPUUploadParams:
	LDA HUDUpdate ;Get HUD update state
	ASL
	ASL
	TAX ;Get pointer for current HUD update stage (selects on screen HUD value to update)
	LDA tbl3_F3A7,X
	STA PPUUpdatePtr
	LDA tbl3_F3A7+1,X
	STA PPUUpdatePtr+1 ;Load PPU address
	LDA tbl3_F3A7+2,X
	STA $03A3
	LDA tbl3_F3A7+3,X
	STA PPUWriteCount ;Load tile length
	RTS
tbl3_F3A7:
; Life Counter (00)
	db $2B, $84 ;PPU Address 
	db $01
	db $02 ;Tile Length
; Dragon Coins (04)
	db $2B, $68
	db $01
	db $05
; Timer (08)
	db $2B, $94
	db $01
	db $03
; Score (12)
	db $2B, $98
	db $01
	db $05
; Coin Counter (16)
	db $2B, $7C
	db $01
	db $02

;----------------------------------------
;SUBROUTINE ($F3BB)
;Renders a counter in decimal to the HUD buffer.
; Parameters:
; > $26: Number start tile
; > $34: [16-bit] Counter value
;----------------------------------------
HUD_RenderCounterToBuf:
	LDA #$00
	STA $39
	STA $25 ;Clear registers
	LDA #10
	STA $38 ;Convert number to base 10 (decimal)

RenderDigitLoop:
	JSR Div16 ;Divide counter by base
	LDA $32
	CLC
	ADC $26 ;(Counter % Base) + Digit start tile = Next digit of counter
	LDY $25
	STA HUDUpdateTiles,Y ;Upload number tile to update buffer
	INC $25 ;Move to next tile in buffer
	LDA $25
	CMP #5
	BCC RenderDigitLoop ;Upload up to 5 digits of a count, displaying each digit from right to left

; Clear every unused digit from the left
	LDY #4
ClearUnusedDigitsLoop:
	LDA HUDUpdateTiles,Y
	CMP $26
	BNE @Stop ;Stop if a non-zero tile is reached, as this marks the start of the number
		LDA #$00
		STA HUDUpdateTiles,Y ;Render each zero from the left as blank
		DEY
		BNE ClearUnusedDigitsLoop ;Loop until the last digit is reached
@Stop:
	RTS

;----------------------------------------
;SUBROUTINE ($F3EC)
;Performs 16-bit division on two 16-bit numbers, storing the quotient in the dividend and returning the remainder.
; Parameters:
; > $34: [16-bit] Dividend, becomes quotient
; > $38: [16-bit] Divisor
; Return:
; > $32: [16-bit] Remainder
;----------------------------------------
Div16:
	LDA #$00
	STA $32
	STA $33 ;Clear the remainder
	LDX #16 ;Loop through all 16 bits of the number
; Divide the number by the base
@Loop:
	ASL $34
	ROL $35
	ROL $32
	ROL $33 ;Shift the bits of the numerical value in from the left
	LDA $32
	SEC
	SBC $38
	TAY ;Copy low byte of result to Y for later
	LDA $33
	SBC $39 ;Subtract divisor to see if it fits
	BCC @Continue ;If it underflowed, the divisor didn't fit yet
		INC $34 ;Otherwise, increment the result for each time it fits
		STA $33
		STY $32 ;Save the new difference as the remainder
@Continue:
	DEX
	BNE @Loop
	RTS

	LDA #$2B
	STA PPUADDR
	LDA #$40
	STA PPUADDR
	LDX #$00
	LDA InterruptMode
	CMP #$04
	BEQ bra3_F442
	LDA CurrentPlayer
	BNE bra3_F436 ;if player 2, branch
bra3_F42A: ;if player 1
	LDA tbl3_F44E,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra3_F42A
	RTS
	
bra3_F436:  ;If player 2, go here
	LDA tbl3_F4CE,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra3_F436
	RTS

bra3_F442: ;not sure, it just loads nothing from a table and clears PPU data over and over
	LDA tbl3_F54E,X ;this entire table is just #$00 and it's massive
	STA PPUDATA ;clear PPU data
	INX ;Increment X
	CPX #$80
	BCC bra3_F442 ;Loop if X < #$80
	RTS
tbl3_F44E:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $9F
	db $A0
	db $A1
	db $A2
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
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
	db $07
	db $08
	db $09
	db $00
	db $00
	db $00
	db $06
	db $0A
	db $00
	db $0B
	db $00
	db $00
	db $00
	db $00
	db $00
	db $0A
	db $00
	db $0B
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
	db $0E
	db $0B
	db $0B
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $0B
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
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
tbl3_F4CE:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $9F
	db $A0
	db $A1
	db $A2
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
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
	db $07
	db $08
	db $09
	db $00
	db $00
	db $00
	db $06
	db $0A
	db $00
	db $0B
	db $00
	db $00
	db $00
	db $00
	db $00
	db $0A
	db $00
	db $0B
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
	db $0E
	db $0B
	db $0B
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $0B
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
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
tbl3_F54E:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
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
	db $00
tbl3_F6AC:
	db $E0
tbl3_F6AD:
	db $E1
tbl3_F6AE:
	db $E2
	db $E3
	db $D0
	db $D1
	db $D2
	db $D3
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
IRQ:
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	JSR MemJMPOpcode ;Execute JMP opcode from RAM
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
	LDA #$4C
	STA MemJMPOpcode ;Store JMP opcode into RAM
	;Load pointer for JMP location
	LDA tbl3_F720
	STA MemJMPPtr
	LDA tbl3_F720+1
	STA MemJMPPtr+1
	JMP loc3_F6F3

sub3_F6E0:
	LDA #$4C
	STA MemJMPOpcode ;Load JMP opcode into RAM
	;Load JMP pointer for current interrupt mode
	LDA InterruptMode
	ASL
	TAX
	LDA tbl3_F71A,X
	STA MemJMPPtr
	LDA tbl3_F71A+1,X
loc3_F6F3:
	STA MemJMPPtr+1
	LDX InterruptMode
	LDA PPUSTATUS ;Clear address latch
	LDA InterruptLineTable,X
	STA M90_IRQ_DISABLE
	STA M90_IRQ_COUNTER ;Temporarily disable interrupts and set IRQ counter to the given scanline, causing it to fire an interrupt once the number of scanlines has been reached
	LDA #$FB
	STA M90_IRQ_PRESCALER
	STA M90_IRQ_ENABLE ;Enable interrupts and set prescaler to 251 (unsure of why)
	RTS
InterruptLineTable:
	db 8
	db 204 ;Level
	db 128
	db 8
	db 176 ;Bowser Fight
	db 8
	db 8
	db 8
	db 8
	db 8
	db 100 ;Title Screen
	db 208 ;Overworld Map
tbl3_F71A:
	dw pnt2_F152
	dw bra3_F751
	dw bra3_F76E
tbl3_F720:
	dw bra3_F78B
	dw bra3_F7A8
	dw pnt2_F734
	dw pnt2_F734
	dw pnt2_F734
	dw pnt2_F734
	dw pnt2_F734
	dw pnt2_F0F8
	dw pnt2_F127
	dw pnt2_F152

;-----------------------------
;HUD MODE CHECKS
;(CONDITIONAL NIGHTMARE WARNING!!)
;-----------------------------
pnt2_F734:
	LDA HUDDisplay
	BNE bra3_F73C ;Branch if HUD BG isn't updated at all (not sure about these)
	JMP loc3_F7C5 ;Jump if it is
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
	LDA HUDDisplay
	BNE bra3_F759 ;Go to next check if the HUD isn't in mode 0
	JMP loc3_F7CE ;If it is, jump
bra3_F759:
	CMP #$01
	BNE bra3_F760 ;Go to next check if the HUD isn't in mode 1
	JMP loc3_F85A ;If it is, jump
bra3_F760:
	CMP #$02
	BNE bra3_F767 ;Go to next check if the HUD isn't in mode 2
	JMP loc3_F899 ;If it is, jump
bra3_F767:
	CMP #$03
	BNE bra3_F76E ;Go to next check if the HUD isn't in mode 3
	JMP loc3_F7C5 ;If it is, jump
bra3_F76E:
	LDA HUDDisplay
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
	LDA HUDDisplay
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
	LDA HUDDisplay
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
	STA $E000 ;Write to useless, unmapped location (Maybe this was originally for another mapper?)
	LDA #$00
	STA HUDDisplay
	RTS
loc3_F7CE:
	INC HUDDisplay
	LDA #$20
	STA M90_IRQ_ENABLE
	STA M90_IRQ_ENABLE ;Enable interrupts
	RTS

PauseChk:
	LDA PauseFlag ;Check if the game is paused
	BNE BGAnimSubDone ;If so, branch (stop)
	LDA DataBank2 ;Otherwise, continue
	CMP #$26 ;Check if the final boss area is loaded
	BNE BGAnimSub ;If not, do standard BG animation
	JSR sub3_F90B ;If it is, animate the clown car instead
	RTS
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
; BG BANK ANIMATION
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
BGAnimSub:
	LDA DataBank2
	CMP #$23
	BEQ BGAnimSubDone ;Skip BG animation if on special level, which includes Yoshi's house or any of the level intro screens
	CMP #$2B
	BEQ BGAnimSubDone ;Also skip BG animation if the bonus level is loaded
	LDA BGBankAnimation
	LSR
	TAY ;Get pointer index for BG bank animation
	LDA AnimatedBankPointers,Y
	STA $A6 ;Load lower byte of pointer
	LDA AnimatedBankPointers+1,Y
	STA $A7 ;Load upper byte of pointer
	LDA FrameCount
	AND #%00011000 ;Mask out bits 4 and 5 to cycle through 4 values every 32 frames
	LSR
	LSR
	LSR ;Divide the result by 8 to get the bank index, effectively switching to the next bank every 8 frames
	TAY ;Set pointer index
	LDA ($A6),Y
	STA M90_BG_CHR3 ;Update the 4th CHR bank
BGAnimSubDone:
	RTS
AnimatedBankPointers:
	dw AnimBank2
	dw AnimBank2
	dw AnimBank3
	dw AnimBank2
	dw AnimBank2
	dw AnimBank2
	dw AnimBank1
	dw AnimBank1
	dw AnimBank2
	dw AnimBank2
	dw AnimBank1
	dw AnimBank1
	dw AnimBank3
	dw AnimBank3
	dw AnimBank3
	dw AnimBank1
	dw AnimBank2
	dw AnimBank1
	dw AnimBank2
	dw AnimBank1
	dw AnimBank3
	dw AnimBank2
	dw AnimBank1
	dw AnimBank1
	dw AnimBank1
	dw AnimBank4
	dw AnimBank1
	dw AnimBank2
AnimBank1:
	db $01
	db $45
	db $41
	db $0A
AnimBank2:
	db $5B
	db $56
	db $16
	db $36
AnimBank3:
	db $0D
	db $33
	db $63
	db $79
AnimBank4:
	db $C4
	db $C5
	db $C6
	db $C7
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;END OF BG BANK ANIMATION
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-	
loc3_F85A:
	LDA #$1D
	STA M90_IRQ_DISABLE
	STA M90_IRQ_ENABLE ;Disable then enable interrupts (removing this causes the HUD to flicker, I assume this is an IRQ reset of some sort)
	STA M90_IRQ_COUNTER ;Set IRQ counter (line?) to $1D
	LDX #$0C ;Set X for loop count (See below)
bra3_F867:
	DEX
	BNE bra3_F867 ;Wait 59 (X*5 - 1) cycles before updating registers

	LDX #$2B
	LDY #$40
	STX PPUADDR
	STY PPUADDR ;Set PPU address to $2B40

	LDA PPUSTATUS ;Clear PPU address data latch 
	LDA #$00
	STA PPUSCROLL ;Set horizontal scroll for HUD (seems to position the item box, not the HUD itself)
	LDA #$C4
	STA PPUSCROLL ;Set vertical scroll for HUD
	INC HUDDisplay

	LDA #$EC
	STA M90_BG_CHR0 ;Swap in 1st HUD bank (contains text and icons)
	LDA #$ED
	STA M90_BG_CHR1 ;Swap in 2nd HUD bank (nothing to do with HUD, just random level tiles)
	LDA #$EE
	STA M90_BG_CHR2 ;Swap in 3rd HUD bank (contains item box graphic)
	LDA #$EF
	STA M90_BG_CHR3 ;Swap in 4th HUD bank (nothing to do with HUD, just random level tiles)
	RTS

loc3_F899:
	STA M90_IRQ_DISABLE
	LDX #$0C
bra3_F89E:
	DEX
	BNE bra3_F89E ;Wait 59 (X*5 - 1) cycles before updating HUD
	LDA #%00010000
	STA PPUMASK ;Display sprites only
	LDA #$00
	STA HUDDisplay
	RTS
loc3_F8AC:
	LDA #$00
	STA HUDDisplay
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
	STA HUDDisplay
	RTS
loc3_F8D7:
	LDX #$22
	LDY #$D8 ;Set interrupt line
	STX PPUADDR
	STY PPUADDR ;Store interrupt line
	LDA PPUSTATUS
	LDA #$00
	STA PPUSCROLL
	LDA #$B0
	STA PPUSCROLL
	LDA #$00
	STA HUDDisplay
	LDA #$C8
	STA M90_BG_CHR0 ;Load 1st Clown Car bank into PPU
	LDA #$C9
	STA M90_BG_CHR1 ;Load 2nd Clown Car bank into PPU
	LDA #$CA
	STA M90_BG_CHR2 ;Load 3rd Clown Car bank into PPU
	LDA #$CB
	STA M90_BG_CHR3 ;Load 4th Clown Car bank into PPU
	STA M90_IRQ_DISABLE
	RTS
sub3_F90B:
	LDY ClownCarFace
	LDA ClownCarBanks,Y
	STA M90_BG_CHR0
	RTS
ClownCarBanks:
	db $C8 ;Default
	db $C9 ;Blinking
	db $CA ;Hurt
	db $CB ;Angry
sub3_F919:
	LDA BGPalette
	ASL
	ASL
	TAY ;Get the pointer index for the BG palette
	LDA CurrentPlayer
	BEQ bra3_F939 ;Load player 1 palettes if player 1 is playing
	;Otherwise, load palettes for player 2
	LDA Player2LevelPalettes+2,Y
	STA $30 ;Load lower byte of pointer
	LDA Player2LevelPalettes+3,Y
	STA $31 ;Load upper byte of pointer
	LDA Player2LevelPalettes,Y
	STA $32
	LDA Player2LevelPalettes+1,Y
	JMP loc3_F94B
bra3_F939:
	LDA Player1LevelPalettes+2,Y
	STA $30 ;Load lower byte of pointer
	LDA Player1LevelPalettes+3,Y
	STA $31 ;Load upper byte of pointer
	LDA Player1LevelPalettes,Y
	STA $32
	LDA Player1LevelPalettes+1,Y
loc3_F94B:
	STA $33
	LDA FadeoutMode
	ASL
	ASL
	TAY
	LDA tbl3_FE8C,Y
	STA $34
	LDA tbl3_FE8C+1,Y
	STA $35
	LDA tbl3_FE8C+2,Y
	STA $2E
	LDA tbl3_FE8C+3,Y
	STA $2F
	LDA PPUUpdatePtr
	BNE bra3_F9E7
	LDA FrameCount
	AND #$03
	BNE bra3_F9E7
	LDX PalTransition
	LDA tbl3_F9F3,X
	STA $25
	LDY #$00
	LDX #$00
bra3_F97E:
	LDA ($34),Y
	BPL bra3_F987
	LDA ($32),Y
	JMP loc3_F990
bra3_F987:
	LDA ($32),Y
	SEC
	SBC $25
	BPL bra3_F990
	LDA #$FF
bra3_F990:
loc3_F990:
	CPY #$00
	BNE bra3_F99A
	STA $03B5
	JMP loc3_F99D
bra3_F99A:
	STA PPUDataBuffer,X
loc3_F99D:
	INX
	INY
	CPY #$10
	BNE bra3_F97E
	LDY #$01
	LDX #$11
bra3_F9A7:
	LDA ($2E),Y
	BPL bra3_F9B0
	LDA ($30),Y
	JMP loc3_F9B9
bra3_F9B0:
	LDA ($30),Y
	SEC
	SBC $25
	BPL bra3_F9B9
	LDA #$FF
bra3_F9B9:
loc3_F9B9:
	STA PPUDataBuffer,X
	INX
	INY
	CPY #$10
	BNE bra3_F9A7
	LDA #$3F
	STA PPUUpdatePtr
	LDA #$00
	STA PPUUpdatePtr+1
	STA $03A0
	LDA #$20
	STA PPUWriteCount
	LDA #$01
	STA $03A3
	INC PalTransition
	LDA PalTransition
	CMP #$05
	BEQ bra3_F9EA
	CMP #$09
	BEQ bra3_F9EA
bra3_F9E7:
	PLA
	PLA
	RTS
bra3_F9EA:
	LDA #$80
	ORA PalTransition
	STA PalTransition
	RTS
tbl3_F9F3:
	db $40
	db $30
	db $20
	db $10
	db $00
	db $10
	db $20
	db $30
	db $40
Player1LevelPalettes:
	dw LvlPalBG_1_1 ;Level 1-1 BG Palette
	dw LvlPalSprP1_1 ;Level 1-1 Sprite Palette
	dw LvlPalBG_1_2 ;Level 1-2 BG Palette
	dw LvlPalSprP1_1 ;Level 1-2 Sprite Palette
	dw LvlPalBG_1_3 ;Level 1-3 BG Palette
	dw LvlPalSprP1_1 ;Level 1-3 Sprite Palette
	dw LvlPalBG_Castle1 ;Level 1-4 BG Palette
	dw LvlPalSprP1_1 ;Level 1-4 Sprite Palette
	dw LvlPalBG_2_1 ;Level 2-1 BG Palette
	dw LvlPalSprP1_1 ;Level 2-1 Sprite Palette
	dw LvlPalBG_2_2 ;Level 2-2 BG Palette
	dw LvlPalSprP1_1 ;Level 2-2 Sprite Palette
	dw LvlPalBG_GhostHouse1 ;Level 2-3 BG Palette
	dw LvlPalSprP1_1 ;Level 2-3 Sprite Palette
	dw LvlPalBG_Castle1
	dw LvlPalSprP1_1
	dw LvlPalBG_3_1 ;Level 3-1 BG Palette
	dw LvlPalSprP1_1 ;Level 3-1 Sprite Palette
	dw LvlPalBG_3_2 ;Level 3-2 BG Palette
	dw LvlPalSprP1_1 ;Level 3-2 Sprite Paltte
	dw LvlPalBG_GhostHouse1 ;Level 3-3 BG Palette
	dw LvlPalSprP1_1 ;Level 3-3 BG Palette
	dw ofs_FBBC
	dw LvlPalSprP1_1
	dw LvlPalBG_Bridge ;Level 4-1 BG Palette
	dw LvlPalSprP1_1 ;Level 4-1 Sprite Palette
	dw LvlPalBG_Bridge ;Level 4-2 BG Palette
	dw LvlPalSprP1_1 ;Level 4-2 Sprite Palette
	dw LvlPalBG_4_3 ;Level 4-3 BG Palette
	dw LvlPalSprP1_1 ;Level 4-3 Sprite Palette
	dw LvlPalBG_4_4 ;Level 4-4 (Area 2) BG Palette
	dw LvlPalSprP1_1 ;Level 4-4 (Area 2) BG Palette
	dw LvlPalBG_5_1 ;Level 5-1 BG Palette
	dw LvlPalSprP1_1 ;Level 5-1 Sprite Palette
	dw LvlPalBG_5_2 ;Level 5-2 BG Palette
	dw LvlPalSprP1_1 ;Level 5-2 Sprite Palette
	dw LvlPalBG_5_3 ;Level 5-3 BG Palette
	dw LvlPalSprP1_1 ;Level 5-3 Sprite Palette
	dw LvlPalBG_5_4 ;Level 5-4 BG Palette
	dw LvlPalSprP1_Castle3 ;Level 5-4 Sprite Palette
	dw LvlPalBG_6_1 ;Level 6-1 BG Palette
	dw LvlPalSprP1_1 ;Level 6-1 Sprite Palette
	dw LvlPalBG_6_2 ;Level 6-2 BG Palette
	dw LvlPalSprP1_1 ;Level 6-2 Sprite Palette
	dw LvlPalBG_6_3 ;Level 6-3 BG Palette
	dw LvlPalSprP1_1 ;Level 6-3 Sprite Palette
	dw LvlPalBG_6_4 ;Level 6-4 BG Palette
	dw LvlPalSprP1_Castle3 ;Level 6-4 Sprite Palette
	dw LvlPalBG_7_1 ;Level 7-1 BG Palette
	dw LvlPalSprP1_1 ;Level 7-1 Sprite Palette
	dw LvlPalBG_7_2 ;Level 7-2 BG Palette
	dw LvlPalSprP1_1 ;Level 7-2 Sprite Palette
	dw LvlPalBG_7_3 ;Level 7-3 BG Palette
	dw LvlPalSprP1_1 ;Level 7-3 Sprite Palette
	dw LvlPalBG_7_4 ;Level 7-4 BG Palette
	dw LvlPalSprP1_Castle3 ;Level 7-4 Sprite Palette
	dw LvlPalBG_GhostHouseIntro ;Ghost House Intro BG Palette
	dw LvlPalSprP1_1 ;Ghost House Intro Sprite Palette
	dw LvlPalBG_CastleIntro ;Castle Intro BG Palette
	dw LvlPalSprP1_1 ;Castle Intro Sprite Palette
	dw LvlPalBG_MortonBoss ;Morton Boss Room BG Palette
	dw LvlPalSprP1_MortonBoss ;Morton Boss Room Sprite Palette
	dw LvlPalBG_LemmyBoss ;Lemmy/Wendy Boss Room BG Palette
	dw LvlPalSprP1_LemmyBoss ;Lemmy/Wendy Boss Room Sprite Palette
	dw LvlPalBG_Castle2 ;Reznor Room, Level 2-4 (Areas 1 and 2) BG Palette
	dw LvlPalSprP1_Castle2 ;Reznor Room, Level 2-4 (Areas 1 and 2) Sprite Palette
	dw LvlPalBG_Castle3 ;Level 1-4 (Area 2), 2-4 (Area 3), 3-4, 4-4 (Area 1) BG Palette
	dw LvlPalSprP1_Castle3 ;Level 1-4 (Area 2), 2-4 (Area 3), 3-4, 4-4 (Area 1) Sprite Palette
	dw LvlPalBG_YoshisHouse ;Yoshi's House BG Palette
	dw LvlPalSprP1_YoshisHouse ;Yoshi's House Sprite Palette
	dw LvlPalBG_MortonBoss ;Roy Boss Room BG Palette
	dw LvlPalSprP1_RoyBoss ;Roy Boss Room Sprite Palette
	dw LvlPalBG_BowserFight ;Bowser Fight BG Palette
	dw LvlPalSprP1_BowserFight ;Bowser Fight Sprite Palette
	dw LvlPalBG_BonusRoom ;Bonus Room BG Palette
	dw LvlPalSprP1_BonusRoom ;Bonus Room Sprite Palette
Player2LevelPalettes:
	dw LvlPalBG_1_1 ;Level 1-1 BG Palette
	dw LvlPalSprP2_1 ;Level 1-1 Sprite Palette
	dw LvlPalBG_1_2 ;Level 1-2 BG Palette
	dw LvlPalSprP2_1 ;Level 1-2 Sprite Palette
	dw LvlPalBG_1_3 ;Level 1-3 BG Palette
	dw LvlPalSprP2_1 ;Level 1-3 Sprite Palette
	dw LvlPalBG_Castle1 ;Level 1-4 BG Palette
	dw LvlPalSprP2_1 ;Level 1-4 Sprite Palette
	dw LvlPalBG_2_1 ;Level 2-1 BG Palette
	dw LvlPalSprP2_1 ;Level 2-1 Sprite Palette
	dw LvlPalBG_2_2 ;Level 2-2 BG Palette
	dw LvlPalSprP2_1 ;Level 2-2 Sprite Palette
	dw LvlPalBG_GhostHouse1 ;Level 2-3 BG Palette
	dw LvlPalSprP2_1 ;Level 2-3 Sprite Palette
	dw LvlPalBG_Castle1
	dw LvlPalSprP2_1
	dw LvlPalBG_3_1 ;Level 3-1 BG Palette
	dw LvlPalSprP2_1 ;Level 3-1 Sprite Palette
	dw LvlPalBG_3_2 ;Level 3-2 BG Palette
	dw LvlPalSprP2_1 ;Level 3-2 Sprite Paltte
	dw LvlPalBG_GhostHouse1 ;Level 3-3 BG Palette
	dw LvlPalSprP2_1 ;Level 3-3 BG Palette
	dw ofs_FBBC
	dw LvlPalSprP2_1
	dw LvlPalBG_Bridge ;Level 4-1 BG Palette
	dw LvlPalSprP2_1 ;Level 4-1 Sprite Palette
	dw LvlPalBG_Bridge ;Level 4-2 BG Palette
	dw LvlPalSprP2_1 ;Level 4-2 Sprite Palette
	dw LvlPalBG_4_3 ;Level 4-3 BG Palette
	dw LvlPalSprP2_1 ;Level 4-3 Sprite Palette
	dw LvlPalBG_4_4 ;Level 4-4 (Area 2) BG Palette
	dw LvlPalSprP2_1 ;Level 4-4 (Area 2) BG Palette
	dw LvlPalBG_5_1 ;Level 5-1 BG Palette
	dw LvlPalSprP2_1 ;Level 5-1 Sprite Palette
	dw LvlPalBG_5_2 ;Level 5-2 BG Palette
	dw LvlPalSprP2_1 ;Level 5-2 Sprite Palette
	dw LvlPalBG_5_3 ;Level 5-3 BG Palette
	dw LvlPalSprP2_1 ;Level 5-3 Sprite Palette
	dw LvlPalBG_5_4 ;Level 5-4 BG Palette
	dw LvlPalSprP2_Castle3 ;Level 5-4 Sprite Palette
	dw LvlPalBG_6_1 ;Level 6-1 BG Palette
	dw LvlPalSprP2_1 ;Level 6-1 Sprite Palette
	dw LvlPalBG_6_2 ;Level 6-2 BG Palette
	dw LvlPalSprP2_1 ;Level 6-2 Sprite Palette
	dw LvlPalBG_6_3 ;Level 6-3 BG Palette
	dw LvlPalSprP2_1 ;Level 6-3 Sprite Palette
	dw LvlPalBG_6_4 ;Level 6-4 BG Palette
	dw LvlPalSprP2_Castle3 ;Level 6-4 Sprite Palette
	dw LvlPalBG_7_1 ;Level 7-1 BG Palette
	dw LvlPalSprP2_1 ;Level 7-1 Sprite Palette
	dw LvlPalBG_7_2 ;Level 7-2 BG Palette
	dw LvlPalSprP2_1 ;Level 7-2 Sprite Palette
	dw LvlPalBG_7_3 ;Level 7-3 BG Palette
	dw LvlPalSprP2_1 ;Level 7-3 Sprite Palette
	dw LvlPalBG_7_4 ;Level 7-4 BG Palette
	dw LvlPalSprP2_Castle3 ;Level 7-4 Sprite Palette
	dw LvlPalBG_GhostHouseIntro ;Ghost House Intro BG Palette
	dw LvlPalSprP2_1 ;Ghost House Intro Sprite Palette
	dw LvlPalBG_CastleIntro ;Castle Intro BG Palette
	dw LvlPalSprP2_1 ;Castle Intro Sprite Palette
	dw LvlPalBG_MortonBoss ;Morton Boss Room BG Palette
	dw LvlPalSprP2_MortonBoss ;Morton Boss Room Sprite Palette
	dw LvlPalBG_LemmyBoss ;Lemmy/Wendy Boss Room BG Palette
	dw LvlPalSprP2_LemmyBoss ;Lemmy/Wendy Boss Room Sprite Palette
	dw LvlPalBG_Castle2 ;Reznor Room, Level 2-4 (Areas 1 and 2) BG Palette
	dw LvlPalSprP2_Castle2 ;Reznor Room, Level 2-4 (Areas 1 and 2) Sprite Palette
	dw LvlPalBG_Castle3 ;Level 1-4 (Area 2), 2-4 (Area 3), 3-4, 4-4 (Area 1) BG Palette
	dw LvlPalSprP2_Castle3 ;Level 1-4 (Area 2), 2-4 (Area 3), 3-4, 4-4 (Area 1) Sprite Palette
	dw LvlPalBG_YoshisHouse ;Yoshi's House BG Palette
	dw LvlPalSprP2_YoshisHouse ;Yoshi's House Sprite Palette
	dw LvlPalBG_MortonBoss ;Roy Boss Room BG Palette
	dw LvlPalSprP2_RoyBoss ;Roy Boss Room Sprite Palette
	dw LvlPalBG_BowserFight ;Bowser Fight BG Palette
	dw LvlPalSprP2_BowserFight ;Bowser Fight Sprite Palette
	dw LvlPalBG_BonusRoom ;Bonus Room BG Palette
	dw LvlPalSprP2_BonusRoom ;Bonus Room Sprite Palette
LvlPalBG_1_1:
	db $11, $30, $38, $3D
	db $11, $30, $2A, $1A
	db $11, $37, $2A, $1A
	db $11, $2C, $3C, $30

LvlPalBG_1_2:
	db $0A, $2C, $1C, $30
	db $0A, $30, $38, $28
	db $0A, $37, $2A, $1A
	db $0A, $29, $19, $39

LvlPalBG_1_3:
	db $0E, $11, $3C, $30
	db $0E, $30, $37, $27
	db $0E, $29, $38, $18
	db $0E, $00, $10, $30

LvlPalBG_Castle1:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $20
	db $0E, $27, $17, $37

LvlPalBG_2_1:
	db $11, $11, $3C, $30
	db $11, $30, $38, $28
	db $11, $37, $2A, $1A
	db $11, $39, $29, $1A

LvlPalBG_2_2:
	db $0A, $31, $11, $30
	db $0A, $30, $38, $28
	db $0A, $0E, $2A, $30
	db $0A, $2A, $19, $39

LvlPalBG_GhostHouse1:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $1C, $2C, $38
	db $0E, $37, $27, $18

LvlPalBG_3_1:
	db $0E, $21, $11, $30
	db $0E, $30, $28, $18
	db $0E, $37, $0C, $1C
	db $0E, $38, $27, $17

LvlPalBG_3_2:
	db $01, $2C, $1C, $3C
	db $01, $30, $38, $28
	db $01, $00, $10, $30
	db $01, $38, $27, $17

ofs_FBBC:
	db $0E, $11, $21, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $30
	db $0E, $27, $17, $37

LvlPalBG_Bridge:
	db $30, $11, $2C, $0E
	db $30, $28, $18, $0E
	db $30, $37, $31, $0E
	db $30, $30, $2A, $0A

LvlPalBG_4_3:
	db $30, $11, $21, $0E
	db $30, $28, $18, $0E
	db $30, $37, $2A, $0A
	db $30, $0E, $2A, $1A

LvlPalBG_4_4:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $30
	db $0E, $27, $17, $37

LvlPalBG_5_1:
	db $0E, $2C, $1C, $30
	db $0E, $30, $28, $18
	db $0E, $1A, $28, $18
	db $0E, $1A, $0A, $2A

LvlPalBG_5_2:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $0C, $1C, $2C
	db $0E, $37, $27, $18

LvlPalBG_5_3:
	db $01, $2C, $1C, $3C
	db $01, $30, $38, $28
	db $01, $00, $10, $38
	db $01, $38, $27, $17

LvlPalBG_5_4:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $20
	db $0E, $27, $17, $37

LvlPalBG_6_1:
	db $0E, $01, $21, $30
	db $0E, $30, $28, $18
	db $0E, $29, $38, $18
	db $0E, $29, $30, $18

LvlPalBG_6_2:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $0C, $1C, $2C
	db $0E, $37, $27, $18

LvlPalBG_6_3:
	db $01, $1C, $2C, $30
	db $01, $30, $28, $18
	db $01, $37, $2A, $1C
	db $01, $3C, $2C, $1C

LvlPalBG_6_4:
	db $0E, $01, $31, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $30
	db $0E, $27, $17, $37

LvlPalBG_7_1:
	db $0E, $21, $11, $30
	db $0E, $30, $38, $28
	db $0E, $1A, $2A, $30
	db $0E, $00, $10, $30

LvlPalBG_7_2:
	db $0E, $31, $22, $30
	db $0E, $30, $38, $28
	db $0E, $1A, $2A, $30
	db $0E, $00, $10, $30

LvlPalBG_7_3:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $0C, $1C, $31
	db $0E, $37, $27, $18

LvlPalBG_7_4:
	db $0E, $15, $1A, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $30
	db $0E, $27, $16, $37

LvlPalBG_GhostHouseIntro:
	db $0E, $30, $0C, $15
	db $0E, $01, $31, $30
	db $0E, $37, $2A, $1A
	db $0E, $10, $0C, $00

LvlPalBG_CastleIntro:
	db $0E, $21, $31, $30
	db $0E, $31, $2A, $1A
	db $0E, $37, $2A, $1A
	db $0E, $00, $10, $20

LvlPalBG_MortonBoss:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $20
	db $0E, $27, $17, $37

LvlPalBG_LemmyBoss:
	db $0E, $11, $21, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $30
	db $0E, $27, $17, $37

LvlPalBG_Castle2:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $30
	db $0E, $27, $17, $37

LvlPalBG_Castle3:
	db $0E, $11, $3C, $30
	db $0E, $30, $28, $18
	db $0E, $00, $10, $30
	db $0E, $27, $17, $37

LvlPalBG_YoshisHouse:
	db $0E, $2A, $2C, $36
	db $0E, $37, $27, $38
	db $0E, $2A, $37, $30
	db $0E, $1C, $2C, $30

LvlPalBG_BowserFight:
	db $1E, $10, $00, $0E
	db $1E, $27, $22, $20
	db $1E, $2A, $1A, $20
	db $1E, $27, $16, $20

LvlPalBG_BonusRoom:
	db $0E, $30, $2C, $0E
	db $0E, $30, $28, $18
	db $0E, $30, $2A, $19
	db $0E, $30, $21, $23

LvlPalSprP1_1:
	db $11, $37, $16, $0E
	db $10, $30, $16, $02
	db $10, $2A, $20, $0E
	db $10, $38, $16, $0E

LvlPalSprP1_MortonBoss:
	db $0E, $37, $16, $0E
	db $0E, $30, $16, $02
	db $0E, $28, $1A, $30
	db $0E, $38, $16, $0E

LvlPalSprP1_LemmyBoss:
	db $0E, $37, $16, $0E
	db $10, $30, $16, $02
	db $10, $28, $06, $30
	db $10, $38, $16, $0E

LvlPalSprP1_Castle2:
	db $0E, $37, $16, $0E
	db $00, $30, $16, $02
	db $00, $10, $20, $0E
	db $00, $38, $16, $0E

LvlPalSprP1_Castle3:
	db $0E, $37, $16, $0E
	db $00, $30, $16, $02
	db $00, $10, $20, $0E
	db $00, $38, $16, $0E

LvlPalSprP1_YoshisHouse:
	db $0E, $37, $16, $0E
	db $10, $30, $16, $02
	db $10, $2A, $20, $0E
	db $10, $38, $16, $0E

LvlPalSprP1_RoyBoss:
	db $1E, $37, $16, $0E
	db $1E, $30, $16, $02
	db $1E, $28, $1C, $30
	db $1E, $28, $16, $0E

LvlPalSprP1_BowserFight:
	db $0E, $37, $16, $0E
	db $0E, $30, $16, $02
	db $0E, $28, $15, $30
	db $0E, $28, $16, $0E

LvlPalSprP1_BonusRoom:
	db $3D, $37, $16, $0E
	db $3D, $30, $16, $02
	db $3D, $2A, $30, $0F
	db $3D, $28, $16, $0E

LvlPalSprP2_1:
	db $11, $37, $2B, $0E
	db $10, $30, $1B, $02
	db $10, $2A, $20, $0E
	db $10, $38, $16, $0E
	;What are these extras for exactly?
	db $0E, $37, $2B, $0E
	db $10, $30, $1B, $02
	db $10, $2A, $20, $0E
	db $10, $38, $16, $0E
	db $0E, $37, $2B, $0E
	db $10, $30, $1B, $02
	db $10, $2A, $20, $0E
	db $10, $38, $16, $0E
LvlPalSprP2_MortonBoss:
	db $0E, $37, $2B, $0E
	db $0E, $30, $1B, $02
	db $0E, $28, $1A, $30
	db $0E, $38, $16, $0E

LvlPalSprP2_LemmyBoss:
	db $0E, $37, $2B, $0E
	db $10, $30, $1B, $02
	db $10, $28, $06, $30
	db $10, $38, $16, $0E

LvlPalSprP2_Castle2:
	db $0E, $37, $2B, $0E
	db $00, $30, $1B, $02
	db $00, $10, $20, $0E
	db $00, $38, $16, $0E

LvlPalSprP2_Castle3:
	db $0E, $37, $2B, $0E
	db $00, $30, $1B, $02
	db $00, $10, $20, $0E
	db $00, $38, $16, $0E

LvlPalSprP2_YoshisHouse:
	db $0E, $37, $2B, $0E
	db $10, $30, $1B, $02
	db $10, $2A, $20, $0E
	db $10, $38, $16, $0E

LvlPalSprP2_RoyBoss:
	db $1E, $37, $2B, $0E
	db $1E, $30, $1B, $02
	db $1E, $28, $1C, $30
	db $1E, $28, $16, $0E

LvlPalSprP2_BowserFight:
	db $0E, $37, $2B, $0E
	db $0E, $30, $1B, $02
	db $0E, $28, $15, $30
	db $0E, $28, $16, $0E

LvlPalSprP2_BonusRoom:
	db $3D, $37, $2B, $0E
	db $3D, $30, $1B, $02
	db $3D, $2A, $30, $0F
	db $3D, $28, $16, $0E

tbl3_FE8C:
	dw ofs_FE94
	dw ofs_FE94
	dw ofs_FE94
	dw ofs_FEA4
ofs_FE94:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
ofs_FEA4:
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
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0B
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0C
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0D
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0E
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $0F
	db $00
	db $04
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
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $03
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
	db $03
	db $03
	db $01
	db $03
	db $01
	db $03
	db $01
	db $68
	db $01
	db $01
	db $01
	db $01
	db $01
	db $03
	db $03
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
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
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
MapperProtection:
	LDA #$05 ;Use 5 for both values to multiply
	STA M90_MULTIPLICAND ;First value to multiply (5)
	STA M90_MULTIPLIER ;Multiplier (5)
	LDA #$00
	JSR sub3_F184
MapperProtectLoop:
	LDA M90_MULTIPLICAND ;Get product
	CMP #$19
	BNE MapperProtectLoop ;If the product isn't 25, send the game into a loop and prevent it from starting
	RTS
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
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $02
	db $01
