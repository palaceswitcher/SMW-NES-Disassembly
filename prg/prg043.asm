;disassembled by BZK 6502 Disassembler
incbin tilesets/ts_Bonus.bin
	db $18
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
	db $19
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
	db $BE
	db $BC
	LDA #$00
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
	db $BD
	db $18
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
	db $19
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
	db $10
	CMP ObjectYScreen,X
	BEQ bra3_8694 ;not sure why its jumping to blank data
	LDA ObjYScreenDistance,X
	BPL bra3_8683
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	db $18
	db $00
	db $00
bra3_8683:
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
	db $19
	db $00
bra3_8694:
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
;Everything below here is (probably) duplicate padding garbage, so it can be ignored.
	LDA tbl3_86B1,Y
	STA $32
	LDA tbl3_86B2,Y
	STA $33
	JMP ($32)
tbl3_86B1:
	db $E9
tbl3_86B2:
	db $86
	db $B5
	db $86
	db $A0
	db $00
	LDA ObjectSlot,X
	CMP #$E6
	BCC bra3_86C0
	LDY #$02
bra3_86C0:
	db $18
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
	db $19
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
	db $12
	JSR GetMovementData
	RTS
	JSR sub3_B057
	BEQ bra3_874F
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	INC ObjectAction,X
	LDA #$E0
	BMI bra3_8716
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_870A
	CMP #$F0
	BCC bra3_8728
bra3_870A:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_8728
bra3_8716:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_8728
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_8728:
loc3_8728:
	LDY #$08
	LDA ObjectState,X
	AND #$40
	BNE bra3_8733
	LDY #$F8
bra3_8733:
	TYA
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_8746
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_874B
bra3_8746:
	LDA ObjectXScreen,X
	SBC #$00
bra3_874B:
	STA ObjectXScreen,X
	RTS
bra3_874F:
	LDY #$13
	LDA ObjectSlot,X
	CMP #$E6
	BCC bra3_8759
	INY
bra3_8759:
	STY $25
	LDA FrameCount
	AND #$01
	BNE bra3_8766
	LDA $25
	JSR GetMovementData
bra3_8766:
	LDY #$00
	LDA ObjFrameCounter
	AND #$08
	BNE bra3_8770
	INY
bra3_8770:
	STY $25
	LDA PlayerYSpeed
	BNE bra3_8790
	LDA InvincibilityTimer
	BNE bra3_8790
	LDA ObjectState,X
	AND #$BF
	STA ObjectState,X
	LDA ObjXScreenDistance,X
	BMI bra3_8790
	LDA ObjectState,X
	ORA #$40
	STA ObjectState,X
bra3_8790:
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
	BEQ bra3_87BD
	CMP #$FF
	BEQ bra3_87BD
	JMP Obj_RemoveObject
bra3_87BD:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra3_87FF
	LDA ObjYScreenDistance,X
	BPL bra3_87EE
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc3_87FF
bra3_87EE:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra3_87FF:
loc3_87FF:
	db $AD
incbin tilesets/ts_Bonus.bin
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
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_8E2C
	CMP #$F0
	BCC bra3_8E4A
bra3_8E2C:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_8E4A
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_8E4A
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_8E4A:
loc3_8E4A:
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
	BMI bra3_8E67
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_8E6C
bra3_8E67:
	LDA ObjectXScreen,X
	SBC #$00
bra3_8E6C:
	STA ObjectXScreen,X
	LDA $02
	SEC
	SBC $06E2
	STA $02
	RTS
	LDA $06E3
	BMI bra3_8E96
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_8E8A
	CMP #$F0
	BCC bra3_8EA8
bra3_8E8A:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_8EA8
bra3_8E96:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_8EA8
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_8EA8:
loc3_8EA8:
	LDA $06E2
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_8EBD
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_8EC2
bra3_8EBD:
	LDA ObjectXScreen,X
	SBC #$00
bra3_8EC2:
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
	LDA tbl3_8EFC,X
	STA $32
	LDA tbl3_8EFD,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra3_8EEE
	LDY #$C0
bra3_8EEE:
	STY $36
	LDA EnemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl3_8EFC:
	db $00
tbl3_8EFD:
	db $8F
	db $17
	db $8F
	db $04
	db $05
	db $E3
	db $FF
	db $C0
	db $C1
	db $FF
	db $FF
	db $CB
	db $CC
	db $CD
	db $FF
	db $DA
	db $DB
	db $DC
	db $E3
	db $E4
	db $E5
	db $E6
	db $FF
	db $E9
	db $EA
	db $FF
	db $04
	db $05
	db $E3
	db $FF
	db $C0
	db $C1
	db $FF
	db $FF
	db $CE
	db $CF
	db $CD
	db $FF
	db $DA
	db $DB
	db $DC
	db $E3
	db $E4
	db $E5
	db $E6
	db $FF
	db $E9
	db $EA
	db $FF
	LDX $A4
	LDA EnemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl3_8F66,X
	STA $32
	LDA tbl3_8F67,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra3_8F4E
	LDY #$C0
bra3_8F4E:
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
tbl3_8F66:
	db $76
tbl3_8F67:
	db $8F
	db $82
	db $8F
	db $8E
	db $8F
	db $9A
	db $8F
	db $A6
	db $8F
	db $B2
	db $8F
	db $BE
	db $8F
	db $CA
	db $8F
	db $03
	db $03
	db $E3
	db $C2
	db $C3
	db $C4
	db $D0
	db $D1
	db $D2
	db $DD
	db $DE
	db $DF
	db $03
	db $03
	db $E1
	db $51
	db $52
	db $53
	db $5E
	db $5F
	db $60
	db $FF
	db $6C
	db $6D
	db $03
	db $03
	db $E1
	db $54
	db $55
	db $FF
	db $61
	db $62
	db $63
	db $FF
	db $6E
	db $6F
	db $03
	db $03
	db $E3
	db $C5
	db $FF
	db $FF
	db $C5
	db $C5
	db $FF
	db $FF
	db $C5
	db $C5
	db $03
	db $03
	db $E3
	db $DD
	db $DE
	db $DF
	db $D0
	db $D1
	db $D2
	db $C2
	db $C3
	db $C4
	db $03
	db $03
	db $E1
	db $FF
	db $6C
	db $6D
	db $5E
	db $5F
	db $60
	db $51
	db $52
	db $53
	db $03
	db $03
	db $E1
	db $FF
	db $6E
	db $6F
	db $61
	db $62
	db $63
	db $54
	db $55
	db $FF
	db $03
	db $03
	db $E3
	db $FF
	db $C5
	db $C5
	db $C5
	db $C5
	db $FF
	db $C5
	db $FF
	db $FF
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra3_8FF4
	CMP #$FF
	BEQ bra3_8FF4
	JMP Obj_RemoveObject
bra3_8FF4:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X


incbin tilesets/ts_Bonus.bin
	db $42
	BCS bra3_960D
	LDA #$0F
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectState,Y
bra3_960D:
	CPY ObjectCount
	BCC $95F7
	RTS
	CMP #$01
	BEQ bra3_9619
	JMP loc3_970B_RTS
bra3_9619:
	LDA #$10
	STA Sound_Sfx
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
loc3_970B_RTS:
	RTS
	LDA $05F6
	BNE bra3_9762_RTS
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
	BMI bra3_975B
	LDY #$00
bra3_975B:
	STY PlayerMovement
	LDA #$2F
	STA Sound_Music
	RTS
bra3_9762_RTS:
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
	BEQ bra3_9782
	CMP #$FF
	BEQ bra3_9782
	JMP Obj_RemoveObject
bra3_9782:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra3_97C4
	LDA ObjYScreenDistance,X
	BPL bra3_97B3
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc3_97C4
bra3_97B3:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra3_97C4:
loc3_97C4:
	LDA FreezeFlag
	BEQ bra3_97CA
	RTS
bra3_97CA:
	LDA ObjectAction,X
	ASL
	TAY
	LDA tbl3_97DC,Y
	STA $32
	LDA tbl3_97DD,Y
	STA $33
	JMP ($32)
tbl3_97DC:
	db $E2
tbl3_97DD:
	db $97
	db $11
	db $98
	db $40
	db $98
	LDA ObjFrameCounter
	AND #$03
	BNE bra3_97F6_RTS
	LDA ObjectVariables,X
	CMP #$28
	BCC bra3_97F7
	INC ObjectAction,X
	INC $05F7
bra3_97F6_RTS:
	RTS
bra3_97F7:
	INC ObjectVariables,X
	LDA #$20
	STA $06E1
	db $BD
incbin tilesets/ts_Bonus.bin
