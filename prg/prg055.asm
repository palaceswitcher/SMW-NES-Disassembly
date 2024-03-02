;disassembled by BZK 6502 Disassembler
;----------------------------------------
;Koopa Object Code
;----------------------------------------
obj_h10:
	LDX $A4 ;Get index of current object
;Koopa X position - player X position = horizontal distance between Koopa and player
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X 
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28

	BEQ bra8_801E ;Branch if the player and Koopa are on the same screen
	CMP #$FF
	BEQ bra8_801E ;Branch if the Koopa is within one screen behind the player
	JMP loc3_A6B5 ;Otherwise, if 
bra8_801E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X ;Get object's vertical distance from player
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8060 ;Branch if the object and player are on the same vertical screen
	LDA ObjYScreenDistance,X
	BPL bra8_804F ;Branch if the player is on a higher vertical screen than the object
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X ;Increase the vertical distance value by 16
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X ;Increase the vertical screen distance if needed
	JMP loc8_8060
bra8_804F:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_8060:
loc8_8060:
	LDA FreezeFlag
	BEQ bra8_8066
	RTS
bra8_8066:
	JSR sub8_8096
	LDY #$03
	LDA $062B
	AND #$08
	BEQ bra8_8073
	INY
bra8_8073:
	TYA
	STA EnemyAnimFrame,X
	LDA ObjectSlot,X
	CMP #$36
	BCC bra8_808A
	LDA FrameCount
	AND #$01
	BNE bra8_8089_RTS
	LDA #$10
	JSR GetMovementData
bra8_8089_RTS:
	RTS
bra8_808A:
	LDA FrameCount
	AND #$01
	BNE bra8_8096_RTS
	LDA #$10
	JSR sub_54_B3B4
bra8_8096_RTS:
	RTS
sub8_8096:
	LDA #$04
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
	BEQ bra8_80B8
	CMP #$FF
	BEQ bra8_80B8
	JMP loc3_A6B5 ;unlogged
bra8_80B8:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_80FA
	LDA ObjYScreenDistance,X
	BPL bra8_80E9
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_80FA
bra8_80E9:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_80FA:
loc8_80FA:
	LDA FreezeFlag
	BEQ bra8_8100
	RTS ;unlogged
bra8_8100:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8114,Y
	STA $32
	LDA tbl8_8114+1,Y
	STA $33
	JMP ($32)
tbl8_8114:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr_811E
	.word ptr_8201
ptr_811E:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	JSR jmp_54_BCBE
	LDA #$10
	BMI bra8_8147
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra8_813B
	CMP #$F0
	BCC loc8_8159
bra8_813B:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	INC ObjectYScreen,X ;unlogged
	JMP loc8_8159 ;unlogged
bra8_8147:
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	BCS loc8_8159 ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	DEC ObjectYScreen,X ;unlogged
loc8_8159:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_8175
	CMP #$FF
	BEQ bra8_8175
	JMP loc3_A6B5 ;unlogged
bra8_8175:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_81B7
	LDA ObjYScreenDistance,X ;unlogged
	BPL bra8_81A6 ;unlogged
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_81B7 ;unlogged
bra8_81A6:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra8_81B7:
loc8_81B7:
	LDA FreezeFlag
	BEQ bra8_81BD
	RTS ;unlogged
bra8_81BD:
	LDY ObjectCount ;Set index for current object
	INC ObjectCount ;Add it to the total amount of object
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y ;Make sure the coordinate values are correct?
	LDA ObjectState,X
	AND #$40
	ORA #$80
	STA ObjectState,Y
	LDA #$80
	STA ObjectVariables,Y ;Set speed to 128?
	STA ObjectAction,Y ;Set action to sliding
	LDA ObjectSlot,X
	AND #$01
	CLC
	ADC #$12
	STA ObjectSlot,Y ;Spawn shell-less koopa
	LDA #$04
	STA ObjectSlot,X ;Spawn shell in lower object slot
	LDA #$08
	STA ObjectState,X ;Make shell bounce off
	RTS
ptr_8201:
	LDX $A4 ;Set index for previous object?
	LDA #$04
	STA ObjectSlot,X ;Spawn shell
	LDA #$00
	STA ObjectVariables,X ;Clear speed variables?
	RTS
ptr6_820E:
	LDX $A4
	LDA EnemyAnimFrame,X
	ASL
	TAX
	LDA KoopaMappings,X
	STA $32
	LDA KoopaMappings+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_822C
	LDY #$C0
bra8_822C:
	STY $36
	LDA ObjectState,X
	AND #$40
	STA $05F0
	JSR jmp_52_A118
	RTS
KoopaMappings:
	.word BeachKoopaWalk1
	.word BeachKoopaWalk2
	.word BeachKoopaSlide
	.word KoopaWalk1
	.word KoopaWalk2
	.word ParatroopaWalk1
	.word ParatroopaWalk2
BeachKoopaWalk1:
	.byte $02
	.byte $02
	.byte $94
	.byte $01, $02
	.byte $06, $07
BeachKoopaWalk2:
	.byte $02
	.byte $02
	.byte $94
	.byte $01, $03
	.byte $08, $09
BeachKoopaSlide:
	.byte $02
	.byte $02
	.byte $94
	.byte $04, $05
	.byte $0A, $0B
KoopaWalk1:
	.byte $02
	.byte $04
	.byte $94
	.byte $0E, $0F
	.byte $18, $19
	.byte $27, $28
	.byte $35, $36
KoopaWalk2:
	.byte $02
	.byte $04
	.byte $94
	.byte $10, $11
	.byte $1A, $1B
	.byte $29, $2A
	.byte $37, $38
ParatroopaWalk1:
	.byte $04
	.byte $04
	.byte $94
	.byte $FF, $12, $13, $FF
	.byte $1C, $1D, $1E, $1F
	.byte $FF, $2C, $2D, $2E
	.byte $FF, $39, $3A, $FF
ParatroopaWalk2:
	.byte $04
	.byte $04
	.byte $94
	.byte $FF, $16, $17, $FF
	.byte $23, $24, $25, $26
	.byte $31, $32, $33, $34
	.byte $FF, $3E, $3F, $FF
obj_h14:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_82B7
	CMP #$FF
	BEQ bra8_82B7
	JMP loc3_A6B5
bra8_82B7:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_82F9
	LDA ObjYScreenDistance,X
	BPL bra8_82E8
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_82F9
bra8_82E8:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_82F9:
loc8_82F9:
	LDA FreezeFlag
	BEQ bra8_82FF
	RTS
bra8_82FF:
	LDA ObjectVariables,X
	BPL bra8_8308
	JSR jmp_54_B5BB
	RTS
bra8_8308:
	JSR sub8_83D0
	LDA FrameCount
	AND #$01
	BNE bra8_8316
	LDA #$12
	JSR GetMovementData
bra8_8316:
	LDY #$05
	LDA $062B
	AND #$08
	BEQ bra8_8320
	INY
bra8_8320:
	TYA
	STA EnemyAnimFrame,X
	RTS
obj_h58:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_8343
	CMP #$FF
	BEQ bra8_8343
	JMP loc3_A6B5
bra8_8343:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8385
	LDA ObjYScreenDistance,X
	BPL bra8_8374
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_8385
bra8_8374:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_8385:
loc8_8385:
	LDA FreezeFlag
	BEQ bra8_838B
	RTS ;unlogged
bra8_838B:
	LDA ObjectVariables,X
	BPL bra8_8394
	JSR jmp_54_B5BB
	RTS
bra8_8394:
	JSR sub8_83D0
	LDA ObjectSlot,X
	BMI bra8_83B6
	LDA FrameCount
	AND #$03
	BNE bra8_83A7
	LDA #$3A
	JSR jmp_54_B11D
bra8_83A7:
	LDY #$05
	LDA $062B
	AND #$08
	BEQ bra8_83B1
	INY
bra8_83B1:
	TYA
	STA EnemyAnimFrame,X
	RTS
bra8_83B6:
	LDA FrameCount
	AND #$03
	BNE bra8_83C1
	LDA #$21
	JSR jmp_54_B11D
bra8_83C1:
	LDY #$05
	LDA $062B
	AND #$08
	BEQ bra8_83CB
	INY
bra8_83CB:
	TYA
	STA EnemyAnimFrame,X
	RTS
sub8_83D0:
	LDA #$04
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
	BEQ bra8_83F2
	CMP #$FF
	BEQ bra8_83F2
	JMP loc3_A6B5 ;unlogged
bra8_83F2:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8434
	LDA ObjYScreenDistance,X
	BPL bra8_8423
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_8434
bra8_8423:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_8434:
loc8_8434:
	LDA FreezeFlag
	BEQ bra8_843A
	RTS ;unlogged
bra8_843A:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_844E,Y
	STA $32
	LDA tbl8_844E+1,Y
	STA $33
	JMP ($32)
tbl8_844E:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr3_8458
	.word ptr3_847B
ptr3_8458:
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	LDA InvincibilityTimer
	CMP #$F7
	BCS bra8_847A_RTS
	JSR sub_54_BCA7
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	CLC
	ADC #$36
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
bra8_847A_RTS:
	RTS
ptr3_847B:
	LDX $A4
	LDA #$04
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	RTS
obj_h16:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra8_84F7
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_84AB
	CMP #$FF
	BEQ bra8_84AB
	JMP loc3_A6B5 ;unlogged
bra8_84AB:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_84ED
	LDA ObjYScreenDistance,X
	BPL bra8_84DC
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_84ED ;unlogged
bra8_84DC:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_84ED:
loc8_84ED:
	LDA FreezeFlag
	BEQ bra8_84F3
	RTS ;unlogged
bra8_84F3:
	JSR jmp_54_B5BB
	RTS
bra8_84F7:
	LDA #$06
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
	BEQ bra8_8519
	CMP #$FF
	BEQ bra8_8519
	JMP loc3_A6B5
bra8_8519:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_855B
	LDA ObjYScreenDistance,X
	BPL bra8_854A
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_855B ;unlogged
bra8_854A:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_855B:
loc8_855B:
	LDA FreezeFlag
	BEQ bra8_8561
	RTS ;unlogged
bra8_8561:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8575,Y
	STA $32
	LDA tbl8_8575+1,Y
	STA $33
	JMP ($32)
tbl8_8575:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr3_857F
	.word ptr_AD88
ptr3_857F:
	LDY #$13
	LDA ObjectSlot,X
	CMP #$18
	BCC bra8_8589
	INY
bra8_8589:
	STY $25
	LDA FrameCount
	AND #$00
	BNE bra8_8596
	LDA $25
	JSR GetMovementData
bra8_8596:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	LDA ObjectSlot,X
	LSR
	CMP #$0C
	BCC bra8_85B5
	LDA #$0F
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	JSR jmp_54_BCC2
	RTS
bra8_85B5:
	LDA #$10
	BMI bra8_85D2
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra8_85C6
	CMP #$F0
	BCC bra8_85E4
bra8_85C6:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	INC ObjectYScreen,X ;unlogged
	JMP loc8_85E4 ;unlogged
bra8_85D2:
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	BCS bra8_85E4 ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	DEC ObjectYScreen,X ;unlogged
bra8_85E4:
loc8_85E4:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_8600
	CMP #$FF
	BEQ bra8_8600
	JMP loc3_A6B5 ;unlogged
bra8_8600:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8642
	LDA ObjYScreenDistance,X ;unlogged
	BPL bra8_8631 ;unlogged
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_8642 ;unlogged
bra8_8631:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra8_8642:
loc8_8642:
	LDA FreezeFlag
	BEQ bra8_8648
	RTS ;unlogged
bra8_8648:
	INC ObjectSlot,X
	INC ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	JSR jmp_54_BCBE
	RTS
ptr6_8657:
	LDY #$00
	BEQ bra8_865F
ptr6_865B:
	LDX $A4
	LDY #$03
bra8_865F:
	LDA $062B
	AND #$08
	BEQ bra8_8667
	INY
bra8_8667:
	TYA
	ASL
	TAX
	LDA RexMappings,X
	STA $32
	LDA RexMappings+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_8681
	LDY #$C0
bra8_8681:
	STY $36
	LDA ObjectState,X
	AND #%01000000
	STA ObjectAttributes ;Get/use the horizontal mirroring bit
	JSR jmp_54_A118
	RTS
RexMappings:
	.word RexWalk1
	.word RexWalk2
	.word RexFlattened ;Unused
	.word RexSquishWalk1
	.word RexSquishWalk2
RexWalk1:
	.byte $03
	.byte $04
	.byte $95
	.byte $21, $22, $FF
	.byte $25, $26, $FF
	.byte $29, $2A, $2B
	.byte $33, $34, $35
RexWalk2:
	.byte $03
	.byte $04
	.byte $95
	.byte $23, $24, $FF
	.byte $27, $28, $FF
	.byte $2C, $2D, $2E
	.byte $36, $37, $38
RexFlattened:
	.byte $02
	.byte $01
	.byte $95
	.byte $39, $3A
RexSquishWalk1:
	.byte $02
	.byte $02
	.byte $95
	.byte $2F, $30
	.byte $3B, $3C
RexSquishWalk2:
	.byte $02
	.byte $02
	.byte $95
	.byte $31, $32
	.byte $3D, $3E
obj_h1A:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_86E8
	CMP #$FF
	BEQ bra8_86E8
	JMP loc3_A6B5
bra8_86E8:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_872A
	LDA ObjYScreenDistance,X
	BPL bra8_8719
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_872A ;unlogged
bra8_8719:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_872A:
loc8_872A:
	LDA FreezeFlag
	BEQ bra8_8730
	RTS ;unlogged
bra8_8730:
	LDA ObjectVariables,X
	BPL bra8_8776
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectXPos,X
	CLC
	ADC #$08
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,X
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	LDA ObjectSlot,X
	CLC
	ADC #$02
	STA ObjectSlot,Y
	LDA #$F3
	STA ObjectAction,Y
	RTS
bra8_8776:
	LDA #$06
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
	BEQ bra8_8798
	CMP #$FF
	BEQ bra8_8798
	JMP loc3_A6B5 ;unlogged
bra8_8798:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_87DA
	LDA ObjYScreenDistance,X
	BPL bra8_87C9
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_87DA ;unlogged
bra8_87C9:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_87DA:
loc8_87DA:
	LDA FreezeFlag
	BEQ bra8_87E0
	RTS
bra8_87E0:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_87F4,Y
	STA $32
	LDA tbl8_87F4+1,Y
	STA $33
	JMP ($32)
tbl8_87F4:
	.word ptr3_87FE
	.word ptr3_880D
	.word ptr3_881C
	.word ptr3_882B
	.word ptr_AD88
ptr3_87FE:
	LDA FrameCount
	AND #$03
	BNE bra8_8809
	LDA #$15
	JSR jmp_54_B11D ;Use movement data string #$15 (21 in decimal), which is used for the piranha plant
bra8_8809:
	JSR ptr_A7BB ;Handle edibility
	RTS
ptr3_880D:
	LDA FrameCount
	AND #$03
	BNE bra8_8818
	LDA #$15
	JSR jmp_54_B11D
bra8_8818:
	JSR ptr_AA7B
	RTS
ptr3_881C:
	LDA FrameCount
	AND #$03
	BNE bra8_8827
	LDA #$15
	JSR jmp_54_B11D
bra8_8827:
	JSR ptr_AB29
	RTS
ptr3_882B:
	LDA FrameCount
	AND #$03
	BNE bra8_8836
	LDA #$15
	JSR jmp_54_B11D
bra8_8836:
	LDA ObjectVariables,X
	CMP #$10
	BCC bra8_884A_RTS
	CMP #$35
	BCS bra8_884A_RTS
	JSR jmp_54_A6D4
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
bra8_884A_RTS:
	RTS
ptr6_884B:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra8_8853
	RTS
bra8_8853:
	LDA $062B
	AND #$18
	LSR
	LSR
	LSR
	ASL
	TAX
	LDA tbl8_887F,X
	STA $32
	LDA tbl8_887F+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_8874
	LDY #$C0
bra8_8874:
	STY $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl8_887F:
	.word JumpPiranha1
	.word JumpPiranha2
	.word JumpPiranha3
	.word JumpPiranha4
JumpPiranha1:
	.byte $02
	.byte $03
	.byte $97
	.byte $0D
	.byte $0E
	.byte $11
	.byte $12
	.byte $15
	.byte $16
JumpPiranha2:
	.byte $02
	.byte $03
	.byte $97
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $17
	.byte $18
JumpPiranha3:
	.byte $02
	.byte $03
	.byte $97
	.byte $0D
	.byte $0E
	.byte $11
	.byte $12
	.byte $19
	.byte $1A
JumpPiranha4:
	.byte $02
	.byte $03
	.byte $97
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $19
	.byte $1B
obj_h1C:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_88C9
	CMP #$FF
	BEQ bra8_88C9
	JMP loc3_A6B5
bra8_88C9:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_890B
	LDA ObjYScreenDistance,X
	BPL bra8_88FA
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_890B ;unlogged
bra8_88FA:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_890B:
loc8_890B:
	LDA FreezeFlag
	BEQ bra8_8911_RTS
	RTS ;unlogged
bra8_8911_RTS:
	RTS
ptr6_8912:
	RTS
obj_h1E:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_8931
	CMP #$FF
	BEQ bra8_8931
	JMP loc3_A6B5
bra8_8931:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8973
	LDA ObjYScreenDistance,X
	BPL bra8_8962
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_8973
bra8_8962:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_8973:
loc8_8973:
	LDA FreezeFlag
	BEQ bra8_8979
	RTS
bra8_8979:
	LDA ObjectVariables,X
	CMP #$80
	BNE bra8_8995
	LDA ObjectYPos,X
	SEC
	SBC #$08
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	JSR jmp_54_B5BB
	RTS
bra8_8995:
	LDA ObjectAction,X
	BEQ bra8_89CF
	CMP #$02
	BEQ bra8_89CB
	LDY ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	LDA #$00
	STA ObjectVariables,Y
	STA ObjectState,Y
	LDA #$0D
	STA ObjectSlot,Y
	INC ObjectAction,X
	RTS
bra8_89CB:
	JSR sub_54_B4FC
	RTS
bra8_89CF:
	JSR sub8_89F6
	LDX $A4
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BNE bra8_89DE
	RTS
bra8_89DE:
	LDA ObjectSlot,X
	SEC
	SBC #$10
	LSR
	CLC
	ADC #$10
	STA $25
	LDA FrameCount
	AND #$01
	BNE bra8_89F6_RTS
	LDA $25
	JSR jmp_54_B11D
bra8_89F6_RTS:
	RTS
sub8_89F6:
	LDA #$06
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
	BEQ bra8_8A18
	CMP #$FF
	BEQ bra8_8A18
	.byte $4C
	.byte $B5
	.byte $A6
bra8_8A18:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8A5A
	LDA ObjYScreenDistance,X
	BPL bra8_8A49
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_8A5A
bra8_8A49:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_8A5A:
loc8_8A5A:
	LDA FreezeFlag
	BEQ bra8_8A60
	.byte $60
bra8_8A60:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8A74,Y
	STA $32
	LDA tbl8_8A74+1,Y
	STA $33
	JMP ($32)
tbl8_8A74:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr3_8A7E
	.word ptr_AD88
ptr3_8A7E:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	JSR jmp_54_BCBE
	LDX $A4
	LDY #$01
	LDA ObjectSlot,X
	CMP #$20
	BCC bra8_8A96
	INY
bra8_8A96:
	TYA
	STA ObjectAction,X
	LDA #$81
	STA ObjectVariables,X
	RTS
ptr6_8AA0:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra8_8AAB
	LDY #$0C
	BNE bra8_8AC9
bra8_8AAB:
	AND #$7F
	TAY
	LDA tbl8_8AF1,Y
	TAY
	LDA ObjectSlot,X
	CMP #$20
	BCC bra8_8AC1
	CMP #$22
	BCC bra8_8ABF
	LDY #$08
bra8_8ABF:
	INY
	INY
bra8_8AC1:
	LDA $062B
	AND #$04
	BNE bra8_8AC9
	INY
bra8_8AC9:
	TYA
	ASL
	TAX
	LDA tbl8_8B05,X
	STA $32
	LDA tbl8_8B05+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_8AE3
	LDY #$C0
bra8_8AE3:
	STY $36
	LDA ObjectState,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl8_8AF1:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
tbl8_8B05:
	.word ofs_8B1F
	.word ofs_8B2B
	.word ofs_8B1F
	.word ofs_8B2B
	.word ofs_8B43
	.word ofs_8B67
	.word ofs_8B43
	.word ofs_8B37
	.word ofs_8B5B
	.word ofs_8B73
	.word ofs_8B5B
	.word ofs_8B4F
	.word ofs_8B7F
ofs_8B1F:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $06
	.byte $1A
	.byte $1B
	.byte $21
	.byte $22
	.byte $23
ofs_8B2B:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1C
	.byte $1D
	.byte $1E
	.byte $24
	.byte $25
	.byte $23
ofs_8B37:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF
	.byte $01
	.byte $02
	.byte $06
	.byte $07
	.byte $08
	.byte $10
	.byte $11
	.byte $FF
ofs_8B43:
	.byte $03
	.byte $03
	.byte $96
	.byte $03
	.byte $04
	.byte $05
	.byte $09
	.byte $0A
	.byte $0B
	.byte $12
	.byte $13
	.byte $FF
ofs_8B4F:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $06
	.byte $0C
	.byte $0D
	.byte $14
	.byte $15
	.byte $16
ofs_8B5B:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $06
	.byte $0E
	.byte $0F
	.byte $14
	.byte $17
	.byte $18
ofs_8B67:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF
	.byte $01
	.byte $3A
	.byte $06
	.byte $38
	.byte $39
	.byte $10
	.byte $11
	.byte $FF
ofs_8B73:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $06
	.byte $3B
	.byte $3C
	.byte $14
	.byte $3D
	.byte $3E
ofs_8B7F:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF
	.byte $19
	.byte $FF
	.byte $1F
	.byte $20
	.byte $1E
	.byte $26
	.byte $27
	.byte $28
obj_h24:
	LDX LowerObjSlot ;Get the index for the current object slot
	LDA ObjectState,X
	CMP #$04
	BCS bra8_8BB3
	LDA $062B
	AND #$07
	BNE bra8_8BB3 ;Increment the object's timer every 8th frame
	LDA ObjectVariables,X
	CMP #$1F
	BCC bra8_8BA9
	LDA #$00
	STA ObjectVariables,X ;Clear the lotus timer if it goes above #$1F
	BEQ bra8_8BB3
bra8_8BA9:
	CMP #$04
	BNE bra8_8BB0 ;Continue each time the timer is at 4. 8 frames x 32 ticks = 256 frames (~4s NTSC)
	JSR SpawnLotusPollen ;Spawns 4 seeds when the timer is at 4
bra8_8BB0:
	INC ObjectVariables,X ;Increments lotus timer
bra8_8BB3:
	LDA #$06
	STA $25
	LDX LowerObjSlot
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X ;Calculate x distance from player
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X ;Calculate x screen distance from player
	STA $28
	BEQ bra8_8BD5
	CMP #$FF
	BEQ bra8_8BD5
	JMP loc3_A6B5
bra8_8BD5:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8C17
	LDA ObjYScreenDistance,X
	BPL bra8_8C06
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_8C17 ;unlogged
bra8_8C06:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_8C17:
loc8_8C17:
	LDA FreezeFlag
	BEQ bra8_8C1D
	RTS ;unlogged
bra8_8C1D:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8C31,Y
	STA $32
	LDA tbl8_8C31+1,Y
	STA $33
	JMP ($32)
tbl8_8C31:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr3_8C3B
	.word ptr3_8C48
ptr3_8C3B:
	JSR jmp_54_A6D4
	JSR jmp_54_BC3E
	JSR jmp_54_A74D
	JSR jmp_54_BF74
	RTS
ptr3_8C48:
	LDA #$0F
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	RTS
;-----
	
SpawnLotusPollen:
	LDY ObjectCount ;Load index for starting pollen slot
	INC ObjectCount
	INC ObjectCount
	INC ObjectCount
	INC ObjectCount ;Update the object count
	LDA ObjectXPos,X
	CLC
	ADC #$0C
	STA ObjectXPos,Y
	STA ObjectXPos+1,Y
	STA ObjectXPos+2,Y
	STA ObjectXPos+3,Y ;Spawn the pollen pellets 12 x pixels from the base of the lotus
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y 
	STA ObjectXScreen+1,Y
	STA ObjectXScreen+2,Y
	STA ObjectXScreen+3,Y ;Spawn them on the same screen as the lotus
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	STA ObjectYPos+1,Y
	STA ObjectYPos+2,Y
	STA ObjectYPos+3,Y ;Spawn them on the same y position as the lotus
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	STA ObjectYScreen+1,Y
	STA ObjectYScreen+2,Y
	STA ObjectYScreen+3,Y ;Spawn them on the same y screen as the lotus
	
;This piece of code moves two object IDs up by two starting form 24, which spawns in each pollen pellet in order
	LDA ObjectSlot,X
	CLC
	ADC #$02
	STA ObjectSlot,Y
	CLC
	ADC #$02
	STA ObjectSlot+1,Y
	CLC
	ADC #$02
	STA ObjectSlot+2,Y
	CLC
	ADC #$02
	STA ObjectSlot+3,Y
;-----
;Initialize the pellet variables
	LDA #$00
	STA ObjectState,Y
	STA ObjectState+1,Y
	STA ObjectState+2,Y
	STA ObjectState+3,Y
	STA ObjectVariables,Y
	STA $0579,Y
	STA $057A,Y
	STA $057B,Y
	STA ObjectAction,Y
	STA ObjectAction+1,Y
	STA ObjectAction+2,Y
	STA ObjectAction+3,Y
	RTS
;----- (Stops)

ptr6_8CDE:
	LDX $A4
	LDA ObjectVariables,X
	TAY
	LDA tbl8_8D0B,Y
	ASL
	TAX
	LDA tbl8_8D2B,X
	STA $32
	LDA tbl8_8D2B+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_8D00
	LDY #$C0
bra8_8D00:
	STY $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl8_8D0B:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $00
tbl8_8D2B:
	.word ofs_8D31
	.word ofs_8D3C
	.word ofs_8D47
ofs_8D31:
	.byte $04
	.byte $02
	.byte $97
	.byte $FF
	.byte $05
	.byte $06
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
ofs_8D3C:
	.byte $04
	.byte $02
	.byte $97
	.byte $FF
	.byte $03
	.byte $04
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
ofs_8D47:
	.byte $04
	.byte $02
	.byte $97
	.byte $FF
	.byte $01
	.byte $02
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
obj_h26:
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
	BEQ bra8_8D74
	CMP #$FF
	BEQ bra8_8D74
	JMP loc3_A6B5
bra8_8D74:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8DB6
	LDA ObjYScreenDistance,X
	BPL bra8_8DA5
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_8DB6 ;unlogged
bra8_8DA5:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_8DB6:
loc8_8DB6:
	LDA FreezeFlag
	BEQ bra8_8DBC
	RTS ;unlogged
bra8_8DBC:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8DD0,Y
	STA $32
	LDA tbl8_8DD0+1,Y
	STA $33
	JMP ($32)
tbl8_8DD0:
	.word ptr3_8DDA
	.word ptr3_8DDA
	.word ptr3_8DDA
	.word ptr3_8DDA
	.word ptr3_8E0E
ptr3_8DDA:
	LDA ObjectSlot,X
	SEC
	SBC #$10
	LSR
	CLC
	ADC #$10
	STA $25
	LDA FrameCount
	AND #$03
	BNE bra8_8DF1
	LDA $25
	JSR jmp_54_B470
bra8_8DF1:
	LDA ObjectYPos,X
	CMP #$E0
	BCC bra8_8E04
	LDA #$00
	STA ObjectSlot,X
	STA ObjectState,X
	STA ObjectVariables,X
	RTS
bra8_8E04:
	JSR jmp_54_A6D4
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
ptr3_8E0E:
	LDA #$00
	STA ObjectSlot,X
	STA ObjectState,X
	RTS
ptr6_8E17:
	LDY #$00
	LDA $062B
	AND #$04
	BEQ bra8_8E21
	INY
bra8_8E21:
	TYA
	ASL
	TAX
	LDA tbl8_8E46,X
	STA $32
	LDA tbl8_8E46+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_8E3B
	LDY #$C0
bra8_8E3B:
	STY $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl8_8E46:
	.word LotusPollen1
	.word LotusPollen2
LotusPollen1:
	.byte $01
	.byte $01
	.byte $97
	.byte $07
LotusPollen2:
	.byte $01
	.byte $01
	.byte $97
	.byte $08
obj_h2E:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra8_8E5C
	JMP loc8_8EE9
bra8_8E5C:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_8E78
	CMP #$FF
	BEQ bra8_8E78
	JMP loc3_A6B5 ;unlogged
bra8_8E78:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8EBA
	LDA ObjYScreenDistance,X ;unlogged
	BPL bra8_8EA9 ;unlogged
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_8EBA ;unlogged
bra8_8EA9:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra8_8EBA:
loc8_8EBA:
	LDA FreezeFlag
	BEQ bra8_8EC0
	RTS ;unlogged
bra8_8EC0:
	LDA ObjectVariables,X
	CMP #$80
	BNE bra8_8ED9
	LDA ObjectXDistance,X
	BPL bra8_8ED1
	EOR #$FF
	CLC
	ADC #$01
bra8_8ED1:
	CMP #$40
	BCS bra8_8ED8_RTS
	INC ObjectVariables,X
bra8_8ED8_RTS:
	RTS
bra8_8ED9:
	CMP #$81
	BNE bra8_8EE5
	LDA #$10
	STA SFXRegister
	JSR jmp_54_B5BB
	RTS
bra8_8EE5:
	JSR sub_54_B4FC
	RTS
loc8_8EE9:
	LDA #$06
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
	BEQ bra8_8F0B
	CMP #$FF
	BEQ bra8_8F0B
	JMP loc3_A6B5
bra8_8F0B:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_8F4D
	LDA ObjYScreenDistance,X ;unlogged
	BPL bra8_8F3C ;unlogged
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_8F4D ;unlogged
bra8_8F3C:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra8_8F4D:
loc8_8F4D:
	LDA FreezeFlag
	BEQ bra8_8F53
	RTS ;unlogged
bra8_8F53:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8F67,Y
	STA $32
	LDA tbl8_8F67+1,Y
	STA $33
	JMP ($32)
tbl8_8F67:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr3_8F71
	.word ptr_AD88
ptr3_8F71:
	LDA FrameCount
	AND #$00
	BNE bra8_8F7C
	LDA #$1F
	JSR jmp_54_B11D
bra8_8F7C:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	JSR jmp_54_BCBE
	LDX $A4
	LDA #$82
	STA ObjectVariables,X
	RTS
ptr6_8F90:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra8_8FA1
	LDY #$00
	CMP #$82
	BCC bra8_8FAB
	LDY #$02
	BNE bra8_8FAB
bra8_8FA1:
	LDY #$01
	LDA $062B
	AND #$04
	BEQ bra8_8FAB
	INY
bra8_8FAB:
	TYA
	ASL
	TAX
	LDA tbl8_8FD3,X
	STA $32
	LDA tbl8_8FD3+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_8FC5
	LDY #$C0
bra8_8FC5:
	STY $36
	LDA ObjectState,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl8_8FD3:
	.word Swooper1
	.word Swooper2
	.word Swooper3
Swooper1:
	.byte $03
	.byte $02
	.byte $96
	.byte $FF
	.byte $2E
	.byte $2F
	.byte $FF
	.byte $36
	.byte $37
Swooper2:
	.byte $03
	.byte $02
	.byte $96
	.byte $FF
	.byte $29
	.byte $2A
	.byte $30
	.byte $31
	.byte $32
Swooper3:
	.byte $03
	.byte $02
	.byte $96
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $33
	.byte $34
	.byte $35
obj_h30:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra8_9063
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_9017
	CMP #$FF
	BEQ bra8_9017
	JMP loc3_A6B5 ;unlogged
bra8_9017:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_9059
	LDA ObjYScreenDistance,X
	BPL bra8_9048
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_9059
bra8_9048:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_9059:
loc8_9059:
	LDA FreezeFlag
	BEQ bra8_905F
	RTS ;unlogged
bra8_905F:
	JSR jmp_54_B5BB
	RTS
bra8_9063:
	LDA #$06
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
	BEQ bra8_9085
	CMP #$FF
	BEQ bra8_9085
	JMP loc3_A6B5
bra8_9085:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_90C7
	LDA ObjYScreenDistance,X
	BPL bra8_90B6
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_90C7
bra8_90B6:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_90C7:
loc8_90C7:
	LDA FreezeFlag
	BEQ bra8_90CD
	RTS
bra8_90CD:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_90E1,Y
	STA $32
	LDA tbl8_90E1+1,Y
	STA $33
	JMP ($32)
tbl8_90E1:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr3_90EB
	.word ptr_AD88
ptr3_90EB:
	LDA ObjectSlot,X
	AND #$FE
	CMP #$52
	BEQ bra8_910B
	LDA ObjectSlot,X
	SEC
	SBC #$10
	LSR
	CLC
	ADC #$10
	STA $25
	LDA FrameCount
	AND #$00
	BNE bra8_910B
	LDA $25
	JSR jmp_54_B11D
bra8_910B:
	JSR jmp_54_A6D4
	JSR jmp_54_BC3E
	JSR jmp_54_A74D
	JSR jmp_54_BF74
	RTS
ptr6_9118:
	LDY #$00
	LDX $A4
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BNE bra8_912B
	LDY #$02
	LDA #$80
	BNE bra8_9130
bra8_912B:
	LDA ObjectState,X
	AND #$40
bra8_9130:
	STA $05F0
	LDA $062B
	AND #$04
	BEQ bra8_913B
	INY
bra8_913B:
	TYA
	ASL
	TAX
	LDA tbl8_915B,X
	STA $32
	LDA tbl8_915B+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_9155
	LDY #$C0
bra8_9155:
	STY $36
	JSR jmp_54_A118
	RTS
tbl8_915B:
	.word Blurp1
	.word Blurp2
	.word Blurp3
	.word Blurp4
Blurp1:
	.byte $02
	.byte $02
	.byte $A6
	.byte $03
	.byte $04
	.byte $0D
	.byte $0E
Blurp2:
	.byte $02
	.byte $02
	.byte $A6
	.byte $05
	.byte $06
	.byte $0F
	.byte $0E
Blurp3:
	.byte $02
	.byte $02
	.byte $A6
	.byte $0D
	.byte $0E
	.byte $03
	.byte $04
Blurp4:
	.byte $02
	.byte $02
	.byte $A6
	.byte $0F
	.byte $0E
	.byte $05
	.byte $06
	LDX $A4
	LDA ObjectVariables,X
	BMI bra8_9189
	JMP loc8_9202
bra8_9189:
	LDA ObjectYPos,X
	CLC
	ADC #$08
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,X
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_91B6
	CMP #$FF
	BEQ bra8_91B6
	JMP loc3_A6B5 ;unlogged
bra8_91B6:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_91F8
	LDA ObjYScreenDistance,X
	BPL bra8_91E7
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_91F8
bra8_91E7:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_91F8:
loc8_91F8:
	LDA FreezeFlag
	BEQ bra8_91FE
	RTS ;unlogged
bra8_91FE:
	JSR jmp_54_B5BB
	RTS
loc8_9202:
	LDA ObjectAction,X
	BNE bra8_920A
	JMP loc8_9287
bra8_920A:
	CMP #$10
	BCC bra8_9214
	LDA #$00
	STA ObjectAction,X
	RTS
bra8_9214:
	INC ObjectAction,X
	LDA FrameCount
	AND #$01
	BNE bra8_9222
	LDA #$4B
	JSR GetMovementData
bra8_9222:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_923E
	CMP #$FF
	BEQ bra8_923E
	JMP loc3_A6B5 ;unlogged
bra8_923E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_9280
	LDA ObjYScreenDistance,X ;unlogged
	BPL bra8_926F ;unlogged
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_9280 ;unlogged
bra8_926F:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra8_9280:
loc8_9280:
	LDA FreezeFlag
	BEQ bra8_9286_RTS
	RTS ;unlogged
bra8_9286_RTS:
	RTS
loc8_9287:
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
	BEQ bra8_92A9
	CMP #$FF
	BEQ bra8_92A9
	JMP loc3_A6B5
bra8_92A9:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_92EB
	LDA ObjYScreenDistance,X
	BPL bra8_92DA
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_92EB
bra8_92DA:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_92EB:
loc8_92EB:
	LDA FreezeFlag
	BEQ bra8_92F1
	RTS
bra8_92F1:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_9305,Y
	STA $32
	LDA tbl8_9305+1,Y
	STA $33
	JMP ($32)
tbl8_9305:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr3_930F
	.word ptr_AD88
ptr3_930F:
	LDA FrameCount
	AND #$00
	BNE bra8_931A
	LDA #$13
	JSR GetMovementData
bra8_931A:
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	JSR jmp_54_BCBE
	LDA ObjectVariables,X
	AND #$06
	LSR
	TAY
	LDA tbl8_9345,Y
	CLC
	ADC ObjectSlot,X
	STA ObjectSlot,X
	LDA #$00
	STA $0641,X
	STA ObjectVariables,X
	LDA ObjectState,X
	AND #$40
	STA ObjectState,X
	RTS
tbl8_9345:
	.byte $02
	.byte $04
	.byte $06
	.byte $04
ptr6_9349:
	LDX $A4
	LDA ObjectVariables,X
	AND #$06
	LSR
	ASL
	TAX
	LDA tbl8_9395,X
	STA $32
	LDA tbl8_9395+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_936A
	LDY #$C0
bra8_936A:
	STY $36
	LDA ObjectState,X
	AND #$40
	STA $05F0
loc8_9374:
	LDA $06E1
	PHA
	LDA DataBank2
	CMP #$26
	BNE bra8_938D
	LDY #$00
	LDA ObjectYPos,X
	CMP #$A0
	BCC bra8_938A
	LDY #$20
bra8_938A:
	STY $06E1
bra8_938D:
	JSR jmp_54_A118
	PLA
	STA $06E1
	RTS
tbl8_9395:
	.word Mechakoopa1
	.word Mechakoopa2
	.word Mechakoopa3
	.word Mechakoopa2
Mechakoopa1:
	.byte $04
	.byte $03
	.byte $AE
	.byte $01
	.byte $02
	.byte $03
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
	.byte $14
	.byte $15
	.byte $16
	.byte $17
Mechakoopa2:
	.byte $04
	.byte $03
	.byte $AE
	.byte $04
	.byte $05
	.byte $06
	.byte $FF
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
	.byte $18
	.byte $19
	.byte $1A
	.byte $1B
Mechakoopa3:
	.byte $04
	.byte $03
	.byte $AE
	.byte $01
	.byte $07
	.byte $08
	.byte $FF
	.byte $09
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $1C
	.byte $1D
	.byte $1E
obj_h3C:
	LDX $A4
	LDA $0641,X
	CMP #$F0
	BCC bra8_9419
	LDA ObjectSlot,X
	AND #$01
	CLC
	ADC #$3A
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	STA ObjectVariables,X
	STA $0641,X
	LDA #$F8
	BMI bra8_9406
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	BCS bra8_93FA ;unlogged
	CMP #$F0 ;unlogged
	BCC bra8_9418_RTS ;unlogged
bra8_93FA:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	INC ObjectYScreen,X ;unlogged
	JMP loc8_9418_RTS ;unlogged
bra8_9406:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra8_9418_RTS
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	DEC ObjectYScreen,X ;unlogged
bra8_9418_RTS:
loc8_9418_RTS:
	RTS
bra8_9419:
	LDA $062B
	AND #$03
	BNE bra8_9423
	INC $0641,X
bra8_9423:
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
	BEQ bra8_9445
	CMP #$FF
	BEQ bra8_9445
	JMP loc3_A6B5
bra8_9445:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_9487
	LDA ObjYScreenDistance,X
	BPL bra8_9476
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_9487
bra8_9476:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_9487:
loc8_9487:
	LDA FreezeFlag
	BEQ bra8_948D
	RTS ;unlogged
bra8_948D:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_94A1,Y
	STA $32
	LDA tbl8_94A1+1,Y
	STA $33
	JMP ($32)
tbl8_94A1:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr3_94B1
	.word ptr_AD88
	.word ptr3_9564
	.word ptr_AD79
	.word ptr3_959C
ptr3_94B1:
	JSR jmp_54_ACC3
	LDA $0636
	BEQ bra8_94BA
	RTS
bra8_94BA:
	LDA FrameCount
	AND #$00
	BNE bra8_94C5
	LDA #$27
	JSR GetMovementData
bra8_94C5:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_94E1
	CMP #$FF
	BEQ bra8_94E1
	JMP loc3_A6B5 ;unlogged
bra8_94E1:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_9523
	LDA ObjYScreenDistance,X
	BPL bra8_9512
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_9523
bra8_9512:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_9523:
loc8_9523:
	LDA FreezeFlag
	BEQ bra8_9529
	RTS
bra8_9529:
	JSR jmp_54_A773
	JSR SetObjectCarryState
	LDA $1E
	CMP #$05
	BEQ bra8_9541
bra8_9535:
	INC ObjectState,X
	INC ObjectState,X
	LDA #$00
	STA ObjectVariables,X
	RTS
bra8_9541:
	LDA PlayerYSpeed
	BEQ bra8_9535
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
	RTS
ptr3_9564:
	LDA ObjXScreenDistance,X
	BPL bra8_9570
	LDA ObjectState,X
	ORA #$40
	BNE bra8_9575
bra8_9570:
	LDA ObjectState,X
	AND #$BF
bra8_9575:
	STA ObjectState,X
	LDA FrameCount
	AND #$00
	BNE bra8_9583
	LDA #$23
	JSR GetMovementData
bra8_9583:
	LDA ObjectVariables,X
	CMP #$07
	BCC bra8_959B_RTS
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	AND #$20
	BNE bra8_959B_RTS
	LDA #$00
	STA ObjectVariables,X
bra8_959B_RTS:
	RTS
ptr3_959C:
	LDA FrameCount
	AND #$00
	BNE bra8_95A7
	LDA #$45
	JSR GetMovementData
bra8_95A7:
	LDA #$20
	JSR sub3_AEA8
tbl8_95AC:
	JSR jmp_54_AD54
	LDA #$01
	STA $06E4
	RTS
ptr6_95B5:
	LDX $A4
	LDA $0641,X
	CMP #$D0
	BCC bra8_95C6
	LDA $062B
	AND #$04
	BNE bra8_95C6
	RTS
bra8_95C6:
	LDA ObjectSlot,X
	LSR
	SEC
	SBC #$1E
	TAY
	LDA ObjectState,X
	AND #$1F
	CMP #$05
	BNE bra8_95DC
	TYA
	CLC
	ADC #$03
	TAY
bra8_95DC:
	TYA
	ASL
	TAX
	LDA tbl8_9612,X
	STA $32
	LDA tbl8_9612+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra8_95F6
	LDY #$C0
bra8_95F6:
	STY $36
	LDA ObjectState,X
	BPL bra8_960A
	AND #$BF
	STA $34
	LDA PlayerMovement
	AND #$40
	ORA $34
	STA ObjectState,X
bra8_960A:
	AND #$40
	STA $05F0
	JMP loc8_9374
tbl8_9612:
	.word StunMechakoopa1
	.word StunMechakoopa2
	.word StunMechakoopa3
	.word StunMechakoopa4
	.word StunMechakoopa5
	.word StunMechakoopa6
StunMechakoopa1:
	.byte $03
	.byte $03
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $20
	.byte $21
	.byte $24
	.byte $25
	.byte $26
StunMechakoopa2:
	.byte $03
	.byte $03
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $20
	.byte $23
	.byte $24
	.byte $25
	.byte $26
StunMechakoopa3:
	.byte $03
	.byte $03
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $20
	.byte $31
	.byte $24
	.byte $25
	.byte $26
StunMechakoopa4:
	.byte $03
	.byte $03
	.byte $AE
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $2B
	.byte $2D
	.byte $2E
	.byte $2F
StunMechakoopa5:
	.byte $03
	.byte $03
	.byte $AE
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $30
	.byte $2D
	.byte $2E
	.byte $2F
StunMechakoopa6:
	.byte $03
	.byte $03
	.byte $AE
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $32
	.byte $2D
	.byte $2E
	.byte $2F
obj_h12:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_9684
	CMP #$FF
	BEQ bra8_9684
	JMP loc3_A6B5
bra8_9684:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_96C6
	LDA ObjYScreenDistance,X
	BPL bra8_96B5
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_96C6
bra8_96B5:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_96C6:
loc8_96C6:
	LDA FreezeFlag
	BEQ bra8_96CC
	RTS
bra8_96CC:
	LDA ObjectVariables,X
	CMP #$F0
	BEQ bra8_96D6
	JMP loc8_975A
bra8_96D6:
	JSR jmp_54_B5BB
	LDA #$00
	STA EnemyAnimFrame,X
	RTS
obj_h6E:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_96FD
	CMP #$FF
	BEQ bra8_96FD
	JMP loc3_A6B5
bra8_96FD:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_973F
	LDA ObjYScreenDistance,X
	BPL bra8_972E
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_973F ;unlogged
bra8_972E:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_973F:
loc8_973F:
	LDA FreezeFlag
	BEQ bra8_9745
	RTS ;unlogged
bra8_9745:
	LDA ObjectVariables,X
	CMP #$F0
	BNE bra8_975A
	LDA #$40
	STA ObjectState,X
	LDA #$00
	STA EnemyAnimFrame,X
	STA ObjectVariables,X
	RTS
bra8_975A:
loc8_975A:
	JSR sub8_97B6
	LDX $A4
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BCC bra8_9769
	RTS
bra8_9769:
	JSR sub8_9856
loc8_976C:
	LDA ObjectVariables,X
	BPL bra8_979C
	AND #$7F
	CMP #$20
	BCC bra8_977D
	LDA #$00
	STA ObjectVariables,X
	RTS
bra8_977D:
	LDA #$08
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra8_978B
	INC ObjectVariables,X
bra8_978B:
	LDA FrameCount
	AND #$00
	BNE bra8_9796
	LDA #$23
	JSR GetMovementData
bra8_9796:
	LDA #$02
	STA EnemyAnimFrame,X
	RTS
bra8_979C:
	LDA FrameCount
	AND #$01
	BNE bra8_97A7
	LDA #$11
	JSR GetMovementData
bra8_97A7:
	LDY #$00
	LDA $062B
	AND #$08
	BEQ bra8_97B1
	INY
bra8_97B1:
	TYA
	STA EnemyAnimFrame,X
	RTS
sub8_97B6:
	LDA #$06
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
	BEQ bra8_97D8
	CMP #$FF
	BEQ bra8_97D8
	JMP loc3_A6B5 ;unlogged
bra8_97D8:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_981A
	LDA ObjYScreenDistance,X
	BPL bra8_9809
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_981A
bra8_9809:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_981A:
loc8_981A:
	LDA FreezeFlag
	BEQ bra8_9820
	RTS ;unlogged
bra8_9820:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_9834,Y
	STA $32
	LDA tbl8_9834+1,Y
	STA $33
	JMP ($32)
tbl8_9834:
	.word ptr_A7BB
	.word ptr_AA7B
	.word ptr_AB29
	.word ptr3_983E
	.word ptr_AD88
ptr3_983E:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_BCC2
	LDA #$04
	STA PlayerAction
	LDA #$0F
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	RTS
sub8_9856:
	LDA #$0F
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BNE bra8_9871
	LDA ObjectAction,X
	BEQ bra8_9870_RTS
	LDA #$00
	STA ObjectAction,X
	LDA #$80
	STA ObjectVariables,X
bra8_9870_RTS:
	RTS
bra8_9871:
	CMP #$03
	BNE bra8_9870_RTS
	LDA FrameCount
	AND #$00
	BNE bra8_9880
	LDA #$3D
	JSR jmp_54_B470
bra8_9880:
	LDA #$02
	STA EnemyAnimFrame,X
	LDA #$01
	STA ObjectAction,X
	PLA
	PLA
	RTS
obj_h7A:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_98AB
	CMP #$FF
	BEQ bra8_98AB
	JMP loc3_A6B5 ;unlogged
bra8_98AB:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_98ED
	LDA ObjYScreenDistance,X ;unlogged
	BPL bra8_98DC ;unlogged
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_98ED ;unlogged
bra8_98DC:
	LDA ObjectYDistance,X ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	SBC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
bra8_98ED:
loc8_98ED:
	LDA FreezeFlag
	BEQ bra8_98F3
	RTS ;unlogged
bra8_98F3:
	LDA ObjectVariables,X
	CMP #$F0
	BNE bra8_9908
	LDA #$40
	STA ObjectState,X
	LDA #$00
	STA EnemyAnimFrame,X
	STA ObjectVariables,X
	RTS
bra8_9908:
	JSR sub8_97B6
	LDX $A4
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BCC bra8_9917
	RTS
bra8_9917:
	LDA ObjectAction,X
	BNE bra8_9940
	LDA FrameCount
	AND #$00
	BNE bra8_9927
	LDA #$3E
	JSR jmp_54_B470
bra8_9927:
	LDA #$02
	STA EnemyAnimFrame,X
	LDA ObjectVariables,X
	AND #$7F
	CMP #$2A
	BCC bra8_993F_RTS
	LDA #$80
	STA ObjectVariables,X
	LDA #$01
	STA ObjectAction,X
bra8_993F_RTS:
	RTS
bra8_9940:
	JMP loc8_976C
obj_h7D:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_9961
	CMP #$FF
	BEQ bra8_9961
	JMP loc3_A6B5 ;unlogged
bra8_9961:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_99A3
	LDA ObjYScreenDistance,X
	BPL bra8_9992
	LDA ObjectYDistance,X ;unlogged
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYDistance,X ;unlogged
	LDA ObjYScreenDistance,X ;unlogged
	ADC #$00 ;unlogged
	STA ObjYScreenDistance,X ;unlogged
	JMP loc8_99A3 ;unlogged
bra8_9992:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_99A3:
loc8_99A3:
	LDA FreezeFlag
	BEQ bra8_99A9
	RTS ;unlogged
bra8_99A9:
	LDY #$00
	LDA ObjXScreenDistance,X
	BMI bra8_99B2
	LDY #$20
bra8_99B2:
	STY $06E0
	RTS
obj_hF0:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra8_99D4
	CMP #$FF
	BEQ bra8_99D4
	JMP loc3_A6B5 ;unlogged
bra8_99D4:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra8_9A16
	LDA ObjYScreenDistance,X
	BPL bra8_9A05
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc8_9A16
bra8_9A05:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra8_9A16:
loc8_9A16:
	LDA FreezeFlag
	BEQ bra8_9A1C
	RTS ;unlogged
bra8_9A1C:
	LDA ObjectYScreen,X
	CMP PlayerYScreenDup
	BNE bra8_9A77_RTS
	LDY #$00
	LDA ObjectSlot,X
	CMP #$F2
	BNE bra8_9A6D
	LDA ObjectVariables,X
	BPL bra8_9A66
	LDA #$00
	STA ObjectVariables,X
	LDA #$03
	BMI bra8_9A53
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra8_9A47
	CMP #$F0
	BCC bra8_9A66_RTS
bra8_9A47:
	CLC ;unlogged
	ADC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	INC ObjectYScreen,X ;unlogged
	JMP loc8_9A66_RTS ;unlogged
bra8_9A53:
	CLC ;unlogged
	ADC ObjectYPos,X ;unlogged
	STA ObjectYPos,X ;unlogged
	BCS bra8_9A66_RTS ;unlogged
	SEC ;unlogged
	SBC #$10 ;unlogged
	STA ObjectYPos,X ;unlogged
	DEC ObjectYScreen,X ;unlogged
bra8_9A66_RTS:
loc8_9A66_RTS:
	RTS
bra8_9A66:
	LDA ObjYScreenDistance,X
	BPL bra8_9A72
	BMI bra8_9A74
bra8_9A6D:
	LDA ObjYScreenDistance,X
	BPL bra8_9A74
bra8_9A72:
	LDY #$20
bra8_9A74:
	STY $06E0
bra8_9A77_RTS:
	RTS
	BEQ bra8_9A7F ;unlogged
	ASL ;unlogged
	TAX ;unlogged
	LDA tbl8_9A99,X ;unlogged
bra8_9A7F:
	STA $32 ;unlogged
	LDA tbl8_9A9A,X ;unlogged
	STA $33 ;unlogged
	LDY #$80 ;unlogged
	LDX $A4 ;unlogged
	LDA ObjectSlot,X ;unlogged
	AND #$01 ;unlogged
	BEQ bra8_9A93 ;unlogged
	LDY #$C0 ;unlogged
bra8_9A93:
	STY $36 ;unlogged
	JSR jmp_54_A118 ;unlogged
	RTS ;unlogged
tbl8_9A99:
	.byte $A3
tbl8_9A9A:
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
.incbin prg/padding/padding055.bin
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