;disassembled by BZK 6502 Disassembler
	.byte $22	;underground theme continued
	.byte $00
	.byte $26
	.byte $00
	.byte $21
	.byte $00
	.byte $24
	.byte $00
	.byte $1F
	.byte $00
	.byte $20
	.byte $00
	.byte $F4
	.byte $F3
	.byte $9F
	.byte $FF
	.byte $F6
	.byte $01
	.byte $F9
	.byte $00
	.byte $FA
	.byte $00
	.byte $F8
	.byte $53
	.byte $8C
	.byte $2F
	.byte $F4
	.byte $10
	.byte $A0
	.byte $FF
	.byte $FF
	.byte $00
	.byte $60
	.byte $9F
	.byte $01
	.byte $1E
	.byte $A0
	.byte $02
	.byte $F3
	.byte $9F
	.byte $03
	.byte $10
	.byte $A0
	.byte $04
	.byte $1E
	.byte $A0
	.byte $FF
	;include the rest of the music binaries
	.incbin sound/mus_GhostHouse.bin
	.incbin sound/mus_Castle.bin
	.incbin sound/mus_Underwater.bin
	.incbin sound/mus_Ending.bin
	.byte $FF
	.byte $FB
	.byte $F9
	.byte $E5
	.byte $FF
	.byte $FC
	.byte $FA
	.byte $E7
	.byte $FF
	LDA PlayerPowerup	;all of this code is copied from another bank
	CMP #$03	;and serves no purpose other than padding out this bank
	BCS bra5_A8E6	;in other words, its garbage so don't bother commenting it
	RTS
bra5_A8E6:
	LDA PlayerPowerupBuffer
	BMI bra5_A909_RTS
	BEQ bra5_A8F4
	LDA FrameCount
	AND #$04
	BEQ bra5_A90A
	RTS
bra5_A8F4:
	LDA #$02
	LDY InvincibilityTimer
	BEQ bra5_A90A
	CPY #$D0
	BCC bra5_A905
	CPY #$F6
	BCS bra5_A90A
	LDA #$01
bra5_A905:
	AND $06
	BEQ bra5_A90A
bra5_A909_RTS:
	RTS
bra5_A90A:
	LDA PlayerSprYPos
	CMP #$E0
	BCS bra5_A93D_RTS
	LDY #$04
	LDX $1E
	LDA Player1YoshiStatus
	CMP #$01
	BCC bra5_A929
	LDA PlayerXSpeed
	BNE bra5_A923
	LDA PlayerYSpeed
	BEQ bra5_A929
bra5_A923:
	LDA tbl5_ABE1,X
	JMP loc5_A92C
bra5_A929:
	LDA tbl5_ABD0,X
loc5_A92C:
	STA $34
	BMI bra5_A936
	STY PlayerPowerup
	JSR $A14A
bra5_A936:
	LDY PlayerPowerup
	CPY #$04
	BEQ bra5_A93E
bra5_A93D_RTS:
	RTS
bra5_A93E:
	LDA $34
	AND #$0F
	BNE bra5_A947
	JMP loc5_AB16
bra5_A947:
	CMP #$01
	BNE bra5_A94E
	JMP loc5_AB3C
bra5_A94E:
	CMP #$02
	BNE bra5_A955
	JMP loc5_AB70
bra5_A955:
	CMP #$03
	BNE bra5_A95C
	JMP loc5_AB82
bra5_A95C:
	CMP #$04
	BNE bra5_A963
	JMP loc5_ABB0
bra5_A963:
	LDY $0627
	LDA tbl5_AB60,Y
	JMP loc5_AB42
loc5_A96C:
	LDX Player1YoshiStatus
	BEQ bra5_A974
	JMP loc5_AA45
bra5_A974:
	PHA
	LDA PlayerPowerup
	ASL
	TAY
	LDA tbl5_AC41,Y
	STA $34
	LDA tbl5_AC42,Y
	STA $35
	PLA
	PHA
	ASL
	TAY
	LDA ($34),Y
	STA PCPointerLoByte
	INY
	LDA ($34),Y
	STA PCPointerHiByte
	LDA #$00
	STA $2E
	PLA
	TAY
	LDA PlayerSprYPos
	SEC
	SBC tbl5_AC0B,Y
	LDX $1E
	CLC
	ADC tbl5_ABF2,X
	LDX PlayerPowerup
	BNE bra5_A9AB
	SEC
	SBC #$03
bra5_A9AB:
	STA $2B
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra5_A9D6
	LDA PlayerSprXPos
	CLC
	ADC tbl5_AC1D,Y
	STA $28
loc5_A9BD:
	LDA $2E
	CLC
	ADC #$04
	TAY
	LDX $3C
	LDA (PCPointerLoByte),Y
	CMP #$FF
	BEQ bra5_AA31
	AND #$3F
	STA $0201,X
	PHA
	LDA #$40
	JMP loc5_A9F0
bra5_A9D6:
	LDA PlayerSprXPos
	CLC
	ADC tbl5_AC26,Y
	STA $28
bra5_A9DE:
	LDY $2E
	LDX $3C
	LDA (PCPointerLoByte),Y
	CMP #$FF
	BEQ bra5_AA31
	AND #$3F
	STA $0201,X
	PHA
	LDA #$00
loc5_A9F0:
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
	LDA $28
	CLC
	ADC tbl5_AC03,Y
	STA $0203,X
	LDA $2B
	CLC
	ADC tbl5_AC07,Y
	STA $0200,X
	TXA
	CLC
	ADC #$04
	STA $3C
bra5_AA31:
	INC $2E
	LDA $2E
	CMP #$04
	BCS bra5_AA44_RTS
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra5_A9DE
	JMP loc5_A9BD
bra5_AA44_RTS:
	RTS
loc5_AA45:
	PHA
	LDA PlayerPowerup
	ASL
	TAY
	LDA tbl5_AC41,Y
	STA $34
	LDA tbl5_AC42,Y
	STA $35
	PLA
	PHA
	ASL
	TAY
	LDA ($34),Y
	STA PCPointerLoByte
	INY
	LDA ($34),Y
	STA PCPointerHiByte
	LDA #$00
	STA $2E
	PLA
	TAY
	LDA PlayerSprYPos
	SEC
	SBC tbl5_AC14,Y
	LDX $1E
	CLC
	ADC tbl5_ABF2,X
	LDX PlayerPowerup
	BNE bra5_AA7C
	SEC
	SBC #$03
bra5_AA7C:
	STA $2B
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra5_AAA7
	LDA PlayerSprXPos
	CLC
	ADC tbl5_AC2F,Y
	STA $28
loc5_AA8E:
	LDA $2E
	CLC
	ADC #$04
	TAY
	LDX $3C
	LDA (PCPointerLoByte),Y
	CMP #$FF
	BEQ bra5_AB02
	AND #$3F
	STA $0201,X
	PHA
	LDA #$40
	JMP loc5_AAC1
bra5_AAA7:
	LDA PlayerSprXPos
	CLC
	ADC tbl5_AC38,Y
	STA $28
bra5_AAAF:
	LDY $2E
	LDX $3C
	LDA (PCPointerLoByte),Y
	CMP #$FF
	BEQ bra5_AB02
	AND #$3F
	STA $0201,X
	PHA
	LDA #$00
loc5_AAC1:
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
	LDA $28
	CLC
	ADC tbl5_AC03,Y
	STA $0203,X
	LDA $2B
	CLC
	ADC tbl5_AC07,Y
	STA $0200,X
	TXA
	CLC
	ADC #$04
	STA $3C
bra5_AB02:
	INC $2E
	LDA $2E
	CMP #$04
	BCS bra5_AB15_RTS
	LDA PlayerMovement
	EOR PlayerSpriteAttributes
	AND #$40
	BNE bra5_AAAF
	JMP loc5_AA8E
bra5_AB15_RTS:
	RTS
loc5_AB16:
	LDY $0627
	LDA tbl5_AB30,Y
	BPL bra5_AB2D
	LDA #$00
	STA $0627
	LDA #$03
	STA PlayerPowerup
	JSR $A14A
	LDA #$08
bra5_AB2D:
	JMP loc5_A96C
tbl5_AB30:
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $80
loc5_AB3C:
	LDY $0627
	LDA tbl5_AB55,Y
loc5_AB42:
	BPL bra5_AB52
	LDA #$00
	STA $0627
	LDA PlayerXSpeed
	BNE bra5_AB50
	STA $0628
bra5_AB50:
	LDA #$00
bra5_AB52:
	JMP loc5_A96C
tbl5_AB55:
	.byte $08
	.byte $08
	.byte $07
	.byte $07
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $00
	.byte $00
	.byte $80
tbl5_AB60:
	.byte $08
	.byte $08
	.byte $08
	.byte $07
	.byte $07
	.byte $07
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $00
	.byte $00
	.byte $00
	.byte $80
loc5_AB70:
	LDA #$00
	STA $0627
	LDA #$03
	STA PlayerPowerup
	JSR $A14A
	LDA #$00
	JMP loc5_A96C
loc5_AB82:
	LDY $0627
	LDA PlayerMovement
	AND #$04
	BEQ bra5_AB8E
	JMP loc5_AB3C
bra5_AB8E:
	LDA tbl5_ABA6,Y
	BPL bra5_ABA3
	LDA #$00
	STA $0627
	LDA PlayerYSpeed
	BNE bra5_ABA1
	LDA #$01
	STA $0628
bra5_ABA1:
	LDA #$03
bra5_ABA3:
	JMP loc5_A96C
tbl5_ABA6:
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $03
	.byte $03
	.byte $03
	.byte $80
loc5_ABB0:
	LDA #$00
	STA $0627
	LDY #$02
	LDA $062B
	AND #$01
	BNE bra5_ABC0
	LDY #$07
bra5_ABC0:
	LDA PlayerYSpeed
	BEQ bra5_ABCC
	LDA PlayerMovement
	AND #$04
	BNE bra5_ABCC
	LDY #$06
bra5_ABCC:
	TYA
	JMP loc5_A96C
tbl5_ABD0:
	.byte $80
	.byte $05
	.byte $01
	.byte $01
	.byte $03
	.byte $04
	.byte $80
	.byte $80
	.byte $80
	.byte $01
	.byte $03
	.byte $03
	.byte $01
	.byte $82
	.byte $82
	.byte $01
	.byte $80
tbl5_ABE1:
	.byte $80
	.byte $05
	.byte $01
	.byte $01
	.byte $03
	.byte $04
	.byte $01
	.byte $80
	.byte $80
	.byte $01
	.byte $03
	.byte $03
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $80
tbl5_ABF2:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $06
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
tbl5_AC03:
	.byte $00
	.byte $08
	.byte $00
	.byte $08
tbl5_AC07:
	.byte $00
	.byte $00
	.byte $08
	.byte $08
tbl5_AC0B:
	.byte $11
	.byte $19
	.byte $11
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $19
	.byte $17
tbl5_AC14:
	.byte $1B
	.byte $23
	.byte $1B
	.byte $29
	.byte $29
	.byte $29
	.byte $29
	.byte $23
	.byte $21
tbl5_AC1D:
	.byte $EE
	.byte $EE
	.byte $EE
	.byte $EF
	.byte $EF
	.byte $EF
	.byte $EF
	.byte $EE
	.byte $EE
tbl5_AC26:
	.byte $02
	.byte $02
	.byte $02
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
tbl5_AC2F:
	.byte $EA
	.byte $EA
	.byte $EA
	.byte $ED
	.byte $ED
	.byte $ED
	.byte $ED
	.byte $EA
	.byte $EA
tbl5_AC38:
	.byte $06
	.byte $06
	.byte $06
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $06
	.byte $06
tbl5_AC41:
	.byte $4B
tbl5_AC42:
	.byte $AC
	.byte $4B
	.byte $AC
	.byte $4B
	.byte $AC
	.byte $4B
	.byte $AC
	.byte $4B
	.byte $AC
	.byte $5D
	.byte $AC
	.byte $65
	.byte $AC
	.byte $6D
	.byte $AC
	.byte $75
	.byte $AC
	.byte $7D
	.byte $AC
	.byte $85
	.byte $AC
	.byte $8D
	.byte $AC
	.byte $95
	.byte $AC
	.byte $9D
	.byte $AC
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $02
	.byte $01
	.byte $04
	.byte $03
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $06
	.byte $05
	.byte $08
	.byte $07
	.byte $0B
	.byte $0C
	.byte $FF
	.byte $FF
	.byte $0C
	.byte $0B
	.byte $FF
	.byte $FF
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
	.byte $0E
	.byte $0D
	.byte $10
	.byte $0F
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $12
	.byte $11
	.byte $14
	.byte $13
	.byte $15
	.byte $16
	.byte $17
	.byte $18
	.byte $16
	.byte $15
	.byte $18
	.byte $17
	.byte $19
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $1A
	.byte $19
	.byte $1C
	.byte $1B
	.byte $FF
	.byte $1D
	.byte $09
	.byte $0A
	.byte $1D
	.byte $FF
	.byte $0A
	.byte $09
	.byte $20
	.byte $FF
	.byte $1E
	.byte $1F
	.byte $FF
	.byte $20
	.byte $1F
	.byte $1E
	LDA PlayerState
	CMP #$09
	BCS bra5_ACCF
	RTS
	LDA $067D
	BEQ bra5_ACBE
	LDA PlayerMovement
	AND #$04
	BNE bra5_ACBD_RTS
	LDA #$00
	STA PlayerAction
	STA PlayerAnimationFrame
bra5_ACBD_RTS:
	RTS
bra5_ACBE:
	JSR sub5_AD27
	JSR sub5_AE13
	JSR sub5_AD8C
	JSR sub5_ADB3
	JSR sub5_B0BC
	LDA PlayerState
bra5_ACCF:
	ASL
	TAY
	LDA tbl5_ACDE,Y
	STA PCPointerLoByte
	LDA tbl5_ACDF,Y
	STA PCPointerHiByte
	JMP (PCPointerLoByte)
tbl5_ACDE:
	.byte $4F
tbl5_ACDF:
	.byte $AE
	.byte $4F
	.byte $AE
	.byte $4F
	.byte $AE
	.byte $7C
	.byte $B6
	.byte $7C
	.byte $B5
	.byte $24
	.byte $B7
	.byte $DE
	.byte $B8
	.byte $DE
	.byte $B8
	.byte $0C
	.byte $B9
	.byte $24
	.byte $B7
	.byte $6A
	.byte $B7
	.byte $82
	.byte $B7
	.byte $94
	.byte $B7
	.byte $B5
	.byte $B7
	.byte $CD
	.byte $B7
	.byte $DF
	.byte $B7
	.byte $F7
	.byte $B7
	.byte $0F
	.byte $B8
	.byte $21
	.byte $B8
	LDA PlayerPowerupBuffer
	BEQ bra5_AD1E
	INC PlayerPowerupBuffer
	LDA PlayerPowerupBuffer
	AND #$7F
	CMP #$20
	BCC bra5_AD1D_RTS
	LDA #$00
	STA PlayerPowerupBuffer
	JSR $A14A
bra5_AD1D_RTS:
	RTS
bra5_AD1E:
	LDA #$02
	STA Event
	LDA #$00
	STA EventPart
	RTS
sub5_AD27:
	LDA DataBank2
	CMP #$26
	BEQ bra5_AD8B_RTS
	LDA WorldNumber
	CMP #$07
	BCC bra5_AD3E
	LDA #$00
	STA LevelTimerLo
	STA LevelTimerHi
	RTS
bra5_AD3E:
	LDA $0616
	CMP #$3B
	BCS bra5_AD49
	INC $0616
	RTS
bra5_AD49:
	LDA #$00
	STA $0616
	LDA LevelTimerLo
	SEC
	SBC #$01
	STA LevelTimerLo
	LDA LevelTimerHi
	SBC #$00
	STA LevelTimerHi
	BNE bra5_AD8B_RTS
	LDA LevelTimerLo
	BNE bra5_AD8B_RTS
	STA PlayerPowerup
	LDA #$01
	STA $0398
	LDA Player1YoshiStatus
	BEQ bra5_AD76
	JSR sub5_B48B
bra5_AD76:
	LDA #$00
	STA EventPart
	STA PlayerState
	STA $06DC
	STA $06DD
	LDA #$04
	STA Event
	JSR $A14A
	PLA
	PLA
bra5_AD8B_RTS:
	RTS
sub5_AD8C:
	LDA PlayerState
	CMP #$05
	BCS bra5_ADB2_RTS
	LDA UnderwaterFlag
	BEQ bra5_AD9F
	LDA PlayerState
	BNE bra5_ADB2_RTS
	LDX #$01
	BNE bra5_ADB0
bra5_AD9F:
	LDA PlayerState
	CMP #$03
	BEQ bra5_ADB2_RTS
	LDX #$00
	LDA PlayerPowerup
	CMP #$03
	BCC bra5_ADB0
	LDX #$04
bra5_ADB0:
	STX $E1
bra5_ADB2_RTS:
	RTS
sub5_ADB3:
	LDA Player1YoshiStatus
	BEQ bra5_ADE2
	LDA HurtFlag
	BEQ bra5_ADE2
	LDA #$00
	STA HurtFlag
	LDA #$40
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$0C
	STA SFXRegister
	LDA #$03
	STA PlayerAction
	LDA #$00
	STA PlayerState
	JSR sub5_B48B
	LDA #$04
	STA YoshiUnmountedState
	STA $50
bra5_ADE2:
	LDA PlayerHoldFlag
	CMP PlayerHoldFlag2
	BEQ bra5_ADF0
	STA PlayerHoldFlag2
	JSR $A14A
bra5_ADF0:
	LDY InvincibilityTimer
	BEQ bra5_AE12_RTS
	LDA FrameCount
	AND #$03
	BNE bra5_AE12_RTS
	CPY #$01
	BNE bra5_AE03
	LDX #$26
	STX MusicRegister
bra5_AE03:
	CPY #$F8
	BCC bra5_AE0F
	JSR $A4CE
	LDA #$FF
	STA InvincibilityTimer
bra5_AE0F:
	INC InvincibilityTimer
bra5_AE12_RTS:
	RTS
sub5_AE13:
	LDA ButtonsPressed
	AND #$20
	BEQ bra5_AE4A_RTS
	LDA #$07
	STA Event
	LDY PlayerPowerup
	CPY #$04
	BNE bra5_AE27
	LDY #$03
bra5_AE27:
	LDX ItemBox
	BEQ bra5_AE4A_RTS
	CPX #$02
	BCS bra5_AE34
	CPY #$00
	BNE bra5_AE45
bra5_AE34:
	STY ItemBox
	LDA #$01
	STX PlayerPowerup
	CPX #$03
	BNE bra5_AE42
	LDA #$81
bra5_AE42:
	STA PlayerPowerupBuffer
bra5_AE45:
	LDA tbl5_AE4B,X
	STA SFXRegister
bra5_AE4A_RTS:
	RTS
tbl5_AE4B:
	.byte $00
	.byte $09
	.byte $09
	.byte $0E
	LDA PlayerPowerup
	CMP #$03
	BCC bra5_AE59
	JSR sub5_B5FC
bra5_AE59:
	LDA $1E
	ASL
	TAY
	LDA tbl5_AE6A,Y
	STA PCPointerLoByte
	LDA tbl5_AE6B,Y
	STA PCPointerHiByte
	JMP (PCPointerLoByte)
tbl5_AE6A:
	.byte $92
tbl5_AE6B:
	.byte $AE
	.byte $E5
	.byte $AE
	.byte $06
	.byte $AF
	.byte $E5
	.byte $AE
	.byte $33
	.byte $AF
	.byte $6A
	.byte $AF
	.byte $92
	.byte $AE
	.byte $BB
	.byte $AE
	.byte $92
	.byte $AE
	.byte $33
	.byte $AF
	.byte $33
	.byte $AF
	.byte $A2
	.byte $B0
	.byte $A2
	.byte $B0
	.byte $06
	.byte $AF
	.byte $33
	.byte $AF
	.byte $33
	.byte $AF
	.byte $33
	.byte $AF
	.byte $86
	.byte $AF
	.byte $A2
	.byte $B0
	.byte $92
	.byte $AF
	LDA PlayerYSpeed
	BNE bra5_AEB0
	LDA PlayerMovement
	AND #$04
	BNE bra5_AEAF_RTS
	LDA ButtonsHeld
	BNE bra5_AEA3
	STA PlayerAction
bra5_AEA3:
	JSR sub5_B565
	JSR sub5_B34F
	JSR sub5_B3DF
	JSR sub5_AFA1
bra5_AEAF_RTS:
	RTS
bra5_AEB0:
	LDA PlayerMovement
	AND #$04
	BNE bra5_AEAF_RTS
	LDA #$0A
	STA PlayerAction
	RTS
	LDA PlayerYSpeed
	BNE bra5_AEDA
	LDA PlayerMovement
	AND #$04
	BNE bra5_AED9_RTS
	LDA ButtonsHeld
	AND #$04
	BNE bra5_AED0
	LDA #$00
	STA PlayerAction
bra5_AED0:
	JSR sub5_B565
	JSR sub5_B3DF
	JSR sub5_AFA1
bra5_AED9_RTS:
	RTS
bra5_AEDA:
	LDA PlayerMovement
	AND #$04
	BNE bra5_AED9_RTS
	LDA #$0A
	STA PlayerAction
	RTS
	JSR sub5_AF1F
	LDA PlayerXSpeed
	BNE bra5_AEEE
	STA PlayerAction
bra5_AEEE:
	JSR sub5_B34F
	JSR sub5_B509
	JSR sub5_B3DF
	JSR sub5_AFA1
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_AF05_RTS
	LDA #$07
	STA PlayerAction
bra5_AF05_RTS:
	RTS
	JSR sub5_AF1F
	LDA PlayerXSpeed
	BNE bra5_AF0F
	STA PlayerAction
bra5_AF0F:
	JSR sub5_B34F
	JSR sub5_B509
	JSR sub5_B3DF
	JSR sub5_B4F3
	JSR sub5_AFA1
	RTS
sub5_AF1F:
	LDA PlayerYSpeed
	CMP #$07
	BCC bra5_AF32_RTS
	LDX #$0A
	LDA UnderwaterFlag
	BEQ bra5_AF2E
	LDX #$0B
bra5_AF2E:
	STX PlayerAction
	PLA
	PLA
bra5_AF32_RTS:
	RTS
	LDA PlayerYSpeed
	BNE bra5_AF41
	LDA PlayerMovement
	AND #$04
	BNE bra5_AF41
	LDA #$01
	STA PlayerAction
bra5_AF41:
	JSR sub5_AF55
	JSR sub5_AFC6
	JSR sub5_B3A5
	LDA PlayerState
	BEQ bra5_AF51
	JSR sub5_B3DF
bra5_AF51:
	JSR sub5_B462
	RTS
sub5_AF55:
	LDA PlayerMovement
	AND #$04
	BEQ bra5_AF69_RTS
	LDA ButtonsHeld
	AND #$80
	BEQ bra5_AF69_RTS
	LDA PlayerYSpeed
	CLC
	ADC #$01
	STA PlayerYSpeed
bra5_AF69_RTS:
	RTS
	LDA PlayerYSpeed
	BNE bra5_AF78
	LDA PlayerMovement
	AND #$04
	BNE bra5_AF78
	LDA #$01
	STA PlayerAction
bra5_AF78:
	JSR sub5_AFF1
	JSR sub5_B3A5
	LDA PlayerState
	BEQ bra5_AF85_RTS
	JSR sub5_B3DF
bra5_AF85_RTS:
	RTS
	LDX #$00
	LDY #$10
	JSR sub5_B8A2
	LDA #$04
	STA PlayerAction
	RTS
	JSR sub5_B3DF
	LDX #$00
	LDY #$08
	JSR sub5_B8A2
	LDA #$00
	STA PlayerAction
	RTS
sub5_AFA1:
	LDA PlayerPowerup
	CMP #$02
	BNE bra5_AFC5_RTS
	LDA FireballSlot
	AND FireballSlot2
	BNE bra5_AFC5_RTS
	LDA ButtonsHeld
	AND #$04
	BNE bra5_AFC5_RTS
	LDA ButtonsPressed
	AND #$40
	BEQ bra5_AFC5_RTS
	LDA #$13
	STA PlayerAction
	JSR sub5_B00D
bra5_AFC5_RTS:
	RTS
sub5_AFC6:
	LDA PlayerPowerup
	CMP #$02
	BNE bra5_AFF0_RTS
	LDA FireballSlot
	AND FireballSlot2
	BNE bra5_AFF0_RTS
	LDA ButtonsHeld
	AND #$04
	BNE bra5_AFF0_RTS
	LDA ButtonsPressed
	AND #$40
	BEQ bra5_AFF0_RTS
	LDY #$11
	LDA UnderwaterFlag
	BEQ bra5_AFEB
	INY
bra5_AFEB:
	STY PlayerAction
	JSR sub5_B00D
bra5_AFF0_RTS:
	RTS
sub5_AFF1:
	LDA PlayerPowerup
	CMP #$02
	BEQ bra5_AFF9
bra5_AFF8_RTS:
	RTS
bra5_AFF9:
	LDX UsedFireballSlots
	LDA FireballSlot,X
	BNE bra5_AFF8_RTS
	LDA #$40
	CPX #$00
	BNE bra5_B008
	TXA
bra5_B008:
	STA PCPointerLoByte
	JMP loc5_B01C
sub5_B00D:
	LDA PlayerMovement
	AND #$C0
	STA PCPointerLoByte
	LDX UsedFireballSlots
	LDA FireballSlot,X
	BEQ bra5_B01C
	RTS
bra5_B01C:
loc5_B01C:
	INC FireballSlot,X
	LDY ObjectCount
	LDA PCPointerLoByte
	STA ObjectState,Y
	TXA
	CLC
	ADC #$06
	STA ObjectSlot,Y
	LDA PCPointerLoByte
	AND #$40
	BNE bra5_B042
	LDA PlayerXPosDup
	CLC
	ADC #$00
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc5_B04E
bra5_B042:
	LDA PlayerXPosDup
	SEC
	SBC #$08
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc5_B04E:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$EC
	BMI bra5_B075
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B066
	CMP #$F0
	BCC bra5_B08C
bra5_B066:
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	JMP loc5_B089
bra5_B075:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B08C
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc5_B089:
	STA ObjectYScreen,Y
bra5_B08C:
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
	BNE bra5_B0B2
	LDX #$0B
	LDA PlayerYSpeed
	BNE bra5_B0B0
	LDX #$01
bra5_B0B0:
	STX PlayerAction
bra5_B0B2:
	JSR sub5_B37C
	JSR sub5_B3DF
	JSR sub5_AFC6
	RTS
sub5_B0BC:
	LDA Player1YoshiStatus
	BEQ bra5_B0D6_RTS
	CMP #$02
	BCS bra5_B0C8
	JMP loc5_B193
bra5_B0C8:
	CMP #$06
	BCS bra5_B0CF
	JMP loc5_B0D7
bra5_B0CF:
	CMP #$07
	BCS bra5_B0DA
	JMP loc5_B1C1
bra5_B0D6_RTS:
	RTS
loc5_B0D7:
	JSR sub5_B1DE
bra5_B0DA:
	LDA ButtonsPressed
	AND #$40
	BEQ bra5_B11D_RTS
	LDA #$00
	STA $0613
	STA $0614
	LDY #$0C
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B0F4
	LDY #$0E
bra5_B0F4:
	LDA ButtonsHeld
	AND #$03
	BEQ bra5_B0FD
	LDY #$0D
bra5_B0FD:
	STY $E1
	LDA Player1YoshiStatus
	CMP #$07
	BCC bra5_B113
	SEC
	SBC #$05
	STA Player1YoshiStatus
	JSR $A14A
	LDA #$00
	STA PlayerAnimationFrame
bra5_B113:
	LDA Player1YoshiStatus
	CMP #$04
	BNE bra5_B11E
	JSR sub5_B1F6
bra5_B11D_RTS:
	RTS
bra5_B11E:
	LDY ObjectCount
	STA ObjectSlot,Y
	LDA PlayerMovement
	AND #$40
	BNE bra5_B138
	LDA PlayerXPosDup
	CLC
	ADC #$10
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc5_B144
bra5_B138:
	LDA PlayerXPosDup
	SEC
	SBC #$20
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc5_B144:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E4
	BMI bra5_B16B
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B15C
	CMP #$F0
	BCC bra5_B182
bra5_B15C:
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	JMP loc5_B17F
bra5_B16B:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B182
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc5_B17F:
	STA ObjectYScreen,Y
bra5_B182:
	LDA #$00
	STA ObjectState,Y
	STA $0578,Y
	LDA $0632
	STA $058C,Y
	INC ObjectCount
	RTS
loc5_B193:
	LDA PlayerState
	CMP #$09
	BCS bra5_B1C0_RTS
	LDA ButtonsPressed
	AND #$40
	BEQ bra5_B1C0_RTS
	LDA #$19
	STA SFXRegister
	LDY #$09
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B1AF
	LDY #$0B
bra5_B1AF:
	LDA ButtonsHeld
	AND #$03
	BEQ bra5_B1BE
	LDY #$09
	LDA PlayerYSpeed
	BNE bra5_B1BE
	LDY #$0A
bra5_B1BE:
	STY $E1
bra5_B1C0_RTS:
	RTS
loc5_B1C1:
	LDY #$0F
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B1CC
	LDY #$11
bra5_B1CC:
	LDA ButtonsHeld
	AND #$03
	BEQ bra5_B1DB
	LDY #$0F
	LDA PlayerYSpeed
	BNE bra5_B1DB
	LDY #$10
bra5_B1DB:
	STY $E1
	RTS
sub5_B1DE:
	LDX #$1E
	LDY #$3B
	JSR sub5_B8C0
	LDA #$12
	STA PlayerState
	LDA Player1YoshiStatus
	CLC
	ADC #$05
	STA Player1YoshiStatus
	JSR $A14A
	RTS
sub5_B1F6:
	LDY ObjectCount
	LDA #$08
	STA ObjectSlot,Y
	LDA #$09
	STA ObjectSlot+1,Y
	LDA #$0A
	STA ObjectSlot+2,Y
	LDA PlayerMovement
	STA ObjectState,Y
	STA ObjectState+1,Y
	STA ObjectState+2,Y
	AND #$40
	BNE bra5_B225
	LDA PlayerXPosDup
	CLC
	ADC #$08
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc5_B231
bra5_B225:
	LDA PlayerXPosDup
	SEC
	SBC #$10
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc5_B231:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E4
	BMI bra5_B258
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B249
	CMP #$F0
	BCC bra5_B26F
bra5_B249:
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	JMP loc5_B26C
bra5_B258:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B26F
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc5_B26C:
	STA ObjectYScreen,Y
bra5_B26F:
	LDA #$00
	STA $058C,Y
	STA GuidedObjStatus,Y
	INY
	LDA PlayerMovement
	AND #$40
	BNE bra5_B28D
	LDA PlayerXPosDup
	CLC
	ADC #$08
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc5_B299
bra5_B28D:
	LDA PlayerXPosDup
	SEC
	SBC #$10
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc5_B299:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E4
	BMI bra5_B2C0
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B2B1
	CMP #$F0
	BCC bra5_B2D7
bra5_B2B1:
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	JMP loc5_B2D4
bra5_B2C0:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B2D7
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc5_B2D4:
	STA ObjectYScreen,Y
bra5_B2D7:
	LDA #$00
	STA $058C,Y
	STA GuidedObjStatus,Y
	INY
	LDA PlayerMovement
	AND #$40
	BNE bra5_B2F5
	LDA PlayerXPosDup
	CLC
	ADC #$08
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc5_B301
bra5_B2F5:
	LDA PlayerXPosDup
	SEC
	SBC #$10
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc5_B301:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E4
	BMI bra5_B328
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B319
	CMP #$F0
	BCC bra5_B33F
bra5_B319:
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	JMP loc5_B33C
bra5_B328:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra5_B33F
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
loc5_B33C:
	STA ObjectYScreen,Y
bra5_B33F:
	LDA #$00
	STA $058C,Y
	STA GuidedObjStatus,Y
	INY
	STY ObjectCount
	LDA #$1B
	STA SFXRegister
	RTS
sub5_B34F:
	LDA ButtonsHeld
	AND #$01
	BEQ bra5_B35D
	LDA PlayerMovement
	AND #$BE
	JMP loc5_B368
bra5_B35D:
	LDA ButtonsHeld
	AND #$02
	BEQ bra5_B37B_RTS
	LDA PlayerMovement
	ORA #$41
loc5_B368:
	STA PlayerMovement
	LDA PlayerXSpeed
	CMP #$10
	BCS bra5_B377
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra5_B377:
	LDA #$01
	STA PlayerAction
bra5_B37B_RTS:
	RTS
sub5_B37C:
	LDA ButtonsHeld
	AND #$01
	BEQ bra5_B38A
	LDA PlayerMovement
	AND #$BE
	JMP loc5_B395
bra5_B38A:
	LDA ButtonsHeld
	AND #$02
	BEQ bra5_B3A4_RTS
	LDA PlayerMovement
	ORA #$41
loc5_B395:
	STA PlayerMovement
	LDA PlayerXSpeed
	CMP #$10
	BCS bra5_B3A4_RTS
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra5_B3A4_RTS:
	RTS
sub5_B3A5:
	LDA PlayerMovement
	STA $26
	LDA ButtonsHeld
	AND #$01
	BEQ bra5_B3B7
	LDA PlayerMovement
	AND #$BE
	JMP loc5_B3C6
bra5_B3B7:
	LDA ButtonsHeld
	AND #$02
	BNE bra5_B3C2
	LDA #$01
	BNE bra5_B3D5
bra5_B3C2:
	LDA PlayerMovement
	ORA #$41
loc5_B3C6:
	STA PlayerMovement
	EOR $26
	AND #$40
	BEQ bra5_B3D3
	LDA #$00
	STA PlayerXSpeed
	RTS
bra5_B3D3:
	LDA #$03
bra5_B3D5:
	CLC
	ADC PlayerXSpeed
	CMP #$20
	BCS bra5_B3DE_RTS
	STA PlayerXSpeed
bra5_B3DE_RTS:
	RTS
sub5_B3DF:
	LDA UnderwaterFlag
	BEQ bra5_B426
	LDA PlayerHoldFlag
	BEQ bra5_B402
	LDA #$20
	STA PlayerYSpeed
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B3FB
	LDA PlayerMovement
	AND #$FB
	STA PlayerMovement
	RTS
bra5_B3FB:
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	RTS
bra5_B402:
	LDA ButtonsPressed
	AND #$80
	BEQ bra5_B425_RTS
	LDA ButtonsHeld
	AND #$08
	BEQ bra5_B413
	JSR sub5_B48B
bra5_B413:
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA SFXRegister
	LDA #$0C
	STA PlayerAction
bra5_B425_RTS:
	RTS
bra5_B426:
	LDA ButtonsPressed
	AND #$80
	BEQ bra5_B425_RTS
	LDA PlayerYSpeed
	BNE bra5_B425_RTS
	LDA PlayerHoldFlag
	BNE bra5_B43D
	LDA ButtonsHeld
	AND #$08
	BNE bra5_B475
bra5_B43D:
	LDY #$48
	LDA ButtonsHeld
	AND #$40
	BEQ bra5_B448
	LDY #$58
bra5_B448:
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B451
	LDY #$28
bra5_B451:
	STY PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA PlayerAction
	LDA #$03
	STA SFXRegister
	RTS
sub5_B462:
	LDA Player1YoshiStatus
	BEQ bra5_B48A_RTS
	LDA ButtonsPressed
	AND #$80
	BEQ bra5_B48A_RTS
	LDA ButtonsHeld
	AND #$08
	BEQ bra5_B48A_RTS
bra5_B475:
	JSR sub5_B48B
	LDA #$50
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$05
	STA PlayerAction
	LDA #$01
	STA SFXRegister
bra5_B48A_RTS:
	RTS
sub5_B48B:
	LDA Player1YoshiStatus
	BEQ bra5_B4F2_RTS
	LDA PlayerMovement
	STA YoshiIdleMovement
	LDA Player1YoshiStatus
	STA YoshiIdleStorage
	LDA #$00
	STA Player1YoshiStatus
	STA Player2YoshiStatus
	JSR $A14A
	LDA #$04
	STA YoshiUnmountedState
	LDA PlayerYPosDup
	SEC
	SBC #$20
	STA YoshiYPos
	LDA PlayerYScreenDup
	SBC #$00
	STA YoshiYScreen
	LDA YoshiIdleMovement
	AND #$40
	BNE bra5_B4D2
	LDA PlayerMovement
	ORA #$01
	STA PlayerMovement
	LDA PlayerXPosDup
	SEC
	SBC #$08
	STA YoshiXPos
	JMP loc5_B4E0
bra5_B4D2:
	LDA PlayerMovement
	AND #$FE
	STA PlayerMovement
	LDA PlayerXPosDup
	SEC
	SBC #$18
	STA YoshiXPos
loc5_B4E0:
	LDA PlayerXScreenDup
	SBC #$00
	STA YoshiXScreen
	LDA #$00
	STA $05F6
	LDA #$30
	STA PlayerXSpeed
	INC ObjectCount
bra5_B4F2_RTS:
	RTS
sub5_B4F3:
	LDA PlayerAnimationFrame
	CMP #$10
	BCC bra5_B508_RTS
	LDA ButtonsPressed
	AND #$80
	BEQ bra5_B508_RTS
	LDA #$60
	STA PlayerYSpeed
	LDA #$09
	STA PlayerAction
bra5_B508_RTS:
	RTS
sub5_B509:
	LDA UnderwaterFlag
	BNE bra5_B55B_RTS
	LDA ButtonsHeld
	AND #$03
	BEQ bra5_B55C
	LDA ButtonsHeld
	AND #$40
	BNE bra5_B538
	STA $0314
	LDA PlayerXSpeed
	CMP #$10
	BCS bra5_B52C_RTS
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra5_B52C_RTS:
	RTS
	LDA $0314
	CMP #$30
	BCS bra5_B538
	INC $0314
	RTS
bra5_B538:
	LDA PlayerMovement
	AND #$01
	CMP $4F
	BEQ bra5_B54A
	STA $4F
	LDA #$10
	STA PlayerXSpeed
	LDA #$00
	STA PlayerAction
bra5_B54A:
	LDA #$02
	STA PlayerAction
	LDA PlayerXSpeed
	CMP #$40
	BCS bra5_B55B_RTS
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra5_B55B_RTS:
	RTS
bra5_B55C:
	LDA PlayerXSpeed
	BEQ bra5_B55B_RTS
	LDA #$01
	STA PlayerAction
	RTS
sub5_B565:
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B570
	LDA #$07
	STA PlayerAction
bra5_B570:
	LDA ButtonsHeld
	AND #$08
	BEQ bra5_B57B_RTS
	LDA #$08
	STA PlayerAction
bra5_B57B_RTS:
	RTS
	JSR sub5_B5FC
	LDA $1E
	ASL
	TAY
	LDA tbl5_B590,Y
	STA PCPointerLoByte
	LDA tbl5_B591,Y
	STA PCPointerHiByte
	JMP (PCPointerLoByte)
tbl5_B590:
	.byte $92
tbl5_B591:
	.byte $AE
	.byte $E5
	.byte $AE
	.byte $06
	.byte $AF
	.byte $E5
	.byte $AE
	.byte $33
	.byte $AF
	.byte $33
	.byte $AF
	.byte $92
	.byte $AE
	.byte $92
	.byte $AE
	.byte $92
	.byte $AE
	.byte $B0
	.byte $B5
	.byte $33
	.byte $AF
	.byte $A2
	.byte $B0
	.byte $A2
	.byte $B0
	.byte $06
	.byte $AF
	.byte $33
	.byte $AF
	.byte $DC
	.byte $B5
	INC $061C
	LDA $061C
	CMP #$50
	BCC $B5C4
	LDA #$00
	STA $061C
	LDA #$0F
	STA PlayerAction
	RTS
	LDA PlayerYSpeed
	BNE bra5_B5D2
	LDA PlayerMovement
	AND #$04
	BNE bra5_B5D2
	LDA #$01
	STA PlayerAction
bra5_B5D2:
	JSR sub5_B37C
	JSR sub5_B616
	JSR sub5_B669
	RTS
	LDA Player1YoshiStatus
	BEQ bra5_B5E7
	JSR sub5_B37C
	JMP loc5_B5EA
bra5_B5E7:
	JSR sub5_B61B
loc5_B5EA:
	JSR sub5_B616
	LDA PlayerMovement
	AND #$04
	BNE bra5_B5FB_RTS
	LDA PlayerYSpeed
	BNE bra5_B5FB_RTS
	LDA #$01
	STA PlayerAction
bra5_B5FB_RTS:
	RTS
sub5_B5FC:
	LDA Player1YoshiStatus
	BNE bra5_B615_RTS
	LDA PlayerHoldFlag
	BNE bra5_B615_RTS
	LDA ButtonsPressed
	AND #$40
	BEQ bra5_B615_RTS
	LDA #$08
	STA PlayerState
	LDA #$01
	STA SFXRegister
bra5_B615_RTS:
	RTS
sub5_B616:
	LDA #$30
	STA PlayerXSpeed
	RTS
sub5_B61B:
	LDA ButtonsHeld
	AND #$40
	BNE bra5_B627
	LDA #$0A
	STA PlayerAction
	RTS
bra5_B627:
	LDX #$00
	LDA PlayerMovement
	AND #$40
	BEQ bra5_B630
	INX
bra5_B630:
	TXA
	STA PCPointerLoByte
	EOR #$01
	STA $34
	INC PCPointerLoByte
	INC $34
	LDA PlayerMovement
	AND #$04
	BNE bra5_B653
	LDA ButtonsPressed
	AND PCPointerLoByte
	BEQ bra5_B653
	INC PlayerYSpeed
	LDA #$50
	CMP PlayerYSpeed
	BCS bra5_B668_RTS
	STA PlayerYSpeed
	RTS
bra5_B653:
	LDA ButtonsPressed
	AND $34
	BEQ bra5_B668_RTS
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$50
	CMP PlayerYSpeed
	BCS bra5_B668_RTS
	STA PlayerYSpeed
bra5_B668_RTS:
	RTS
sub5_B669:
	LDA ButtonsHeld
	AND #$40
	BEQ bra5_B67B_RTS
	LDA ButtonsHeld
	AND #$80
	BEQ bra5_B67B_RTS
	LDA #$40
	STA PlayerYSpeed
bra5_B67B_RTS:
	RTS
	LDA ButtonsHeld
	AND #$0F
	BNE bra5_B68D
	LDA #$00
	STA PlayerYSpeed
	STA PlayerXSpeed
	LDA #$0D
	STA PlayerAction
bra5_B68D:
	JSR sub5_B6BF
	JSR sub5_B694
	RTS
sub5_B694:
	LDA ButtonsPressed
	AND #$80
	BEQ bra5_B6BE_RTS
	LDA ButtonsHeld
	AND #$08
	BNE bra5_B6BE_RTS
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
bra5_B6BE_RTS:
	RTS
sub5_B6BF:
	LDA ButtonsHeld
	AND #$08
	BEQ bra5_B6D7
	LDA $06DD
	BEQ bra5_B6D1
	LDA #$00
	STA PlayerYSpeed
	BEQ bra5_B6D7
bra5_B6D1:
	LDA PlayerMovement
	ORA #$04
	BNE bra5_B6E7
bra5_B6D7:
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B6EF
	LDA #$00
	STA $06DD
	LDA PlayerMovement
	AND #$7B
bra5_B6E7:
	STA PlayerMovement
	LDA #$10
	STA PlayerYSpeed
	BNE bra5_B71F
bra5_B6EF:
	LDA $06DE
	BNE bra5_B6FE
	LDA $06DC
	BEQ bra5_B6FE
	LDA #$00
	STA PlayerXSpeed
	RTS
bra5_B6FE:
	LDA ButtonsHeld
	AND #$02
	BEQ bra5_B70B
	LDA PlayerMovement
	ORA #$41
	BNE bra5_B716
bra5_B70B:
	LDA ButtonsHeld
	AND #$01
	BEQ bra5_B71E_RTS
	LDA PlayerMovement
	AND #$BE
bra5_B716:
	STA PlayerMovement
	LDA #$10
	STA PlayerXSpeed
	BNE bra5_B71F
bra5_B71E_RTS:
	RTS
bra5_B71F:
	LDA #$0E
	STA PlayerAction
	RTS
	JSR sub5_B84B
	JSR sub5_B874
	LDX #$0D
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra5_B734
	LDY #$0A
bra5_B734:
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B73D
	LDY #$07
bra5_B73D:
	LDA #$0D
	STA PCPointerLoByte
sub5_B741:
	STX PlayerAction
	LDA PlayerAnimationFrame
	CMP PCPointerLoByte
	BCC bra5_B769_RTS
	STY PlayerAction
	LDY #$01
	LDA Player1YoshiStatus
	CMP #$01
	BNE bra5_B75C
	LDY YoshiTongueState
	LDA #$01
	STA YoshiTongueState
bra5_B75C:
	STY Player1YoshiStatus
	JSR $A14A
	LDA #$00
	STA PlayerState
	STA $062E
bra5_B769_RTS:
	RTS
	JSR sub5_B84B
	JSR sub5_B874
	LDX #$0E
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra5_B77A
	LDY #$0A
bra5_B77A:
	LDA #$0D
	STA PCPointerLoByte
	JSR sub5_B741
	RTS
	JSR sub5_B84B
	JSR sub5_B874
	LDX #$06
	LDY #$07
	LDA #$0D
	STA PCPointerLoByte
	JSR sub5_B741
	RTS
	JSR sub5_B84B
	JSR sub5_B874
	LDX #$0D
	LDY #$00
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B7A7
	LDY #$07
bra5_B7A7:
	LDA PlayerYSpeed
	BEQ bra5_B7AD
	LDY #$0A
bra5_B7AD:
	LDA #$03
	STA PCPointerLoByte
	JSR sub5_B741
	RTS
	JSR sub5_B84B
	JSR sub5_B874
	LDX #$0E
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra5_B7C5
	LDY #$0A
bra5_B7C5:
	LDA #$04
	STA PCPointerLoByte
	JSR sub5_B741
	RTS
	JSR sub5_B84B
	JSR sub5_B874
	LDX #$06
	LDY #$07
	LDA #$01
	STA PCPointerLoByte
	JSR sub5_B741
	RTS
	JSR sub5_B37C
	JSR sub5_B874
	LDX #$0D
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra5_B7EF
	LDY #$0A
bra5_B7EF:
	LDA #$03
	STA PCPointerLoByte
	JSR sub5_B741
	RTS
	JSR sub5_B37C
	JSR sub5_B874
	LDX #$0E
	LDY #$00
	LDA PlayerYSpeed
	BEQ bra5_B807
	LDY #$0A
bra5_B807:
	LDA #$07
	STA PCPointerLoByte
	JSR sub5_B741
	RTS
	JSR sub5_B37C
	JSR sub5_B874
	LDX #$06
	LDY #$07
	LDA #$03
	STA PCPointerLoByte
	JSR sub5_B741
	RTS
	JSR sub5_B37C
	JSR sub5_B874
	LDX #$00
	LDA ButtonsHeld
	AND #$03
	BEQ bra5_B835
	LDA PlayerYSpeed
	BNE bra5_B835
	INX
bra5_B835:
	STX PlayerAction
	LDX #$00
	LDY #$40
	JSR sub5_B8C0
	LDA #$06
	STA Player1YoshiStatus
	JSR $A14A
	LDA #$1A
	STA SFXRegister
	RTS
sub5_B84B:
	LDA ButtonsHeld
	AND #$01
	BEQ bra5_B859
	LDA PlayerMovement
	AND #$FE
	JMP loc5_B864
bra5_B859:
	LDA ButtonsHeld
	AND #$02
	BEQ bra5_B873_RTS
	LDA PlayerMovement
	ORA #$01
loc5_B864:
	STA PlayerMovement
	LDA PlayerXSpeed
	CMP #$10
	BCS bra5_B873_RTS
	LDA PlayerXSpeed
	CLC
	ADC #$04
	STA PlayerXSpeed
bra5_B873_RTS:
	RTS
sub5_B874:
	LDA ButtonsPressed
	AND #$80
	BEQ bra5_B8A1_RTS
	LDA UnderwaterFlag
	BEQ bra5_B886
	LDX #$04
	LDY #$20
	BNE bra5_B897
bra5_B886:
	LDX #$03
	LDA PlayerYSpeed
	BNE bra5_B8A1_RTS
	LDY #$60
	LDA ButtonsHeld
	AND #$04
	BEQ bra5_B897
	LDY #$30
bra5_B897:
	STY PlayerYSpeed
	STX SFXRegister
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
bra5_B8A1_RTS:
	RTS
sub5_B8A2:
	INC PlayerFrameCount
	CPY PlayerFrameCount
	BCS bra5_B8B7
	LDA #$00
	STA PlayerFrameCount
	INC PlayerActionTimer
	CPX PlayerActionTimer
	BCC bra5_B8BA
bra5_B8B7:
	PLA
	PLA
	RTS
bra5_B8BA:
	LDA #$00
	STA PlayerActionTimer
	RTS
sub5_B8C0:
	INC $0613
	CPY $0613
	BCS bra5_B8D5
	LDA #$00
	STA $0613
	INC $0614
	CPX $0614
	BCC bra5_B8D8
bra5_B8D5:
	PLA
	PLA
	RTS
bra5_B8D8:
	LDA #$00
	STA $0614
	RTS
	LDA PlayerYSpeed
	BNE bra5_B90B_RTS
	LDA #$07
	STA PlayerState
	LDX $A4
	DEX
	LDA YoshiIdleMovement
	STA PlayerMovement
	LDA YoshiIdleStorage
	STA Player1YoshiStatus
	LDA #$01
	STA Player2YoshiStatus
	LDA #$07
	STA PlayerAction
	JSR $A14A
	LDX #$00
	LDY #$14
	JSR sub5_B8A2
	LDA #$00
	STA PlayerState
bra5_B90B_RTS:
	RTS
	JSR sub5_B37C
	JSR sub5_B922
	LDA #$05
	STA PlayerAction
	LDX #$00
	LDY #$14
	JSR sub5_B8A2
	LDA #$00
	STA PlayerState
	RTS
sub5_B922:
	LDA PlayerYSpeed
	BNE bra5_B937_RTS
	LDA ButtonsPressed
	AND #$80
	BEQ bra5_B937_RTS
	LDA #$60
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
bra5_B937_RTS:
	RTS
	LDA PlayerXSpeed
	CMP #$10
	BCS bra5_B945
	LDA FrameCount
	AND #$01
	JMP loc5_B94F
bra5_B945:
	ROR
	ROR
	ROR
	ROR
	AND #$0F
	TAY
	LDA tbl5_BAD1,Y
loc5_B94F:
	STA $28
	LDA PlayerXSpeed
	CMP #$03
	BCS bra5_B95B
	LDA #$00
	STA $28
bra5_B95B:
	LDA $28
	BNE bra5_B96A
	LDA PlayerXScreen
	STA PlayerXScreenDup
	LDA PlayerXPos
	STA PlayerXPosDup
	JMP loc5_B993
bra5_B96A:
	LDA PlayerMovement
	AND #$01
	BEQ bra5_B980
	LDA PlayerXPos
	SEC
	SBC $28
	STA PlayerXPosDup
	LDA PlayerXScreen
	SBC #$00
	STA PlayerXScreenDup
	JMP loc5_B993
bra5_B980:
	LDA PlayerSprXPos
	CMP #$F0
	BCS bra5_B993
	LDA PlayerXPos
	CLC
	ADC $28
	STA PlayerXPosDup
	LDA PlayerXScreen
	ADC #$00
	STA PlayerXScreenDup
bra5_B993:
loc5_B993:
	LDA PlayerYSpeed
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA tbl5_BAE1,X
	STA $2B
	LDA PlayerYSpeed
	CMP #$04
	BCS bra5_B9A9
	LDA #$00
	STA $2B
bra5_B9A9:
	LDA $2B
	BNE bra5_B9B8
	LDA PlayerYScreen
	STA PlayerYScreenDup
	LDA PlayerYPos
	STA PlayerYPosDup
	JMP loc5_BA24
bra5_B9B8:
	LDA PlayerMovement
	AND #$04
	BEQ bra5_B9DF
	LDA PlayerSprYPos
	CMP #$08
	BCC bra5_B9DF
	LDA PlayerYPos
	SEC
	SBC $2B
	STA PlayerYPosDup
	LDA PlayerYScreen
	SBC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra5_B9DC
	SEC
	SBC #$10
	STA PlayerYPosDup
bra5_B9DC:
	JMP loc5_BA24
bra5_B9DF:
	LDA PlayerSprYPos
	CMP #$E0
	BCC bra5_BA0A
	LDA #$22
	STA MusicRegister
	LDA #$00
	STA PlayerPowerup
	STA Player1YoshiStatus
	LDA LevelNumber
	CMP #$03
	BEQ bra5_B9FD
	LDA #$00
	STA Player2YoshiStatus
bra5_B9FD:
	LDA #$04
	STA Event
	LDA #$02
	STA EventPart
	LDA #$07
	STA PlayerAction
	RTS
bra5_BA0A:
	LDA PlayerYPos
	CLC
	ADC $2B
	STA PlayerYPosDup
	LDA PlayerYScreen
	ADC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra5_BA24
	CLC
	ADC #$10
	STA PlayerYPosDup
	INC PlayerYScreenDup
bra5_BA24:
loc5_BA24:
	LDA PlayerSprYPos
	CMP #$D0
	BCS bra5_BA42
	LDA Event
	CMP #$04
	BEQ bra5_BA42
	CMP #$0B
	BEQ bra5_BA42
	CMP #$0D
	BCC bra5_BA3C
	CMP #$15
	BCC bra5_BA42
bra5_BA3C:
	JSR sub5_BAF1
	JSR sub5_BC50
bra5_BA42:
	LDA PlayerXPosDup
	SEC
	SBC PlayerXPos
	STA $28
	LDA PlayerXScreenDup
	SBC PlayerXScreen
	BPL bra5_BA6A
	LDA $28
	EOR #$FF
	SEC
	ADC #$00
	CMP #$07
	BCC bra5_BA67
	LDA PlayerXPos
	SEC
	SBC #$07
	STA PlayerXPosDup
	LDA PlayerXScreen
	SBC #$00
	STA PlayerXScreenDup
bra5_BA67:
	JMP loc5_BA7D
bra5_BA6A:
	LDA $28
	CMP #$07
	BCC bra5_BA7D
	LDA PlayerXPos
	CLC
	ADC #$07
	STA PlayerXPosDup
	LDA PlayerXScreen
	ADC #$00
	STA PlayerXScreenDup
bra5_BA7D:
loc5_BA7D:
	LDA PlayerYPosDup
	SEC
	SBC PlayerYPos
	STA $28
	LDA PlayerYScreenDup
	SBC PlayerYScreen
	BPL bra5_BAB0
	LDA $28
	EOR #$FF
	SEC
	ADC #$00
	CMP #$07
	BCC bra5_BAAD
	LDA PlayerYPos
	SEC
	SBC #$07
	STA PlayerYPosDup
	LDA PlayerYScreen
	SBC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra5_BAAD
	SEC
	SBC #$10
	STA PlayerYPosDup
bra5_BAAD:
	JMP loc5_BAD0_RTS
bra5_BAB0:
	LDA $28
	CMP #$07
	BCC bra5_BAD0_RTS
	LDA PlayerYPos
	CLC
	ADC #$07
	STA PlayerYPosDup
	LDA PlayerYScreen
	ADC #$00
	STA PlayerYScreenDup
	LDA PlayerYPosDup
	CMP #$F0
	BCC bra5_BAD0_RTS
	CLC
	ADC #$10
	STA PlayerYPosDup
	INC PlayerYScreenDup
bra5_BAD0_RTS:
loc5_BAD0_RTS:
	RTS
tbl5_BAD1:
	.byte $00
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
tbl5_BAE1:
	.byte $01
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
sub5_BAF1:
	LDX PlayerAction
	LDA tbl5_BC2F,X
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
loc5_BB09:
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
	STA PCPointerHiByte
	LDA #$00
	STA PCPointerLoByte
	TYA
	AND #$20
	BNE bra5_BB3D
	LDA DataBank1
	STA M90_PRG0
	JMP loc5_BB43
bra5_BB3D:
	LDA $04F4
	STA M90_PRG0
loc5_BB43:
	LDY $65
	LDA $67
	AND #$F0
	ORA tbl5_BD6D,Y
	TAY
	LDA (PCPointerLoByte),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA $96
	LDA #$27
	STA M90_PRG3
	JSR $E000
	LDA #$3F
	STA M90_PRG3
	LDA $96
	CMP #$F8
	BNE bra5_BB73
	LDA $49
	ORA #$01
	BNE bra5_BB77
bra5_BB73:
	LDA $49
	AND #$FE
bra5_BB77:
	STA $49
	LDA $26
	BEQ bra5_BB80
	JMP loc5_BB09
bra5_BB80:
	LDX PlayerAction
	LDA tbl5_BC2F,X
	ASL
	STA $25
	LDA $65
	SEC
	SBC $25
	STA $65
	LDA PlayerWallColPos
	SBC #$00
	STA PlayerWallColPos
loc5_BB95:
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
	STA PCPointerHiByte
	LDA #$00
	STA PCPointerLoByte
	TYA
	AND #$20
	BNE bra5_BBC9
	LDA DataBank1
	STA M90_PRG0
	JMP loc5_BBCF
bra5_BBC9:
	LDA $04F4
	STA M90_PRG0
loc5_BBCF:
	LDY $65
	LDA $67
	AND #$F0
	ORA tbl5_BD6D,Y
	TAY
	LDA (PCPointerLoByte),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA $96
	LDA PlayerSprYPos
	CMP #$C8
	BCC bra5_BBF0
	LDA #$00
	STA $96
bra5_BBF0:
	LDA #$27
	STA M90_PRG3
	JSR $E000
	LDA #$3F
	STA M90_PRG3
	LDA $96
	CMP #$F8
	BNE bra5_BC09
	LDA $49
	ORA #$02
	BNE bra5_BC0D
bra5_BC09:
	LDA $49
	AND #$FD
bra5_BC0D:
	STA $49
	LDA $26
	BEQ bra5_BC16
	JMP loc5_BB95
bra5_BC16:
	LDX PlayerAction
	LDA $65
	CLC
	ADC tbl5_BC2F,X
	STA PlayerXPosDup
	LDA PlayerWallColPos
	ADC #$00
	STA PlayerXScreenDup
	LDA $67
	STA PlayerYPosDup
	LDA $66
	STA PlayerYScreenDup
	RTS
tbl5_BC2F:
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $00
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $08
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $05
	.byte $0A
sub5_BC50:
	LDY #$10
	LDA PlayerPowerup
	BEQ bra5_BC59
	LDY #$18
bra5_BC59:
	STY $2B
	LDX PlayerAction
	LDA tbl5_BC2F,X
	CLC
	ADC PlayerXPosDup
	STA $65
	LDA PlayerXScreenDup
	ADC #$00
	STA PlayerWallColPos
	LDA PlayerYPosDup
	SEC
	SBC $2B
	STA $67
	BCS bra5_BC7E
	SEC
	SBC #$10
	STA $67
	LDY PlayerYScreenDup
	DEY
	STY $66
bra5_BC7E:
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
	STA PCPointerHiByte
	LDA #$00
	STA PCPointerLoByte
	TYA
	AND #$20
	BNE bra5_BCB2
	LDA DataBank1
	STA M90_PRG0
	JMP loc5_BCB8
bra5_BCB2:
	LDA $04F4
	STA M90_PRG0
loc5_BCB8:
	LDY $65
	LDA $67
	AND #$F0
	ORA tbl5_BD6D,Y
	TAY
	LDA (PCPointerLoByte),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA $96
	JSR sub5_BE6D
	LDX PlayerAction
	LDA tbl5_BC2F,X
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
	STA PCPointerHiByte
	LDA #$00
	STA PCPointerLoByte
	TYA
	AND #$20
	BNE bra5_BD17
	LDA DataBank1
	STA M90_PRG0
	JMP loc5_BD1D
bra5_BD17:
	LDA $04F4
	STA M90_PRG0
loc5_BD1D:
	LDY $65
	LDA $67
	AND #$F0
	ORA tbl5_BD6D,Y
	TAY
	LDA (PCPointerLoByte),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	STA $96
	JSR sub5_BE6D
	JSR sub5_BE91
	LDX PlayerAction
	LDA $65
	CLC
	ADC tbl5_BC2F,X
	STA PlayerXPosDup
	LDA PlayerWallColPos
	ADC #$00
	STA PlayerXScreenDup
	LDY #$10
	LDA PlayerPowerup
	BEQ bra5_BD53
	LDY #$18
bra5_BD53:
	STY $2B
	LDA $67
	CLC
	ADC $2B
	STA PlayerYPosDup
	BCS bra5_BD62
	CMP #$F0
	BCC bra5_BD6C_RTS
bra5_BD62:
	CLC
	ADC #$10
	STA PlayerYPosDup
	LDY $66
	INY
	STY PlayerYScreenDup
bra5_BD6C_RTS:
	RTS
tbl5_BD6D:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $02
	.byte $02
	.byte $02
	.byte $02
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
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
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
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
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
sub5_BE6D:
	LDA $96
	CMP #$70
	BCS bra5_BE83
	CMP #$60
	BCC bra5_BE82_RTS
	AND #$0F
	TAY
	LDA tbl5_BEC5,Y
	BEQ bra5_BE82_RTS
	JMP loc5_BED5
bra5_BE82_RTS:
	RTS
bra5_BE83:
	LDA #$27
	STA M90_PRG3
	JSR $E000
	LDA #$3F
	STA M90_PRG3
	RTS
sub5_BE91:
	LDA $06DE
	BNE bra5_BEAD_RTS
	LDA $06DC
	BNE bra5_BEAD_RTS
	LDA PlayerState
	CMP #$03
	BNE bra5_BEAE
	LDY #$00
	LDA $96
	CMP #$F8
	BEQ bra5_BEAA
	INY
bra5_BEAA:
	STY $06DD
bra5_BEAD_RTS:
	RTS
bra5_BEAE:
	LDA $1E
	CMP #$08
	BNE bra5_BEAD_RTS
	LDA $96
	CMP #$F8
	BNE bra5_BEAD_RTS
	LDA #$00
	STA PlayerYSpeed
	STA PlayerXSpeed
	LDA #$03
	STA PlayerState
	RTS
tbl5_BEC5:
	.byte $01
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
loc5_BED5:
	LDA PlayerMovement
	AND #$04
	BEQ bra5_BF06
	LDA #$04
	EOR #$FF
	AND PlayerMovement
	STA PlayerMovement
	LDA #$10
	STA PlayerYSpeed
	LDA PlayerState
	CMP #$03
	BEQ bra5_BEF1
	LDA #$0F
	STA SFXRegister
bra5_BEF1:
	LDA $67
	CLC
	ADC #$10
	AND #$F0
	STA $67
	CMP #$F0
	BCC bra5_BF05_RTS
	CLC
	ADC #$10
	STA $67
	INC $66
bra5_BF05_RTS:
	RTS
bra5_BF06:
	LDA #$00
	STA PlayerXSpeed
	LDA PlayerXPosDup
	SEC
	SBC $65
	LDA PlayerXScreenDup
	SBC $64
	BMI bra5_BF25
	LDA $65
	CLC
	ADC #$10
	AND #$F0
	STA $65
	LDA PlayerWallColPos
	ADC #$00
	STA PlayerWallColPos
	RTS
bra5_BF25:
	LDA $65
	SEC
	SBC #$10
	ORA #$0F
	STA $65
	LDA PlayerWallColPos
	SBC #$00
bra5_BF32:
	STA PlayerWallColPos
	RTS
	LDA (PCPointerLoByte),Y
	STA PPUData
	DEC $2B
	BNE bra5_BF32
	JSR sub5_BF59
	JMP $BF26
	STA $2B
	JSR sub5_BF59
	LDA (PCPointerLoByte),Y
bra5_BF4B:
	STA PPUData
	DEC $2B
	BNE bra5_BF4B
	JSR sub5_BF59
	JMP $BF26
	RTS
sub5_BF59:
	INC PCPointerLoByte
	BNE bra5_BF5F_RTS
	INC PCPointerHiByte
bra5_BF5F_RTS:
	RTS
	.byte $BA
	.byte $AB
	.byte $04
	STA ObjectState,X
	LDA #$00
	STA $0578,X
	PLA
	PLA
	RTS
	JSR sub5_BF7A
	PLA
	PLA
	RTS
	LDA InvincibilityTimer
	BEQ bra5_BF7A
	RTS
bra5_BF7A:
sub5_BF7A:
	LDX $A4
	LDA ObjectSlot,X
	CMP #$48
	BCC bra5_BF87
	CMP #$4C
	BCC bra5_BF9B
bra5_BF87:
	LDA $05B4,X
	BMI bra5_BF93
	LDA ObjectState,X
	ORA #$40
	BNE bra5_BF98
bra5_BF93:
	LDA ObjectState,X
	AND #$BF
bra5_BF98:
	STA ObjectState,X
bra5_BF9B:
	LDA #$00
	STA PlayerHoldFlag
	LDA Player1YoshiStatus
	BEQ bra5_BFAD
	LDA #$01
	STA HurtFlag
	JMP loc5_BFC0
bra5_BFAD:
	LDA PlayerPowerup
	BEQ bra5_BFD2
	LDA #$00
	STA PlayerPowerup
	LDA #$01
	STA PlayerPowerupBuffer
	LDA #$07
	STA Event
loc5_BFC0:
	LDA #$D0
	STA InvincibilityTimer
	LDA #$0C
	STA SFXRegister
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	RTS
bra5_BFD2:
	LDA #$04
	STA Event
	LDA #$00
	STA EventPart
	STA PlayerState
	STA $06DC
	STA $06DD
	RTS
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
