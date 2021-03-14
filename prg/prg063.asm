;disassembled by BZK 6502 Disassembler
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA PPUMaskControl
	STA PPUMask
	LDA XScroll
	STA PPUScroll
	LDA YScroll
	STA PPUScroll
	LDA $00
	AND #$FC
	ORA $5B
	STA $00
	STA PPUCtrl
	JSR sub3_F6E0
	LDA BGBank1
	STA M90_BG_CHR0
	LDA BGBank2
	STA M90_BG_CHR1
	LDA BGBank3
	STA M90_BG_CHR2
	LDA BGBank4		;these registers go unused
	STA M90_BG_CHR3	;
	LDA SpriteBank1
	STA M90_SP_CHR0
	LDA SpriteBank2
	STA M90_SP_CHR1
	LDA SpriteBank3
	STA M90_SP_CHR2
	LDA SpriteBank4
	STA M90_SP_CHR3
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
	JMP loc3_EF10
	JMP loc3_EFE0
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA ColumnFinishFlag
	BEQ bra3_E0E8
	LDA PPUStatus
	LDA $00
	ORA #$04
	STA PPUCtrl
	LDA PPUStatus
	LDA ColumnFinishFlag
	STA PPUAddr
	LDA NextBGColumn
	STA PPUAddr
	LDX #$00
bra3_E088:
	LDA $0485,X
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
	LDA $0485,X
	STA PPUData
	INX
	CPX #$38
	BCC bra3_E0A4
	LDA PPUStatus
	LDA $00
	AND #$FB
	STA PPUCtrl
	LDA $04C1
	BEQ bra3_E0E1
	LDX #$00
bra3_E0C0:
	LDA PPUStatus
	LDA $04C1,X
	STA PPUAddr
	LDA $04C2,X
	STA PPUAddr
	LDA $04C3,X
	STA PPUData
	INX
	INX
	INX
	CPX #$30
	BCC bra3_E0C0
	LDA #$00
	STA $04C1
bra3_E0E1:
	LDA #$00
	STA ColumnFinishFlag
	BEQ bra3_E0F0
bra3_E0E8:
	LDA $03A1
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
	LDA PPUMaskControl
	STA PPUMask
	LDA $02
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
	LDA $06
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
	LDA $00
	AND #$FC
	ORA $5B
	STA $00
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
	INC $06
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
	SEI	;
	CLD	;standard 2a03/6502 init
	LDX #$FF
	TXS
	LDA #$00
	STA M90_IRQ_DISABLE
	STA PPUMask
	STA PPUCtrl
	LDX #$02
bra3_E1A5:
	BIT PPUStatus
	BPL bra3_E1A5
bra3_E1AA:
	BIT PPUStatus
	BMI bra3_E1AA
	DEX
	BNE bra3_E1A5
	LDA #$3E
	STA M90_PRG2
	LDA #$3F
	STA M90_PRG3
	LDA #$85
	STA $C001
	LDA #$3E
	STA $D000
	LDA #$00
	STA $B000
	LDA #$01
	STA $B001
	LDA #$02
	STA $B002
	LDA #$03
	STA $B003
	LDA #$00
	STA $C006
	STA $D002
	STA $D003
	LDA #$01
	STA $D001
	LDA #$0F
	STA APUStatus
	LDA #$00
	STA DMCFreq
	LDA #$40
	STA Joy2Frame
	STA M90_IRQ_DISABLE
	LDA PPUStatus
	LDA #$10
	TAX
bra3_E202:
	STA PPUAddr
	STA PPUAddr
	EOR #$10
	DEX
	BNE bra3_E202
	LDA #$00
	LDX #$00
ClearMemory:
	STA $00,X
	STA $0200,X
	STA $0300,X
	STA $0400,X
	STA $0500,X
	STA $0600,X
	STA $0700,X
	DEX
	BNE ClearMemory
	LDA #$00
	JSR sub3_FFD0
	LDA #$3A
	STA M90_PRG0
	LDA #$3B
	STA M90_PRG1
	JSR $85D6
	LDA #$20
	STA MusicRegister
	JSR $8E24
	INC $0700
	LDA #$00
	STA $0607
	CLI
	LDA #$80
	ORA $0312
	STA $0312
	LDA #$03
	STA PlayerPowerup
	LDA #$4C
	STA $063A
	LDX #$04
	LDA tbl3_EF08,X
	STA $063B
	LDA #$00E0
	STA $063C
	LDA #$88
	STA PPUCtrl
	STA $00
	LDA #$18
	STA PPUMask
	STA PPUMaskControl
bra3_E277:
loc3_E277:
	INC $00E4
	LDA $06
	CMP $07
	BEQ bra3_E277
	STA $07
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
	LDA $02
	STA XScroll
	LDA $03
	STA YScroll
	JMP loc3_E277
sub3_E2AB:
	LDA a:GameState
	BNE bra3_E317
	LDX #$04
	LDA tbl3_EF08,X
	STA $063B
	JMP loc3_E2BE
	JMP loc3_E317
loc3_E2BE:
	LDX #$29
	STX $09
	STX $8001
	JMP $A000
	RTS 
	LDA a:Event
	ASL
	TAY 
	LDA tbl3_E2DB,Y 
	STA PCPointerLowerByte
	LDA tbl3_E2DC,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_E2DB:
	.byte $E5
tbl3_E2DC:
	.byte $E2
	.byte $16
	.byte $E3
	.byte $16
	.byte $E3
	.byte $16
	.byte $E3
	.byte $16
	.byte $E3
	LDA ButtonsPressed
	AND #$80
	BEQ bra3_E2FE
	INC LevelNumber
	LDA LevelNumber
	CMP #$04
	BCC bra3_E2FE
	LDA #$00
	STA LevelNumber
	INC WorldNumber
bra3_E2FE:
	LDA ButtonsPressed
	AND #$10
	BEQ bra3_E315
	INC a:GameState
	LDA #$00
	STA a:Event
	LDA #$05
	STA $0312
	JSR sub3_F919
bra3_E315:
	RTS
	RTS
bra3_E317:
loc3_E317:
	LDA a:Event
	ASL
	TAY
	LDA tbl3_E329,Y
	STA PCPointerLowerByte
	LDA tbl3_E32A,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_E329:
	.byte $53
tbl3_E32A:
	.byte $E3
	.byte $72
	.byte $E3
	.byte $09
	.byte $E4
	.byte $CA
	.byte $E4
	.byte $34
	.byte $E5
	.byte $10
	.byte $E6
	.byte $ED
	.byte $E6
	.byte $9E
	.byte $E7
	.byte $A2
	.byte $E7
	.byte $D0
	.byte $E7
	.byte $5F
	.byte $E8
	.byte $75
	.byte $ED
	.byte $02
	.byte $EE
	.byte $23
	.byte $EE
	.byte $59
	.byte $EE
	.byte $96
	.byte $EE
	.byte $C8
	.byte $EE
	.byte $96
	.byte $EE
	.byte $C8
	.byte $EE
	.byte $75
	.byte $ED
	.byte $FD
	.byte $EE
	LDA Player2YoshiStatus
	STA Player1YoshiStatus
	LDA #$80
	ORA $0312
	STA $0312
	LDA #$3C
	STA M90_PRG0
	LDA #$3D
	STA M90_PRG1
	JSR $B19E
	INC a:Event
	RTS
	LDA $00E0
	ASL
	TAY
	LDA tbl3_E384,Y
	STA PCPointerLowerByte
	LDA tbl3_E385,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_E384:
	.byte $88
tbl3_E385:
	.byte $E3
	.byte $DD
	.byte $E3
	LDA #$00
	STA PPUCtrl
	STA $00
	STA PPUMask
	STA PPUMaskControl
	LDX #$00
	TXA
bra3_E397:
	STA ObjectSlot,X
	INX
	CPX #$14
	BCC bra3_E397
	STA YoshiXScreen
	JSR sub3_E904
	LDA #$3C
	STA M90_PRG0
	LDA #$3D
	STA M90_PRG1
	JSR $B38E
	LDA $E3DB
	STA $036E
	STA $0370
	LDA $E3DC
	STA $036F
	STA $0371
	LDA #%00011000		;
	STA PPUMaskControl	;sets ppu mask for levels
	LDA #$88
	STA PPUCtrl
	STA $00
	LDA #$01
	STA $D001
	JSR sub3_F0CB
	INC $00E0
	RTS
	.byte $2C
	.byte $01
	LDA #$00
	STA $0311
	JSR sub3_E6E0
	JSR sub3_F919
	LDA #$00
	STA $52
	STA $00E0
	LDA DataBank2
	CMP #$23
	BNE bra3_E405
	LDA $51
	BNE bra3_E405
	LDA LevelNumber
	BEQ bra3_E405
	LDA #$05
	STA a:Event
	RTS
bra3_E405:
	INC a:Event
	RTS
	LDA $00E0
	BEQ bra3_E411
	JMP loc3_E498
bra3_E411:
	LDX #$02
	LDA tbl3_EF08,X
	STA $063B
	LDA PauseFlag
	BNE bra3_E442
	LDA #$39
	STA M90_PRG1
	LDA $06E6
	BNE bra3_E42B
	JSR $ACAC
bra3_E42B:
	LDA $06EF
	BEQ bra3_E437
	LDA #$00
	STA $06EF
	STA PlayerXSpeed
bra3_E437:
	LDA UnderwaterFlag
	BEQ bra3_E445
	LDA $06
	AND #$01
	BEQ bra3_E445
bra3_E442:
	JMP loc3_E45F
bra3_E445:
	JSR sub3_ED14
	LDA PSwitchSeconds
	BEQ bra3_E45F
	INC PSwitchFrameCount
	LDA PSwitchFrameCount	;
	CMP #$3B				;if less than 59 frames pass,
	BCC bra3_E45F			;branch
	DEC PSwitchSeconds		;if not, decrement the amount of seconds left
	LDA #$00				;
	STA PSwitchFrameCount	;set frame count back to zero
bra3_E45F:
loc3_E45F:
	LDA $06E6
	BNE bra3_E47C
	LDA ButtonsPressed
	AND #$10
	BEQ bra3_E47C
	LDA #$00
	STA JYEasterEggInput
	LDA PauseFlag
	EOR #$01
	STA PauseFlag
	LDA #$02
	STA SFXRegister
bra3_E47C:
	LDA PauseFlag		;load pause status
	BEQ bra3_E494		;branch
	JSR sub3_E9DC
	LDA ButtonsPressed	;
	AND #$20			;if select pressed
	BEQ bra3_E494		;exit to map
	INC $00E0
	LDX CurrentPlayer
	INC Player1Lives,X
bra3_E494:
	JSR sub3_F27F
	RTS
loc3_E498:
	LDA #$00
	STA $0311
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA PauseFlag
	STA a:GameState
	STA $00E0
	LDA #$16
	STA a:Event
	JSR sub3_E4BA
	RTS
sub3_E4BA:
	LDX CurrentPlayer
	LDA PlayerPowerup
	STA $06DA,X
	LDA Player2YoshiStatus
	STA $0393,X
	RTS
	LDA $00E0
	ASL
	TAY
	LDA tbl3_E4DC,Y
	STA PCPointerLowerByte
	LDA tbl3_E4DD,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_E4DC:
	.byte $E4
tbl3_E4DD:
	.byte $E4
	.byte $EC
	.byte $E4
	.byte $F7
	.byte $E4
	.byte $09
	.byte $E5
	LDA #$0A
	STA SFXRegister
	INC $00E0
	RTS
	LDX #$00
	LDY #$3C
	JSR sub3_E5B6
	INC $00E0
	RTS
	LDA #$00
	STA $0311
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	INC $00E0
	RTS
	LDY $060B
	LDA tbl3_EB24,Y
	STA PCPointerLowerByte
	LDA tbl3_EB25,Y
	STA PCPointerUpperByte
	LDA tbl3_EA10,Y
	STA $34
	LDA tbl3_EA11,Y
	STA $35
	JSR sub3_E870
	LDA #$01
	STA a:Event
	LDA #$00
	STA $00E0
	STA $06DE
	STA $06DF
	RTS
	LDA $00E0
	ASL
	TAY
	LDA tbl3_E546,Y
	STA PCPointerLowerByte
	LDA tbl3_E547,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_E546:
	.byte $4E
tbl3_E547:
	.byte $E5
	.byte $70
	.byte $E5
	.byte $85
	.byte $E5
	.byte $97
	.byte $E5
	LDA #$11
	STA PlayerAction
	LDA #$00
	STA $06E0
	STA PlayerXSpeed
	STA PlayerYSpeed
	JSR sub3_E5D4
	LDA #$22
	STA MusicRegister
	LDX #$00
	LDY #$28
	JSR sub3_E5B6
	JSR sub3_F27F
	INC $00E0
	RTS
	LDA #$00
	STA PlayerXSpeed
	LDA #$70
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	JSR sub3_E5D4
	INC $00E0
	RTS
	LDA #$00
	STA PlayerXSpeed
	JSR sub3_E5D4
	LDX #$04
	LDY #$3B
	JSR sub3_E5B6
	INC $00E0
	RTS
	LDA #$00
	STA $0311
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA a:GameState
	STA $00E0
	LDA #$16
	STA a:Event
	JSR sub3_E4BA
	RTS
sub3_E5B6:
	INC $0611
	CPY $0611
	BCS bra3_E5CB
	LDA #$00
	STA $0611
	INC $0612
	CPX $0612
	BCC bra3_E5CE
bra3_E5CB:
	PLA
	PLA
	RTS
bra3_E5CE:
	LDA #$00
	STA $0612
	RTS
sub3_E5D4:
	LDA #57			;
	STA M90_PRG1	;loads bank 57 into 2nd prg bank
	JSR jmp_57_ACA5
	JSR jmp_57_A000
	LDA #54			;
	STA M90_PRG1	;loads bank 54 into 2nd prg bank
	JSR jmp_54_A150
	JSR jmp_54_A0D9
	JSR jmp_54_A000
	LDA #61			;
	STA M90_PRG1	;loads bank 61 into 2nd prg bank
	JSR jmp_61_AE8F
	LDA #$00
	STA $062B
	LDA #52		;
	STA M90_PRG1	;loads bank 52 into 2nd prg bank
	LDA #$80
	STA $3C
	JSR jmp_52_A080
	JSR jmp_52_A089
	JSR jmp_52_A000
	JSR sub3_E9C4
	RTS
	JSR sub3_ED14
	JSR sub3_F27F
	LDA ButtonsPressed
	AND #$C0
	BEQ bra3_E62F
	LDA #$00
	STA Player1YoshiStatus
	LDA #$39
	STA M90_PRG1
	JSR $A14A
	LDA #$03
	STA $00E0
bra3_E62F:
	LDA $00E0
	ASL
	TAY
	LDA tbl3_E641,Y
	STA PCPointerLowerByte
	LDA tbl3_E642,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)	;jumps to currently loaded PC pointer
tbl3_E641:
	.byte $49
tbl3_E642:
	.byte $E6
	.byte $8B
	.byte $E6
	.byte $9E
	.byte $E6
	.byte $B0
	.byte $E6
	LDA PlayerYSpeed
	BNE bra3_E68A
	LDA #$01
	STA PlayerAction
	LDA #$10
	STA PlayerXSpeed
	LDA PlayerMovement
	AND #$BE
	STA PlayerMovement
	LDA PlayerSprXPos
	CMP #$80
	BCC bra3_E68A
	LDA Player1YoshiStatus
	BEQ bra3_E681
	JSR sub3_E965
	LDA #$01
	STA Player2YoshiStatus
	LDA #$50
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$05
	STA PlayerAction
	LDA #sfxSpinJump
	STA SFXRegister
	RTS
bra3_E681:
	LDA PlayerSprXPos
	CMP #$B0
	BCC bra3_E68A
	INC $00E0
bra3_E68A:
	RTS
	LDA #$08
	STA PlayerAction
	LDA #$00
	STA PlayerXSpeed
	LDX #$01
	LDY #$3B
	JSR sub3_E5B6
	INC $00E0
	RTS
	LDA #$01
	STA PlayerAction
	LDA #$10
	STA PlayerXSpeed
	LDA PlayerSprXPos
	CMP #$C8
	BCC bra3_E6AF
	INC $00E0
bra3_E6AF:
	RTS
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	ASL
	STA $060B
	LDA #$00
	STA $060C
	LDA #$03
	STA a:Event
	LDA #$00
	STA $00E0
	STA $0611
	STA $0612
	STA PlayerAction
	RTS
sub3_E6D5:
	LDA $0312
	AND #$80
	BEQ bra3_E6EC
	LDA #$05
	BNE bra3_E6E9
sub3_E6E0:
	LDA $0312
	AND #$80
	BEQ bra3_E6EC
	LDA #$00
bra3_E6E9:
	STA $0312
bra3_E6EC:
	RTS
	LDA #57
	STA M90_PRG1
	JSR jmp_57_A000
	LDA #54
	STA M90_PRG1
	JSR jmp_54_A000
	LDA #52
	STA M90_PRG1
	LDA #61
	STA M90_PRG1
	JSR jmp_61_AE8F
	JSR sub3_E9C4
	LDA $00E0
	ASL
	TAY
	LDA tbl3_E71F,Y
	STA PCPointerLowerByte
	LDA tbl3_E720,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_E71F:
	.byte $27
tbl3_E720:
	.byte $E7
	.byte $48
	.byte $E7
	.byte $69
	.byte $E7
	.byte $74
	.byte $E7
	LDA PlayerYSpeed
	BNE bra3_E747
	LDA #$01
	STA $0311
	JSR sub3_E6D5
	JSR sub3_F919
	LDA #$01
	STA PlayerAction
	LDA #$20
	STA PlayerXSpeed
	LDA PlayerMovement
	AND #$BE
	STA PlayerMovement
	INC $00E0
bra3_E747:
	RTS
	LDA #$10
	STA PlayerXSpeed
	LDA PlayerSprXPos
	CMP #$98
	BCC bra3_E768
	LDA #$10
	STA PlayerAction
	LDA #$00
	STA PlayerXSpeed
	LDA #$01
	STA $0311
	JSR sub3_E6E0
	JSR sub3_F919
	INC $00E0
bra3_E768:
	RTS
	LDX #$02
	LDY #$3B
	JSR sub3_E5B6
	INC $00E0
	RTS
	LDA #$01
	STA UnlockNextLevel
	STA PlayerAction
	LDA #$20
	STA PlayerXSpeed
	LDA #$00
	STA $0311
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA a:GameState
	STA $00E0
	LDA #$16
	STA a:Event
	JSR sub3_E4BA
	RTS
	INC a:Event
	RTS
	LDA #57			;
	STA M90_PRG1	;loads bank 57 into 2nd prg bank
	JSR $ACA5
	JSR $AD04
	JSR $A000
	LDA #54			;
	STA M90_PRG1	;loads bank 54 into 2nd prg bank
	LDA #$00
	STA $062B
	LDA #52			;
	STA M90_PRG1	;loads bank 52 into 2nd prg bank
	LDA #$80
	STA $3C
	JSR $A080
	JSR $A089
	JSR $A000
	JSR sub3_E9C4
	RTS
	LDA #57
	STA M90_PRG1
	JSR $A000
	LDA #54
	STA M90_PRG1
	JSR $A150
	JSR $A07E
	JSR $A000
	LDA #61
	STA M90_PRG1
	JSR $AE8F
	LDA #$34
	STA M90_PRG1
	LDA #$80
	STA $3C
	JSR $A089
	JSR sub3_E9C4
	LDA $00E0
	ASL
	TAY
	LDA tbl3_E80F,Y
	STA PCPointerLowerByte
	LDA tbl3_E810,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_E80F:
	.byte $13
tbl3_E810:
	.byte $E8
	.byte $1E
	.byte $E8
	LDX #$06
	LDY #$3B
	JSR sub3_E5B6
	INC $00E0
	RTS
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
	STA $0311
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	LDA #$00
	STA a:GameState
	STA $00E0
	LDA #$16
	STA a:Event
	JSR sub3_E4BA
	RTS
	LDA $00E0
	BNE bra3_E86F
	LDA #$3D
	STA M90_PRG1
	JSR $BE85
	INC $00E0
bra3_E86F:
	RTS
sub3_E870:
	LDY $060C
	LDX #$01
	STX InterruptMode
	LDA (PCPointerLowerByte),Y
	AND #$7F
	STA $51
	STA PlayerWallColPos
	LDA #$00
	STA $52
	STA $65
	INY
	LDA (PCPointerLowerByte),Y
	STA $53
	ASL
	STA $5B
	LDA #$00
	STA $66
	STA $54
	STA $67
	LDA $51
	STA PlayerXScreen
	INY
	LDA (PCPointerLowerByte),Y
	STA PlayerXPos
	STA PlayerSprXPos
	LDA $53
	STA PlayerYScreen
	INY
	LDA (PCPointerLowerByte),Y
	STA PlayerYPos
	STA PlayerSprYPos
	INY
	LDA (PCPointerLowerByte),Y
	STA $060F
	INY
	LDA (PCPointerLowerByte),Y
	STA ScreenCount
	INY
	LDA (PCPointerLowerByte),Y
	STA $060D
	INY
	LDA (PCPointerLowerByte),Y
	STA $060E
	LDA $060C
	LSR
	TAY
	LDA ($34),Y
	AND #$20
	STA $06E0
	STA $06E1
	LDA ($34),Y
	AND #$C0
	STA UnderwaterFlag
	LDA ($34),Y
	AND #$DF
	STA DataBank1
	INY
	LDA ($34),Y
	CMP #$32
	BNE bra3_E8ED
	LDA #$04
	STA InterruptMode
bra3_E8ED:
	LDA #$3D
	STA M90_PRG1
	LDA ($34),Y
	JSR $B34A
	INY
	LDA ($34),Y
	STA DataBank2
	INY
	LDA ($34),Y
	STA $0310
	RTS
sub3_E904:
	JSR sub3_F176
	JSR sub3_E959
	LDA #$01
	STA $0621
	STA YoshiTongueState
	LDA #$90
	STA SpriteBank2
	LDA #$00
	STA PlayerXSpeed
	STA PlayerYSpeed
	STA PlayerMovement
	STA $1A
	STA PlayerAction
	STA $00E1
	STA $0611
	STA $0612
	STA $0613
	STA $0614
	STA $0629
	STA $0627
	STA PlayerCarryFlag
	STA InvincibilityTimer
	LDA #$39
	STA M90_PRG1
	JSR $A14A
	JSR $A000
	JSR sub3_E9C4
	LDX #$70
	LDA #$00
bra3_E950:
	STA $0400,X
	INX
	CPX #$80
	BCC bra3_E950
	RTS
sub3_E959:
	LDA #$00
	TAX
bra3_E95C:
	STA $03CE,X
	INX
	CPX #$16
	BCC bra3_E95C
	RTS
sub3_E965:
	LDA Player1YoshiStatus
	BEQ bra3_E9C3
	LDA PlayerMovement
	STA $0622
	LDA #$00
	STA Player1YoshiStatus
	LDA #$39
	STA M90_PRG1
	JSR $A14A
	LDA #$02
	STA YoshiXScreen
	LDA $11
	SEC
	SBC #$20
	STA $05F4
	LDA PlayerYScreenDup
	SBC #$00
	STA $05F5
	LDA PlayerMovement
	ORA #$01
	STA PlayerMovement
	LDY #$08
	LDA $0622
	AND #$40
	BEQ bra3_E9A7
	.byte $A5
	.byte $19
	.byte $29
	.byte $FE
	.byte $85
	.byte $19
	.byte $A0
	.byte $18
bra3_E9A7:
	STY $32
	SEC
	LDA PlayerXPosDup
	SBC $32
	STA YoshiXPos
	LDA PlayerXScreenDup
	SBC #$00
	STA $05F3
	LDA #$00
	STA $05F6
	LDA #$30
	STA PlayerXSpeed
	INC ObjectCount
bra3_E9C3:
	RTS
sub3_E9C4:
	LDA #$14
	STA $3C
	LDA #$39
	STA M90_PRG1
	JSR $A23B
	JSR $A8DE
	LDA #$34
	STA M90_PRG1
	JSR $A0F3
	RTS
sub3_E9DC:
	LDA ButtonsPressed
	CMP #$10
	BEQ bra3_EA01
	LDA ButtonsPressed
	BEQ bra3_EA01
	LDX JYEasterEggInput
	BMI bra3_EA01
	CMP tbl3_EA08,X
	BNE bra3_EA02
	INC JYEasterEggInput
	LDA JYEasterEggInput
	CMP #$08
	BCC bra3_EA01
	LDA #$0A
	STA a:Event
bra3_EA01:
	RTS
bra3_EA02:
	LDA #$00
	STA JYEasterEggInput
	RTS
tbl3_EA08:
	.byte $08	;JY logo inputs
	.byte $01	;
	.byte $80	;
	.byte $04	;
	.byte $01	;
	.byte $40	;
	.byte $08	;
	.byte $02	;
tbl3_EA10:
	.byte $48
tbl3_EA11:
	.byte $EA
	.byte $48
	.byte $EA
	.byte $48
	.byte $EA
	.byte $48
	.byte $EA
	.byte $48
	.byte $EA
	.byte $48
	.byte $EA
	.byte $54
	.byte $EA
	.byte $70
	.byte $EA
	.byte $48
	.byte $EA
	.byte $48
	.byte $EA
	.byte $80
	.byte $EA
	.byte $9C
	.byte $EA
	.byte $48
	.byte $EA
	.byte $48
	.byte $EA
	.byte $48
	.byte $EA
	.byte $A8
	.byte $EA
	.byte $48
	.byte $EA
	.byte $B4
	.byte $EA
	.byte $48
	.byte $EA
	.byte $D0
	.byte $EA
	.byte $48
	.byte $EA
	.byte $DC
	.byte $EA
	.byte $48
	.byte $EA
	.byte $E8
	.byte $EA
	.byte $48
	.byte $EA
	.byte $48
	.byte $EA
	.byte $F4
	.byte $EA
	.byte $10
	.byte $EB
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
	.byte PlayerAnimationFrame
	.byte PlayerAnimationFrame
	.byte $21
	.byte PlayerAnimationFrame
	.byte PlayerAnimationFrame
	.byte PlayerAnimationFrame
	.byte $21
	.byte PlayerAnimationFrame
	.byte $0B
	.byte $0B
	.byte $1E
	.byte $1F
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
	.byte $5C
tbl3_EB25:
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $74
	.byte $EB
	.byte $AC
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $CC
	.byte $EB
	.byte $04
	.byte $EC
	.byte $5C
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $1C
	.byte $EC
	.byte $5C
	.byte $EB
	.byte $34
	.byte $EC
	.byte $5C
	.byte $EB
	.byte $6C
	.byte $EC
	.byte $5C
	.byte $EB
	.byte $84
	.byte $EC
	.byte $5C
	.byte $EB
	.byte $9C
	.byte $EC
	.byte $5C
	.byte $EB
	.byte $5C
	.byte $EB
	.byte $B4
	.byte $EC
	.byte $EC
	.byte $EC
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
	STA M90_PRG1
	JSR $A000
	LDA #$36
	STA M90_PRG1
	JSR $A150
	JSR $A07E
	JSR $A000
	LDA #$3D
	STA M90_PRG1
	JSR $AE8F
	LDA #$34
	STA M90_PRG1
	LDA #$80
	STA $3C
	JSR $A080
	JSR $A089
	JSR $A000
	JSR sub3_E9C4
	RTS
sub3_ED48:
	LDA #$24
	STA M90_PRG2
	LDA $D03E,Y
	STA PCPointerLowerByte
	LDA $D03F,Y
	STA PCPointerUpperByte
	LDA $D000,Y
	STA $34
	LDA $D001,Y
	STA $35
	LDA #$00
	STA $060C
	JSR sub3_E870
	INC $00E0
	LDA #$00
	STA $06DE
	STA $06DF
	RTS
	LDA $00E0
	ASL
	TAY
	LDA tbl3_ED87,Y
	STA PCPointerLowerByte
	LDA tbl3_ED88,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_ED87:
	.byte $93
tbl3_ED88:
	.byte $ED
	.byte $AA
	.byte $ED
	.byte $CF
	.byte $ED
	.byte $E1
	.byte $ED
	.byte $88
	.byte $E3
	.byte $DD
	.byte $E3
	LDA #$20
	STA $06E0
	LDA #$00
	STA PlayerAction
	JSR sub3_E5D4
	LDA #$0A
	STA SFXRegister
	JSR sub3_F27F
	INC $00E0
	RTS
	LDA #$00
	STA PlayerXSpeed
	LDA #$10
	STA PlayerYSpeed
	LDA PlayerMovement
	AND #$FB
	LDY a:Event
	CPY #$13
	BNE bra3_EDBF
	ORA #$04
bra3_EDBF:
	STA PlayerMovement
	JSR sub3_E5D4
	LDX #$01
	LDY #$16
	JSR sub3_E5B6
	INC $00E0
	RTS
	LDA #$00
	STA $0311
	JSR sub3_E6D5
	JSR sub3_F919
	JSR sub3_E904
	INC $00E0
	RTS
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
	LDA $00E0
	ASL
	TAY
	LDA tbl3_EE35,Y
	STA PCPointerLowerByte
	LDA tbl3_EE36,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_EE35:
	.byte $CF
tbl3_EE36:
	.byte $ED
	.byte $3D
	.byte $EE
	.byte $88
	.byte $E3
	.byte $DD
	.byte $E3
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
	STA $06E0
	RTS
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
	LDA $0611
	CMP #$02
	BNE bra3_EE84
	LDA #$0A
	STA SFXRegister
bra3_EE84:
	LDX #$00
	LDY #$19
	JSR sub3_E5B6
	LDA #$00
	STA $06E0
	LDA #$02
	STA a:Event
	RTS
	LDA $00E0
	ASL
	TAY
	LDA tbl3_EEA8,Y
	STA PCPointerLowerByte
	LDA tbl3_EEA9,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
tbl3_EEA8:
	.byte $93
tbl3_EEA9:
	.byte $ED
	.byte $AA
	.byte $ED
	.byte $CF
	.byte $ED
	.byte $B4
	.byte $EE
	.byte $88
	.byte $E3
	.byte $DD
	.byte $E3
	LDY #$3A
	LDA a:Event
	CMP #$0F
	BEQ bra3_EEBF
	LDY #$3C
bra3_EEBF:
	JSR sub3_ED48
	LDA #$20
	STA $06E0
	RTS
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
	LDA $0611
	CMP #$02
	BNE bra3_EEEB
	LDA #$10
	STA SFXRegister
bra3_EEEB:
	LDX #$00
	LDY #$19
	JSR sub3_E5B6
	LDA #$00
	STA $06E0
	LDA #$02
	STA a:Event
	RTS
	LDA #$00
	STA $00E0
	LDA #$0C
	STA a:Event
	RTS
tbl3_EF08:
	.byte $62
	.byte $E0
	.byte $00
	.byte $E0
	.byte $5C
	.byte $E0
	.byte $5F
	.byte $E0
loc3_EF10:
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA #$3D
	STA M90_PRG1
	LDA ColumnFinishFlag
	BEQ bra3_EF2B
	JSR sub3_F055
	JSR sub3_F0A2
	LDA #$00
	STA ColumnFinishFlag
bra3_EF2B:
	LDA $03A1
	BEQ bra3_EF33
	JSR sub3_F20F
bra3_EF33:
	LDA #$00
	STA PPUOAMAddr
	LDA #$02
	STA OAMDMA
	LDA PPUMaskControl
	STA PPUMask
	LDA #$00
	STA PPUAddr
	STA PPUAddr
	LDA $00
	AND #$FC
	ORA $5B
	STA $00
	STA PPUCtrl
	LDA $032D
	BNE bra3_EF67
	LDA $02
	STA PPUScroll
	LDA $03
	STA PPUScroll
	JMP loc3_EF73
bra3_EF67:
	LDA $0330
	STA PPUScroll
	LDA $0331
	STA PPUScroll
loc3_EF73:
	JSR sub3_F6E0
	LDX BGBank1
	STX M90_BG_CHR0
	INX
	STX M90_BG_CHR1
	LDX BGBank3
	STX M90_BG_CHR2
	INX
	STX M90_BG_CHR3
	LDA SpriteBank1
	STA M90_SP_CHR0
	LDA SpriteBank2
	STA M90_SP_CHR1
	LDA SpriteBank3
	STA M90_SP_CHR2
	LDA SpriteBank4
	STA M90_SP_CHR3
	JSR sub3_F19F
	INC $0313
	LDA $0313
	CMP #$3C
	BCC bra3_EFB4
	AND #$00
	STA $0313
bra3_EFB4:
	LDA #$00
	STA $3C
	INC $06
	LDA #$3A
	STA M90_PRG0
	LDA #$3B
	STA M90_PRG1
	LDA a:GameState
	BNE bra3_EFD9
	JSR $85BE
	JSR $862A
	LDA $08
	STA M90_PRG0
	LDA $09
	STA M90_PRG1
bra3_EFD9:
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
loc3_EFE0:
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA PPUMaskControl
	STA PPUMask
	LDA $00
	AND #$FC
	ORA $5B
	STA $00
	STA PPUCtrl
	LDA $032D
	BNE bra3_F008
	LDA $02
	STA PPUScroll
	LDA $03
	STA PPUScroll
	JMP loc3_F014
bra3_F008:
	LDA $0330
	STA PPUScroll
	LDA $0331
	STA PPUScroll
loc3_F014:
	JSR sub3_F6E0
	LDX $03C5
	STX M90_BG_CHR0
	INX
	STX M90_BG_CHR1
	LDX $03C6
	STX M90_BG_CHR2
	INX
	STX M90_BG_CHR3
	LDA SpriteBank1
	STA M90_SP_CHR0
	LDA SpriteBank2
	STA M90_SP_CHR1
	LDA SpriteBank3
	STA M90_SP_CHR2
	LDA SpriteBank4
	STA M90_SP_CHR3
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
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
	LDA PPUStatus
	LDA $00
	ORA #$04
	STA PPUCtrl
	LDA PPUStatus
	LDA ColumnFinishFlag
	STA PPUAddr
	LDA NextBGColumn
	STA PPUAddr
	LDX #$00
bra3_F070:
	LDA $0485,X
	STA PPUData
	INX
	CPX #$1E
	BCC bra3_F070
	LDA PPUStatus
	LDA ColumnFinishFlag
	ORA #$08
	STA PPUAddr
	LDA NextBGColumn
	STA PPUAddr
bra3_F08C:
	LDA $0485,X
	STA PPUData
	INX
	CPX $B0
	BCC bra3_F08C
	LDA PPUStatus
	LDA $00
	AND #$FB
	STA PPUCtrl
	RTS
sub3_F0A2:
	LDA $04C1
	BEQ bra3_F0CA
	LDX #$00
bra3_F0A9:
	LDA PPUStatus
	LDA $04C1,X
	STA PPUAddr
	LDA $04C2,X
	STA PPUAddr
	LDA $04C3,X
	STA PPUData
	INX
	INX
	INX
	CPX $B1
	BCC bra3_F0A9
	LDA #$00
	STA $04C1
bra3_F0CA:
	RTS
sub3_F0CB:
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAX
	LDA tbl3_F0DB,X
	STA MusicRegister
	RTS
tbl3_F0DB:
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
	LDX #$F0
	STX M90_BG_CHR0
	INX
	STX M90_BG_CHR1
	LDX $0362
	STX M90_BG_CHR2
	INX
	STX M90_BG_CHR3
	LDY #$21
	LDA $02
	LSR
	LSR
	LSR
	ORA #$B0
	TAX
	STY PPUAddr
	STX PPUAddr
	LDA $02
	STA PPUScroll
	STA PPUScroll
	STA M90_IRQ_DISABLE
	RTS
	LDA PPUStatus
	LDA #$2B
	STA PPUAddr
	LDA #$40
	STA PPUAddr
	LDA #$00
	STA PPUScroll
	STA PPUScroll
	LDA #$0E
	STA PPUMask
	LDX #$EC
	STX M90_BG_CHR0
	INX
	STX M90_BG_CHR1
	INX
	STX M90_BG_CHR2
	INX
	STX M90_BG_CHR3
	STA M90_IRQ_DISABLE
	RTS
bra3_F156:
	LDA PPUStatus
	BPL bra3_F156
bra3_F15B:
	LDA PPUStatus
	BPL bra3_F15B
	RTS
	ASL
	TAY
	PLA
	STA $34
	PLA
	STA $35
	INY
	LDA ($34),Y
	STA PCPointerLowerByte
	INY
	LDA ($34),Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
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
	STA Joy1
	LDA #$00
	STA Joy1
	LDA #$01
	STA Joy1
	NOP
	NOP
	LDA #$00
	STA Joy1
	NOP
	NOP
	LDA #$01
	LSR
	TAX
	STA Joy1
	JSR sub3_F1EC
	INX
sub3_F1EC:
	LDA #$00
	STA $063E
	LDY #$08
bra3_F1F3:
	PHA
	LDA Joy1,X
	STA $063D
	LSR
	LSR
	ROL $25
	LSR $063D
	PLA
	ROL $063E
	DEY
	BNE bra3_F1F3
	ORA $063E
	STA ButtonsHeld,X
	RTS
sub3_F20F:
	LDA $03A1
	BEQ bra3_F258
	LDA $03A0
	ORA $00
	AND #$7F
	STA PPUCtrl
	LDY #$00
	LDX #$00
bra3_F222:
	LDA PPUStatus
	LDA $03A1
	STA PPUAddr
	LDA $03A2
	STA PPUAddr
bra3_F231:
	LDA $03A5,X
	STA PPUData
	INY
	INX
	CPY $03A4
	BCC bra3_F231
	LDA $03A2
	CLC
	ADC #$20
	STA $03A2
	BCC bra3_F24C
	INC $03A1
bra3_F24C:
	LDY #$00
	DEC $03A3
	BNE bra3_F222
	LDA #$00
	STA $03A1
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
	LDA InterruptMode	;
	CMP #$04			;if interrupt mode is set to 4,
	BEQ bra3_F29D		;branch
	LDA $03A1
	BNE bra3_F29D
	LDA $037D
	ASL
	TAY
	LDA tbl3_F29E,Y
	STA PCPointerLowerByte
	LDA tbl3_F29F,Y
	STA PCPointerUpperByte
	JMP (PCPointerLowerByte)
bra3_F29D:
	RTS
tbl3_F29E:
	.byte $A8
tbl3_F29F:
	.byte $F2
	.byte $D6
	.byte $F2
	.byte $03
	.byte $F3
	.byte $29
	.byte $F3
	.byte $58
	.byte $F3
	JSR sub3_F388
	INC $037D
	LDX #$00
	LDA CurrentPlayer
	BEQ bra3_F2B7
	LDX #$01
bra3_F2B7:
	LDA Player1Lives,X
	STA $34
	LDA #$00
	STA $35
	LDA #$0B
	STA $26
	JSR sub3_F3BB
	LDY #$00
	LDX #$01
bra3_F2CB:
	LDA $0378,Y
	STA $03A5,X
	INY
	DEX
	BPL bra3_F2CB
	RTS
	JSR sub3_F388
	INC $037D
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
	JSR sub3_F388
	INC $037D
	LDA $036E
	STA $34
	LDA $036F
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
	JSR sub3_F388
	INC $037D
	LDX #$00
	LDA CurrentPlayer
	BEQ bra3_F338
	LDX #$02
bra3_F338:
	LDA #$0B
	STA $26
	LDA $0372,X
	STA $34
	LDA $0373,X
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
	JSR sub3_F388
	LDA #$00
	STA $037D
	LDX #$00
	LDA CurrentPlayer
	BEQ bra3_F369
	LDX #$01
bra3_F369:
	LDA Player1Coins,X
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
	LDA $037D
	ASL
	ASL
	TAX
	LDA tbl3_F3A7,X
	STA $03A1
	LDA tbl3_F3A8,X
	STA $03A2
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
	STA $39
	STA $25
	LDA #$0A
	STA $38
bra3_F3C5:
	JSR sub3_F3EC
	LDA PCPointerLowerByte
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
	STA PCPointerLowerByte
	STA PCPointerUpperByte
	LDX #$10
bra3_F3F4:
	ASL $34
	ROL $35
	ROL $32
	ROL $33
	LDA PCPointerLowerByte
	SEC
	SBC $38
	TAY
	LDA PCPointerUpperByte
	SBC $39
	BCC bra3_F40E
	INC $34
	STA PCPointerUpperByte
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
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	JSR $0600
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
	LDA #$4C
	STA $0600
	LDA $F720
	STA $0601
	LDA $F721
	STA $0602
	JMP loc3_F6F3
sub3_F6E0:
	LDA #$4C
	STA $0600
	LDA InterruptMode
	ASL
	TAX
	LDA tbl3_F71A,X
	STA $0601
	LDA tbl3_F71B,X
loc3_F6F3:
	STA $0602
	LDX InterruptMode
	LDA PPUStatus
	LDA tbl3_F70E,X
	STA M90_IRQ_DISABLE
	STA M90_IRQ_COUNTER
	LDA #$FB
	STA $C004
	STA M90_IRQ_ENABLE
	RTS
tbl3_F70E:
	.byte $08
	.byte $CC	;Status bar height
	.byte $80
	.byte $08
	.byte $B0
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $64
	.byte $D0	;Status bar height (level)
tbl3_F71A:
	.byte $52
tbl3_F71B:
	.byte $F1
	.byte $51
	.byte $F7
	.byte $6E
	.byte $F7
	.byte $8B
	.byte $F7
	.byte $A8
	.byte $F7
	.byte $34
	.byte $F7
	.byte $34
	.byte $F7
	.byte $34
	.byte $F7
	.byte $34
	.byte $F7
	.byte $34
	.byte $F7
	.byte $F8
	.byte $F0
	.byte $27
	.byte $F1
	.byte $52
	.byte $F1
	LDA $0607
	BNE $F73C
	JMP $F7C5
	CMP #$01
	BNE $F743
	JMP $F7C5
	CMP #$02
	BNE $F74A
	JMP $F7C5
	CMP #$03
	BNE $F751
	JMP $F7C5
	LDA $0607
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
	LDA $0607
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
	LDA $0607
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
	LDA $0607
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
	STA $0607
	RTS
loc3_F7CE:
	INC $0607
	LDA #$20
	STA M90_IRQ_ENABLE
	STA M90_IRQ_ENABLE
	RTS
sub3_F7DA:
	LDA PauseFlag
	BNE bra3_F811
	LDA DataBank2
	CMP #$26
	BNE bra3_F7EA
	JSR sub3_F90B
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
	STA $A6
	LDA tbl3_F813,Y
	STA $A7
	LDA $06
	AND #$18
	LSR
	LSR
	LSR
	TAY
	LDA ($A6),Y
	STA M90_BG_CHR3
bra3_F811:
	RTS
tbl3_F812:
	.byte $4E
tbl3_F813:
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $52
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $52
	.byte $F8
	.byte $52
	.byte $F8
	.byte $52
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $52
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $56
	.byte $F8
	.byte $4A
	.byte $F8
	.byte $4E
	.byte $F8
	.byte $01
	.byte $45
	.byte $41
	.byte $0A
	.byte $5B
	.byte $56
	.byte $16
	.byte $36
	.byte $0D
	.byte $33
	.byte $63
	.byte $79
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
	STY PPUAddr
	LDA PPUStatus
	LDA #$00
	STA PPUScroll
	LDA #$C4
	STA PPUScroll
	INC $0607
	LDA #$EC
	STA M90_BG_CHR0
	LDA #$ED
	STA M90_BG_CHR1
	LDA #$EE
	STA M90_BG_CHR2
	LDA #$EF
	STA M90_BG_CHR3
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
	STA $0607
	RTS
loc3_F8AC:
	LDA #$00
	STA $0607
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
	STA $0607
	RTS
loc3_F8D7:
	LDX #$22
	LDY #$D8
	STX PPUAddr
	STY PPUAddr
	LDA PPUStatus
	LDA #$00
	STA PPUScroll
	LDA #$B0
	STA PPUScroll
	LDA #$00
	STA $0607
	LDA #$C8
	STA M90_BG_CHR0
	LDA #$C9
	STA M90_BG_CHR1
	LDA #$CA
	STA M90_BG_CHR2
	LDA #$CB
	STA M90_BG_CHR3
	STA M90_IRQ_DISABLE
	RTS
sub3_F90B:
	LDY ClownCarFace
	LDA tbl3_F915,Y
	STA M90_BG_CHR0
	RTS
tbl3_F915:
	.byte $C8
	.byte $C9
	.byte $CA
	.byte $CB
sub3_F919:
	LDA $0310
	ASL
	ASL
	TAY
	LDA CurrentPlayer
	BEQ bra3_F939
	LDA tbl3_FA96,Y
	STA $30
	LDA tbl3_FA97,Y
	STA $31
	LDA tbl3_FA94,Y
	STA PCPointerLowerByte
	LDA tbl3_FA95,Y
	JMP loc3_F94B
bra3_F939:
	LDA tbl3_F9FE,Y
	STA $30
	LDA tbl3_F9FF,Y
	STA $31
	LDA tbl3_F9FC,Y
	STA PCPointerLowerByte
	LDA tbl3_F9FD,Y
loc3_F94B:
	STA PCPointerUpperByte
	LDA $0311
	ASL
	ASL
	TAY
	LDA tbl3_FE8C,Y
	STA $34
	LDA tbl3_FE8D,Y
	STA $35
	LDA tbl3_FE8E,Y
	STA $2E
	LDA tbl3_FE8F,Y
	STA $2F
	LDA $03A1
	BNE bra3_F9E7
	LDA $06
	AND #$03
	BNE bra3_F9E7
	LDX $0312
	LDA tbl3_F9F3,X
	STA $25
	LDY #$00
	LDX #$00
bra3_F97E:
	LDA ($34),Y
	BPL bra3_F987
	LDA (PCPointerLowerByte),Y
	JMP loc3_F990
bra3_F987:
	LDA (PCPointerLowerByte),Y
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
	STA $03A1
	LDA #$00
	STA $03A2
	STA $03A0
	LDA #$20
	STA $03A4
	LDA #$01
	STA $03A3
	INC $0312
	LDA $0312
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
	ORA $0312
	STA $0312
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
	.byte $2C
tbl3_F9FD:
	.byte $FB
tbl3_F9FE:
	.byte $4C
tbl3_F9FF:
	.byte $FD
	.byte $3C
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $4C
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $5C
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $6C
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $7C
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $8C
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $5C
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $9C
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $AC
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $8C
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $BC
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $CC
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $CC
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $DC
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $EC
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $FC
	.byte $FB
	.byte $4C
	.byte $FD
	.byte $0C
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $1C
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $2C
	.byte $FC
	.byte $8C
	.byte $FD
	.byte $3C
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $4C
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $5C
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $6C
	.byte $FC
	.byte $8C
	.byte $FD
	.byte $7C
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $8C
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $9C
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $AC
	.byte $FC
	.byte $8C
	.byte $FD
	.byte $BC
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $CC
	.byte $FC
	.byte $4C
	.byte $FD
	.byte $DC
	.byte $FC
	.byte $5C
	.byte $FD
	.byte $EC
	.byte $FC
	.byte $6C
	.byte $FD
	.byte $FC
	.byte $FC
	.byte $7C
	.byte $FD
	.byte $0C
	.byte $FD
	.byte $8C
	.byte $FD
	.byte $1C
	.byte $FD
	.byte $9C
	.byte $FD
	.byte $DC
	.byte $FC
	.byte $AC
	.byte $FD
	.byte $2C
	.byte $FD
	.byte $BC
	.byte $FD
	.byte $3C
	.byte $FD
	.byte $CC
	.byte $FD
tbl3_FA94:
	.byte $2C
tbl3_FA95:
	.byte $FB
tbl3_FA96:
	.byte $DC
tbl3_FA97:
	.byte $FD
	.byte $3C
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $4C
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $5C
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $6C
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $7C
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $8C
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $5C
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $9C
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $AC
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $8C
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $BC
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $CC
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $CC
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $DC
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $EC
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $FC
	.byte $FB
	.byte $DC
	.byte $FD
	.byte $0C
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $1C
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $2C
	.byte $FC
	.byte $3C
	.byte $FE
	.byte $3C
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $4C
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $5C
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $6C
	.byte $FC
	.byte $3C
	.byte $FE
	.byte $7C
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $8C
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $9C
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $AC
	.byte $FC
	.byte $3C
	.byte $FE
	.byte $BC
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $CC
	.byte $FC
	.byte $DC
	.byte $FD
	.byte $DC
	.byte $FC
	.byte $0C
	.byte $FE
	.byte $EC
	.byte $FC
	.byte $1C
	.byte $FE
	.byte $FC
	.byte $FC
	.byte $2C
	.byte $FE
	.byte $0C
	.byte $FD
	.byte $3C
	.byte $FE
	.byte $1C
	.byte $FD
	.byte $4C
	.byte $FE
	.byte $DC
	.byte $FC
	.byte $5C
	.byte $FE
	.byte $2C
	.byte $FD
	.byte $6C
	.byte $FE
	.byte $3C
	.byte $FD
	.byte $7C
	.byte $FE
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
	.byte PlayerAnimationFrame
	.byte $37
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
	.byte PlayerAnimationFrame
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
	.byte PlayerAnimationFrame
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
	.byte PlayerAnimationFrame
	.byte $37
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
	.byte PlayerAnimationFrame
	.byte $37
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
	.byte PlayerAnimationFrame
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
	.byte PlayerAnimationFrame
	.byte $37
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
	.byte PlayerAnimationFrame
	.byte $37
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
	.byte PlayerAnimationFrame
	.byte $37
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
	.byte PlayerAnimationFrame
	.byte $37
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
	.byte PlayerAnimationFrame
	.byte $37
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
	.byte PlayerAnimationFrame
	.byte $37
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
	.byte $94
tbl3_FE8D:
	.byte $FE
tbl3_FE8E:
	.byte $94
tbl3_FE8F:
	.byte $FE
	.byte $94
	.byte $FE
	.byte $A4
	.byte $FE
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
sub3_FFD0:
	LDA #$05
	STA $5800
	STA $5801
	LDA #$00
	JSR sub3_F184
bra3_FFDD:
	LDA $5800
	CMP #$19
	BNE bra3_FFDD
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
	.byte $3A
	.byte $06
	.byte $93
	.byte $E1
	.byte $BC
	.byte $F6