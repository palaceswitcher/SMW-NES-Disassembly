;disassembled by BZK 6502 Disassembler
	LDA YoshiXPos
	SEC
	SBC PlayerXPosDup
	STA $05F9
	LDA YoshiXScreen
	SBC PlayerXScreenDup
	STA $05FA
	BEQ bra7_8018
	CMP #$FF
	BEQ bra7_8018
	RTS
bra7_8018:
	LDA YoshiYPos
	SEC
	SBC PlayerYPosDup
	STA $05FB
	LDA YoshiYScreen
	SBC PlayerYScreenDup
	STA $05FC
	LDA PlayerYScreenDup
	CMP YoshiYScreen
	BEQ bra7_805A
	LDA $05FC
	BPL bra7_8049
	LDA $05FB
	CLC
	ADC #$10
	STA $05FB
	LDA $05FC
	ADC #$00
	STA $05FC
	JMP loc7_805A
bra7_8049:
	LDA $05FB
	SEC
	SBC #$10
	STA $05FB
	LDA $05FC
	SBC #$00
	STA $05FC
bra7_805A:
loc7_805A:
	LDA YoshiUnmountedState
	AND #$7F
	ASL
	TAY
	LDA tbl7_806E,Y
	STA $32
	LDA tbl7_806F,Y
	STA $33
	JMP ($32)
tbl7_806E:
	.byte $78
tbl7_806F:
	.byte $80
	.byte $79
	.byte $80
	.byte $AB
	.byte $80
	.byte $50
	.byte $81
	.byte $97
	.byte $81
	.byte $60
	LDA FrameCount
	AND #$07
	BNE bra7_80905_RTS
	LDA $05F6
	AND #$0F
	TAX
	LDA tbl7_80A2,X
	BMI bra7_8091
	STA YoshiAnimation
	INC $05F6
bra7_80905_RTS:
	RTS
bra7_8091:
	INC YoshiUnmountedState
	LDA $05F6
	AND #$F0
	STA $05F6
	LDA #$00
	STA FreezeFlag
	RTS
tbl7_80A2:
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $02
	.byte $03
	.byte $02
	.byte $03
	.byte $80
	LDX $05F6
	LDA tbl7_813C,X
	CMP #$02
	BNE bra7_80C5
	JSR $B758
	BNE bra7_80C5
	LDA #$04
	STA YoshiUnmountedState
	LDA #$00
	STA $05F7
	RTS
bra7_80C5:
	JSR sub7_820C
	LDA FrameCount
	AND #$03
	BEQ bra7_80CF
	RTS
bra7_80CF:
	LDA $05F6
	AND #$0F
	TAY
	LDA tbl7_8127,Y
	BPL bra7_80E7
	LDA $05F6
	AND #$F0
	STA $05F6
	LDY #$00
	LDA $8127
bra7_80E7:
	LDX YoshiIdleStorage
	CPX #$01
	BEQ bra7_80F0
	LDA #$09
bra7_80F0:
	STA YoshiAnimation
	LDA tbl7_813C,Y
	BMI bra7_8111
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS bra7_8105
	CMP #$F0
	BCC bra7_8123
bra7_8105:
	CLC
	ADC #$10
	STA YoshiYPos
	INC YoshiYScreen
	JMP loc7_8123
bra7_8111:
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS bra7_8123
	SEC
	SBC #$10
	STA YoshiYPos
	DEC YoshiYScreen
bra7_8123:
loc7_8123:
	INC $05F6
	RTS
tbl7_8127:
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
	.byte $80
tbl7_813C:
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
	LDA #$22
	JSR $B5CD
	JSR sub7_820C
	LDA FrameCount
	AND #$03
	BNE bra7_81895_RTS
	LDA $05F6
	AND #$0F
	TAY
	LDA tbl7_818A,Y
	BPL bra7_8176
	LDA $05F6
	AND #$F0
	STA $05F6
	LDY #$00
	LDA $818A
bra7_8176:
	LDX YoshiIdleStorage
	CPX #$01
	BEQ bra7_8183
	TYA
	AND #$01
	CLC
	ADC #$0A
bra7_8183:
	STA YoshiAnimation
	INC $05F6
bra7_81895_RTS:
	RTS
tbl7_818A:
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $07
	.byte $08
	.byte $80
	JSR $B758
	BNE bra7_81DE
	LDA #$06
	STA YoshiAnimation
	LDA $05F7
	AND #$7F
	CMP #$07
	BCS bra7_81AD
	INC $05F7
bra7_81AD:
	LDA $05F7
	BMI bra7_81CB
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS bra7_81BF
	CMP #$F0
	BCC bra7_81DD5_RTS
bra7_81BF:
	CLC
	ADC #$10
	STA YoshiYPos
	INC YoshiYScreen
	JMP loc7_81DD5_RTS
bra7_81CB:
	.byte $18
	.byte $6D
	.byte $F4
	.byte $05
	.byte $8D
	.byte $F4
	.byte $05
	.byte $B0
	.byte $09
	.byte $38
	.byte $E9
	.byte $10
	.byte $8D
	.byte $F4
	.byte $05
	.byte $CE
	.byte $F5
	.byte $05
bra7_81DD5_RTS:
loc7_81DD5_RTS:
	RTS
bra7_81DE:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA YoshiYPos
	SEC
	SBC $25
	BCS bra7_81F4
	DEC YoshiYScreen
	SEC
	SBC #$10
bra7_81F4:
	STA YoshiYPos
	LDA #$00
	STA $05F7
	LDY #$02
	LDA $50
	BEQ bra7_8208
	LDA #$00
	STA $50
	LDY #$03
bra7_8208:
	STY YoshiUnmountedState
	RTS
sub7_820C:
	LDA PlayerHoldFlag
	BNE bra7_827B5_RTS
	LDA YoshiIdleMovement
	AND #$40
	BNE bra7_8222
	LDA YoshiXPos
	CLC
	ADC #$10
	PHA
	JMP loc7_8229
bra7_8222:
	LDA YoshiXPos
	CLC
	ADC #$24
	PHA
loc7_8229:
	LDA YoshiXScreen
	ADC #$00
	STA $34
	PLA
	SEC
	SBC PlayerXPosDup
	STA $32
	LDA $34
	SBC PlayerXScreenDup
	BNE bra7_826C
	LDA $32
	CMP #$14
	BCS bra7_826C
	LDA YoshiYPos
	CLC
	ADC #$10
	PHA
	LDA YoshiYScreen
	ADC #$00
	STA $34
	PLA
	SEC
	SBC PlayerYPosDup
	STA $32
	LDA $34
	SBC PlayerYScreenDup
	BNE bra7_826C
	LDA $32
	CMP #$08
	BCS bra7_826C
	LDA PlayerMovement
	AND #$04
	BNE bra7_826C
	LDA #$06
	STA PlayerState
bra7_826C:
	LDA PlayerState
	CMP #$07
	BNE bra7_827B5_RTS
	LDA #$00
	STA YoshiUnmountedState
	LDA #$0D
	STA SFXRegister
bra7_827B5_RTS:
	RTS
	LDA $05FA
	BEQ bra7_8286
	CMP #$FF
	BEQ bra7_8286
	RTS
bra7_8286:
	LDA YoshiUnmountedState
	BNE bra7_828C
	RTS
bra7_828C:
	LDA YoshiAnimation
	ASL
	TAX
	LDA tbl7_82A2,X
	STA $32
	LDA tbl7_82A3,X
	STA $33
	LDA #$40
	STA $36
	JMP $A463
tbl7_82A2:
	.byte $BA
tbl7_82A3:
	.byte $82
	.byte $C5
	.byte $82
	.byte $D0
	.byte $82
	.byte $E3
	.byte $82
	.byte $F6
	.byte $82
	.byte $09
	.byte $83
	.byte $1C
	.byte $83
	.byte $2F
	.byte $83
	.byte $42
	.byte $83
	.byte $55
	.byte $83
	.byte $68
	.byte $83
	.byte $7B
	.byte $83
	.byte $02
	.byte $04
	.byte $90
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $37
	.byte $38
	.byte $39
	.byte $3A
	.byte $02
	.byte $04
	.byte $90
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $04
	.byte $04
	.byte $92
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $B1
	.byte $B2
	.byte $FF
	.byte $B3
	.byte $B4
	.byte $B5
	.byte $B6
	.byte $FF
	.byte $B7
	.byte $AF
	.byte $B0
	.byte $04
	.byte $04
	.byte $92
	.byte $FF
	.byte $B8
	.byte $B9
	.byte $FF
	.byte $BA
	.byte $BB
	.byte $AB
	.byte $FF
	.byte $FF
	.byte $AC
	.byte $AD
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $AF
	.byte $B0
	.byte $04
	.byte $04
	.byte $A0
	.byte $FF
	.byte $2B
	.byte $2C
	.byte $FF
	.byte $2D
	.byte $2E
	.byte $2F
	.byte $FF
	.byte $FF
	.byte $30
	.byte $31
	.byte $32
	.byte $FF
	.byte $FF
	.byte $33
	.byte $34
	.byte $04
	.byte $04
	.byte $91
	.byte $FF
	.byte $76
	.byte $77
	.byte $FF
	.byte $78
	.byte $79
	.byte $7A
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $6D
	.byte $6E
	.byte $FF
	.byte $FF
	.byte $6F
	.byte $70
	.byte $04
	.byte $04
	.byte $93
	.byte $FF
	.byte $F8
	.byte $F9
	.byte $FF
	.byte $FA
	.byte $FB
	.byte $EB
	.byte $FF
	.byte $FF
	.byte $EC
	.byte $ED
	.byte $EE
	.byte $FF
	.byte $FF
	.byte $EF
	.byte $F0
	.byte $04
	.byte $04
	.byte $91
	.byte $71
	.byte $72
	.byte $73
	.byte $FF
	.byte $FF
	.byte $74
	.byte $75
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $6D
	.byte $6E
	.byte $FF
	.byte $FF
	.byte $6F
	.byte $70
	.byte $04
	.byte $04
	.byte $93
	.byte $F1
	.byte $F2
	.byte $F3
	.byte $FF
	.byte $F4
	.byte $F5
	.byte $F6
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $F7
	.byte $EE
	.byte $FF
	.byte $FF
	.byte $EF
	.byte $F0
	.byte $04
	.byte $04
	.byte $A0
	.byte $FF
	.byte $36
	.byte $37
	.byte $FF
	.byte $38
	.byte $39
	.byte $3A
	.byte $FF
	.byte $FF
	.byte $3B
	.byte $3C
	.byte $3D
	.byte $FF
	.byte $FF
	.byte $3F
	.byte $35
	.byte $04
	.byte $04
	.byte $A3
	.byte $FF
	.byte $FA
	.byte $F9
	.byte $FF
	.byte $FF
	.byte $FB
	.byte $FC
	.byte $FF
	.byte $FF
	.byte $FD
	.byte $FE
	.byte $EB
	.byte $FF
	.byte $FF
	.byte $F4
	.byte $F3
	.byte $04
	.byte $04
	.byte $9B
	.byte $F7
	.byte $F8
	.byte $F9
	.byte $FF
	.byte $FA
	.byte $FB
	.byte $FC
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FD
	.byte $F2
	.byte $FF
	.byte $FF
	.byte $EB
	.byte $F5
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_83AC
	CMP #$FF
	BEQ bra7_83AC
	JMP $A6B5
bra7_83AC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_83EE
	LDA $05DC,X
	BPL bra7_83DD
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_83EE
bra7_83DD:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_83EE:
loc7_83EE:
	JSR $BD3D
	LDA Player1YoshiStatus
	BNE bra7_83FB
	LDA YoshiUnmountedState
	BEQ bra7_840B
bra7_83FB:
	LDA #$05
	STA ObjectSlot,X
	LDA #$00
	STA $0578,X
	LDA #$04
	STA ObjectState,X
	RTS
bra7_840B:
	LDA FrameCount
	AND #$03
	BNE bra7_8416
	LDA #$01
	JSR $B11D
bra7_8416:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8432
	CMP #$FF
	BEQ bra7_8432
	JMP $A6B5
bra7_8432:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8474
	LDA $05DC,X
	BPL bra7_8463
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8474
bra7_8463:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8474:
loc7_8474:
	LDA #$01
	STA FreezeFlag
	LDA $0578,X
	AND #$7F
	CMP #PlayerAnimationFrame
	BCC bra7_84C25_RTS
	LDA #$00
	STA ObjectSlot,X
	STA $05F7
	STA $05F6
	STA YoshiIdleMovement
	STA YoshiAnimation
	LDA #$01
	STA YoshiUnmountedState
	LDA ObjectXPos,X
	STA YoshiXPos
	LDA ObjectXScreen,X
	STA YoshiXScreen
	SEC
	LDA ObjectYPos,X
	CMP #$10
	BCS bra7_84B1
	SBC #$20
	JMP loc7_84B3
bra7_84B1:
	SBC #$10
loc7_84B3:
	STA YoshiYPos
	LDA ObjectYScreen,X
	SBC #$00
	STA YoshiYScreen
	LDA #$0D
	STA SFXRegister
bra7_84C25_RTS:
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_84E1
	CMP #$FF
	BEQ bra7_84E1
	JMP $A6B5
bra7_84E1:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8523
	LDA $05DC,X
	BPL bra7_8512
	LDA $05C8,X
	CLC	;logged as data
	ADC #$10	;logged as data
	STA $05C8,X	;logged as data
	LDA $05DC,X	;logged as data
	ADC #$00
	STA $05DC,X
	JMP loc7_8523
bra7_8512:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8523:
loc7_8523:
	LDA FreezeFlag
	BEQ bra7_8529
	RTS
bra7_8529:
	JSR $BD3D
	LDA #$02
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_854E
	CMP #$FF
	BEQ bra7_854E
	JMP $A6B5
bra7_854E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8590
	LDA $05DC,X
	BPL bra7_857F
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8590
bra7_857F:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8590:
loc7_8590:
	LDA FreezeFlag
	BEQ bra7_8596
	RTS
bra7_8596:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_85AA,Y
	STA $32
	LDA tbl7_85AB,Y
	STA $33
	JMP ($32)
tbl7_85AA:
	.byte $BB
tbl7_85AB:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $5D
	.byte $AB
	.byte $B8
	.byte $85
	.byte $17
	.byte $AE
	.byte $89
	.byte $86
	.byte $95
	.byte $86
	JSR $AB92
	LDA FrameCount
	AND #$00
	BNE bra7_85C6
	LDA #$27
	JSR $B1DA
bra7_85C6:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_85E2
	CMP #$FF
	BEQ bra7_85E2
	JMP $A6B5
bra7_85E2:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8624
	LDA $05DC,X
	BPL bra7_8613
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8624
bra7_8613:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8624:
loc7_8624:
	LDA FreezeFlag
	BEQ bra7_862A
	RTS
bra7_862A:
	JSR $A6D4
	JSR $A773
	JSR $AB6B
	LDA PlayerYSpeed
	BEQ bra7_8653
	LDA PlayerMovement
	AND #$04
	BNE bra7_86525_RTS
	LDA #$01
	STA $0633
	LDA #$1E
	STA $0635
	LDA #$0F
	STA SFXRegister
	LDA #$00
	LDX $A4
	STA ObjectSlot,X
bra7_86525_RTS:
	RTS
bra7_8653:
	LDA Player1YoshiStatus
	BEQ bra7_866B
	LDA #$20
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA PlayerAction
	LDA #$03
	STA SFXRegister
	RTS
bra7_866B:
	LDA PlayerMovement
	AND #$01
	BNE bra7_867E
	LDA $05B4,X
	BMI bra7_86885_RTS
	LDA #$01
	STA $06EF
	JMP loc7_86885_RTS
bra7_867E:
	LDA $05B4,X
	BPL bra7_86885_RTS
	LDA #$01
	STA $06EF
bra7_86885_RTS:
loc7_86885_RTS:
	RTS
	LDA FrameCount
	AND #$00
	BNE bra7_86945_RTS
	LDA #$26
	JSR $B1DA
bra7_86945_RTS:
	RTS
	LDA FrameCount
	AND #$00
	BNE bra7_86A0
	LDA #$04
	JSR $B1DA
bra7_86A0:
	LDA ObjectState,X
	AND #$20
	BEQ bra7_86F25_RTS
	LDA $05B4,X
	BPL bra7_86B9
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC $05A0,X
	BCS bra7_86C0
	BCC bra7_86E0
bra7_86B9:
	LDA $05A0,X
	CMP #$10
	BCS bra7_86E0
bra7_86C0:
	LDA $05DC,X
	BEQ bra7_86D6
	CMP #$FF
	BNE bra7_86E0
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC $05C8,X
	BCS bra7_86DD
	BCC bra7_86E0
bra7_86D6:
	LDA $05C8,X
	CMP #$00
	BCS bra7_86E0
bra7_86DD:
	CLC
	BCC bra7_86E1
bra7_86E0:
	SEC
bra7_86E1:
	BCS bra7_86F25_RTS
	LDA ObjectState,X
	AND #$40
	ORA #$04
	STA ObjectState,X
	LDA #$00
	STA $0578,X
bra7_86F25_RTS:
	RTS
	LDA #$03
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8715
	CMP #$FF
	BEQ bra7_8715
	JMP $A6B5
bra7_8715:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8757
	LDA $05DC,X
	BPL bra7_8746
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8757
bra7_8746:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8757:
loc7_8757:
	LDA FreezeFlag
	BEQ bra7_875D
	.byte $60
bra7_875D:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_8771,Y
	STA $32
	LDA tbl7_8772,Y
	STA $33
	JMP ($32)
tbl7_8771:
	.byte $BB
tbl7_8772:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $5D
	.byte $AB
	.byte $89
	.byte $87
	.byte $17
	.byte $AE
	.byte $4C
	.byte $88
	.byte $95
	.byte $86
	.byte $BC
	.byte $88
	.byte $BC
	.byte $88
	.byte $BC
	.byte $88
	.byte $31
	.byte $89
	.byte $C1
	.byte $89
	JSR $AB92
	LDA FrameCount
	AND #$00
	BNE bra7_8797
	LDA #$27
	JSR $B1DA
bra7_8797:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_87B3
	CMP #$FF
	BEQ bra7_87B3
	JMP $A6B5
bra7_87B3:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_87F5
	LDA $05DC,X
	BPL bra7_87E4
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_87F5
bra7_87E4:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_87F5:
loc7_87F5:
	LDA FreezeFlag
	BEQ bra7_87FB
	RTS
bra7_87FB:
	JSR $A6D4
	JSR $A773
	JSR $AB6B
	LDA PlayerYSpeed
	BEQ bra7_881E
	LDA PlayerMovement
	AND #$04
	BNE bra7_881D5_RTS
	LDA #$00
	STA PlayerYSpeed
	LDX $A4
	LDA ObjectState,X
	CLC
	ADC #$04
	STA ObjectState,X
bra7_881D5_RTS:
	RTS
bra7_881E:
	LDA Player1YoshiStatus
	BEQ bra7_882E
	LDA #$20
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	RTS
bra7_882E:
	LDA PlayerMovement
	AND #$01
	BNE bra7_8841
	LDA $05B4,X
	BMI bra7_884B5_RTS
	LDA #$01
	STA $06EF
	JMP loc7_884B5_RTS
bra7_8841:
	LDA $05B4,X
	BPL bra7_884B5_RTS
	LDA #$01
	STA $06EF
bra7_884B5_RTS:
loc7_884B5_RTS:
	RTS
	LDA FrameCount
	AND #$00
	BNE bra7_8857
	LDA #$26
	JSR $B1DA
bra7_8857:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8873
	CMP #$FF
	BEQ bra7_8873
	JMP $A6B5
bra7_8873:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_88B5
	LDA $05DC,X
	BPL bra7_88A4
	LDA $05C8,X	;logged as data
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_88B5
bra7_88A4:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_88B5:
loc7_88B5:
	LDA FreezeFlag
	BEQ bra7_88BB5_RTS
	RTS
bra7_88BB5_RTS:
	RTS
	LDA FrameCount
	AND #$00
	BNE bra7_88C7
	LDA #$27
	JSR $B1DA
bra7_88C7:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_88E3
	CMP #$FF
	BEQ bra7_88E3
	JMP $A6B5
bra7_88E3:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8925
	LDA $05DC,X
	BPL bra7_8914
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8925
bra7_8914:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8925:
loc7_8925:
	LDA FreezeFlag
	BEQ bra7_892B
	RTS
bra7_892B:
	LDX $A4
	INC ObjectState,X
	RTS
	LDA FrameCount
	AND #$00
	BNE bra7_893C
	LDA #$27
	JSR $B1DA
bra7_893C:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8958
	CMP #$FF
	BEQ bra7_8958
	JMP $A6B5
bra7_8958:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_899A
	LDA $05DC,X
	BPL bra7_8989
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_899A
bra7_8989:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_899A:
loc7_899A:
	LDA FreezeFlag
	BEQ bra7_89A0
	RTS
bra7_89A0:
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDY #$50
	LDA ButtonsHeld
	AND #$80
	BEQ bra7_89B1
	LDY #$70
bra7_89B1:
	STY PlayerYSpeed
	LDA #$04
	STA PlayerAction
	LDX $A4
	INC ObjectState,X
	LDA #$04
	STA SFXRegister
	RTS
	LDA FrameCount
	AND #$00
	BNE bra7_89CC
	LDA #$27
	JSR $B1DA
bra7_89CC:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_89E8
	CMP #$FF
	BEQ bra7_89E8
	JMP $A6B5
bra7_89E8:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8A2A
	LDA $05DC,X
	BPL bra7_8A19
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8A2A
bra7_8A19:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8A2A:
loc7_8A2A:
	LDA FreezeFlag
	BEQ bra7_8A30
	RTS
bra7_8A30:
	LDX $A4
	LDA ObjectState,X
	AND #$E0
	ORA #$03
	STA ObjectState,X
	RTS
	LDX $A4
	LDA $0641,X
	CMP #$F0
	BCC bra7_8A60
	LDA ObjectSlot,X
	AND #$01
	CLC
	ADC #$42
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	STA $0578,X
	STA PlayerHoldFlag
	STA $0641,X
	RTS
bra7_8A60:
	LDA $062B
	AND #$03
	BNE bra7_8A6A
	INC $0641,X
bra7_8A6A:
	LDA #$04
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8A8C
	CMP #$FF
	BEQ bra7_8A8C
	JMP $A6B5
bra7_8A8C:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8ACE
	LDA $05DC,X
	BPL bra7_8ABD
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8ACE
bra7_8ABD:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8ACE:
loc7_8ACE:
	LDA FreezeFlag
	BEQ bra7_8AD4
	RTS
bra7_8AD4:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_8AE8,Y
	STA $32
	LDA tbl7_8AE9,Y
	STA $33
	JMP ($32)
tbl7_8AE8:
	.byte $BB
tbl7_8AE9:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $FA
	.byte $8A
	.byte $88
	.byte $AD
	.byte $55
	.byte $8B
	.byte $79
	.byte $AD
	.byte $7D
	.byte $8B
	.byte $91
	.byte $8B
	JSR $AC20
	JSR $A6D4
	JSR $A773
	JSR $AB6B
	LDA Player1YoshiStatus
	BEQ bra7_8B3F
	LDA PlayerYSpeed
	BEQ bra7_8B34
	LDA PlayerMovement
	AND #$04
	BNE bra7_8B335_RTS
bra7_8B15:
	LDA #$20
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA PlayerAction
	LDA #$0F
	STA SFXRegister
	LDX $A4
	LDA #$0F
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
bra7_8B335_RTS:
	RTS
bra7_8B34:
	LDA #$20
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	RTS
bra7_8B3F:
	LDA $1E
	CMP #$05
	BEQ bra7_8B15
	INC ObjectState,X
	INC ObjectState,X
	LDA PlayerHoldFlag
	BNE bra7_8B335_RTS
	LDA #$15
	STA SFXRegister
	RTS
	LDX $A4
	LDA ObjectSlot,X
	CMP #$04
	BEQ bra7_8B66
	INC ObjectSlot,X
	INC ObjectSlot,X
	BNE bra7_8B6B
bra7_8B66:
	LDA #$38
	STA ObjectSlot,X
bra7_8B6B:
	LDA #$00
	LDY $05B4,X
	BPL bra7_8B74
	LDA #$40
bra7_8B74:
	STA ObjectState,X
	LDA #$80
	STA $0578,X
	RTS
	LDA FrameCount
	AND #$00
	BNE bra7_8B88
	LDA #$04
	JSR $B1DA
bra7_8B88:
	LDA #$10
	JSR $AEA8
	JSR $AD54
	RTS
	LDA FrameCount
	AND #$00
	BNE bra7_8B9C5_RTS
	LDA #$27
	JSR $B1DA
bra7_8B9C5_RTS:
	RTS
	LDX $A4
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BNE bra7_8BAB
	JMP loc7_8C42
bra7_8BAB:
	LDA FrameCount
	AND #$00
	BNE bra7_8BB6
	LDA #$25
	JSR $B1DA
bra7_8BB6:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8BD2
	CMP #$FF
	BEQ bra7_8BD2
	JMP $A6B5
bra7_8BD2:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8C14
	LDA $05DC,X
	BPL bra7_8C03
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8C14
bra7_8C03:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8C14:
loc7_8C14:
	LDA FreezeFlag
	BEQ bra7_8C1A
	RTS
bra7_8C1A:
	LDA $0578,X
	BPL bra7_8C36
	LDA $05A0,X
	BPL bra7_8C29
	EOR #$FF
	CLC
	ADC #$01
bra7_8C29:
	CMP #$18
	BCC bra7_8C415_RTS
	LDA $0578,X
	AND #$7F
	STA $0578,X
	RTS
bra7_8C36:
	JSR sub7_8C42
	LDA #$10
	JSR $AEA8
	JSR $AD54
bra7_8C415_RTS:
	RTS
loc7_8C42:
sub7_8C42:
	LDA #$04
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8C64
	CMP #$FF
	BEQ bra7_8C64
	JMP $A6B5
bra7_8C64:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8CA6
	LDA $05DC,X
	BPL bra7_8C95
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8CA6
bra7_8C95:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8CA6:
loc7_8CA6:
	LDA FreezeFlag
	BEQ bra7_8CAC
	RTS
bra7_8CAC:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_8CC0,Y
	STA $32
	LDA tbl7_8CC1,Y
	STA $33
	JMP ($32)
tbl7_8CC0:
	.byte $BB
tbl7_8CC1:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $CA
	.byte $8C
	.byte $88
	.byte $AD
	JSR $A6D4
	JSR $BEBC
	JSR $A74D
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA ObjectSlot,X
	CMP #$38
	BEQ bra7_8CEB
	AND #$01
	CLC
	ADC #$44
	BNE bra7_8CED
bra7_8CEB:
	LDA #$04
bra7_8CED:
	STA ObjectSlot,X
	LDA ObjectState,X
	AND #$C0
	STA ObjectState,X
	LDA #$00
	STA $0578,X
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8D1C
	CMP #$FF
	BEQ bra7_8D1C
	JMP $A6B5
bra7_8D1C:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8D5E
	LDA $05DC,X
	BPL bra7_8D4D
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8D5E
bra7_8D4D:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8D5E:
loc7_8D5E:
	LDA FreezeFlag
	BEQ bra7_8D64
	RTS
bra7_8D64:
	JSR $BD3D
	JMP loc7_8DD0
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8D88
	CMP #$FF
	BEQ bra7_8D88
	JMP $A6B5
bra7_8D88:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8DCA
	LDA $05DC,X
	BPL bra7_8DB9
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8DCA
bra7_8DB9:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8DCA:
loc7_8DCA:
	LDA FreezeFlag
	BEQ bra7_8DD0
	RTS
bra7_8DD0:
loc7_8DD0:
	JSR sub7_8DEA
	LDX $A4
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BCS bra7_8DE95_RTS
	LDA FrameCount
	AND #$01
	BNE bra7_8DE95_RTS
	LDA #$0B
	JSR $B1DA
bra7_8DE95_RTS:
	RTS
sub7_8DEA:
	LDA #$06
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_8E02,Y
	STA $32
	LDA tbl7_8E03,Y
	STA $33
	JMP ($32)
tbl7_8E02:
	.byte $BB
tbl7_8E03:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $0C
	.byte $8E
	.byte $21
	.byte $8E
	JSR $A773
	INC Player1Lives
	LDA #$07
	STA SFXRegister
	LDA #$00
	STA ObjectSlot,X
	LDA #$03
	JSR $BCD4
	RTS
	LDA $0578,X
	CMP #$0E
	BCS bra7_8E34
	LDA FrameCount
	AND #$03
	BNE bra7_8E335_RTS
	LDA #$05
	JSR $B1DA
bra7_8E335_RTS:
	RTS
bra7_8E34:
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	LDA #$00
	STA $0578,X
	RTS
	LDX $A4
	JSR sub7_8F50
	LDX $A4
	LDA ObjectSlot,X
	BEQ bra7_8E8B
	JSR $B057
	BEQ bra7_8E5B
	CMP #$04
	BEQ bra7_8E5B
	CMP #$02
	BNE bra7_8E7F
bra7_8E5B:
	LDA FrameCount
	AND #$00
	BNE bra7_8E66
	LDA #$06
	JSR $B1DA
bra7_8E66:
	LDA #$08
	JSR $AEA8
	LDA ObjectSlot,X
	CMP #$70
	BEQ bra7_8E7F
	CMP #$42
	BCS bra7_8E7A
	CMP #$3A
	BCS bra7_8E7F
bra7_8E7A:
	LDA #$00
	STA ObjectSlot,X
bra7_8E7F:
	LDY $A4
	LDA #$0F
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectState,Y
bra7_8E8B:
	STA FireballSlot
	RTS
	LDX $A4
	JSR sub7_8F50
	LDX $A4
	LDA ObjectSlot,X
	BEQ bra7_8ED8
	JSR $B057
	BEQ bra7_8EA8
	CMP #$04
	BEQ bra7_8EA8
	CMP #$02
	BNE bra7_8ECC
bra7_8EA8:
	LDA FrameCount
	AND #$00
	BNE bra7_8EB3
	LDA #$06
	JSR $B1DA
bra7_8EB3:
	LDA #$08
	JSR $AEA8
	LDA ObjectSlot,X
	CMP #$70
	BEQ bra7_8ECC
	CMP #$42
	BCS bra7_8EC7
	CMP #$3A
	BCS bra7_8ECC
bra7_8EC7:
	LDA #$00
	STA ObjectSlot,X
bra7_8ECC:
	LDY $A4
	LDA #$0F
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectState,Y
bra7_8ED8:
	STA FireballSlot2
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8EFA
	CMP #$FF
	BEQ bra7_8EFA
	JMP $A6B5
bra7_8EFA:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8F3C
	LDA $05DC,X
	BPL bra7_8F2B
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8F3C
bra7_8F2B:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8F3C:
loc7_8F3C:
	LDA FreezeFlag
	BEQ bra7_8F42
	RTS
bra7_8F42:
	JSR sub7_9538
	LDA #$10
	JSR $AEA8
	LDA #$00
	STA ObjectSlot,X
	RTS
sub7_8F50:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8F6C
	CMP #$FF
	BEQ bra7_8F6C
	JMP $A6B5
bra7_8F6C:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8FAE
	LDA $05DC,X
	BPL bra7_8F9D
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_8FAE
bra7_8F9D:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_8FAE:
loc7_8FAE:
	LDA FreezeFlag
	BEQ bra7_8FB45_RTS
	RTS
bra7_8FB45_RTS:
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_8FD3
	CMP #$FF
	BEQ bra7_8FD3
	JMP $A6B5
bra7_8FD3:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9015
	LDA $05DC,X
	BPL bra7_9004
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9015
bra7_9004:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9015:
loc7_9015:
	LDA FreezeFlag
	BEQ bra7_901B
	RTS
bra7_901B:
	JSR sub7_9538
	LDA ObjectYPos,X
	CLC
	ADC #$01
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,X
	LDA #$10
	JSR $AEA8
	LDA #$00
	STA ObjectSlot,X
	RTS
	LDX $A4
	JSR sub7_9538
	LDA ObjectYPos,X
	SEC
	SBC #$01
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	JSR sub7_8F50
	LDA #$10
	JSR $AEA8
	LDA #$00
	STA ObjectSlot,X
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_907C
	CMP #$FF
	BEQ bra7_907C
	JMP $A6B5
bra7_907C:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_90BE
	LDA $05DC,X
	BPL bra7_90AD
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_90BE
bra7_90AD:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_90BE:
loc7_90BE:
	LDA FreezeFlag
	BEQ bra7_90C4
	RTS
bra7_90C4:
	JSR sub7_9149
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_90E6
	CMP #$FF
	BEQ bra7_90E6
	JMP $A6B5
bra7_90E6:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9128
	LDA $05DC,X
	BPL bra7_9117
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9128
bra7_9117:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9128:
loc7_9128:
	LDA FreezeFlag
	BEQ bra7_912E
	RTS
bra7_912E:
	JSR $BD3D
	JSR sub7_9149
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BCS bra7_91485_RTS
	LDA FrameCount
	AND #$01
	BNE bra7_91485_RTS
	LDA #$0B
	JSR $B1DA
bra7_91485_RTS:
	RTS
sub7_9149:
	LDA #$06
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9161,Y
	STA $32
	LDA tbl7_9162,Y
	STA $33
	JMP ($32)
tbl7_9161:
	.byte $BB
tbl7_9162:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $6B
	.byte $91
	.byte $7C
	.byte $91
	JSR $A773
	JSR $AE37
	LDA #$00
	STA ObjectSlot,Y
	LDA #$03
	JSR $BCD4
	RTS
	LDA $0578,X
	CMP #$0E
	BCS bra7_91A2
	LDA ObjectSlot,X
	CMP #$39
	BNE bra7_9196
	LDA FrameCount
	AND #$00
	BNE bra7_91955_RTS
	LDA #$2A
	JSR $B1DA
bra7_91955_RTS:
	RTS
bra7_9196:
	LDA FrameCount
	AND #$03
	BNE bra7_91A15_RTS
	LDA #$05
	JSR $B1DA
bra7_91A15_RTS:
	RTS
bra7_91A2:
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	LDA #$00
	STA $0578,X
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_91CE
	CMP #$FF
	BEQ bra7_91CE
	JMP $A6B5
bra7_91CE:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9210
	LDA $05DC,X
	BPL bra7_91FF
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9210
bra7_91FF:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9210:
loc7_9210:
	LDA FreezeFlag
	BEQ bra7_9216
	RTS
bra7_9216:
	JSR $BD3D
	LDA FrameCount
	AND #$03
	BNE bra7_9224
	LDA #$0C
	JSR $B11D
bra7_9224:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_9240
	CMP #$FF
	BEQ bra7_9240
	.byte $4C
	.byte $B5
	.byte $A6
bra7_9240:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9282
	LDA $05DC,X
	BPL bra7_9271
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9282
bra7_9271:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9282:
loc7_9282:
	LDA FreezeFlag
	BEQ bra7_9288
	RTS
bra7_9288:
	LDA $0578,X
	CMP #$0F
	BCS bra7_9290
	RTS
bra7_9290:
	LDA #$06
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_92A8,Y
	STA $32
	LDA tbl7_92A9,Y
	STA $33
	JMP ($32)
tbl7_92A8:
	.byte $BB
tbl7_92A9:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $B2
	.byte $92
	.byte $C3
	.byte $92
	JSR $A773
	JSR $AE37
	LDA #$00
	STA ObjectSlot,Y
	LDA #$03
	JSR $BCD4
	RTS
	LDX $A4
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_92EC
	CMP #$FF
	BEQ bra7_92EC
	JMP $A6B5
bra7_92EC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_932E
	LDA $05DC,X
	BPL bra7_931D
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_932E
bra7_931D:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_932E:
loc7_932E:
	LDA FreezeFlag
	BEQ bra7_9334
	RTS
bra7_9334:
	JSR $BD3D
	LDA FrameCount
	AND #$03
	BNE bra7_9342
	LDA #$0D
	JSR $B470
bra7_9342:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_935E
	CMP #$FF
	BEQ bra7_935E
	JMP $A6B5
bra7_935E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_93A0
	LDA $05DC,X
	BPL bra7_938F
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_93A0
bra7_938F:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_93A0:
loc7_93A0:
	LDA FreezeFlag
	BEQ bra7_93A6
	RTS
bra7_93A6:
	LDA $0578,X
	CMP #$0F
	BCS bra7_93AE
	RTS
bra7_93AE:
	LDA #$06
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_93C6,Y
	STA $32
	LDA tbl7_93C7,Y
	STA $33
	JMP ($32)
tbl7_93C6:
	.byte $BB
tbl7_93C7:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $D0
	.byte $93
	.byte $C3
	.byte $92
	JSR $A773
	JSR $AE37
	LDA #$00
	STA ObjectSlot,Y
	LDA #$03
	JSR $BCD4
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_93FF
	CMP #$FF
	BEQ bra7_93FF
	JMP $A6B5
bra7_93FF:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9441
	LDA $05DC,X
	BPL bra7_9430
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9441
bra7_9430:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9441:
loc7_9441:
	LDA FreezeFlag
	BEQ bra7_9447
	RTS
bra7_9447:
	JSR $BD3D
	JSR sub7_9462
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BCS bra7_94615_RTS
	LDA FrameCount
	AND #$01
	BNE bra7_94615_RTS
	LDA #$0E
	JSR $B1DA
bra7_94615_RTS:
	RTS
sub7_9462:
	LDA #$06
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_947A,Y
	STA $32
	LDA tbl7_947B,Y
	STA $33
	JMP ($32)
tbl7_947A:
	.byte $BB
tbl7_947B:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $84
	.byte $94
	.byte $97
	.byte $94
	JSR $A773
	LDA #$01
	STA InvincibilityTimer
	LDA #$00
	STA ObjectSlot,X
	LDA #$03
	JSR $BCD4
	RTS
	LDA $0578,X
	CMP #$0E
	BCS bra7_94AA
	LDA FrameCount
	AND #$03
	BNE bra7_94A95_RTS
	LDA #$05
	JSR $B1DA
bra7_94A95_RTS:
	RTS
bra7_94AA:
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	LDA #$00
	STA $0578,X
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_94D6
	CMP #$FF
	BEQ bra7_94D6
	JMP $A6B5
bra7_94D6:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9518
	LDA $05DC,X
	BPL bra7_9507
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9518
bra7_9507:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9518:
loc7_9518:
	LDA FreezeFlag
	BEQ bra7_951E
	RTS
bra7_951E:
	LDA ObjectState,X
	BNE bra7_9527
	LDY #$0F
	STY SFXRegister
bra7_9527:
	CMP #$10
	BCC bra7_9534
	LDA #$00
	STA ObjectSlot,X
	STA ObjectState,X
	RTS
bra7_9534:
	INC ObjectState,X
	RTS
sub7_9538:
	LDA ObjectState,X
	AND #$40
	BEQ bra7_9550
	LDA ObjectXPos,X
	SEC
	SBC #$03
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	SBC #$00
	JMP loc7_955E
bra7_9550:
	LDA ObjectXPos,X
	CLC
	ADC #$03
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
loc7_955E:
	STA ObjectXScreen,X
	RTS
	JSR sub7_9792
	LDY #$0D
	LDX $A4
	LDA $0578,X
	BMI bra7_9573
	CMP #$10
	BCC bra7_9573
	INY
bra7_9573:
	TYA
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDA #$40
	STA $05F0
	JSR $A118
	RTS
	JSR sub7_9792
	LDA #$01
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDA #$40
	STA $05F0
	JSR $A118
	RTS
tbl7_95AB:
	.byte $CD
tbl7_95AC:
	.byte $95
	.byte $D4
	.byte $95
	.byte $DB
	.byte $95
	.byte $E9
	.byte $95
	.byte $F0
	.byte $95
	.byte $F7
	.byte $95
	.byte $FE
	.byte $95
	.byte $05
	.byte $96
	.byte $0C
	.byte $96
	.byte $13
	.byte $96
	.byte $1A
	.byte $96
	.byte $1E
	.byte $96
	.byte $E2
	.byte $95
	.byte $22
	.byte $96
	.byte $29
	.byte $96
	.byte $F6
	.byte $9B
	.byte $21
	.byte $9C
	.byte $02
	.byte $02
	.byte $90
	.byte $01
	.byte $02
	.byte $0B
	.byte $0C
	.byte $02
	.byte $02
	.byte $90
	.byte $03
	.byte $04
	.byte $0D
	.byte $0E
	.byte $02
	.byte $02
	.byte $90
	.byte $05
	.byte $06
	.byte $0F
	.byte $10
	.byte $02
	.byte $02
	.byte $90
	.byte $0F
	.byte $10
	.byte $05
	.byte $06
	.byte $02
	.byte $02
	.byte $90
	.byte $07
	.byte $08
	.byte $11
	.byte $12
	.byte $02
	.byte $02
	.byte $90
	.byte $FF
	.byte $FF
	.byte $15
	.byte $16
	.byte $02
	.byte $02
	.byte $90
	.byte $17
	.byte $18
	.byte $1F
	.byte $20
	.byte $02
	.byte $02
	.byte $90
	.byte $59
	.byte $5A
	.byte $61
	.byte $62
	.byte $02
	.byte $02
	.byte $90
	.byte $1B
	.byte $1C
	.byte $23
	.byte $24
	.byte $02
	.byte $02
	.byte $90
	.byte $1D
	.byte $1E
	.byte $25
	.byte $26
	.byte $02
	.byte $02
	.byte $90
	.byte $27
	.byte $28
	.byte $29
	.byte $2A
	.byte $01
	.byte $01
	.byte $90
	.byte $FF
	.byte $01
	.byte $01
	.byte $84
	.byte $17
	.byte $02
	.byte $02
	.byte $90
	.byte $33
	.byte $34
	.byte $35
	.byte $36
	.byte $02
	.byte $02
	.byte $90
	.byte $2F
	.byte $30
	.byte $31
	.byte $32
	LDX $A4
	LDA ObjectState,X
	AND #$1F
	TAX
	LDA tbl7_9654,X
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR $A118
	RTS
tbl7_9654:
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
	LDY $A4
	LDA ObjectState,Y
	AND #$1F
	CMP #$04
	BEQ bra7_966F
	CMP #$06
	BNE bra7_968A
bra7_966F:
	LDA #$0C
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDA #$80
	STA $05F0
	JSR $A118
	RTS
bra7_968A:
	LDA #$02
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDY #$00
	LDX $A4
	LDA ObjectSlot,X
	CMP #$38
	BNE bra7_96B0
	LDA $062B
	AND #$04
	BEQ bra7_96B0
	LDY #$40
bra7_96B0:
	STY $05F0
	JSR $A118
	RTS
	JSR sub7_9792
	LDA #$09
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR $A118
	RTS
	LDY $A4
	LDA #$0B
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$00
	STA $36
	LDA $062B
	AND #$08
	ASL
	ASL
	ASL
	STA $05F0
	JSR $A118
	RTS
	LDX $A4
	LDA ObjectState,X
	STA $05F0
	LDA $062B
	AND #$04
	BNE bra7_971A5_RTS
	ASL
	TAX
	LDA tbl7_971B,X
	STA $32
	LDA tbl7_971C,X
	STA $33
	LDA #$40
	STA $36
	JSR $A118
bra7_971A5_RTS:
	RTS
tbl7_971B:
	.byte $1D
tbl7_971C:
	.byte $97
	.byte $02
	.byte $02
	.byte $90
	.byte $09
	.byte $0A
	.byte $13
	.byte $14
	JSR sub7_9792
	LDA #$00
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR $A118
	RTS
	JSR sub7_9792
	LDA #$05
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDY #$40
	LDA $062B
	AND #$10
	BEQ bra7_9762
	LDY #$00
bra7_9762:
	STY $05F0
	JSR $A118
	RTS
	JSR sub7_9792
	LDA #$08
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDY #$00
	LDA $0578,X
	CMP #$14
	BCC bra7_978B
	LDY #$40
bra7_978B:
	STY $05F0
	JSR $A118
	RTS
sub7_9792:
	LDX $A4
	LDA $0578,X
	BPL bra7_979B5_RTS
	PLA
	PLA
bra7_979B5_RTS:
	RTS
	JSR sub7_9792
	LDY #$07
	LDA FrameCount
	AND #$08
	BEQ bra7_97A9
	LDY #$0A
bra7_97A9:
	TYA
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR $A118
	RTS
	LDA #$40
	STA $05F0
	LDA #$08
	STA $25
	LDA $05F0
	AND #$40
	BEQ bra7_9817
	LDX #$00
	LDY $A4
	LDA $05A0,Y
	CLC
	ADC PlayerSprXPos
	STA $28
	LDA $05B4,Y
	ADC #$00
	BMI bra7_97F9
	BEQ bra7_97E9
	RTS
bra7_97E9:
	LDA $28
bra7_97EB:
	STA $41,X
	INX
	CPX #$02
	BCS bra7_9862
	CLC
	ADC #$08
	BCC bra7_97EB
	BCS bra7_980C
bra7_97F9:
	LDA $28
	LDY #$00
bra7_97FD:
	STY $41,X
	INX
	CPX #$02
	BCS bra7_980B5_RTS
	CLC
	ADC #$08
	BCC bra7_97FD
	BCS bra7_97EB
bra7_980B5_RTS:
	RTS
bra7_980C:
	LDA #$00
bra7_980E:
	STA $41,X
	INX
	CPX #$02
	BCC bra7_980E
	BCS bra7_9862
bra7_9817:
	LDX #$00
	STX $41
	LDY $A4
	LDA $25
	CLC
	ADC PlayerSprXPos
	BCC bra7_9826
	INC $41
bra7_9826:
	CLC
	ADC $05A0,Y
	STA $28
	LDA $05B4,Y
	ADC $41
	BMI bra7_9846
	BEQ bra7_9836
	RTS
bra7_9836:
	LDA $28
bra7_9838:
	STA $41,X
	INX
	CPX #$02
	BCS bra7_9862
	SEC
	SBC #$08
	BCS bra7_9838
	BCC bra7_9859
bra7_9846:
	LDA $28
	LDY #$00
bra7_984A:
	STY $41,X
	INX
	CPX #$02
	BCS bra7_98585_RTS
	SEC
	SBC #$08
	BCS bra7_984A
	BCC bra7_9838
bra7_98585_RTS:
	RTS
bra7_9859:
	LDA #$00
bra7_985B:
	STA $41,X
	INX
	CPX #$02
	BCC bra7_985B
bra7_9862:
	LDX #$00
	LDY $A4
	LDA $05C8,Y
	CLC
	ADC PlayerSprYPos
	STA $2B
	LDA $05DC,Y
	ADC #$00
	BMI bra7_9890
	BEQ bra7_9878
	RTS
bra7_9878:
	LDA $2B
	CMP #$C8
	BCC bra7_9880
	LDA #$F8
bra7_9880:
	STA $B2,X
	INX
	CPX #$02
	BCS bra7_98AC
	CLC
	ADC #$08
	STA $2B
	BCC bra7_9878
	BCS bra7_98A3
bra7_9890:
	LDA $2B
	LDY #$00
bra7_9894:
	STY $B2,X
	INX
	CPX #$02
	BCS bra7_98A2
	CLC
	ADC #$08
	BCC bra7_9894
	BCS bra7_9880
bra7_98A2:
	.byte $60
bra7_98A3:
	LDA #$00
bra7_98A5:
	STA $B2,X
	INX
	CPX #$02
	BCC bra7_98A5
bra7_98AC:
	LDA $B2
	STA $0204
	LDA $B2
	STA $0208
	LDA $B3
	STA $020C
	LDA $B3
	STA $0210
	LDA $41
	STA $0207
	LDA $42
	STA $020B
	LDA $41
	STA $020F
	LDA $42
	STA $0213
	LDA #$59
	STA $0205
	LDA #$61
	STA $0209
	LDA #$61
	STA $020D
	LDA #$59
	STA $0211
	LDA #$01
	STA $0206
	LDA #$C1
	STA $020A
	LDA #$01
	STA $020E
	LDA #$C1
	STA $0212
	RTS
	LDX $A4
	LDA $0578,X
	BPL bra7_9908
	JSR $B5BB
	RTS
bra7_9908:
	LDA #$07
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_992A
	CMP #$FF
	BEQ bra7_992A
	JMP $A6B5
bra7_992A:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_996C
	LDA $05DC,X
	BPL bra7_995B
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_996C
bra7_995B:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_996C:
loc7_996C:
	LDA FreezeFlag
	BEQ bra7_9972
	RTS
bra7_9972:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9986,Y
	STA $32
	LDA tbl7_9987,Y
	STA $33
	JMP ($32)
tbl7_9986:
	.byte $BB
tbl7_9987:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $90
	.byte $99
	.byte $BF
	.byte $99
	LDA FrameCount
	AND #$00
	BNE bra7_999B
	LDA #$29
	JSR $B1DA
bra7_999B:
	JSR $A6D4
	JSR $BEBC
	JSR $A74D
	JSR $BCBE
	INC ObjectSlot,X
	INC ObjectSlot,X
	LDA #$00
	STA $0641,X
	STA $0578,X
	LDA #$28
	STA ObjectState,X
	LDA #$18
	STA SFXRegister
	RTS
	LDX $A4
	INC ObjectSlot,X
	INC ObjectSlot,X
	LDA #$00
	STA $0578,X
	RTS
	LDY #$00
	LDA $062B
	AND #$08
	BEQ bra7_99D7
	INY
bra7_99D7:
	TYA
	ASL
	TAX
	LDA tbl7_99FF,X
	STA $32
	LDA tbl7_9A00,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_99F1
	LDY #$C0
bra7_99F1:
	STY $36
	LDA ObjectState,X
	AND #$40
	STA $05F0
	JSR $A118
	RTS
tbl7_99FF:
	.byte $03
tbl7_9A00:
	.byte $9A
	.byte $0A
	.byte $9A
	.byte $02
	.byte $02
	.byte $97
	.byte $1E
	.byte $1F
	.byte $26
	.byte $27
	.byte $02
	.byte $02
	.byte $97
	.byte $20
	.byte $21
	.byte $28
	.byte $29
	LDA #$02
	ASL
	TAX
	LDA tbl7_9A99,X
	STA $32
	LDA tbl7_9A9A,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_9A2C
	LDY #$C0
bra7_9A2C:
	STY $36
	LDA ObjectState,X
	AND #$1F
	CMP #$04
	BEQ bra7_9A3B
	CMP #$06
	BNE bra7_9A5C
bra7_9A3B:
	LDA #$04
	ASL
	TAX
	LDA tbl7_9A99,X
	STA $32
	LDA tbl7_9A9A,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_9A56
	LDY #$C0
bra7_9A56:
	STY $36
	LDA #$80
	BNE bra7_9A61
bra7_9A5C:
	LDA ObjectState,X
	AND #$40
bra7_9A61:
	STA $05F0
	JSR $A118
	RTS
	LDA $062B
	AND #$0C
	LSR
	LSR
	LDY #$00
	CMP #$03
	BNE bra7_9A77
	LDY #$40
bra7_9A77:
	STY $05F0
	ASL
	TAX
	LDA tbl7_9A99,X
	STA $32
	LDA tbl7_9A9A,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_9A93
	LDY #$C0
bra7_9A93:
	STY $36
	JSR $A118
	RTS
tbl7_9A99:
	.byte $A3
tbl7_9A9A:
	.byte $9A
	.byte $AA
	.byte $9A
	.byte $B1
	.byte $9A
	.byte $AA
	.byte $9A
	.byte $B8
	.byte $9A
	.byte $02
	.byte $02
	.byte $97
	.byte $1C
	.byte $1D
	.byte $22
	.byte $23
	.byte $02
	.byte $02
	.byte $97
	.byte $1C
	.byte $1D
	.byte $24
	.byte $25
	.byte $02
	.byte $02
	.byte $97
	.byte $1C
	.byte $1D
	.byte $2A
	.byte $2B
	.byte $02
	.byte $02
	.byte $97
	.byte $2A
	.byte $2B
	.byte $1C
	.byte $1D
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_9ADD
	CMP #$FF
	BEQ bra7_9ADD
	JMP $A6B5
bra7_9ADD:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9B1F
	LDA $05DC,X
	BPL bra7_9B0E
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9B1F
bra7_9B0E:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9B1F:
loc7_9B1F:
	LDA FreezeFlag
	BEQ bra7_9B25
	.byte $60
bra7_9B25:
	LDA $0578,X
	BPL bra7_9B4E
	LDA #$00
	STA $0578,X
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAY
	LDA CurrentPlayer
	BEQ bra7_9B43
	TYA
	CLC
	ADC #$1C
	TAY
bra7_9B43:
	LDA CheckpointFlag,Y
	BEQ bra7_9B4E
	LDA #$00
	STA ObjectSlot,X
	RTS
bra7_9B4E:
	LDA #$07
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9B66,Y
	STA $32
	LDA tbl7_9B67,Y
	STA $33
	JMP ($32)
tbl7_9B66:
	.byte $BB
tbl7_9B67:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $6E
	.byte $9B
	LDA $05B4,X
	BPL bra7_9B80
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC $05A0,X
	BCS bra7_9B87
	BCC bra7_9BA7
bra7_9B80:
	LDA $05A0,X
	CMP #$08
	BCS bra7_9BA7
bra7_9B87:
	LDA $05DC,X
	BEQ bra7_9B9D
	CMP #$FF
	BNE bra7_9BA7
	LDA #$18
	CLC
	ADC #$03
	CLC
	ADC $05C8,X
	BCS bra7_9BA4
	BCC bra7_9BA7
bra7_9B9D:
	LDA $05C8,X
	CMP #$00
	BCS bra7_9BA7
bra7_9BA4:
	CLC
	BCC bra7_9BA8
bra7_9BA7:
	SEC
bra7_9BA8:
	BCC bra7_9BB3
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	RTS
bra7_9BB3:
	JSR sub7_9EE5
	LDX $A4
	LDA #$1C
	STA SFXRegister
	LDA #$00
	STA ObjectSlot,X
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAY
	LDA CurrentPlayer
	BEQ bra7_9BD5
	TYA
	CLC
	ADC #$1C
	TAY
bra7_9BD5:
	LDA #$01
	STA CheckpointFlag,Y
	RTS
	LDA #$0F
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDA #$40
	STA $36
	LDA #$40
	STA $05F0
	JSR $A118
	RTS
	.byte $02
	.byte $01
	.byte $90
	.byte $3E
	.byte $3E
	LDA #$10
	ASL
	TAX
	LDA tbl7_95AB,X
	STA $32
	LDA tbl7_95AC,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_9C16
	LDY #$C0
bra7_9C16:
	STY $36
	LDA #$40
	STA $05F0
	JSR $A118
	RTS
	.byte $03
	.byte $01
	.byte $A6
	.byte $37
	.byte $36
	.byte $36
	.byte $36
	LDX $A4
	LDA $0578,X
	BMI bra7_9C32
	JMP loc7_9D0B
bra7_9C32:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_9C4E
	CMP #$FF
	BEQ bra7_9C4E
	JMP $A6B5
bra7_9C4E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9C90
	LDA $05DC,X
	BPL bra7_9C7F
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9C90
bra7_9C7F:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9C90:
loc7_9C90:
	LDA FreezeFlag
	BEQ bra7_9C96
	RTS
bra7_9C96:
	LDA $0578,X
	CMP #$80
	BNE bra7_9D07
	JSR $B5BB
	LDY ObjectCount
	INC ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA $0515,Y
	LDA ObjectState,X
	AND #$40
	BNE bra7_9CBC
	LDA ObjectXPos,X
	CLC
	ADC #$10
	JMP loc7_9CC2
bra7_9CBC:
	LDA ObjectXPos,X
	SEC
	SBC #$10
loc7_9CC2:
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	STA $0529,Y
	LDA ObjectYPos,X
	CLC
	ADC #$10
	STA ObjectYPos,Y
	CLC
	ADC #$10
	STA $053D,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	STA $0551,Y
	LDA ObjectSlot,X
	STA ObjectSlot,Y
	STA $0501,Y
	LDA ObjectState,X
	STA ObjectState,Y
	STA $0565,Y
	LDA #$00
	STA $0578,Y
	STA $0579,Y
	STA GuidedObjStatus,Y
	STA $066A,Y
	RTS
bra7_9D07:
	JSR $B4FC
	RTS
loc7_9D0B:
	LDA #$07
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_9D2D
	CMP #$FF
	BEQ bra7_9D2D
	JMP $A6B5
bra7_9D2D:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9D6F
	LDA $05DC,X
	BPL bra7_9D5E
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9D6F
bra7_9D5E:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9D6F:
loc7_9D6F:
	LDA FreezeFlag
	BEQ bra7_9D75
	.byte $60
bra7_9D75:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9D89,Y
	STA $32
	LDA tbl7_9D8A,Y
	STA $33
	JMP ($32)
tbl7_9D89:
	.byte $BB
tbl7_9D8A:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $93
	.byte $9D
	.byte $88
	.byte $AD
	LDA FrameCount
	AND #$00
	BNE bra7_9D9E
	LDA #$25
	JSR $B11D
bra7_9D9E:
	JSR $BC3E
	JSR $BF74
	RTS
	LDA #$00
	ASL
	TAX
	LDA tbl7_971B,X
	STA $32
	LDA tbl7_971C,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	JSR $A118
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_9DE5
	CMP #$FF
	BEQ bra7_9DE5
	JMP $A6B5
bra7_9DE5:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9E27
	LDA $05DC,X
	BPL bra7_9E16
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9E27
bra7_9E16:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9E27:
loc7_9E27:
	LDA FreezeFlag
	BEQ bra7_9E2D
	RTS
bra7_9E2D:
	LDA $0578,X
	BPL bra7_9E4F
	LDA #$00
	STA $0578,X
	STA $0641,X
	STA GuidedObjStatus,X
	LDA ObjectXPos,X
	CLC
	ADC #$08
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,X
	RTS
bra7_9E4F:
	INC $0641,X
	LDA $0641,X
	CMP #$60
	BCC bra7_9E66
	LDA #$00
	STA $0641,X
	LDA GuidedObjStatus,X
	EOR #$01
	STA GuidedObjStatus,X
bra7_9E66:
	LDA GuidedObjStatus,X
	BNE bra7_9E82
	LDA ObjectYPos,X
	SEC
	SBC #$01
	STA ObjectYPos,X
	BCS bra7_9E98
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
	JMP loc7_9E98
bra7_9E82:
	LDA ObjectYPos,X
	CLC
	ADC #$01
	STA ObjectYPos,X
	CMP #$F0
	BCC bra7_9E98
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
bra7_9E98:
loc7_9E98:
	LDA #$07
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9EB0,Y
	STA $32
	LDA tbl7_9EB1,Y
	STA $33
	JMP ($32)
tbl7_9EB0:
	.byte $BB
tbl7_9EB1:
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $B8
	.byte $9E
	LDA $05B4,X
	BPL bra7_9EE45_RTS
	LDA #$23
	STA MusicRegister
	LDA #$06
	STA Event
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAY
	LDA CurrentPlayer
	BEQ bra7_9ED9
	TYA
	CLC
	ADC #$1C
	TAY
bra7_9ED9:
	LDA #$00
	STA CheckpointFlag,Y
	STA InvincibilityTimer
	STA PlayerPowerupBuffer
bra7_9EE45_RTS:
	RTS
sub7_9EE5:
	LDA PlayerPowerup
	BNE bra7_9EF65_RTS
	INC PlayerPowerup
	LDA #$07
	STA Event
	LDA #$01
	STA PlayerPowerupBuffer
bra7_9EF65_RTS:
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA $05A0,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA $05B4,X
	STA $28
	BEQ bra7_9F15
	CMP #$FF
	BEQ bra7_9F15
	JMP $A6B5
bra7_9F15:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA $05C8,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA $05DC,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9F57
	LDA $05DC,X
	BPL bra7_9F46
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP loc7_9F57
bra7_9F46:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
bra7_9F57:
loc7_9F57:
	LDA FreezeFlag
	BEQ bra7_9F5D
	RTS
bra7_9F5D:
	LDA $0578,X
	BPL bra7_9F78
	LDA $058C,X
	CMP #$02
	BEQ bra7_9F78
	LDA #$00
	STA $0578,X
	LDA ObjectXPos,X
	CLC
	ADC #$0F
	STA ObjectXPos,X
	RTS
bra7_9F78:
	LDA $058C,X
	CMP #$02
	BEQ bra7_9F8D
	LDA $05B4,X
	BPL bra7_9F8C5_RTS
bra7_9F84:
	INC $E0
	LDX CurrentPlayer
	INC Player1Lives,X
bra7_9F8C5_RTS:
	RTS
bra7_9F8D:
	LDA $05B4,X
	BPL bra7_9F84
	RTS
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
