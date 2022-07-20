;disassembled by BZK 6502 Disassembler
	.incbin tilesets/ts_unused3.bin
	
	.byte $17
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $18
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $BE
	.byte $BC
	LDA #$00	;all of the code here is useless padding
	STA ObjectState,X
	STA ObjectVariables,X
	LDA #$02
	STA ObjectAction,X
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA a:PlayerAnimationFrame,X
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $18
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $10
	CMP ObjectYScreen,X
	BEQ bra14_8694
	LDA ObjYScreenDistance,X
	BPL bra14_8683
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	.byte $17
	.byte $00
	.byte $00
bra14_8683:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $18
	.byte $00
bra14_8694:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	LDA tbl14_86B1,Y
	STA $32
	LDA $86B2,Y
	STA $33
	JMP ($32)
tbl14_86B1:
	SBC #$86
	LDA $86,X
	LDY #$00
	LDA ObjectSlot,X
	CMP #$E6
	BCC bra14_86C0
	LDY #$02
bra14_86C0:
	.byte $17
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $18
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $12
	JSR GetMovementData
	RTS
	JSR sub3_B057
	BEQ bra14_874F
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	INC ObjectAction,X
	LDA #$E0
	BMI bra14_8716
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra14_870A
	CMP #$F0
	BCC bra14_8728
bra14_870A:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc14_8728
bra14_8716:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra14_8728
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra14_8728:
loc14_8728:
	LDY #$08
	LDA ObjectState,X
	AND #$40
	BNE bra14_8733
	LDY #$F8
bra14_8733:
	TYA
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra14_8746
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra14_874B
bra14_8746:
	LDA ObjectXScreen,X
	SBC #$00
bra14_874B:
	STA ObjectXScreen,X
	RTS
bra14_874F:
	LDY #$13
	LDA ObjectSlot,X
	CMP #$E6
	BCC bra14_8759
	INY
bra14_8759:
	STY $25
	LDA FrameCount
	AND #$01
	BNE bra14_8766
	LDA $25
	JSR GetMovementData
bra14_8766:
	LDY #$00
	LDA $062B
	AND #$08
	BNE bra14_8770
	INY
bra14_8770:
	STY $25
	LDA PlayerYSpeed
	BNE bra14_8790
	LDA InvincibilityTimer
	BNE bra14_8790
	LDA ObjectState,X
	AND #$BF
	STA ObjectState,X
	LDA ObjXScreenDistance,X
	BMI bra14_8790
	LDA ObjectState,X
	ORA #$40
	STA ObjectState,X
bra14_8790:
	LDA ObjectState,X
	AND #$C0
	ORA $25
	STA EnemyAnimFrame,X
	RTS
	LDA #$07
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra14_87BD
	CMP #$FF
	BEQ bra14_87BD
	JMP loc3_A6B5
bra14_87BD:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra14_87FF
	LDA ObjYScreenDistance,X
	BPL bra14_87EE
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc14_87FF
bra14_87EE:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra14_87FF:
loc14_87FF:
	.byte $AD
	.incbin tilesets/ts_unused4.bin
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra14_8E2C
	CMP #$F0
	BCC bra14_8E4A
bra14_8E2C:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc14_8E4A
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra14_8E4A
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra14_8E4A:
loc14_8E4A:
	LDA $03
	SEC
	SBC $06E3
	STA $03
	LDA $06E2
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra14_8E67
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra14_8E6C
bra14_8E67:
	LDA ObjectXScreen,X
	SBC #$00
bra14_8E6C:
	STA ObjectXScreen,X
	LDA $02
	SEC
	SBC $06E2
	STA $02
	RTS
	LDA $06E3
	BMI bra14_8E96
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra14_8E8A
	CMP #$F0
	BCC bra14_8EA8
bra14_8E8A:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc14_8EA8
bra14_8E96:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra14_8EA8
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra14_8EA8:
loc14_8EA8:
	LDA $06E2
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra14_8EBD
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra14_8EC2
bra14_8EBD:
	LDA ObjectXScreen,X
	SBC #$00
bra14_8EC2:
	STA ObjectXScreen,X
	LDA #$00
	STA $06E2
	STA $06E3
	RTS
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl14_8EFC,X
	STA $32
	LDA tbl14_8EFD,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra14_8EEE
	LDY #$C0
bra14_8EEE:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl14_8EFC:
	.byte $00
tbl14_8EFD:
	.byte $8F
	.byte $17
	.byte $8F
	.byte $04
	.byte $05
	.byte $E3
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $CB
	.byte $CC
	.byte $CD
	.byte $FF
	.byte $DA
	.byte $DB
	.byte $DC
	.byte $E3
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $FF
	.byte $E9
	.byte $EA
	.byte $FF
	.byte $04
	.byte $05
	.byte $E3
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $CE
	.byte $CF
	.byte $CD
	.byte $FF
	.byte $DA
	.byte $DB
	.byte $DC
	.byte $E3
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $FF
	.byte $E9
	.byte $EA
	.byte $FF
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl14_8F66,X
	STA $32
	LDA tbl14_8F67,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra14_8F4E
	LDY #$C0
bra14_8F4E:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA #$00
	STA $06E1
	JSR jmp_54_A118
	LDA #$20
	STA $06E1
	RTS
tbl14_8F66:
	.byte $76
tbl14_8F67:
	.byte $8F
	.byte $82
	.byte $8F
	.byte $8E
	.byte $8F
	.byte $9A
	.byte $8F
	.byte $A6
	.byte $8F
	.byte $B2
	.byte $8F
	.byte $BE
	.byte $8F
	.byte $CA
	.byte $8F
	.byte $03
	.byte $03
	.byte $E3
	.byte $C2
	.byte $C3
	.byte $C4
	.byte $D0
	.byte $D1
	.byte $D2
	.byte $DD
	.byte $DE
	.byte $DF
	.byte $03
	.byte $03
	.byte $E1
	.byte $51
	.byte $52
	.byte $53
	.byte $5E
	.byte $5F
	.byte $60
	.byte $FF
	.byte $6C
	.byte $6D
	.byte $03
	.byte $03
	.byte $E1
	.byte $54
	.byte $55
	.byte $FF
	.byte $61
	.byte $62
	.byte $63
	.byte $FF
	.byte $6E
	.byte $6F
	.byte $03
	.byte $03
	.byte $E3
	.byte $C5
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C5
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C5
	.byte $03
	.byte $03
	.byte $E3
	.byte $DD
	.byte $DE
	.byte $DF
	.byte $D0
	.byte $D1
	.byte $D2
	.byte $C2
	.byte $C3
	.byte $C4
	.byte $03
	.byte $03
	.byte $E1
	.byte $FF
	.byte $6C
	.byte $6D
	.byte $5E
	.byte $5F
	.byte $60
	.byte $51
	.byte $52
	.byte $53
	.byte $03
	.byte $03
	.byte $E1
	.byte $FF
	.byte $6E
	.byte $6F
	.byte $61
	.byte $62
	.byte $63
	.byte $54
	.byte $55
	.byte $FF
	.byte $03
	.byte $03
	.byte $E3
	.byte $FF
	.byte $C5
	.byte $C5
	.byte $C5
	.byte $C5
	.byte $FF
	.byte $C5
	.byte $FF
	.byte $FF
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra14_8FF4
	CMP #$FF
	BEQ bra14_8FF4
	JMP loc3_A6B5
bra14_8FF4:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	
	.incbin tilesets/ts_unused5.bin
	
	.byte $42
	BCS bra14_960D
	LDA #$0F
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectState,Y
bra14_960D:
	CPY ObjectCount
	BCC $95F7
	RTS
	CMP #$01
	BEQ bra14_9619
	JMP loc14_970B_RTS
bra14_9619:
	LDA #$10
	STA SFXRegister
	INC $05F6
	LDY ObjectCount
	INC ObjectCount
	INC ObjectCount
	INC ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	CLC
	ADC #$30
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,Y
	LDA #$00
	STA ObjectVariables,Y
	LDA #$BC
	STA ObjectSlot,Y
	LDA #$C4
	STA EnemyAnimFrame,Y
	LDA #$00
	STA ObjectAction,Y
	STA ObjectState,Y
	LDA ObjectXPos,X
	STA ObjectXPos+1,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen+1,Y
	LDA ObjectYPos,X
	CLC
	ADC #$48
	STA ObjectYPos+1,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen+1,Y
	LDA #$00
	STA $0579,Y
	LDA #$BC
	STA ObjectSlot+1,Y
	LDA #$40
	STA EnemyAnimFrame+1,Y
	LDA #$01
	STA ObjectAction+1,Y
	LDA #$00
	STA ObjectState+1,Y
	LDA ObjectXPos,X
	CLC
	ADC #$20
	STA ObjectXPos+2,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen+2,Y
	LDA ObjectYPos,X
	CLC
	ADC #$30
	STA ObjectYPos+2,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen+2,Y
	LDA #$00
	STA $057A,Y
	LDA #$BC
	STA ObjectSlot+2,Y
	LDA #$84
	STA EnemyAnimFrame+2,Y
	LDA #$02
	STA ObjectAction+2,Y
	LDA #$00
	STA ObjectState+2,Y
	LDA ObjectXPos,X
	CLC
	ADC #$20
	STA ObjectXPos+3,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen+3,Y
	LDA ObjectYPos,X
	CLC
	ADC #$48
	STA ObjectYPos+3,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen+3,Y
	LDA #$00
	STA $057B,Y
	LDA #$BC
	STA ObjectSlot+3,Y
	LDA #$00
	STA EnemyAnimFrame+3,Y
	LDA #$03
	STA ObjectAction+3,Y
	LDA #$00
	STA ObjectState+3,Y
	RTS
loc14_970B_RTS:
	RTS
	LDA $05F6
	BNE bra14_9762_RTS
	INC $05F6
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	CLC
	ADC #$08
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	CLC
	ADC #$28
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,Y
	LDA #$B8
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectState,Y
	STA ObjectVariables,Y
	STA ObjectAction,Y
	STA EnemyAnimFrame,Y
	LDA #$01
	STA $06E6
	LDY #$41
	LDA ObjXScreenDistance,X
	BMI bra14_975B
	LDY #$00
bra14_975B:
	STY $19
	LDA #$2F
	STA $8E
	RTS
bra14_9762_RTS:
	RTS
	RTS
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra14_9782
	CMP #$FF
	BEQ bra14_9782
	JMP loc3_A6B5
bra14_9782:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra14_97C4
	LDA ObjYScreenDistance,X
	BPL bra14_97B3
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc14_97C4
bra14_97B3:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra14_97C4:
loc14_97C4:
	LDA FreezeFlag
	BEQ bra14_97CA
	RTS
bra14_97CA:
	LDA ObjectAction,X
	ASL
	TAY
	LDA tbl14_97DC,Y
	STA $32
	LDA tbl14_97DD,Y
	STA $33
	JMP ($32)
tbl14_97DC:
	.byte $E2
tbl14_97DD:
	.byte $97
	.byte $11
	.byte $98
	.byte $40
	.byte $98
	LDA $062B
	AND #$03
	BNE bra14_97F6_RTS
	LDA ObjectVariables,X
	CMP #$28
	BCC bra14_97F7
	INC ObjectAction,X
	INC $05F7
bra14_97F6_RTS:
	RTS
bra14_97F7:
	INC ObjectVariables,X
	LDA #$20
	STA $06E1
	.byte $BD
	
	.incbin tilesets/ts_unused6.bin
	