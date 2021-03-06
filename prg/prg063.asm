;disassembled by BZK 6502 Disassembler
jmp_63_E000:
	PHP	;Push the CPU status into the stack
	PHA	;Push the accumulator into the stack
	TXA
	PHA	;Push the X register into the stack
	TYA
	PHA	;Push the Y register into the stack
	LDA PPUMaskRegister
	STA PPUMask	;Copy the software mask register to the hardware register
	LDA XScroll
	STA PPUScroll	;Set horizontal scroll in the PPU
	LDA YScroll
	STA PPUScroll	;Set vertical scroll in the PPU
	LDA PPUControlRegister
	AND #$FC
	ORA VerticalScrollFlag
	STA PPUControlRegister
	STA PPUCtrl
	JSR sub3_F6E0
	LDA BGBank1
	STA M90_BG_CHR0	;Update 1st BG bank
	LDA BGBank2
	STA M90_BG_CHR1	;Update 2nd BG bank
	LDA BGBank3
	STA M90_BG_CHR2	;Update 3rd BG bank
	LDA BGBank4
	STA M90_BG_CHR3	;Update 4th BG bank (This goes unused)
	LDA SpriteBank1
	STA M90_SP_CHR0	;Update 1st sprite bank
	LDA SpriteBank2
	STA M90_SP_CHR1	;Update 2nd sprite bank
	LDA SpriteBank3
	STA M90_SP_CHR2	;Update 3rd sprite bank
	LDA SpriteBank4
	STA M90_SP_CHR3	;Update 4th sprite bank
	PLA
	TAY	;Pull the Y register from the stack
	PLA
	TAX	;Pull the X register from the stack
	PLA	;Pull the accumulator from the stack
	PLP	;Pull CPU status from the stack
	RTI
NMI_E05C:
	JMP loc3_EF10
NMI_E05F:
	JMP loc3_EFE0
NMI_E062:
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA ColumnFinishFlag
	BEQ bra3_E0E8
	LDA PPUStatus
	LDA PPUControlRegister
	ORA #$04
	STA PPUCtrl
	LDA PPUStatus
	LDA ColumnFinishFlag
	STA PPUAddr
	LDA NextBGColumn
	STA PPUAddr
	LDX #$00
bra3_E088:
	LDA TileRowMem,X
	STA PPUData
	INX
	CPX #$1E
	BCC bra3_E088
	LDA PPUStatus
	LDA ColumnFinishFlag
	ORA #$08
	STA PPUAddr
	LDA NextBGColumn
	STA PPUAddr
bra3_E0A4:
	LDA TileRowMem,X
	STA PPUData
	INX
	CPX #$38
	BCC bra3_E0A4
	LDA PPUStatus
	LDA PPUControlRegister
	AND #$FB
	STA PPUCtrl
	LDA PalAssignPtrHi
	BEQ bra3_E0E1
	LDX #$00
bra3_E0C0:
	LDA PPUStatus
	LDA PalAssignPtrHi,X
	STA PPUAddr
	LDA PalAssignPtrLo,X
	STA PPUAddr
	LDA PalAssignData,X
	STA PPUData
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
bra3_E0F8:
	LDA #$00
	STA PPUOAMAddr
	LDA #$02
	STA OAMDMA
	LDA PPUMaskRegister
	STA PPUMask
	LDA ScrollXPos
	STA PPUScroll
	LDY $03
	LDA $0633
	BEQ bra3_E12F
	CMP #$30
	BCC bra3_E11E
	LDA #$00
	STA $0633
	BEQ bra3_E12F
bra3_E11E:
	INC $0633
	LDA FrameCount
	AND #$04
	BNE bra3_E12F
	CPY #$EC
	BCS bra3_E12F
	INY
	INY
	INY
	INY
bra3_E12F:
	STY PPUScroll
	LDA PPUControlRegister
	AND #$FC
	ORA VerticalScrollFlag
	STA PPUControlRegister
	STA PPUCtrl
	JSR sub3_F6E0
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
	JSR sub3_F7DA
	JSR sub3_F19F
	LDA #$3A
	STA M90_PRG0
	LDA #$3B
	STA M90_PRG1
	JSR $85BE
	JSR $862A
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
	CLD	;Standard 2A03/6502 initialization
	LDX #$FF
	TXS	;Set the stack pointer to $FF
	LDA #$00
	STA M90_IRQ_DISABLE	;Disable mapper interrupts
	STA PPUMask	;Clear the screen
	STA PPUCtrl
	LDX #$02	;Set the amount of frames to wait
bra3_E1A5:
	BIT PPUStatus
	BPL bra3_E1A5	;Wait for a frame
bra3_E1AA:
	BIT PPUStatus
	BMI bra3_E1AA	;Wait for VBlank to end??
	DEX
	BNE bra3_E1A5	;Loop until the set amount of frames have passed
	LDA #$3E
	STA M90_PRG2	;Swap bank 62 into the 3rd PRG bank
	LDA #$3F
	STA M90_PRG3	;Swap bank 63 into the 4th PRG bank
	LDA #%10000101
	STA M90_IRQ_MODE	;Set mapper IRQ mode
	LDA #%00111110
	STA M90_BANK_SIZE	;Set mapper bank sizes (8K PRG, 1K CHR)
	LDA #$00
	STA M90_NT0
	LDA #$01
	STA M90_NT1
	LDA #$02
	STA M90_NT2
	LDA #$03
	STA M90_NT3	;Set 1K nametable banks (Seems useless, ROM nametables are already disabled)
	LDA #$00
	STA M90_IRQ_XOR	;Clear the XOR register
	STA M90_PPU_CFG	;Clear PPU address config
	STA M90_CHR_CTRL1	;Disable outer bank selection
	LDA #%00000001
	STA M90_CHR_CTRL2	;Enable horizontal nametable mirroring
	LDA #%00001111
	STA APUStatus	;Enable audio channels (excluding DMC)
	LDA #$00
	STA DMCFreq	;Disable the DMC
	LDA #%01000000
	STA Joy2Frame	;Disable the IRQ for the APU frame counter
	STA M90_IRQ_DISABLE	;Disable mapper interrupts
	LDA PPUStatus	;Clear PPU address latch
	LDA #$10	;Set the high/low byte of the PPU address
	TAX	;Also set the loop count
bra3_E202:	;No idea what this loop is for
	STA PPUAddr
	STA PPUAddr	;Store the high/low bytes
	EOR #$10	;Do XOR operation
	DEX
	BNE bra3_E202	;Keep looping until the loop count is reached
	LDA #$00	;Load zero
	LDX #$00	;Clear the X index
ClearMemory:
	STA $00,X
	STA $0200,X
	STA $0300,X
	STA $0400,X
	STA $0500,X
	STA $0600,X
	STA $0700,X	;Wipe all pages of memory
	DEX
	BNE ClearMemory	;Keep looping until every page is cleared
	LDA #$00	;Clear the accumulator
	JSR MapperProtection	;Make sure the game is on Mapper 90
	LDA #$3A
	STA M90_PRG0	;Swap the music bank into 1st PRG slot
	LDA #$3B
	STA M90_PRG1	;Swap the 2nd music bank into 2nd PRG slot
	JSR jmp_58_85D6
	LDA #$20
	STA MusicRegister	;Play the title screen music
	JSR $8E24	;Jump (inbetween opcode?)
	INC MuteFlag	;Enable audio
	LDA #$00
	STA HUDDisplay
	CLI	;Clear interrupt
	LDA #$80
	ORA PalTransition
	STA PalTransition	;Disable transition
	LDA #$03
	STA PlayerPowerup	;Set powerup to cape
	LDA #$4C
	STA NMIJMPOpcode	;Store the first byte of the NMI JMP
	LDX #$04
	LDA tbl3_EF08,X	
	STA NMIJMPOpcode+1	;Load the low byte of the NMI JMP location
	LDA #$E0
	STA NMIJMPOpcode+2	;Set the high byte of the NMI JMP location
	LDA #%10001000
	STA PPUCtrl
	STA PPUControlRegister	;Set PPU control
	LDA #%00011000
	STA PPUMask
	STA PPUMaskRegister	;Set PPU mask
bra3_E277:
loc3_E277:
	INC $00E4
	LDA FrameCount
	CMP FrameCount+1
	BEQ bra3_E277	;Loop if the duplicate frame counter is the same as the main counter
	STA FrameCount+1	;If they aren't, make them the same
	LDA #$01
	STA $062D
	JSR sub3_E2AB
	LDA #$00
	STA $062D
	LDX #$00
	LDA a:GameState
	BNE bra3_E298
	LDX #$04
bra3_E298:
	LDA tbl3_EF08,X
	STA $063B
	LDA ScrollXPos
	STA XScroll	;Copy horizontal scroll
	LDA ScrollYPos
	STA YScroll	;Copy vertical scroll
	JMP loc3_E277	;Jump
sub3_E2AB:
	LDA a:GameState
	BNE bra3_E317	;Branch if in a level
	LDX #$04
	LDA tbl3_EF08,X
	STA $063B
	JMP loc3_E2BE	;Jump
	JMP loc3_E317	;Jump
loc3_E2BE:
	LDX #$29	;Load bank 41
	STX $09
	STX M90_PRG1	;Swap bank 41 into 2nd PRG slot
	JMP jmp_41_A000	;Jump
	RTS
	LDA a:Event
	ASL
	TAY	;Get the pointer for the current event
	LDA tbl3_E2DB,Y 
	STA Data0	;Load lower byte of pointer
	LDA tbl3_E2DB+1,Y
	STA Data0+1	;Load upper byte of pointer
	JMP (Data0)	;Jump to the loaded pointer
tbl3_E2DB:
	.word pnt2_E2E5
	.word pnt2_E316
	.word pnt2_E316
	.word pnt2_E316
	.word pnt2_E316
pnt2_E2E5:
	LDA ButtonsPressed
	AND #buttonA
	BEQ bra3_E2FE	;If the A button is pressed,
	INC LevelNumber	;Increment level number
	LDA LevelNumber
	CMP #$04	;If level number is below 4,
	BCC bra3_E2FE	;branch. Continue if its above 4
	LDA #$00
	STA LevelNumber	;Set level number to 1
	INC WorldNumber	;Add world number by 1
bra3_E2FE:
	LDA ButtonsPressed
	AND #buttonStart
	BEQ bra3_E315	;If start is pressed,
	INC a:GameState	;Set game state to 'in level'
	LDA #$00
	STA a:Event	;Clear event triggers
	LDA #$05
	STA PalTransition
	JSR sub3_F919	;Jump
bra3_E315:
	RTS
pnt2_E316:
	RTS
bra3_E317:
loc3_E317:
	LDA a:Event
	ASL
	TAY	;Get the pointer for the current event
	LDA tbl3_E329,Y
	STA Data0	;Load lower byte of pointer
	LDA tbl3_E329+1,Y
	STA Data0+1	;Load upper byte of pointer
	JMP (Data0)	;Jump to loaded pointer
tbl3_E329:
	.word pnt2_E353	;Event 0
	.word pnt2_E372	;Go out of door
	.word pnt2_E409	;Normal/Nothing
	.word pnt2_E4CA	;Door enter
	.word pnt2_E534	;Death
	.word pnt2_E610	;Castle intro
	.word pnt2_E6ED	;Level complete
	.word pnt2_E79E	;Event 7
	.word pnt2_E7A2	;Event 8
	.word pnt2_E7D0	;Event 9
	.word pnt2_E85F	;JY Easter egg
	.word pnt2_ED75	;Bonus pipe down
	.word pnt2_EE02	;Walk out pipe
	.word pnt2_EE23	;Go out of pipe up
	.word pnt2_EE59	;Enter 1st cannon pipe
	.word pnt2_EE96	;Launch out of 1st cannon
	.word pnt2_EEC8	;Enter 2nd cannon pipe
	.word pnt2_EE96	;Launch out of 2nd cannon
	.word pnt2_EEC8	;Enter pipe up
	.word pnt2_ED75
	.word pnt2_EEFD
pnt2_E353:
	LDA Player2YoshiStatus
	STA Player1YoshiStatus	;Copy player 2's yoshi to current yoshi
	LDA #$80
	ORA PalTransition
	STA PalTransition
	LDA #$3C
	STA M90_PRG0	;Swap bank 60 into 1st PRG slot
	LDA #$3D
	STA M90_PRG1	;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_B19E
	INC a:Event
	RTS
pnt2_E372:
	LDA a:EventPart
	ASL
	TAY	;Get the pointer for the current event part
	LDA tbl3_E384,Y
	STA Data0	;Load lower byte of pointer
	LDA tbl3_E384+1,Y
	STA Data0+1	;Load upper byte of pointer
	JMP (Data0)	;Jump to loaded pointer
tbl3_E384:
	.word pnt2_E388
	.word pnt2_E3DD
pnt2_E388:
	LDA #$00
	STA PPUCtrl
	STA PPUControlRegister	;Clear PPU control
	STA PPUMask
	STA PPUMaskRegister	;Clear PPU mask
	LDX #$00	;Set slot to 0
	TXA
bra3_E397:
	STA ObjectSlot,X	;Clear object slot
	INX	;Move to next slot
	CPX #$14
	BCC bra3_E397	;Loop until all 20 have been cleared
	STA YoshiUnmountedState	;Remove Yoshi
	JSR sub3_E904	;Jump
	LDA #$3C
	STA M90_PRG0	;Swap bank 60 into 1st PRG slot
	LDA #$3D
	STA M90_PRG1	;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_B38E
	LDA TimerSetting
	STA LevelTimerLo	;Set lower byte of level timer
	STA LevelTimerLo+2	;Store backup
	LDA TimerSetting+1
	STA LevelTimerHi	;Set upper byte of level timer
	STA LevelTimerHi+2	;Store backup
	LDA #%00011000
	STA PPUMaskRegister	;Set PPU mask
	LDA #%10001000
	STA PPUCtrl
	STA PPUControlRegister	;Set PPU control
	LDA #%01
	STA M90_CHR_CTRL2	;Set mirroring to horizontal
	JSR sub3_F0CB	;Jump
	INC a:EventPart	;Go to next part of event
	RTS
TimerSetting:
	.word $012C	;Timer data for levels (300 in decimal)

pnt2_E3DD:
	LDA #$00
	STA FadeoutMode	;Disable "blackout" effect
	JSR sub3_E6E0
	JSR sub3_F919
	LDA #$00
	STA $52
	STA a:EventPart	;End level transition
	LDA DataBank2
	CMP #$23
	BNE bra3_E405
	LDA CameraXScreen
	BNE bra3_E405	;If the camera screen is past the 1st screen,
	LDA LevelNumber
	BEQ bra3_E405	;If not in first level of a world,
	LDA #$05
	STA a:Event	;Trigger castle/ghost house intro
	RTS
bra3_E405:
	INC a:Event
	RTS
pnt2_E409:
	LDA a:EventPart
	BEQ bra3_E411	;Branch if at 1st event part
	JMP loc3_E498	;Jump
bra3_E411:
	LDX #$02
	LDA tbl3_EF08,X
	STA $063B
	LDA PauseFlag
	BNE bra3_E442
	LDA #$39
	STA M90_PRG1	;Swap player bank into 2nd PRG slot
	LDA $06E6
	BNE bra3_E42B
	JSR jmp_57_ACAC	;Jump
bra3_E42B:
	LDA $06EF
	BEQ bra3_E437
	LDA #$00
	STA $06EF
	STA PlayerXSpeed	;Clear player's X speed
bra3_E437:
	LDA UnderwaterFlag
	BEQ bra3_E445	;Branch if not underwater
	LDA FrameCount
	AND #$01
	BEQ bra3_E445
bra3_E442:
	JMP loc3_E45F	;Jump
bra3_E445:
	JSR sub3_ED14
	LDA PSwitchSeconds
	BEQ bra3_E45F	;Branch if P-Switch timer is up
	INC PSwitchFrameCount	;Increment frame count
	LDA PSwitchFrameCount
	CMP #$3B
	BCC bra3_E45F	;After 60 frames pass,
	DEC PSwitchSeconds		;Decrease timer
	LDA #$00
	STA PSwitchFrameCount	;Clear frame count
bra3_E45F:
loc3_E45F:
	LDA $06E6
	BNE bra3_E47C
	LDA ButtonsPressed
	AND #buttonStart
	BEQ bra3_E47C	;If start pressed
	LDA #$00
	STA JYEasterEggInput	;Clear Easter egg input
	LDA PauseFlag
	EOR #$01
	STA PauseFlag	;Enable/disable pause
	LDA #sfxPause
	STA SFXRegister	;Play pause sound
bra3_E47C:
	LDA PauseFlag
	BEQ bra3_E494	;Branch if game not paused
	JSR JYScreenTrigger	;Jump
	LDA ButtonsPressed
	AND #buttonSelect
	BEQ bra3_E494	;If select pressed,
	INC a:EventPart	;Start level transition
	LDX CurrentPlayer
	INC Player1Lives,X	;Temporarily increment current player's life count
bra3_E494:
	JSR sub3_F27F	;Jump
	RTS
loc3_E498:
	LDA #$00
	STA FadeoutMode	;Disable BG 'blackout' effect
	JSR sub3_E6D5	;Jump
	JSR sub3_F919	;Jump
	JSR sub3_E904	;Jump
	LDA #$00
	STA PauseFlag	;Unpause the game
	STA a:GameState	;Set game state to 'in map'
	STA a:EventPart	;End level transition
	LDA #$16
	STA a:Event
	JSR sub3_E4BA	;Jump
	RTS
sub3_E4BA:
	LDX CurrentPlayer	;Load current player
	LDA PlayerPowerup
	STA P1PowerupBackup,X	;Backup player's current powerup
	LDA Player2YoshiStatus
	STA P1YoshiBackup,X	;Backup player's Yoshi
	RTS
pnt2_E4CA:
	LDA a:EventPart
	ASL
	TAY
	LDA tbl3_E4DC,Y
	STA Data0
	LDA tbl3_E4DC+1,Y
	STA Data0+1
	JMP (Data0)
tbl3_E4DC:
	.word pnt2_E4E4
	.word pnt2_E4EC
	.word pnt2_E4F7
	.word pnt2_E509
pnt2_E4E4:
	LDA #sfxWarp
	STA SFXRegister	;Play warp sound
	INC a:EventPart
	RTS
pnt2_E4EC:
	LDX #$00
	LDY #$3C
	JSR sub3_E5B6	;Jump
	INC a:EventPart
	RTS
pnt2_E4F7:
	LDA #$00
	STA FadeoutMode	;Disable BG 'blackout' effect
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	INC a:EventPart	;Go to next part of event
	RTS
pnt2_E509:
	LDY WarpLevelNumber	;Load pointers based on level number of warp
	LDA tbl3_EB24,Y
	STA Data0	;Store lower byte of 1st Data0
	LDA tbl3_EB24+1,Y
	STA Data0+1	;Store upper byte of 1st Data0
	LDA tbl3_EA10,Y
	STA Data1	;Store lower byte of 2nd Data0
	LDA tbl3_EA10+1,Y
	STA Data1+1	;Store upper byte of 2nd Data0
	JSR sub3_E870	;Jump
	LDA #$01
	STA a:Event	;Trigger door exit
	LDA #$00
	STA a:EventPart	;Go to 1st event part
	STA $06DE
	STA $06DF
	RTS
pnt2_E534:
	LDA a:EventPart	;Load part of event
	ASL	;Multiply by 2
	TAY	;Load pointer based on event part
	LDA tbl3_E546,Y
	STA Data0	;Load lower byte of pointer
	LDA tbl3_E546+1,Y
	STA Data0+1	;Load upper byte of pointer
	JMP (Data0)	;Jump to loaded pointer
tbl3_E546:
	.word pnt2_E54E
	.word pnt2_E570
	.word pnt2_E585
	.word pnt2_E597
pnt2_E54E:
	LDA #$11
	STA PlayerAction	;Set action to "dying"
	LDA #$00
	STA PlayerAttributes	;Clear player's attributes
	STA PlayerXSpeed	;Clear player's X speed
	STA PlayerYSpeed	;Clear player's Y speed
	JSR sub3_E5D4	;Jump
	LDA #musDeath
	STA MusicRegister	;Play death music
	LDX #$00	;Set action tick count to 1
	LDY #$28	;Set tick length to 40 frames
	JSR sub3_E5B6	;Jump
	JSR sub3_F27F	;Jump
	INC a:EventPart	;Start level transition
	RTS
pnt2_E570:
	LDA #$00
	STA PlayerXSpeed	;Clear X speed
	LDA #$70
	STA PlayerYSpeed	;Set Y speed to 70h
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement	;Make player move up
	JSR sub3_E5D4
	INC a:EventPart
	RTS
pnt2_E585:
	LDA #$00
	STA PlayerXSpeed	;Clear X speed
	JSR sub3_E5D4	;Jump
	LDX #$04	;Set action tick count to 4
	LDY #$3B	;Set tick length to 59 frames
	JSR sub3_E5B6	;Jump
	INC a:EventPart	;Start level transition
	RTS
pnt2_E597:
	LDA #$00
	STA FadeoutMode	;Disable BG blackout flag
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA a:GameState	;Set game state to "not in level"
	STA a:EventPart	;Go to first part of event
	LDA #$16
	STA a:Event	;Trigger map fade-in
	JSR sub3_E4BA
	RTS
sub3_E5B6:
	INC ActionFrameCount	;Increment frame count for player action
	CPY ActionFrameCount
	BCS bra3_E5CB	;Branch when loaded action tick length is exceeded
	LDA #$00
	STA ActionFrameCount	;Clear action frame count
	INC PlayerActionTicks	;Increase action tick
	CPX PlayerActionTicks
	BCC bra3_E5CE	;Branch if the loaded tick count isn't reached
bra3_E5CB:
	PLA
	PLA	;Pull accumulator from stack twice? (Not sure what this is for)
	RTS
bra3_E5CE:
	LDA #$00
	STA PlayerActionTicks	;Clear action tick count
	RTS
sub3_E5D4:
	LDA #$39
	STA M90_PRG1	;Swap player bank into 2nd PRG slot
	JSR jmp_57_ACA5
	JSR jmp_57_A000
	LDA #$36
	STA M90_PRG1	;Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A150
	JSR jmp_54_A0D9
	JSR jmp_54_A000
	LDA #$3D
	STA M90_PRG1	;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F
	LDA #$00
	STA $062B
	LDA #$34
	STA M90_PRG1	;Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A080	;Jump
	JSR jmp_52_A089	;Jump
	JSR jmp_52_A000	;Jump
	JSR sub3_E9C4	;Jump
	RTS
pnt2_E610:
	JSR sub3_ED14	;Jump
	JSR sub3_F27F	;Jump
	LDA ButtonsPressed
	AND #$C0
	BEQ bra3_E62F	;If A or B are pressed,
	LDA #$00
	STA Player1YoshiStatus	;Remove Yoshi
	LDA #$39
	STA M90_PRG1	;Swap player bank into 2nd PRG slot
	JSR sub4_A14A	;Jump
	LDA #$03
	STA a:EventPart	;Skip to 3rd part of event
bra3_E62F:
	LDA a:EventPart	;Load event part
	ASL	;Multiply by 2
	TAY	;Load pointer based on event part
	LDA tbl3_E641,Y
	STA Data0	;Load lower byte of pointer
	LDA tbl3_E641+1,Y
	STA Data0+1	;Load upper byte of pointer
	JMP (Data0)	;Jump to loaded pointer
tbl3_E641:
	.word pnt2_E649
	.word pnt2_E68B
	.word pnt2_E69E
	.word pnt2_E6B0
pnt2_E649:
	LDA PlayerYSpeed
	BNE bra3_E68A	;Branch if moving vertically
	LDA #$01
	STA PlayerAction	;Set action to walking
	LDA #$10
	STA PlayerXSpeed	;Set walking speed to 10h
	LDA PlayerMovement
	AND #$BE
	STA PlayerMovement	;Make player face right
	LDA PlayerSprXPos
	CMP #$80	;If player hasn't reached this point,
	BCC bra3_E68A	;stop
	LDA Player1YoshiStatus
	BEQ bra3_E681	;Branch if player doesn't have Yoshi
	JSR sub3_E965	;Jump
	LDA #$01
	STA Player2YoshiStatus	;Set Yoshi for Player 2
	LDA #$50
	STA PlayerYSpeed	;Set Y speed to 50h
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement	;Set movement to 'moving up'
	LDA #$05
	STA PlayerAction	;Do spin jump
	LDA #sfxSpinJump
	STA SFXRegister	;Play spin jump sound
	RTS
bra3_E681:
	LDA PlayerSprXPos
	CMP #$B0	;If player hasn't reached this point,
	BCC bra3_E68A	;stop
	INC a:EventPart	;Set level transition
bra3_E68A:
	RTS
pnt2_E68B:
	LDA #$08
	STA PlayerAction	;Make player look up
	LDA #$00
	STA PlayerXSpeed	;Clear player's X speed
	LDX #$01
	LDY #$3B
	JSR sub3_E5B6	;Jump
	INC a:EventPart	;Go to next part of event
	RTS
pnt2_E69E:
	LDA #$01
	STA PlayerAction	;Set action to walking
	LDA #$10
	STA PlayerXSpeed	;Set walking speed to 10h
	LDA PlayerSprXPos
	CMP #$C8	;If player hasn't reached this point,
	BCC bra3_E6AF	;stop
	INC a:EventPart	;Go to next part of event
bra3_E6AF:
	RTS
pnt2_E6B0:
	LDA WorldNumber	;Load world number
	ASL
	ASL	;Multiply it by 4
	CLC
	ADC LevelNumber	;Add it to level number to get total level number
	ASL	;Multiply result by 2
	STA WarpLevelNumber	;Store as warp level number
	LDA #$00
	STA WarpNumber	;Set level warp to 0
	LDA #$03
	STA a:Event	;Enter door
	LDA #$00
	STA a:EventPart	;Set event part
	STA ActionFrameCount	;Disable action frame counter
	STA PlayerActionTicks	;Disable action timer
	STA PlayerAction	;Clear player action
	RTS
sub3_E6D5:
	LDA PalTransition
	AND #$80
	BEQ bra3_E6EC	;If palette transition not set,
	LDA #$05	;Set palette transition
	BNE bra3_E6E9
sub3_E6E0:
	LDA PalTransition
	AND #$80	;If palette transition not set,
	BEQ bra3_E6EC	;
	LDA #$00
bra3_E6E9:
	STA PalTransition
bra3_E6EC:
	RTS
pnt2_E6ED:
	LDA #$39
	STA M90_PRG1	;Swap player bank into 2nd PRG slot
	JSR jmp_57_A000	;Jump
	LDA #$36
	STA M90_PRG1	;Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A000	;Jump
	LDA #$34
	STA M90_PRG1	;Swap bank 52 into 2nd PRG slot
	LDA #$3D
	STA M90_PRG1	;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F	;Jump
	JSR sub3_E9C4
	LDA a:EventPart	;Load event part
	ASL
	TAY	;Load pointer based on event part
	LDA tbl3_E71F,Y
	STA Data0	;Load lower byte of pointer
	LDA tbl3_E71F+1,Y
	STA Data0+1	;Load upper byte of pointer
	JMP (Data0)	;Jump to loaded pointer
tbl3_E71F:
	.word pnt2_E727
	.word pnt2_E748
	.word pnt2_E769
	.word pnt2_E774
pnt2_E727:
	LDA PlayerYSpeed
	BNE bra3_E747	;If player not moving vertically,
	LDA #$01
	STA FadeoutMode	;Start BG 'blackout' effect
	JSR sub3_E6D5	;Jump
	JSR sub3_F919	;Jump
	LDA #$01
	STA PlayerAction	;Set action to walking
	LDA #$20
	STA PlayerXSpeed	;Set walking speed to 20h
	LDA PlayerMovement
	AND #$BE
	STA PlayerMovement	;Make player face right
	INC a:EventPart	;Go to next part of event
bra3_E747:
	RTS
pnt2_E748:
	LDA #$10
	STA PlayerXSpeed	;Set walking speed to 10h
	LDA PlayerSprXPos
	CMP #$98
	BCC bra3_E768	;If player's sprite reaches this point,
	LDA #$10
	STA PlayerAction	;Do victory pose
	LDA #$00
	STA PlayerXSpeed	;Stop moving horizontally
	LDA #$01
	STA FadeoutMode	;Start BG 'blackout' effect
	JSR sub3_E6E0	;Jump
	JSR sub3_F919	;Jump
	INC a:EventPart	;Go to next part of event
bra3_E768:
	RTS
pnt2_E769:
	LDX #$02
	LDY #$3B
	JSR sub3_E5B6
	INC a:EventPart	;Go to next part of event
	RTS
pnt2_E774:
	LDA #$01
	STA UnlockNextLevel	;Unlock next level
	STA PlayerAction	;Set action to walking
	LDA #$20
	STA PlayerXSpeed	;Set walking speed to 20h
	LDA #$00
	STA FadeoutMode	;Stop BG 'blackout' effect
	JSR sub3_E6D5	;Jump
	JSR sub3_F919	;Jump
	JSR sub3_E904	;Jump
	LDA #$00
	STA a:GameState	;Set game state to be outside a level
	STA a:EventPart	;Clear event part
	LDA #$16
	STA a:Event	;Set event number to 16h
	JSR sub3_E4BA	;Jump
	RTS
pnt2_E79E:
	INC a:Event	;Increment event number (go right to next event)
	RTS
pnt2_E7A2:
	LDA #$39
	STA M90_PRG1	;Swap player bank into 2nd PRG slot
	JSR jmp_57_ACA5	;Jump
	JSR jmp_57_AD04	;Jump
	JSR jmp_41_A000	;Jump
	LDA #$36
	STA M90_PRG1	;Swap bank 54 into 2nd PRG slot
	LDA #$00
	STA $062B
	LDA #$34
	STA M90_PRG1	;Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A080	;Jump
	JSR jmp_52_A089	;Jump
	JSR jmp_52_A000	;Jump
	JSR sub3_E9C4	;Jump
	RTS
pnt2_E7D0:
	LDA #$39
	STA M90_PRG1	;Swap player bank into 2nd PRG slot
	JSR jmp_41_A000	;Jump
	LDA #$36
	STA M90_PRG1	;Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A150	;Jump
	JSR jmp_54_A07E	;Jump
	JSR jmp_54_A000	;Jump
	LDA #$3D
	STA M90_PRG1	;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F	;Jump
	LDA #$34
	STA M90_PRG1	;Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A089	;Jump
	JSR sub3_E9C4	;Jump
	LDA a:EventPart
	ASL
	TAY	;Load pointer based on event part
	LDA tbl3_E80F,Y
	STA Data0	;Load lower byte of pointer
	LDA tbl3_E80F+1,Y
	STA Data0+1	;Load upper byte of pointer
	JMP (Data0)	;Jump to loaded pointer
tbl3_E80F:
	.word pnt2_E813
	.word pnt2_E81E
pnt2_E813:
	LDX #$06
	LDY #$3B
	JSR sub3_E5B6
	INC a:EventPart
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
	STA FadeoutMode	;Disable BG 'blackout' effect
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA a:GameState	;Set game state to 'not in level'
	STA a:EventPart	;Set event part
	LDA #$16
	STA a:Event
	JSR sub3_E4BA
	RTS
pnt2_E85F:
	LDA a:EventPart
	BNE bra3_E86F	;Branch if not on 1st event part
	LDA #$3D
	STA M90_PRG1	;Swap level handling bank into 2nd PRG slot
	JSR jmp_61_BE85	;Jump
	INC a:EventPart	;Go to next event part
bra3_E86F:
	RTS
sub3_E870:
	LDY WarpNumber
	LDX #$01
	STX InterruptMode	;Set horizontal interrupt for levels
	LDA (Data0),Y	;Load warp X screen from Data0
	AND #%01111111	;Mask out bit 7
	STA CameraXScreen	;Store as camera X screen
	STA PlayerColXScreen	;Store as wall collision position
	LDA #$00
	STA $52
	STA $65
	INY
	LDA (Data0),Y
	STA $53
	ASL
	STA VerticalScrollFlag
	LDA #$00
	STA $66
	STA $54
	STA $67
	LDA CameraXScreen
	STA PlayerXScreen
	INY
	LDA (Data0),Y
	STA PlayerXPos
	STA PlayerSprXPos
	LDA $53
	STA PlayerYScreen
	INY
	LDA (Data0),Y
	STA PlayerYPos
	STA PlayerSprYPos
	INY
	LDA (Data0),Y
	STA $060F
	INY
	LDA (Data0),Y
	STA ScreenCount
	INY
	LDA (Data0),Y
	STA VertScrollLock
	INY
	LDA (Data0),Y
	STA $060E
	LDA WarpNumber	;Load warp number
	LSR	;Divide it by 2
	TAY	;Load pointer based on the result
	LDA (Data1),Y		;Load byte from 2nd Data0 location
	AND #%00100000
	STA PlayerAttributes	;Mask out and store BG priority bit
	STA $06E1
	LDA (Data1),Y
	AND #%11000000
	STA UnderwaterFlag	;Mask out and store underwater flag
	LDA (Data1),Y
	AND #%11011111	;Clear BG priority bit
	STA DataBank1	;Store as level bank/number
	INY
	LDA (Data1),Y	;Load next byte from 2nd Data0 location
	CMP #$32	;If next level byte isn't for the final boss level,
	BNE bra3_E8ED	;branch
	LDA #$04	;Otherwise, set interrupt for final boss fight
	STA InterruptMode
bra3_E8ED:
	LDA #$3D
	STA M90_PRG1
	LDA (Data1),Y
	JSR $B34A
	INY
	LDA (Data1),Y
	STA DataBank2
	INY
	LDA (Data1),Y
	STA BGPalette
	RTS
sub3_E904:
	JSR sub3_F176	;Jump
	JSR sub3_E959	;Jump
	LDA #$01
	STA YoshiIdleStorage
	STA YoshiTongueState
	LDA #$90
	STA SpriteBank2	;Load bank 90h into 2nd sprite bank
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
	STA InvincibilityTimer	;Clear ALL player variables
	LDA #$39
	STA M90_PRG1	;Swap player bank into 2nd PRG slot
	JSR sub4_A14A	;Jump
	JSR jmp_57_A000	;Jump
	JSR sub3_E9C4	;Jump
	LDX #$70
	LDA #$00
bra3_E950:
	STA TileAttributes,X	;Clear tile attribute
	INX
	CPX #$80	;Keep going until all attributes are cleared
	BCC bra3_E950
	RTS
sub3_E959:
	LDA #$00
	TAX	;Clear X register
bra3_E95C:
	STA $03CE,X
	INX
	CPX #$16
	BCC bra3_E95C
	RTS
sub3_E965:
	LDA Player1YoshiStatus
	BEQ bra3_E9C3	;If player has Yoshi,
	LDA PlayerMovement
	STA YoshiIdleMovement	;Set Yoshi's idle movement
	LDA #$00
	STA Player1YoshiStatus	;Stop riding Yoshi
	LDA #$39
	STA M90_PRG1	;Swap player bank into 2nd PRG slot
	JSR sub4_A14A	;Jump
	LDA #$02
	STA YoshiUnmountedState	;Set Yoshi to be ducking down
	LDA PlayerYPosDup
	SEC
	SBC #$20		;Subtract player's Y position by 20h
	STA YoshiYPos	;Set as Yoshi's Y position
	LDA PlayerYScreenDup
	SBC #$00
	STA YoshiYScreen	;Set Yoshi's Y screen
	LDA PlayerMovement
	ORA #$01
	STA PlayerMovement	;Set movement to dismounting Yoshi (right)
	LDY #$08	;Set Yoshi X displacement for facing right
	LDA YoshiIdleMovement
	AND #$40
	BEQ bra3_E9A7	;Branch if Yoshi is facing right
	LDA PlayerMovement
	AND #$FE
	STA PlayerMovement	;Set movement to dismounting Yoshi (left)
	LDY #$18	;Load Yoshi X displacement for facing left
bra3_E9A7:
	STY $32	;Store loaded X displacement temporarily 
	SEC
	LDA PlayerXPosDup
	SBC $32	;Subtract player's X position by loaded displacement
	STA YoshiXPos	;Store result as Yoshi's X position
	LDA PlayerXScreenDup
	SBC #$00	;Subtract player's X screen by nothing
	STA YoshiXScreen	;Store result as Yoshi's X screen
	LDA #$00
	STA $05F6
	LDA #$30
	STA PlayerXSpeed	;Set player's X speed to 30h
	INC ObjectCount	;Add Yoshi to total object count
bra3_E9C3:
	RTS
sub3_E9C4:
	LDA #$14
	STA $3C
	LDA #$39
	STA M90_PRG1	;Swap player control bank into 2nd PRG slot
	JSR jmp_57_A23B
	JSR jmp_57_A8DE
	LDA #$34
	STA M90_PRG1	;Swap bank 52 into 2nd PRG slot
	JSR jmp_52_A0F3
	RTS
JYScreenTrigger:
	LDA ButtonsPressed
	CMP #buttonStart	;If start is pressed,
	BEQ JYTriggerDone	;stop
	LDA ButtonsPressed
	BEQ JYTriggerDone	;If any button is being pressed,
	LDX JYEasterEggInput	;Load correct input count
	BMI JYTriggerDone
	CMP JYScreenInputs,X	;If the next input isn't correct,
	BNE ClearJYInputs	;clear the input counter
	INC JYEasterEggInput	;If it is, go to next input
	LDA JYEasterEggInput
	CMP #$08
	BCC JYTriggerDone ;If all 8 inputs have been entered correctly,
	LDA #$0A
	STA a:Event	;display JY Easter egg screen
JYTriggerDone:
	RTS
ClearJYInputs:
	LDA #$00
	STA JYEasterEggInput	;Clear correct input count
	RTS
JYScreenInputs:
	.byte dirUp, dirRight, buttonA, dirDown, dirRight, buttonB, dirUp, dirLeft
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
	.word pnt2_EADC
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
	.byte $00
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
	STA M90_PRG1	;Swap player bank into 2nd PRG slot
	JSR jmp_57_A000
	LDA #$36
	STA M90_PRG1	;Swap bank 54 into 2nd PRG slot
	JSR jmp_54_A150
	JSR jmp_54_A07E
	JSR jmp_54_A000
	LDA #$3D
	STA M90_PRG1	;Swap bank 61 into 2nd PRG slot
	JSR jmp_61_AE8F
	LDA #$34
	STA M90_PRG1	;Swap bank 52 into 2nd PRG slot
	LDA #$80
	STA $3C
	JSR jmp_52_A080
	JSR jmp_52_A089
	JSR jmp_52_A000
	JSR sub3_E9C4	;Jump
	RTS
sub3_ED48:
	LDA #$24
	STA M90_PRG2	;Swap bank 36 into 3rd PRG slot
	LDA lda_36_D03E,Y
	STA Data0	;Load lower byte of warp coord Data0
	LDA lda_36_D03E+1,Y
	STA Data0+1	;Load upper byte of warp coord Data0
	LDA lda_36_D000,Y
	STA Data1	;Load lower byte of warp level Data0
	LDA lda_36_D000+1,Y
	STA Data1+1	;Load upper byte of warp level Data0
	LDA #$00
	STA WarpNumber	;Set warp number to 0
	JSR sub3_E870
	INC a:EventPart	;Go to next part of event
	LDA #$00
	STA $06DE
	STA $06DF
	RTS
pnt2_ED75:
	LDA a:EventPart	;Load event part
	ASL
	TAY	;Load pointer based on event part
	LDA tbl3_ED87,Y
	STA Data0	;Load lower byte of pointer
	LDA tbl3_ED87+1,Y
	STA Data0+1	;Load upper byte of pointer
	JMP (Data0)	;Jump to loaded pointer location
tbl3_ED87:
	.word pnt2_ED93
	.word pnt2_EDAA
	.word pnt2_EDCF
	.word pnt2_EDE1
	.word pnt2_E388
	.word pnt2_E3DD
pnt2_ED93:
	LDA #%00100000
	STA PlayerAttributes	;Set player to be behind BG
	LDA #$00
	STA PlayerAction	;Make player stand still
	JSR sub3_E5D4	;Jump
	LDA #sfxWarp
	STA SFXRegister	;Play warp sound
	JSR sub3_F27F	;Jump
	INC a:EventPart	;Go to next part of event
	RTS
pnt2_EDAA:
	LDA #$00
	STA PlayerXSpeed	;Stop player from moving vertically
	LDA #$10
	STA PlayerYSpeed	;Set pipe speed to 10h
	LDA PlayerMovement
	AND #$FB	;Stop player from moving up
	LDY a:Event
	CPY #$13	;If player isn't going up a pipe,
	BNE bra3_EDBF	;branch
	ORA #$04	;Otherwise, make the player move up
bra3_EDBF:
	STA PlayerMovement	;Store movement type
	JSR sub3_E5D4	;Jump
	LDX #$01
	LDY #$16	;Set action length to 22 frames
	JSR sub3_E5B6	;Jump
	INC a:EventPart	;Go to next part of event
	RTS
pnt2_EDCF:
	LDA #$00
	STA FadeoutMode	;Disable BG 'blackout' effect
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	INC a:EventPart	;Go to next part of event
	RTS
pnt2_EDE1:
	LDY #$38
	JSR sub3_ED48
	LDA #$00
	STA UnderwaterFlag
	LDA #$3D
	STA M90_PRG1
	LDA $A858
	STA $00DC
	LDA $A859
	STA $00DD
	LDA #$00
	STA $06E1
	RTS
pnt2_EE02:
	JSR sub3_ED14
	JSR sub3_F27F
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
	STA a:Event
	RTS
pnt2_EE23:
	LDA a:EventPart
	ASL
	TAY
	LDA tbl3_EE35,Y
	STA Data0
	LDA tbl3_EE35+1,Y
	STA Data0+1
	JMP (Data0)
tbl3_EE35:
	.word pnt2_EDCF
	.word pnt2_EE3D
	.word pnt2_E388
	.word pnt2_E3DD
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
	JSR $A828
	LDA #$20
	STA PlayerAttributes
	RTS
pnt2_EE59:
	JSR sub3_ED14
	JSR sub3_F27F
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
	LDA #sfxWarp
	STA SFXRegister
bra3_EE84:
	LDX #$00
	LDY #$19
	JSR sub3_E5B6
	LDA #$00
	STA PlayerAttributes
	LDA #$02
	STA a:Event
	RTS
pnt2_EE96:
	LDA a:EventPart
	ASL
	TAY
	LDA tbl3_EEA8,Y
	STA Data0
	LDA tbl3_EEA8+1,Y
	STA Data0+1
	JMP (Data0)
tbl3_EEA8:
	.word pnt2_ED93
	.word pnt2_EDAA
	.word pnt2_EDCF
	.word ofs5_EEB4
	.word pnt2_E388
	.word pnt2_E3DD
ofs5_EEB4:
	LDY #$3A
	LDA a:Event
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
	JSR sub3_F27F
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
	STA SFXRegister
bra3_EEEB:
	LDX #$00
	LDY #$19
	JSR sub3_E5B6
	LDA #$00
	STA PlayerAttributes
	LDA #$02
	STA a:Event
	RTS
pnt2_EEFD:
	LDA #$00
	STA a:EventPart
	LDA #$0C
	STA a:Event
	RTS
tbl3_EF08:
	.word NMI_E062
	.word jmp_63_E000
	.word NMI_E05C
	.word NMI_E05F
loc3_EF10:
	PHP	;Push the CPU status into the stack
	PHA	;Push the accumulator into the stack
	TXA
	PHA	;Push the X register into the stack
	TYA
	PHA	;Push the Y register into the stack
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
bra3_EF33:
	LDA #$00
	STA PPUOAMAddr
	LDA #$02
	STA OAMDMA
	LDA PPUMaskRegister
	STA PPUMask
	LDA #$00
	STA PPUAddr
	STA PPUAddr
	LDA PPUControlRegister
	AND #$FC
	ORA VerticalScrollFlag
	STA PPUControlRegister
	STA PPUCtrl
	LDA LogoFlag
	BNE bra3_EF67
	LDA ScrollXPos
	STA PPUScroll
	LDA ScrollYPos
	STA PPUScroll
	JMP loc3_EF73
bra3_EF67:
	LDA LogoXOffset
	STA PPUScroll
	LDA LogoYOffset
	STA PPUScroll
loc3_EF73:
	JSR sub3_F6E0
	LDX BGBank1
	STX M90_BG_CHR0	;Update 1st BG bank
	INX	;Load next CHR bank
	STX M90_BG_CHR1	;Set as 2nd BG bank
	LDX BGBank3
	STX M90_BG_CHR2	;Update 3rd BG bank
	INX	;Load next CHR bank
	STX M90_BG_CHR3	;Set as 4th BG bank
	LDA SpriteBank1
	STA M90_SP_CHR0	;Update 1st sprite bank
	LDA SpriteBank2
	STA M90_SP_CHR1	;Update 2nd sprite bank
	LDA SpriteBank3
	STA M90_SP_CHR2	;Update 3rd sprite bank
	LDA SpriteBank4
	STA M90_SP_CHR3	;Update 4th sprite bank
	JSR sub3_F19F	;Jump
	INC SecFrameCount	;Increment second frame counter
	LDA SecFrameCount
	CMP #$3C	;If its below 60 frames,
	BCC bra3_EFB4	;branch
	AND #$00
	STA SecFrameCount	;Clear second frame count
bra3_EFB4:
	LDA #$00
	STA $3C
	INC FrameCount	;Increment global frame counter
	LDA #$3A
	STA M90_PRG0
	LDA #$3B
	STA M90_PRG1
	LDA a:GameState	;If in a level,
	BNE bra3_EFD9	;branch
	JSR $85BE
	JSR $862A
	LDA $08
	STA M90_PRG0
	LDA $09
	STA M90_PRG1
bra3_EFD9:
	PLA
	TAY	;Pull stack to Y register
	PLA
	TAX	;Pull stack to X register
	PLA	;Pull stack to accumulator
	PLP	;Pull CPU status from stack
	RTI
loc3_EFE0:
	PHP	;Push CPU status to stack
	PHA	;Push accumulator to stack
	TXA
	PHA	;Push X register to stack
	TYA
	PHA	;Push Y register to stack
	LDA PPUMaskRegister
	STA PPUMask	;Copy software mask register to hardware register
	LDA PPUControlRegister
	AND #%11111100	;Mask out bits
	ORA VerticalScrollFlag	;Add vertical scroll flag (changes nametable address if set)
	STA PPUControlRegister
	STA PPUCtrl	;Store in both software and hardware registers
	LDA LogoFlag	;If logo flag set,
	BNE bra3_F008	;branch
	LDA ScrollXPos
	STA PPUScroll	;Load horizontal scroll position into PPU
	LDA ScrollYPos
	STA PPUScroll	;Load vertical scroll position into PPU
	JMP loc3_F014
bra3_F008:
	LDA LogoXOffset
	STA PPUScroll	;Load logo horizontal offset into PPU
	LDA LogoYOffset
	STA PPUScroll	;Load logo vertical offset into PPU
loc3_F014:
	JSR sub3_F6E0
	LDX BGBank1
	STX M90_BG_CHR0	;Update 1st BG bank
	INX	;Load next CHR bank
	STX M90_BG_CHR1	;Set it as 2nd BG bank
	LDX BGBank3
	STX M90_BG_CHR2	;Update 3rd BG bank
	INX	;Load next CHR bank
	STX M90_BG_CHR3	;Set it as 4th BG bank
	LDA SpriteBank1
	STA M90_SP_CHR0	;Update 1st sprite bank
	LDA SpriteBank2
	STA M90_SP_CHR1	;Update 2nd sprite bank
	LDA SpriteBank3
	STA M90_SP_CHR2	;Update 3rd sprite bank
	LDA SpriteBank4
	STA M90_SP_CHR3	;Update 4th sprite bank
	PLA
	TAY	;Pull stack into Y register
	PLA
	TAX	;Pull stack into X register
	PLA	;Pull stack into accumulator
	PLP	;Pull CPU status from stack
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
	LDA PPUStatus	;Clear address latch
	LDA PPUControlRegister	;Load PPU control software reg
	ORA #$04	;Do OR operation, effectively adding 4
	STA PPUCtrl	;Store in PPU control hardware reg
	LDA PPUStatus
	LDA ColumnFinishFlag
	STA PPUAddr	;Load upper byte of PPU address (20 when scrolling)
	LDA NextBGColumn
	STA PPUAddr	;Load current column into low byte of PPU address
	LDX #$00	;Set row to 0
bra3_F070:
	LDA TileRowMem,X	;Load 8x8 tile row data
	STA PPUData	;Store it in the PPU
	INX	;Move to next row
	CPX #$1E	;Keep looping until row 30 is reached
	BCC bra3_F070
	LDA PPUStatus	;Clear address latch
	LDA ColumnFinishFlag	;Load upper byte (20 when scrolling)
	ORA #$08	;Do OR operation, effectively adding 8
	STA PPUAddr	;Store as upper byte of PPU address
	LDA NextBGColumn
	STA PPUAddr	;Load current column into lower byte of PPU address
bra3_F08C:
	LDA TileRowMem,X	;Load 8x8 tile row data
	STA PPUData	;Store it in the PPU
	INX	;Move to next row
	CPX TileRowCount	;Keep looping until current row count is reached
	BCC bra3_F08C
	LDA PPUStatus	;Clear address latch
	LDA PPUControlRegister	;Load PPU control software reg
	AND #%11111011	;Mask bits
	STA PPUCtrl	;Store in PPU control hardware register
	RTS

sub3_F0A2:
	LDA PalAssignPtrHi	;If upper byte of mapping Data0 is empty,
	BEQ bra3_F0CA	;stop
	LDX #$00
bra3_F0A9:
	LDA PPUStatus	;Clear address latch
	LDA PalAssignPtrHi,X
	STA PPUAddr	;Load upper byte of PPU palette mapping memory 
	LDA PalAssignPtrLo,X
	STA PPUAddr	;Load lower byte of PPU palette mapping memory
	LDA PalAssignData,X
	STA PPUData	;Store palette mapping data into PPU memory
	INX
	INX
	INX	;Load next Data0/data set
	CPX BGPalDataSize	;Keep going until Data0 count is reached
	BCC bra3_F0A9
	LDA #$00
	STA PalAssignPtrHi	;Clear upper byte of pointer
bra3_F0CA:
	RTS
sub3_F0CB:
	LDA WorldNumber	;Load world number
	ASL
	ASL	;multiply it by 4
	CLC
	ADC LevelNumber ;Add it to level count
	TAX	;Copy to X reg
	LDA LevelMusic,X
	STA MusicRegister	;Load/play music for level
	RTS
LevelMusic:
	.byte $29	;1-1 Music
	.byte $28	;1-2 Music
	.byte $20	;1-3 Music
	.byte $2C	;1-4 Music
	.byte $29	;2-1 Music
	.byte $28	;2-2 Music
	.byte $2B	;2-3 Music
	.byte $2C	;2-4 Music
	.byte $2A	;3-1 Music
	.byte $2D	;3-2 Music
	.byte $2B	;3-3 Music
	.byte $2C	;3-4 Music
	.byte $29	;4-1 Music
	.byte $28	;4-2 Music
	.byte $20	;4-3 Music
	.byte $2C	;4-4 Music
	.byte $29	;5-1 Music
	.byte $2B	;5-2 Music
	.byte $2D	;5-3 Music
	.byte $2C	;5-4 Music
	.byte $29	;6-1 Music
	.byte $2B	;6-2 Music
	.byte $28	;6-3 Music
	.byte $2C	;6-4 Music
	.byte $29	;7-1 Music
	.byte $28	;7-2 Music
	.byte $2B	;7-3 Music
	.byte $2C	;7-4 Music
	.byte $29	;Yoshi's House Music
pnt2_F0F8:
	LDX #$F0
	STX M90_BG_CHR0	;Set bank F0 to 1st BG bank
	INX	;Load next CHR bank
	STX M90_BG_CHR1	;Set it as 2nd BG bank
	LDX $0362
	STX M90_BG_CHR2	;Update 3rd BG bank
	INX	;Load next CHR bank
	STX M90_BG_CHR3	;Set it as 4th BG bank
	LDY #$21	;Load upper byte of PPU address
	LDA ScrollXPos	;Load horizontal scroll position
	LSR
	LSR
	LSR	;Divide it by 8
	ORA #$B0	;Do OR operation
	TAX	;Set it as lower byte of PPU address
	STY PPUAddr	;Store upper byte
	STX PPUAddr	;Store lower byte
	LDA ScrollXPos
	STA PPUScroll
	STA PPUScroll	;Set the horizontal scroll to both axes
	STA M90_IRQ_DISABLE	;Disable mapper IRQ
	RTS	;Done
pnt2_F127:
	LDA PPUStatus
	LDA #$2B	;Load upper byte of PPU address
	STA PPUAddr
	LDA #$40	;Load lower byte of PPU address
	STA PPUAddr
	LDA #$00
	STA PPUScroll
	STA PPUScroll	;Set scroll to default position
	LDA #%00001110
	STA PPUMask	;Disable sprite rendering
	LDX #$EC
	STX M90_BG_CHR0	;Set bank EC to 1st BG bank
	INX	;Load next CHR bank
	STX M90_BG_CHR1	;Set it as 2nd BG bank
	INX	;Load next CHR bank
	STX M90_BG_CHR2	;Set it as 3rd BG bank
	INX	;Load next CHR bank
	STX M90_BG_CHR3	;Set it as 4th BG bank
pnt2_F152:
	STA M90_IRQ_DISABLE	;Disable mapper IRQ
	RTS
bra3_F156:
	LDA PPUStatus
	BPL bra3_F156	;Keep looping if VBlank isn't set
bra3_F15B:
	LDA PPUStatus
	BPL bra3_F15B	;Keep looping if VBlank isn't set
	RTS	;Return
	ASL
	TAY
	PLA
	STA $34
	PLA
	STA $35
	INY
	LDA (Data1),Y
	STA Data0
	INY
	LDA (Data1),Y
	STA Data0+1
	JMP (Data0)
sub3_F176:
	LDA #$F8
	LDX #$00
bra3_F17A:
	STA SpriteMem,X
	INX
	INX
	INX
	INX
	BNE bra3_F17A
	RTS
sub3_F184:
	ASL
	ASL
	CLC
	ADC #$20
	LDX #$00
	STA PPUAddr
	STX PPUAddr
	LDY #$03
	LDA #$FF
bra3_F195:
	STA PPUData
	DEX
	BNE bra3_F195
	DEY
	BPL bra3_F195
	RTS
sub3_F19F:
	JSR sub3_F1C9
	LDX #$00
	JSR sub3_F1A8
	INX
sub3_F1A8:
	LDA ButtonsHeld,X
	EOR $030E,X
	AND ButtonsHeld,X
	STA ButtonsPressed,X
	LDA ButtonsHeld,X
	STA $030E,X
	AND #$0C
	CMP #$0C
	BNE bra3_F1C8
	LDA ButtonsHeld,X
	AND #$FB
	STA ButtonsHeld,X
bra3_F1C8:
	RTS
sub3_F1C9:
	LDA #$01
	STA Joy1	;Strobe controller input
	LDA #$00
	STA Joy1	;Read controller input
	LDA #$01
	STA Joy1	;Strobe controller again
	NOP
	NOP	;Wait 2 cycles
	LDA #$00
	STA Joy1	;Read controller input
	NOP
	NOP	;Wait 2 cycles
	LDA #$01
	LSR	;Shift bit 0 and set carry
	TAX
	STA Joy1
	JSR sub3_F1EC
	INX	;Set X offset to 1
sub3_F1EC:
	LDA #$00
	STA Controller2Input	;Clear input for 2nd controller
	LDY #$08
bra3_F1F3:
	PHA
	LDA Joy1,X	;Read 2nd controller register
	STA $063D
	LSR
	LSR
	ROL $25
	LSR $063D
	PLA
	ROL Controller2Input
	DEY
	BNE bra3_F1F3
	ORA Controller2Input
	STA ButtonsHeld,X
	RTS
sub3_F20F:
	LDA PPUUpdatePtr
	BEQ bra3_F258
	LDA $03A0
	ORA PPUControlRegister
	AND #$7F
	STA PPUCtrl
	LDY #$00
	LDX #$00
bra3_F222:
	LDA PPUStatus	;Clear address latch
	LDA PPUUpdatePtr
	STA PPUAddr	;Set upper byte of PPU Data0
	LDA PPUUpdatePtr+1
	STA PPUAddr	;Set lower byte of PPU Data0
bra3_F231:
	LDA $03A5,X
	STA PPUData
	INY
	INX
	CPY $03A4
	BCC bra3_F231
	LDA PPUUpdatePtr+1
	CLC
	ADC #$20
	STA PPUUpdatePtr+1
	BCC bra3_F24C
	INC PPUUpdatePtr
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
sub3_F27F:
	LDA InterruptMode
	CMP #$04	;If using the interrupt for the Bowser fight,
	BEQ bra3_F29D		;branch
	LDA PPUUpdatePtr
	BNE bra3_F29D	;Stop if the upper byte of the PPU Data0 is empty
	LDA HUDUpdate	;Load current HUD update state
	ASL
	TAY	;Get pointer for it
	LDA tbl3_F29E,Y
	STA Data0	;Load lower byte of pointer
	LDA tbl3_F29E+1,Y
	STA Data0+1	;Load upper byte of pointer
	JMP (Data0)	;Jump to loaded pointer
bra3_F29D:
	RTS
tbl3_F29E:
	.word pnt2_F2A8
	.word pnt2_F2D6
	.word pnt2_F303
	.word pnt2_F329
	.word pnt2_F358
pnt2_F2A8:
	JSR sub3_F388
	INC HUDUpdate
	LDX #$00	;Set X index for Player 1
	LDA CurrentPlayer
	BEQ bra3_F2B7	;Branch if Player 1 is playing
	LDX #$01	;Otherwise, set X index for Player 2
bra3_F2B7:
	LDA Player1Lives,X
	STA $34	;Store current player's life count in temporary register
	LDA #$00
	STA $35	;Clear the other temporary register
	LDA #$0B
	STA $26	;Temporarily store value $0B
	JSR sub3_F3BB
	LDY #$00	;Clear Y offset
	LDX #$01	;Set X index to 1
bra3_F2CB:
	LDA HUDUpdateTiles,Y	;Load currently updated HUD tile
	STA $03A5,X
	INY
	DEX
	BPL bra3_F2CB
	RTS
pnt2_F2D6:
	JSR sub3_F388
	INC HUDUpdate
	LDX #$04
	LDA #$00
bra3_F2E0:
	STA $03A5,X
	DEX
	BPL bra3_F2E0
	LDX #$00
	LDA CurrentPlayer
	BEQ bra3_F2EF
	LDX #$01
bra3_F2EF:
	LDA Player1YoshiCoins,X
	STA $25
	BEQ bra3_F302
	LDY #$00
	LDA #$06
bra3_F2FA:
	STA $03A5,Y
	INY
	CPY $25
	BCC bra3_F2FA
bra3_F302:
	RTS
pnt2_F303:
	JSR sub3_F388
	INC HUDUpdate
	LDA LevelTimerLo
	STA $34
	LDA LevelTimerHi
	STA $35
	LDA #$0B
	STA $26
	JSR sub3_F3BB
	LDY #$00
	LDX #$02
bra3_F31E:
	LDA $0378,Y
	STA $03A5,X
	INY
	DEX
	BPL bra3_F31E
	RTS
pnt2_F329:
	JSR sub3_F388
	INC HUDUpdate	;Update HUD
	LDX #$00
	LDA CurrentPlayer
	BEQ bra3_F338
	LDX #$02
bra3_F338:
	LDA #$0B
	STA $26
	LDA P1Score,X
	STA $34
	LDA P1Score+1,X
	STA $35
	JSR sub3_F3BB
	LDY #$00
	LDX #$04
bra3_F34D:
	LDA $0378,Y
	STA $03A5,X
	INY
	DEX
	BPL bra3_F34D
	RTS
pnt2_F358:
	JSR sub3_F388
	LDA #$00
	STA HUDUpdate
	LDX #$00	;Set to Player 1
	LDA CurrentPlayer
	BEQ bra3_F369		;Branch if Player 1 is playing
	LDX #$01	;Otherwise, set values to Player 2
bra3_F369:
	LDA Player1Coins,X	;Load current player's coin count
	STA $34
	LDA #$00
	STA $35
	LDA #$0B
	STA $26
	JSR sub3_F3BB
	LDY #$00
	LDX #$01
bra3_F37D:
	LDA $0378,Y
	STA $03A5,X
	INY
	DEX
	BPL bra3_F37D
	RTS
sub3_F388:
	LDA HUDUpdate
	ASL
	ASL
	TAX
	LDA tbl3_F3A7,X
	STA PPUUpdatePtr
	LDA tbl3_F3A8,X
	STA PPUUpdatePtr+1
	LDA tbl3_F3A9,X
	STA $03A3
	LDA tbl3_F3AA,X
	STA $03A4
	RTS
tbl3_F3A7:
	.byte $2B
tbl3_F3A8:
	.byte $84
tbl3_F3A9:
	.byte $01
tbl3_F3AA:
	.byte $02
	.byte $2B
	.byte $68
	.byte $01
	.byte $05
	.byte $2B
	.byte $94
	.byte $01
	.byte $03
	.byte $2B
	.byte $98
	.byte $01
	.byte $05
	.byte $2B
	.byte $7C
	.byte $01
	.byte $02
sub3_F3BB:
	LDA #$00
	STA Pointer3+1
	STA $25
	LDA #$0A
	STA Pointer3
bra3_F3C5:
	JSR sub3_F3EC
	LDA Data0
	CLC
	ADC $26
	LDY $25
	STA $0378,Y
	INC $25
	LDA $25
	CMP #$05
	BCC bra3_F3C5
	LDY #$04
bra3_F3DC:
	LDA $0378,Y
	CMP $26
	BNE bra3_F3EB
	LDA #$00
	STA $0378,Y
	DEY
	BNE bra3_F3DC
bra3_F3EB:
	RTS
sub3_F3EC:
	LDA #$00
	STA Data0
	STA Data0+1
	LDX #$10
bra3_F3F4:
	ASL $34
	ROL $35
	ROL $32
	ROL $33
	LDA Data0
	SEC
	SBC $38
	TAY
	LDA Data0+1
	SBC $39
	BCC bra3_F40E
	INC $34
	STA Data0+1
	STY $32
bra3_F40E:
	DEX
	BNE bra3_F3F4
	RTS
	LDA #$2B
 	STA PPUAddr
	LDA #$40
 	STA PPUAddr
 	LDX #$00
 	LDA InterruptMode
 	CMP #$04
 	BEQ bra3_F442
 	LDA CurrentPlayer
 	BNE bra3_F436
bra3_F42A:
 	LDA tbl3_F44E,X
 	STA PPUData
 	INX
 	CPX #$80
 	BCC bra3_F42A
	RTS
bra3_F436:
	LDA tbl3_F4CE,X
 	STA PPUData
 	INX
 	CPX #$80
 	BCC bra3_F436
 	RTS
bra3_F442:
 	LDA tbl3_F54E,X
 	STA PPUData
	INX
 	CPX #$80
 	BCC bra3_F442
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
	STA PPUAddr
	LDA $03E6,X
	STA PPUAddr
	CLC
	ADC #$20
	STA $28
	LDA $03E5,X
	ADC #$00
	LDY $03F6
	STY PPUData
	LDY $03F7
	STY PPUData
	STA PPUAddr
	LDA $28
	STA PPUAddr
	LDY $03F8
	STY PPUData
	LDY $03F9
	STY PPUData
	INX
	INX
	INX
	JMP loc3_F5D0
bra3_F623:
	LDA $03E5,X
	STA PPUAddr
	LDA $03E6,X
	STA PPUAddr
	CLC
	ADC #$20
	STA $28
	LDA $03E5,X
	ADC #$00
	LDY $03FA
	STY PPUData
	LDY $03FB
	STY PPUData
	STA PPUAddr
	LDA $28
	STA PPUAddr
	LDY $03FC
	STY PPUData
	LDY $03FD
	STY PPUData
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
	STA PPUAddr
	LDA $03E6,X
	STA PPUAddr
	CLC
	ADC #$20
	STA $28
	LDA $03E5,X
	ADC #$00
	STA $25
	LDY $03E4
	LDA tbl3_F6AB,Y
	STA PPUData
	LDA tbl3_F6AC,Y
	STA PPUData
	LDA $25
	STA PPUAddr
	LDA $28
	STA PPUAddr
	LDA tbl3_F6AD,Y
	STA PPUData
	LDA tbl3_F6AE,Y
	STA PPUData
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
IRQ:
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	JSR MemJMPOpcode	;Execute 'fake' JMP opcode
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
	LDA #$4C
	STA MemJMPOpcode	;Load fake JMP opcode into memory
	LDA tbl3_F720
	STA MemJMPLoByte	;Load lower byte of fake JMP
	LDA tbl3_F720+1
	STA MemJMPHiByte	;Load upper byte of fake JMP
	JMP loc3_F6F3
sub3_F6E0:
	LDA #$4C
	STA MemJMPOpcode	;Load fake JMP opcode into memory
	LDA InterruptMode
	ASL
	TAX
	LDA tbl3_F71A,X
	STA MemJMPLoByte
	LDA tbl3_F71A+1,X
loc3_F6F3:
	STA MemJMPHiByte
	LDX InterruptMode
	LDA PPUStatus
	LDA InterruptLineTable,X
	STA M90_IRQ_DISABLE
	STA M90_IRQ_COUNTER
	LDA #$FB
	STA M90_IRQ_PRESCALER
	STA M90_IRQ_ENABLE
	RTS
InterruptLineTable:
	.byte $08
	.byte $CC	;Level
	.byte $80
	.byte $08
	.byte $B0	;Bowser Fight
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $64	;Title Screen
	.byte $D0	;Overworld Map
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
pnt2_F734:
	LDA HUDDisplay
	BNE bra3_F73C	;Branch if HUD BG isn't updated at all (not sure about these)
	JMP loc3_F7C5	;Jump if it is
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
	BNE bra3_F759
	JMP loc3_F7CE
bra3_F759:
	CMP #$01
	BNE bra3_F760
	JMP loc3_F85A
bra3_F760:
	CMP #$02
	BNE bra3_F767
	JMP loc3_F899
bra3_F767:
	CMP #$03
	BNE bra3_F76E
	JMP loc3_F7C5
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
	STA $E000
	LDA #$00
	STA HUDDisplay
	RTS
loc3_F7CE:
	INC HUDDisplay
	LDA #$20
	STA M90_IRQ_ENABLE
	STA M90_IRQ_ENABLE
	RTS
sub3_F7DA:
	LDA PauseFlag	;If the game is paused,
	BNE bra3_F811	;branch
	LDA DataBank2
	CMP #$26	;If the final boss area isn't loaded,
	BNE bra3_F7EA	;branch
	JSR sub3_F90B	;If it is, continue and jump
	RTS
bra3_F7EA:
	LDA DataBank2
	CMP #$23
	BEQ bra3_F811
	CMP #$2B
	BEQ bra3_F811
	LDA $03CD
	LSR
	TAY
	LDA tbl3_F812,Y
	STA $A6	;Load lower byte of pointer
	LDA tbl3_F812+1,Y
	STA $A7	;Load upper byte of pointer
	LDA FrameCount
	AND #%00011000	;Mask 2 middle bits of frame counter
	LSR
	LSR
	LSR	;Divide result by 8
	TAY	;Copy it to the Y reg
	LDA ($A6),Y	;Load data from Data0
	STA M90_BG_CHR3
bra3_F811:
	RTS
tbl3_F812:
	.word pnt2_F84E
	.word pnt2_F84E
	.word pnt2_F852
	.word pnt2_F84E
	.word pnt2_F84E
	.word pnt2_F84E
	.word pnt2_F84A
	.word pnt2_F84A
	.word pnt2_F84E
	.word pnt2_F84E
	.word pnt2_F84A
	.word pnt2_F84A
	.word pnt2_F852
	.word pnt2_F852
	.word pnt2_F852
	.word pnt2_F84A
	.word pnt2_F84E
	.word pnt2_F84A
	.word pnt2_F84E
	.word pnt2_F84A
	.word pnt2_F852
	.word pnt2_F84E
	.word pnt2_F84A
	.word pnt2_F84A
	.word pnt2_F84A
	.word pnt2_F856
	.word pnt2_F84A
	.word pnt2_F84E
pnt2_F84A:
	.byte $01
	.byte $45
	.byte $41
	.byte $0A
pnt2_F84E:
	.byte $5B
	.byte $56
	.byte $16
	.byte $36
pnt2_F852:
	.byte $0D
	.byte $33
	.byte $63
	.byte $79
pnt2_F856:
	.byte $C4
	.byte $C5
	.byte $C6
	.byte $C7
loc3_F85A:
	LDA #$1D
	STA M90_IRQ_DISABLE
	STA M90_IRQ_ENABLE
	STA M90_IRQ_COUNTER
	LDX #$0C
bra3_F867:
	DEX
	BNE bra3_F867
	LDX #$2B
	LDY #$40
	STX PPUAddr
	STY PPUAddr	;Set PPU address to $2B40
	LDA PPUStatus
	LDA #$00
	STA PPUScroll	;Set horizontal scroll for HUD
	LDA #$C4
	STA PPUScroll	;Set vertical scroll for HUD
	INC HUDDisplay
	LDA #$EC
	STA M90_BG_CHR0		;Swap in 1st HUD bank
	LDA #$ED
	STA M90_BG_CHR1		;Swap in 2nd HUD bank
	LDA #$EE
	STA M90_BG_CHR2		;Swap in 3rd HUD bank
	LDA #$EF
	STA M90_BG_CHR3		;Swap in 4th HUD bank
	RTS
loc3_F899:
	STA M90_IRQ_DISABLE
	LDX #$0C
bra3_F89E:
	DEX
	BNE bra3_F89E
	LDA #$10
	STA PPUMask
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
	STX PPUAddr
	STY PPUAddr
	LDA PPUStatus
	LDA #$00
	STA PPUScroll
	LDA #$C4
	STA PPUScroll
	LDA #$00
	STA HUDDisplay
	RTS
loc3_F8D7:
	LDX #$22
	LDY #$D8	;Set interrupt line
	STX PPUAddr
	STY PPUAddr	;Store interrupt line
	LDA PPUStatus
	LDA #$00
	STA PPUScroll
	LDA #$B0
	STA PPUScroll
	LDA #$00
	STA HUDDisplay
	LDA #$C8
	STA M90_BG_CHR0		;Load 1st Clown Car bank into PPU
	LDA #$C9
	STA M90_BG_CHR1		;Load 2nd Clown Car bank into PPU
	LDA #$CA
	STA M90_BG_CHR2		;Load 3rd Clown Car bank into PPU
	LDA #$CB
	STA M90_BG_CHR3		;Load 4th Clown Car bank into PPU
	STA M90_IRQ_DISABLE
	RTS
sub3_F90B:
	LDY ClownCarFace
	LDA ClownCarBanks,Y
	STA M90_BG_CHR0
	RTS
ClownCarBanks:
	.byte $C8	;Default
	.byte $C9	;Blinking
	.byte $CA	;Hurt
	.byte $CB	;Angry
sub3_F919:
	LDA BGPalette
	ASL
	ASL
	TAY
	LDA CurrentPlayer
	BEQ bra3_F939
	LDA tbl3_FA96,Y
	STA $30
	LDA tbl3_FA96+1,Y
	STA $31
	LDA tbl3_FA94,Y
	STA Data0
	LDA tbl3_FA94+1,Y
	JMP loc3_F94B
bra3_F939:
	LDA tbl3_F9FE,Y
	STA $30
	LDA tbl3_F9FE+1,Y
	STA $31
	LDA tbl3_F9FC,Y
	STA Data0
	LDA tbl3_F9FC+1,Y
loc3_F94B:
	STA Data0+1
	LDA FadeoutMode
	ASL
	ASL
	TAY
	LDA tbl3_FE8C,Y
	STA $34
	LDA tbl3_FE8C+1,Y
	STA $35
	LDA tbl3_FE8E,Y
	STA $2E
	LDA tbl3_FE8E+1,Y
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
	LDA (Data1),Y
	BPL bra3_F987
	LDA (Data0),Y
	JMP loc3_F990
bra3_F987:
	LDA (Data0),Y
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
	STA $03A5,X
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
	STA $03A5,X
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
	STA $03A4
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
	.byte $40
	.byte $30
	.byte $20
	.byte $10
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
tbl3_F9FC:
	.word ofs_FB2C
tbl3_F9FE:
	.word ofs_FD4C
	.word ofs_FB3C
	.word ofs_FD4C
	.word ofs_FB4C
	.word ofs_FD4C
	.word ofs_FB5C
	.word ofs_FD4C
	.word ofs_FB6C
	.word ofs_FD4C
	.word ofs_FB7C
	.word ofs_FD4C
	.word ofs_FB8C
	.word ofs_FD4C
	.word ofs_FB5C
	.word ofs_FD4C
	.word ofs_FB9C
	.word ofs_FD4C
	.word ofs_FBAC
	.word ofs_FD4C
	.word ofs_FB8C
	.word ofs_FD4C
	.word ofs_FBBC
	.word ofs_FD4C
	.word ofs_FBCC
	.word ofs_FD4C
	.word ofs_FBCC
	.word ofs_FD4C
	.word ofs_FBDC
	.word ofs_FD4C
	.word ofs_FBEC
	.word ofs_FD4C
	.word ofs_FBFC
	.word ofs_FD4C
	.word ofs_FC0C
	.word ofs_FD4C
	.word ofs_FC1C
	.word ofs_FD4C
	.word ofs_FC2C
	.word ofs_FD8C
	.word ofs_FC3C
	.word ofs_FD4C
	.word ofs_FC4C
	.word ofs_FD4C
	.word ofs_FC5C
	.word ofs_FD4C
	.word ofs_FC6C
	.word ofs_FD8C
	.word ofs_FC7C
	.word ofs_FD4C
	.word ofs_FC8C
	.word ofs_FD4C
	.word ofs_FC9C
	.word ofs_FD4C
	.word ofs_FCAC
	.word ofs_FD8C
	.word ofs_FCBC
	.word ofs_FD4C
	.word ofs_FCCC
	.word ofs_FD4C
	.word ofs_FCDC
	.word ofs_FD5C
	.word ofs_FCEC
	.word ofs_FD6C
	.word ofs_FCFC
	.word ofs_FD7C
	.word ofs_FD0C
	.word ofs_FD8C
	.word ofs_FD1C
	.word ofs_FD9C
	.word ofs_FCDC
	.word ofs_FDAC
	.word ofs_FD2C
	.word ofs_FDBC
	.word ofs_FD3C
	.word ofs_FDCC
tbl3_FA94:
	.word ofs_FB2C
tbl3_FA96:
	.word ofs_FDDC
	.word ofs_FB3C
	.word ofs_FDDC
	.word ofs_FB4C
	.word ofs_FDDC
	.word ofs_FB5C
	.word ofs_FDDC
	.word ofs_FB6C
	.word ofs_FDDC
	.word ofs_FB7C
	.word ofs_FDDC
	.word ofs_FB8C
	.word ofs_FDDC
	.word ofs_FB5C
	.word ofs_FDDC
	.word ofs_FB9C
	.word ofs_FDDC
	.word ofs_FBAC
	.word ofs_FDDC
	.word ofs_FB8C
	.word ofs_FDDC
	.word ofs_FBBC
	.word ofs_FDDC
	.word ofs_FBCC
	.word ofs_FDDC
	.word ofs_FBCC
	.word ofs_FDDC
	.word ofs_FBDC
	.word ofs_FDDC
	.word ofs_FBEC
	.word ofs_FDDC
	.word ofs_FBFC
	.word ofs_FDDC
	.word ofs_FC0C
	.word ofs_FDDC
	.word ofs_FC1C
	.word ofs_FDDC
	.word ofs_FC2C
	.word ofs_FE3C
	.word ofs_FC3C
	.word ofs_FDDC
	.word ofs_FC4C
	.word ofs_FDDC
	.word ofs_FC5C
	.word ofs_FDDC
	.word ofs_FC6C
	.word ofs_FE3C
	.word ofs_FC7C
	.word ofs_FDDC
	.word ofs_FC8C
	.word ofs_FDDC
	.word ofs_FC9C
	.word ofs_FDDC
	.word ofs_FCAC
	.word ofs_FE3C
	.word ofs_FCBC
	.word ofs_FDDC
	.word ofs_FCCC
	.word ofs_FDDC
	.word ofs_FCDC
	.word ofs_FE0C
	.word ofs_FCEC
	.word ofs_FE1C
	.word ofs_FCFC
	.word ofs_FE2C
	.word ofs_FD0C
	.word ofs_FE3C
	.word ofs_FD1C
	.word ofs_FE4C
	.word ofs_FCDC
	.word ofs_FE5C
	.word ofs_FD2C
	.word ofs_FE6C
	.word ofs_FD3C
	.word ofs_FE7C
ofs_FB2C:
	.byte $11
	.byte $30
	.byte $38
	.byte $3D
	.byte $11
	.byte $30
	.byte $2A
	.byte $1A
	.byte $11
	.byte $37
	.byte $2A
	.byte $1A
	.byte $11
	.byte $2C
	.byte $3C
	.byte $30
ofs_FB3C:
	.byte $0A
	.byte $2C
	.byte $1C
	.byte $30
	.byte $0A
	.byte $30
	.byte $38
	.byte $28
	.byte $0A
	.byte $37
	.byte $2A
	.byte $1A
	.byte $0A
	.byte $29
	.byte $19
	.byte $39
ofs_FB4C:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $37
	.byte $27
	.byte $0E
	.byte $29
	.byte $38
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
ofs_FB5C:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $20
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
ofs_FB6C:
	.byte $11
	.byte $11
	.byte $3C
	.byte $30
	.byte $11
	.byte $30
	.byte $38
	.byte $28
	.byte $11
	.byte $37
	.byte $2A
	.byte $1A
	.byte $11
	.byte $39
	.byte $29
	.byte $1A
ofs_FB7C:
	.byte $0A
	.byte $31
	.byte $11
	.byte $30
	.byte $0A
	.byte $30
	.byte $38
	.byte $28
	.byte $0A
	.byte $0E
	.byte $2A
	.byte $30
	.byte $0A
	.byte $2A
	.byte $19
	.byte $39
ofs_FB8C:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $1C
	.byte $2C
	.byte $38
	.byte $0E
	.byte $37
	.byte $27
	.byte $18
ofs_FB9C:
	.byte $0E
	.byte $21
	.byte $11
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $37
	.byte $0C
	.byte $1C
	.byte $0E
	.byte $38
	.byte $27
	.byte $17
ofs_FBAC:
	.byte $01
	.byte $2C
	.byte $1C
	.byte $3C
	.byte $01
	.byte $30
	.byte $38
	.byte $28
	.byte $01
	.byte $00
	.byte $10
	.byte $30
	.byte $01
	.byte $38
	.byte $27
	.byte $17
ofs_FBBC:
	.byte $0E
	.byte $11
	.byte $21
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
ofs_FBCC:
	.byte $30
	.byte $11
	.byte $2C
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $30
	.byte $37
	.byte $31
	.byte $0E
	.byte $30
	.byte $30
	.byte $2A
	.byte $0A
ofs_FBDC:
	.byte $30
	.byte $11
	.byte $21
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $30
	.byte $37
	.byte $2A
	.byte $0A
	.byte $30
	.byte $0E
	.byte $2A
	.byte $1A
ofs_FBEC:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
ofs_FBFC:
	.byte $0E
	.byte $2C
	.byte $1C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $1A
	.byte $28
	.byte $18
	.byte $0E
	.byte $1A
	.byte $0A
	.byte $2A
ofs_FC0C:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $0C
	.byte $1C
	.byte $2C
	.byte $0E
	.byte $37
	.byte $27
	.byte $18
ofs_FC1C:
	.byte $01
	.byte $2C
	.byte $1C
	.byte $3C
	.byte $01
	.byte $30
	.byte $38
	.byte $28
	.byte $01
	.byte $00
	.byte $10
	.byte $38
	.byte $01
	.byte $38
	.byte $27
	.byte $17
ofs_FC2C:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $20
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
ofs_FC3C:
	.byte $0E
	.byte $01
	.byte $21
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $29
	.byte $38
	.byte $18
	.byte $0E
	.byte $29
	.byte $30
	.byte $18
ofs_FC4C:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $0C
	.byte $1C
	.byte $2C
	.byte $0E
	.byte $37
	.byte $27
	.byte $18
ofs_FC5C:
	.byte $01
	.byte $1C
	.byte $2C
	.byte $30
	.byte $01
	.byte $30
	.byte $28
	.byte $18
	.byte $01
	.byte $37
	.byte $2A
	.byte $1C
	.byte $01
	.byte $3C
	.byte $2C
	.byte $1C
ofs_FC6C:
	.byte $0E
	.byte $01
	.byte $31
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
ofs_FC7C:
	.byte $0E
	.byte $21
	.byte $11
	.byte $30
	.byte $0E
	.byte $30
	.byte $38
	.byte $28
	.byte $0E
	.byte $1A
	.byte $2A
	.byte $30
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
ofs_FC8C:
	.byte $0E
	.byte $31
	.byte $22
	.byte $30
	.byte $0E
	.byte $30
	.byte $38
	.byte $28
	.byte $0E
	.byte $1A
	.byte $2A
	.byte $30
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
ofs_FC9C:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $0C
	.byte $1C
	.byte $31
	.byte $0E
	.byte $37
	.byte $27
	.byte $18
ofs_FCAC:
	.byte $0E
	.byte $15
	.byte $1A
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
	.byte $0E
	.byte $27
	.byte $16
	.byte $37
ofs_FCBC:
	.byte $0E
	.byte $30
	.byte $0C
	.byte $15
	.byte $0E
	.byte $01
	.byte $31
	.byte $30
	.byte $0E
	.byte $37
	.byte $2A
	.byte $1A
	.byte $0E
	.byte $10
	.byte $0C
	.byte $00
ofs_FCCC:
	.byte $0E
	.byte $21
	.byte $31
	.byte $30
	.byte $0E
	.byte $31
	.byte $2A
	.byte $1A
	.byte $0E
	.byte $37
	.byte $2A
	.byte $1A
	.byte $0E
	.byte $00
	.byte $10
	.byte $20
ofs_FCDC:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $20
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
ofs_FCEC:
	.byte $0E
	.byte $11
	.byte $21
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
ofs_FCFC:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
ofs_FD0C:
	.byte $0E
	.byte $11
	.byte $3C
	.byte $30
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $00
	.byte $10
	.byte $30
	.byte $0E
	.byte $27
	.byte $17
	.byte $37
ofs_FD1C:
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
ofs_FD2C:
	.byte $1E
	.byte $10
	.byte $00
	.byte $0E
	.byte $1E
	.byte $27
	.byte $22
	.byte $20
	.byte $1E
	.byte $2A
	.byte $1A
	.byte $20
	.byte $1E
	.byte $27
	.byte $16
	.byte $20
ofs_FD3C:
	.byte $0E
	.byte $30
	.byte $2C
	.byte $0E
	.byte $0E
	.byte $30
	.byte $28
	.byte $18
	.byte $0E
	.byte $30
	.byte $2A
	.byte $19
	.byte $0E
	.byte $30
	.byte $21
	.byte $23
ofs_FD4C:
	.byte $11
	.byte $37
	.byte $16
	.byte $0E
	.byte $10
	.byte $30
	.byte $16
	.byte $02
	.byte $10
	.byte $2A
	.byte $20
	.byte $0E
	.byte $10
	.byte $38
	.byte $16
	.byte $0E
ofs_FD5C:
	.byte $0E
	.byte $37
	.byte $16
	.byte $0E
	.byte $0E
	.byte $30
	.byte $16
	.byte $02
	.byte $0E
	.byte $28
	.byte $1A
	.byte $30
	.byte $0E
	.byte $38
	.byte $16
	.byte $0E
ofs_FD6C:
	.byte $0E
	.byte $37
	.byte $16
	.byte $0E
	.byte $10
	.byte $30
	.byte $16
	.byte $02
	.byte $10
	.byte $28
	.byte $06
	.byte $30
	.byte $10
	.byte $38
	.byte $16
	.byte $0E
ofs_FD7C:
	.byte $0E
	.byte $37
	.byte $16
	.byte $0E
	.byte $00
	.byte $30
	.byte $16
	.byte $02
	.byte $00
	.byte $10
	.byte $20
	.byte $0E
	.byte $00
	.byte $38
	.byte $16
	.byte $0E
ofs_FD8C:
	.byte $0E
	.byte $37
	.byte $16
	.byte $0E
	.byte $00
	.byte $30
	.byte $16
	.byte $02
	.byte $00
	.byte $10
	.byte $20
	.byte $0E
	.byte $00
	.byte $38
	.byte $16
	.byte $0E
ofs_FD9C:
	.byte $0E
	.byte $37
	.byte $16
	.byte $0E
	.byte $10
	.byte $30
	.byte $16
	.byte $02
	.byte $10
	.byte $2A
	.byte $20
	.byte $0E
	.byte $10
	.byte $38
	.byte $16
	.byte $0E
ofs_FDAC:
	.byte $1E
	.byte $37
	.byte $16
	.byte $0E
	.byte $1E
	.byte $30
	.byte $16
	.byte $02
	.byte $1E
	.byte $28
	.byte $1C
	.byte $30
	.byte $1E
	.byte $28
	.byte $16
	.byte $0E
ofs_FDBC:
	.byte $0E
	.byte $37
	.byte $16
	.byte $0E
	.byte $0E
	.byte $30
	.byte $16
	.byte $02
	.byte $0E
	.byte $28
	.byte $15
	.byte $30
	.byte $0E
	.byte $28
	.byte $16
	.byte $0E
ofs_FDCC:
	.byte $3D
	.byte $37
	.byte $16
	.byte $0E
	.byte $3D
	.byte $30
	.byte $16
	.byte $02
	.byte $3D
	.byte $2A
	.byte $30
	.byte $0F
	.byte $3D
	.byte $28
	.byte $16
	.byte $0E
ofs_FDDC:
	.byte $11
	.byte $37
	.byte $2B
	.byte $0E
	.byte $10
	.byte $30
	.byte $1B
	.byte $02
	.byte $10
	.byte $2A
	.byte $20
	.byte $0E
	.byte $10
	.byte $38
	.byte $16
	.byte $0E
	.byte $0E
	.byte $37
	.byte $2B
	.byte $0E
	.byte $10
	.byte $30
	.byte $1B
	.byte $02
	.byte $10
	.byte $2A
	.byte $20
	.byte $0E
	.byte $10
	.byte $38
	.byte $16
	.byte $0E
	.byte $0E
	.byte $37
	.byte $2B
	.byte $0E
	.byte $10
	.byte $30
	.byte $1B
	.byte $02
	.byte $10
	.byte $2A
	.byte $20
	.byte $0E
	.byte $10
	.byte $38
	.byte $16
	.byte $0E
ofs_FE0C:
	.byte $0E
	.byte $37
	.byte $2B
	.byte $0E
	.byte $0E
	.byte $30
	.byte $1B
	.byte $02
	.byte $0E
	.byte $28
	.byte $1A
	.byte $30
	.byte $0E
	.byte $38
	.byte $16
	.byte $0E
ofs_FE1C:
	.byte $0E
	.byte $37
	.byte $2B
	.byte $0E
	.byte $10
	.byte $30
	.byte $1B
	.byte $02
	.byte $10
	.byte $28
	.byte $06
	.byte $30
	.byte $10
	.byte $38
	.byte $16
	.byte $0E
ofs_FE2C:
	.byte $0E
	.byte $37
	.byte $2B
	.byte $0E
	.byte $00
	.byte $30
	.byte $1B
	.byte $02
	.byte $00
	.byte $10
	.byte $20
	.byte $0E
	.byte $00
	.byte $38
	.byte $16
	.byte $0E
ofs_FE3C:
	.byte $0E
	.byte $37
	.byte $2B
	.byte $0E
	.byte $00
	.byte $30
	.byte $1B
	.byte $02
	.byte $00
	.byte $10
	.byte $20
	.byte $0E
	.byte $00
	.byte $38
	.byte $16
	.byte $0E
ofs_FE4C:
	.byte $0E
	.byte $37
	.byte $2B
	.byte $0E
	.byte $10
	.byte $30
	.byte $1B
	.byte $02
	.byte $10
	.byte $2A
	.byte $20
	.byte $0E
	.byte $10
	.byte $38
	.byte $16
	.byte $0E
ofs_FE5C:
	.byte $1E
	.byte $37
	.byte $2B
	.byte $0E
	.byte $1E
	.byte $30
	.byte $1B
	.byte $02
	.byte $1E
	.byte $28
	.byte $1C
	.byte $30
	.byte $1E
	.byte $28
	.byte $16
	.byte $0E
ofs_FE6C:
	.byte $0E
	.byte $37
	.byte $2B
	.byte $0E
	.byte $0E
	.byte $30
	.byte $1B
	.byte $02
	.byte $0E
	.byte $28
	.byte $15
	.byte $30
	.byte $0E
	.byte $28
	.byte $16
	.byte $0E
ofs_FE7C:
	.byte $3D
	.byte $37
	.byte $2B
	.byte $0E
	.byte $3D
	.byte $30
	.byte $1B
	.byte $02
	.byte $3D
	.byte $2A
	.byte $30
	.byte $0F
	.byte $3D
	.byte $28
	.byte $16
	.byte $0E
tbl3_FE8C:
	.word ofs_FE94
tbl3_FE8E:
	.word ofs_FE94
	.word ofs_FE94
	.word ofs_FEA4
ofs_FE94:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
ofs_FEA4:
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
MapperProtection:
	LDA #$05		;Use 5 for both values to multiply
	STA M90_MULTIPLICAND	;First value to multiply (5)
	STA M90_MULTIPLIER		;Multiplier (5)
	LDA #$00
	JSR sub3_F184
MapperProtectLoop:
	LDA M90_MULTIPLICAND	;Get product
	CMP #$19
	BNE MapperProtectLoop	;If the product isn't 25, send the game into a loop and prevent it from starting
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
;Interrupt vectors
	.dw NMIJMPOpcode	;Unused?
	.dw Reset
	.dw IRQ